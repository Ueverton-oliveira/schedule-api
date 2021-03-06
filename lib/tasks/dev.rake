namespace :dev do
  desc "Config develop environment"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)

    kinds = %w(Amigo Comercial Conhecido)
    
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.create!(
          number:Faker::PhoneNumber.cell_phone
        )
        contact.save!
      end
    end

    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )      
    end

  end
end

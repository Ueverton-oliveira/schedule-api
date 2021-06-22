namespace :dev do
  desc "Config develop environment"
  task setup: :environment do
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
        Kind_id: Kind.all
      )
    end
  end
end

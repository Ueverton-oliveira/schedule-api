class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address
  
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

 

=begin
  def to_br
    { 
      name: self.name, 
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?) 
    }
  end


  def author
    "Ueverton Oliveira"
  end

  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :author],
      include: { kind: { only: :description }}
    )
  end
=end
end

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
end


def attributes(*args)
  h = super(*args)
  #pr-BR --> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) 
  h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  h
end
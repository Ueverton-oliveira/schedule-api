class PhonesController < ApplicationController
  before_action :set_contact, only: [:show]
  
  def create
    @contact.phones = Phone.new(phones_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    phone = Phone.find(phones_params[:id])

    if @contact.phones.update(phones_params)
     render json: @contact.phones
    else
     render json: @contact.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @contact.phones
  end

  def destroy
    phone = Phone.find(phones_params[:id])
    phone.destroy
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    if params[:contact_id]
      @contact = Contact.find(params[:contact_id])
    end
  end

  def phones_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end

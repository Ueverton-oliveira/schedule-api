class AddressesController < ApplicationController
  before_action :set_address, only: [:show]

  def show
    render json: @address
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      if params[:contact_id]
        @address = Contact.find(params[:contact_id]).address
      end
    end
end
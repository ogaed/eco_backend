# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options = {})
    if resource.persisted?
      render json: {
        status: {
          code: 200, message: "Signed up successfully",
          # data: resource,
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        },
      }, status: :ok
    else
      render json: {
        status: { message: "User could not be created successfull", errors: resource.errors },
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
  user_data = params.require(:user)
  user_data.permit(:email, :password, :role, :first_name, :phone_number, :last_name, :location, :national_id,  :expertise,  :languages,  :experience, :bio,   :preferences,  :interests)
end

end



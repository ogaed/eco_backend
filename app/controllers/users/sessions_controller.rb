# # frozen_string_literal: true

# class Users::SessionsController < Devise::SessionsController
#   respond_to :json

#   private

#   def respond_with(resource, options = {})
#     render json: {
#       status: {
#         code: 200, message: "User signed in successfully",
#         # data: current_user,
#         data: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
#       },
#     }, status: :ok
#   end

#   def respond_to_on_destroy
#     jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1], Rails.application.credentials.fetch(:secret_key_base)).first
#     current_user = User.find(jwt_payload["sub"])
#     if current_user
#       render json: {
#         status: 200,
#         message: "Signed out successfully",
#       }, status: :ok
#     else
#       render json: {
#         status: 401,
#         message: "User has no active session",
#       }, status: :unauthorized
#     end
#   end
# end
# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options = {})
    render json: {
      status: {
        code: 200, message: "User signed in successfully",
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
      },
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = decode_jwt

    if jwt_payload && (current_user = find_user_by_id(jwt_payload["sub"]))
      render json: {
        status: 200,
        message: "Signed out successfully",
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User has no active session",
      }, status: :unauthorized
    end
  end

  def decode_jwt
    JWT.decode(jwt_token, Rails.application.credentials.fetch(:secret_key_base)).first
  rescue JWT::DecodeError, JWT::VerificationError
    nil
  end

  def find_user_by_id(user_id)
    User.find_by(id: user_id)
  end

  def jwt_token

    authorization_header = request.headers["Authorization"]
    return nil unless authorization_header

    # Split the Authorization header
    authorization_header.split(" ")[1]
    request.headers["Authorization"].split(" ")[1]
  end
 
end

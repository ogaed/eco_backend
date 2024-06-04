class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :first_name, :last_name, :role, :national_id, :phone_number, :location, :jti, :avatar_url, :expertise,  :languages,  :experience, :bio,   :preferences,  :interests
end

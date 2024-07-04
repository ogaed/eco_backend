class CarbonFootprintSerializer
  include JSONAPI::Serializer
  attributes :id, :date_recorded, :value

  belongs_to :user
end

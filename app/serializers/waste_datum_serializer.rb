class WasteDatumSerializer
  include JSONAPI::Serializer
  attributes :id, :date_recorded, :recycling_amount, :composting_amount

  belongs_to :user
end

class ProductSerializer
  include JSONAPI::Serializer
  attributes  :id, :name, :description, :price, :quantity, :user_id, :crop_id
  attribute :first_name, if: Proc.new { |record| record.user.present? } do |record|
    record.user.first_name
  end
  attribute :last_name, if: Proc.new { |record| record.user.present? } do |record|
    record.user.last_name
  end
  attribute :phone_number, if: Proc.new { |record| record.user.present? } do |record|
    record.user.phone_number
  end
  attribute :location, if: Proc.new { |record| record.user.present? } do |record|
    record.user.location
  end
  attribute :crop_name, if: Proc.new { |record| record.crop.present? } do |record|
    record.crop.crop_name
  end
end

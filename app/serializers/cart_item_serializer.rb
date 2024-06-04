class CartItemSerializer
  include JSONAPI::Serializer

  attributes :id, :quantity, :total, :status, :user_id, :product_id, :crop_id

  attribute :user, if: Proc.new { |record| record.user.present? } do |record|
    {
      first_name: record.user.first_name,
      last_name: record.user.last_name,
      phone_number: record.user.phone_number,
      location: record.user.location
    }
  end

  attribute :product, if: Proc.new { |record| record.product.present? } do |record|
    {
      name: record.product.name,
      description: record.product.description,
      price: record.product.price,
      quantity: record.product.quantity,
     
      first_name: record.product.user.first_name,
      last_name: record.product.user.last_name,
      phone_number: record.product.user.phone_number,
      location: record.product.user.location,
      user_id: record.product.user_id
    }
  end

  attribute :crop, if: Proc.new { |record| record.crop.present? } do |record|
    {
        crop_name: record.crop.crop_name,
  }
end
end

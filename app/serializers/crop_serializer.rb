class CropSerializer
  include JSONAPI::Serializer
  attributes :id, :crop_name, :crop_age, :acreage, :trees_0_to_3, :trees_4_to_7, :trees_7_plus, :farm_plot_no, :variety, :user_id

  attribute :first_name, if: Proc.new { |record| record.user.present? } do |record|
    record.user.first_name
  end
  attribute :last_name, if: Proc.new { |record| record.user.present? } do |record|
    record.user.last_name
  end
  attribute :phone_number, if: Proc.new { |record| record.user.present? } do |record|
    record.user.phone_number
  end

end
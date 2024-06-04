class IssueSerializer
  include JSONAPI::Serializer
  attributes :id, :description, :issue_type, :status,  :crop_id, :user_id, :farm_specialist_id
  attribute :user, if: Proc.new { |record| record.user.present? } do |record|
    {
      first_name: record.user.first_name,
      last_name: record.user.last_name,
      phone_number: record.user.phone_number,
      location: record.user.location
    }
  end

  attribute :farm_specialist, if: Proc.new { |record| record.farm_specialist.present? } do |record|
    {
      first_name: record.farm_specialist.first_name,
      last_name: record.farm_specialist.last_name,
      phone_number: record.farm_specialist.phone_number,
      location: record.farm_specialist.location
    }
  end

  attribute :crop, if: Proc.new { |record| record.crop.present? } do |record|
    {
        crop_name: record.crop.crop_name,
  }
end
end

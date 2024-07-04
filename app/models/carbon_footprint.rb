class CarbonFootprint < ApplicationRecord
  belongs_to :user

  validates :date_recorded, presence: true
  validates :value, presence: true
end
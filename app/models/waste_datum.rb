class WasteDatum < ApplicationRecord
  belongs_to :user
  
    validates :date_recorded, presence: true
    validates :recycling_amount, presence: true
    validates :composting_amount, presence: true
  
end

class Feedback < ApplicationRecord
    belongs_to :tourist, class_name: 'User', foreign_key: 'tourist_id'
    belongs_to :tourist_attraction, class_name: 'User', foreign_key: 'tourist_attraction'
  
    validates :rating, presence: true, inclusion: { in: 1..5 }
    validates :comments, presence: true
  end
  
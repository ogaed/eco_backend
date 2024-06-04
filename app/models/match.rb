class Match < ApplicationRecord
    belongs_to :tourist, class_name: 'User'
    belongs_to :local_tourist_attraction, class_name: 'User'
  end
  
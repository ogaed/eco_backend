class EducationalContent < ApplicationRecord
    # Example fields, adjust as per your requirements
    validates :title, presence: true
    validates :content, presence: true
  end
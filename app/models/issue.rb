class Issue < ApplicationRecord
  belongs_to :crop
  belongs_to :user
  belongs_to :farm_specialist, class_name: 'User', foreign_key: 'farm_specialist_id'

  enum status: ["pending", "picked", "resolved", "unresolved"]

  # Callbacks
  after_create :set_default_status


  private

  def set_default_status
    self.status ||= "pending"
  end
end

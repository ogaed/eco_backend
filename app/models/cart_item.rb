class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :crop


  enum status: ["pending", "paid", "delivered"]

   # Callbacks
   after_create :set_default_status
 

   private
 
   def set_default_status
     self.status ||= "pending"
   end
end

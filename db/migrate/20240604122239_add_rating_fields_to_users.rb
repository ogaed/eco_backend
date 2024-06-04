class AddRatingFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :average_rating, :float
    add_column :users, :number_of_ratings, :integer
  end
end

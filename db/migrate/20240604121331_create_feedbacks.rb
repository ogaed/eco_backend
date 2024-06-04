class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.integer :tourist_id
      t.integer :expert_id
      t.integer :rating
      t.text :comments

      t.timestamps
    end
  end
end

class CreateWasteData < ActiveRecord::Migration[7.1]
  def change
    create_table :waste_data do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_recorded
      t.float :recycling_amount
      t.float :composting_amount

      t.timestamps
    end
  end
end

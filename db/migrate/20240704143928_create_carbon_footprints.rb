class CreateCarbonFootprints < ActiveRecord::Migration[7.1]
  def change
    create_table :carbon_footprints do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_recorded
      t.float :value

      t.timestamps
    end
  end
end

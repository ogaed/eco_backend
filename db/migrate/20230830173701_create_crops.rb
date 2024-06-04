class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.string :crop_name
      t.integer :crop_age
      t.float :acreage
      t.integer :trees_0_to_3
      t.integer :trees_4_to_7
      t.integer :trees_7_plus
      t.string :farm_plot_no
      t.string :variety

      t.timestamps
    end
    add_reference :crops, :user, null: false, foreign_key: true
  end
end


# products that are ready to be used by customers
# customers to purchase and pay


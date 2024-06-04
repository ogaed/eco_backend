class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :quantity

      t.timestamps
    end
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :crop, null: false, foreign_key: true
  end
end

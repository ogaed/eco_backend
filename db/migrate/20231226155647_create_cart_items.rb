class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.float :total
      t.integer :status, default: 0

      t.timestamps
    end
    add_reference :cart_items, :product, null: false, foreign_key: true
    add_reference :cart_items, :user, null: false, foreign_key: true
    add_reference :cart_items, :crop, null: false, foreign_key: true
  end
end

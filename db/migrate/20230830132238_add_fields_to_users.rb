class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :role, :integer, default: 0
    add_column :users, :location, :string, null: false
    add_column :users, :national_id, :string, null: false
    add_column :users, :phone_number, :string, null: false
   
  end
end

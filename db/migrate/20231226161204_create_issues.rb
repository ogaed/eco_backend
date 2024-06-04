# db/migrate/[timestamp]_create_issues.rb

class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.text :description
      t.string :issue_type
      t.datetime :time
      t.integer :status, default: 0

      t.timestamps
    end

    add_reference :issues, :crop, null: false, foreign_key: true
    add_reference :issues, :user, null: false, foreign_key: { to_table: :users } # farmer_id
    add_reference :issues, :farm_specialist, null: false, foreign_key: { to_table: :users }

  end
end

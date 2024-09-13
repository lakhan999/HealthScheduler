class AddColumnintoUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :mobile_number, :integer
    add_column :users, :role, :integer, default: 0
  end
end

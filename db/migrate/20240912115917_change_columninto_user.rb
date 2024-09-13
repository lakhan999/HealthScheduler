class ChangeColumnintoUser < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :mobile_number, :string, null: false
  end
end

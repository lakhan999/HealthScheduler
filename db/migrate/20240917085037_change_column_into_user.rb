class ChangeColumnIntoUser < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :role, from: 0, to: 1
  end
end

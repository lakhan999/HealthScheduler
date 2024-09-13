class AddColumnintoAppointment < ActiveRecord::Migration[7.2]
  def change
    add_reference :appointments, :user, null: false, foreign_key: true
    add_column :appointments, :status, :string, default: "pending"
  end
end

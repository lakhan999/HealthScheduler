class RemovePatientFromAppointments < ActiveRecord::Migration[7.2]
  def change
    remove_column :appointments, :patient_id, :integer
  end
end

class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.date :appointment_date, null: :false
      t.time :appointment_time, null: :false
      t.string :reason, null: :false
      t.belongs_to :doctor
      t.belongs_to :patient
      t.timestamps
    end
  end
end

class CreateDoctorAvailabilities < ActiveRecord::Migration[7.2]
  def change
    create_table :doctor_availabilities do |t|
      t.references :doctor, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end

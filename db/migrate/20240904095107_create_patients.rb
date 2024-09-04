class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name, null: :false
      t.string :mobile_number, null: :false
      t.text :address
      t.string :blood_group, null: :false
      t.string :medical_history

      t.timestamps
    end
  end
end

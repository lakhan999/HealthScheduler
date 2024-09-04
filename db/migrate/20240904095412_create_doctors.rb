class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.string :name, null: :false
      t.string :mobile_number,  null: :false
      t.text :address
      t.string :specialization, null: :false
      t.integer :consultation_fees, null: :false
      t.integer :experians
      t.timestamps
    end
  end
end

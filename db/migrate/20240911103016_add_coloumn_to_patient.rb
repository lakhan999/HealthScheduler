class AddColoumnToPatient < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :email, :string
    add_reference :patients, :user, null: false, foreign_key: true
  end
end

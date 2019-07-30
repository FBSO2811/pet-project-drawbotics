class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :interviewer
      t.string :firstname
      t.string :lastname
      t.string :position
      t.string :expertises_array, default: [], array: true

      t.timestamps
    end
  end
end

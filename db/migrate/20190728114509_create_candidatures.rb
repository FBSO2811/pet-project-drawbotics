class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.references :candidate, foreign_key: true
      t.references :interviewer, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end

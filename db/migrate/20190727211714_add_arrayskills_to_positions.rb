class AddArrayskillsToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :array_skills, :string, default: [], array: true
  end
end

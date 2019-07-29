class AddSkillsToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :skills, :string, default: [], array: true
  end
end

class AddSkillsstringToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :skills, :string
  end
end

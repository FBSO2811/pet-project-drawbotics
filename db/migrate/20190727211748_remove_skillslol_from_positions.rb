class RemoveSkillslolFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :positions, :skills, :string
  end
end

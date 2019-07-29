class RemoveSkillFromCandidate < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :skill, :string
  end
end

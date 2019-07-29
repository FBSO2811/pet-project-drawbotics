class AddSkillToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :skill, :string, default: [], array: true
  end
end

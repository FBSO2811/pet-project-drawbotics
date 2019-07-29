class RemoveSkillFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :positions, :number_of_applicants, :integer
  end
end

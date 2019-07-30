class AddExpertiseToInterviewer < ActiveRecord::Migration[5.2]
  def change
    add_column :interviewers, :expertises, :string, default: [], array: true
  end
end

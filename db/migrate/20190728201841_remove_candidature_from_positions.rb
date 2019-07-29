class RemoveCandidatureFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :positions, :candidatures, :string
  end
end

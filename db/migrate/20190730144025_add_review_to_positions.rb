class AddReviewToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :review, :TEXT
  end
end

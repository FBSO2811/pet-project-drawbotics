class AddReviewToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :review, :string
  end
end

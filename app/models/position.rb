class Position < ApplicationRecord
  validates :title, presence: true

  belongs_to :interviewer
  has_many :candidatures


end

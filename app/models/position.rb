class Position < ApplicationRecord
  validates :title, presence: true

  belongs_to :interviewer
  has_many :candidatures
  validate :must_have_one_skill

  # answered by @Taryn East - the second answer
  def must_have_one_skill
    errors.add(:base, 'You must select at least one skill') if self.array_skills.all?{|skill| skill.blank? }
  end

end

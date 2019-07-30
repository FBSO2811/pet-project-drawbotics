class Employee < ApplicationRecord
  validate :must_have_one_skill

  def must_have_one_skill
    errors.add(:base, 'You must select at least one skill') if self.expertises_array.all?{|skill| skill.blank? }
  end

end

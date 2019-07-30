class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :positions
  has_many :candidatures

  validate :must_have_one_skill

  def must_have_one_skill
    errors.add(:base, 'You must select at least one skill') if self.skill.all?{|skill| skill.blank? }
  end

end

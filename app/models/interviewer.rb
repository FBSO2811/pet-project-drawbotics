class Interviewer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :positions, dependent: :destroy
  has_many :candidatures

  validate :must_have_one_skill

  # answered by @Taryn East - the second answer
  def must_have_one_skill
    errors.add(:base, 'You must select at least one expertise') if self.expertises.all?{|skill| skill.blank? }
  end

end

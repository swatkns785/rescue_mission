class Question < ActiveRecord::Base
  has_many :answers

  validates :question_name,
  presence: true,
  length: { minimum: 40, message: "Your question must be at least %{count} characters in length." }

  validates :description,
  presence: true,
  length: { minimum: 150, message: "Your question's description must be at least %{count} characters in length." }

  validates :user_id,
  presence: true

end

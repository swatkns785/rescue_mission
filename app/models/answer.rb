class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  validates :user_id,
  presence: true

  validates :question_id,
  presence: true

  validates :answer,
  presence: true,
  length: { minimum: 50, message: "Your answer must be at least %{count} characters in length."}
end

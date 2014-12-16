class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer, presence: true
end

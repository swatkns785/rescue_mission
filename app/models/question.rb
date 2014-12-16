class Question < ActiveRecord::Base
  has_many :answers

  validates :question_name,
  presence: true,
  length: { minimum: 10 }

  validates :description,
  presence: true,
  length: { minimum: 10 }

  validates :user_id,
  presence: true
  
end

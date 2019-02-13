class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :user_follow_questions
end

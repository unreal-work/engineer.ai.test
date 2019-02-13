class HomeController < ApplicationController
  def index
    @questions = Question.joins(:user_follow_questions)
                     .where(user_follow_questions: { user_id: current_user.id })
                     .order(updated_at: :desc)
  end
end

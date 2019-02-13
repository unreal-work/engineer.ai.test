class AnswersController < ApplicationController
  def create
    question = Question.find_by!(id: answer_params[:question_id])

    current_user.answers.create(answer_params)

    question.update(updated_at: Time.now)

    redirect_to question_path(question)
  rescue => error
    Rails.logger.error "Creating answer error", error
    flash.now[:error] = error.message
    redirect_to questions_path
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :message)
  end
end

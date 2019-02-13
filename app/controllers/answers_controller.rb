class AnswersController < ApplicationController
  def create
    question = Question.find_by!(id: answer_params[:question_id])

    current_user.answers.create(answer_params)

    question.update(updated_at: Time.now)

    redirect_to question_path(question)
  rescue => error
    Rails.logger.error error
    flash.now[:error] = error.message
    redirect_to questions_path
  end

  def vote_up
    answer = Answer.find_by!(id: params[:id])

    vote = answer.votes.find_or_initialize_by(user: current_user)
    vote.value = true
    vote.save!

    redirect_to question_path(answer.question_id)
  rescue => error
    Rails.logger.error error
    flash.now[:error] = error.message
    redirect_to questions_path
  end

  def vote_down
    answer = Answer.find_by!(id: params[:id])

    vote = answer.votes.find_or_initialize_by(user: current_user)
    vote.value = false
    vote.save!

    redirect_to question_path(answer.question_id)
  rescue => error
    Rails.logger.error error
    flash.now[:error] = error.message
    redirect_to questions_path
  end
  private

  def answer_params
    params.require(:answer).permit(:question_id, :message)
  end
end

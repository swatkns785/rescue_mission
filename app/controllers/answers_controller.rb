class AnswersController < ApplicationController

  before_filter :authenticate_user!, except: [:show] #does not allow user to answer question unless logged in

  def show
    @answers = Answer.find(:question_id)
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create

    @question_id = params[:question_id]
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question_id
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :answer, :user_id)
  end

end

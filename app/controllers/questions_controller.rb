class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path(@question[:id])
    else
      render :new
    end
  end

  def edit
    #binding.pry
    @question_edit = Question.find(params[:id])
  end

  def update
    @question_edit = Question.update_attributes(question_params)
    if @question.save
      redirect_to questions_path(@question[:id])
    else
      render :edit
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where question_id: params[:id]
  end

  private

  def question_params
    params.require(:question).permit(:question_name, :description, :user_id)
  end

end

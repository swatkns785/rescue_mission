class QuestionsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show] #does not allow user to modify anything unless logged in.

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new(question_params)
    @question.user_id = current_user.id

    if @question.save
      redirect_to question_path(@question[:id])
    else
      render :new
    end

  end

  def edit
    @question = Question.find(params[:id])
  end

  def update

    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      redirect_to questions_path(@question[:id])
    else
      render :edit
    end

  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where question_id: params[:id]
    @answers = @answers.order("created_at DESC").all
  end

  def destroy

    @question = Question.find(params[:id])

    if @question.user_id != current_user.id
      flash[:notice] = "You must be logged in as the question creator to delete this question."
      redirect_to questions_path(@question)
    else
      @answers = Answer.where question_id: params[:id]

      @answers.each do |answer|
        answer.destroy
      end

      @question.destroy

      flash[:notice] = "Question deleted."
      redirect_to questions_path

    end
  end

  private

  def question_params
    params.require(:question).permit(:question_name, :description, :user_id)
  end

end

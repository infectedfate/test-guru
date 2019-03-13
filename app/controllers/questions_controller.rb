class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[edit show destroy update]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to tests_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def question_not_found
    render plain: 'Вопрос не существует.'
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end

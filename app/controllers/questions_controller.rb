class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

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

  def delete
    @question.destroy
    redirect_to @question.test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def question_not_found
    render plain: 'Вопрос не существует.'
  end
end

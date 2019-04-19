class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  
  def set_test
    @test = Test.find(params[:id])
  end

  def test_not_found
    render plain: 'Тест не существует.'
  end
end

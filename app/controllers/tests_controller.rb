class TestsController < ApplicationController
  before_action :find_test, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    find_test

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_not_found
    render plain: 'Тест не существует.'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

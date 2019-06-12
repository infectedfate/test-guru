class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end
    
  def result
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    response = service.call
    gist_url = response.html_url
    
    flash_options = if service.created_code?
      create_gist_link(gist_url)
      { notice: t('.success', url: gist_url) }
    else
      { alert: t('.failure') }
    end
    
    redirect_to @test_passage, flash_options
  end
  

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      awarded_badges! if @test_passage.successfully_completed?

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def create_gist_link(gist_url)
    current_user.gists.create(question: @test_passage.current_question, url: gist_url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def awarded_badges
    badge_service = BadgeService.new(@test_passage)
    badge_service.awarded_badges!
    current_user.badges.push(badge_service.badges)
  end
  
end

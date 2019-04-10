class ApplicationController < ActionController::Base
  
  def authenticate_user!
    unless current_user
      redirect_to login_path
    end
  end

  def current_user
    User.find_by(id: session[:user_id] if session[:user_id])
  end
  
  
end

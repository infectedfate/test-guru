class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:mail])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:page] || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end

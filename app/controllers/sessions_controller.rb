class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:mail])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash_message(:alert, 'Are you a Guru?')
      render :new
    end
  end

  def destroy
    
  end
  
end

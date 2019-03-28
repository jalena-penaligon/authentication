class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address])
    if user && User.authenticate(params[:session][:email_address], params[:session][:password])
      log_in(user)
      redirect_to user_path(user)
    else
      flash.notice = 'Invalid email/password combination'
      render :new
    end
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end
end

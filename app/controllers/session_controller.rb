class SessionController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user.validate_password(params[:user][:password])
      session[:session_token] = @user.set_session_token!
      redirect_to users_url
    else
      render :new
    end
  end

  def destroy
    current = current_user
    current.session_token = nil
    current.save
    session[:session_token] = nil
    redirect_to log_in_url
  end

end

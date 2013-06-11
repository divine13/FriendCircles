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

end

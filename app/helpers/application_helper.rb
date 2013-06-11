module ApplicationHelper

  def current_user
    if token = session[:session_token]
      @current_user ||= User.find_by_session_token(token)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorize_user
    redirect_to log_in_url unless logged_in?
  end
end

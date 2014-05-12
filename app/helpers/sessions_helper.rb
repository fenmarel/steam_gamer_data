module SessionsHelper
  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return @current_user = nil if session[:session_token].nil?

    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token!
    @current_user = session[:session_token] = nil
    redirect_to new_session_url
  end
end
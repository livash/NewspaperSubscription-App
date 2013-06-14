class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    return nil if session[:session_token].nil?
    @user = User.find_by_session_token(session[:session_token])
    puts @user
    @user
  end
  
  def verify_user
    unless current_user.session_token == session[:session_token]
      return redirect_to new_session_url
    end
  end
end

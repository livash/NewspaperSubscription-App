class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user and @user.check_password?(params[:user][:password])
      @user.issue_new_session_token!
      @user.save
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def destroy
    #verify_user
    @user = current_user
    @user.session_token = nil
    @user.save
    session[:session_token] = nil
    redirect_to new_session_url
  end

end

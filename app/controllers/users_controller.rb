class UsersController < ApplicationController
 before_filter :verify_user, :except => [:new, :create]

  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      @user.issue_new_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @newspapers = Newspaper.all
    render :show
  end
  
  def update
    puts params
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      @newspapers = Newspaper.all
      render :show
    else
      flash[:message] = "Your subscription failed. Try again."
      @newspapers = Newspaper.all
      render :show
    end
  end

end

class NewspapersController < ApplicationController
  before_filter :verify_user

  def index
    @user = current_user
    @newspapers = Newspaper.all
  end
  
  def new
    @user = current_user
    @newspaper = Newspaper.new
    @users = User.all
  end
  
  def create
    @user = current_user
    @newspaper = Newspaper.new(params[:newspaper])
    if @newspaper.save
      redirect_to newspaper_url(@newspaper)
    else
      render :new
    end
  end
  
  def show
    @user = current_user
    @newspaper = Newspaper.find(params[:id])
  end
  
  def destroy
    @user = current_user
    @newspaper = Newspaper.find(params[:id])
    if @newspaper
      @newspaper.destroy
      @newspapers = Newspaper.all
      render :index
    else
      @newspapers = Newspaper.all
      flash[:notice] = "Can not delete newspaper with ID=#{params[:id]}"
      render :index
    end
  end

end

class SubscriptionPlansController < ApplicationController
  before_filter :verify_user
  def new
    @user = current_user
    @newspapers = Newspaper.all
    @subscription = SubscriptionPlan.new
  end

  def create
    @user = current_user
    @subscription = SubscriptionPlan.new(params[:subscription])
    if @subscription.save
      redirect_to @subscription
    else
      @newspapers = Newspaper.all
      render :new
    end
  end
  
  def show
    @user = current_user
    @subscription = SubscriptionPlan.find(params[:id])
  end
end

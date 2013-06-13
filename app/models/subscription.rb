class Subscription < ActiveRecord::Base
  attr_accessible :subscription_plan_id, :user_id
  
  belongs_to :subscription_plan
  
  belongs_to :user
  
end

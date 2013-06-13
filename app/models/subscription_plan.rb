class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :subscription_type
  
  validates :newspaper, :presence => true
  validates :subscription_type, :inclusion => { :in => [true, false] }
  
  belongs_to :newspaper,
  :foreign_key => :newspaper_id
  
  has_many :users, 
  :through => :subscriptions,
  :source => :user
  
   
end

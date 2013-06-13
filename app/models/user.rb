require "securerandom"
require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :username, :password, :subscription_plan_ids
  
  has_many :edited_newspapers,
  :class_name => "Newspaper",
  :foreign_key => :editor_id
  
  has_many :subscriptions,
  :foreign_key => :user_id,
  :dependent => :destroy
  
  has_many :subscription_plans,
  :through => :subscriptions,
  :source => :subscription_plan
  
  has_many :newspapers, 
  :through => :subscriptions,
  :through => :subscription_plan,
  :source => :newspaper
  
  def issue_new_session_token!
    self.session_token = SecureRandom::base64
    self.save
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end
  
  def check_password?(pass)
    BCrypt::Password.new(self.password_digest) == pass
  end
  
  def subscribed?(sub_plan_id)
    self.subscription_plan_ids.include?(sub_plan_id)
  end
end

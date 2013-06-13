class Newspaper < ActiveRecord::Base
  attr_accessible :editor_id, :title, :subscription_plans_attributes
  
  validates :title, :presence => true
  
  belongs_to :editor,
  :class_name => "User",
  :foreign_key => :editor_id
  
  has_many :subscription_plans,
  :foreign_key => :newspaper_id,
  :inverse_of => :newspaper,
  :dependent => :destroy
  
  accepts_nested_attributes_for :subscription_plans
end

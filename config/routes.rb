NewspaperClone::Application.routes.draw do
 
  resource :session
  resources :newspapers, :subscription_plans, :users
  
end

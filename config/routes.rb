Rails.application.routes.draw do
  #get 'welcome/index'
  resources :users do
    resources :tasks
  end


  post 'users/login_user', :to => 'users#login_user', as: 'login_user'
  root 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

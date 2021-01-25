Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
      get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session_path
      get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :pins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pins#index'
end

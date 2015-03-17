Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', confirmations: 'users/confirmations' }

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
      resources :tracks, only: [:index, :show]
    end
  end

  devise_scope :user do
    get '/confirmation-getting-started' => 'users/confirmations#getting_started', as: :confirmation_getting_started
  end

  root to: 'home#index'
end

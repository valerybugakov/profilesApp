Rails.application.routes.draw do
  root :to => 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    resources :users, only: [:index, :show], controller: 'registrations'
    put 'users/:id/remove_avatar', to: 'registrations#remove_avatar', as: 'remove_avatar'
    scope "/admin" do
      resources :users, only: [:show, :edit, :update, :destroy], as: 'admin_user'
      get 'users/:id/ban' => 'users#ban', as: 'ban_user'
    end
  end

end

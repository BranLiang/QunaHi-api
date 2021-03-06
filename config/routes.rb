Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    resources :events

    resources :users, except: :put

    resources :password_resets, only: [:show, :create, :update],
                                param: :reset_token
    resources :user_confirmations, only: :show, param: :confirmation_token
    resources :access_tokens, only: :create do
      delete '/', action: :destroy, on: :collection
    end
  end
end

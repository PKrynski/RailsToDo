Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :to_do_lists do
    resources :items do
      member do
        patch :complete
      end
    end
  end

  root 'to_do_lists#index'

end

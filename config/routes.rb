Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :to_do_lists

  root 'to_do_lists#index'

end

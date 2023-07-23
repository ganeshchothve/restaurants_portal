Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dishes#index'
  resources :restaurants do
    resources :dishes
    member do
      patch :change_status
    end
  end

  resources :dishes do
  end
end

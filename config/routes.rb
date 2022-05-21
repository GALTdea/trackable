Rails.application.routes.draw do
   root "items#index"
  resources :comments
  # resources :items

  resources :items do
    resources :comments, only: [:new, :create]
    member do 
      get :soft_deletion
      get :restore
    end
  end

 
end

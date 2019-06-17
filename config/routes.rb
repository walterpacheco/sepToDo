Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'

  get 'my_completes' ,to:'userlist#index'

  devise_for :users
  resources :lists, only: :index do
    resources :userlists,only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post  'lists/:id/listo', to:'lists#listo', as:'listo_lists'
  resources :complete, only: [:update, :index]
  root to: "complete#index"

end

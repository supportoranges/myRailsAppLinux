Rails.application.routes.draw do

  resources :products #, :except => [:create]
  resources :indis #, :except => [:create]
  as :indis do
    get 'indis/search' => 'indis#search'
  end
  get 'tasks/search'

  get "tasks/searchC"

  resources :profiles do
    resources :indis
    resources :products
  end
  #devise_for :users
  devise_for :users
  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  delete "indis/delete/:id/:file_id" =>  'indis#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

end

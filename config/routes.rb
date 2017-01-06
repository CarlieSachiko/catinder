Rails.application.routes.draw do

  root 'welcome#index', as: :home

  get '/cats' => "cats#index"

  get 'cats/new' => 'cats#new', as: :new_cat

  get '/cats/:id' => "cats#show", as: :cat

  post 'cats/' => 'cats#create'

end

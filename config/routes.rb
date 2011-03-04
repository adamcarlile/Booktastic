Booktastic::Application.routes.draw do
  root :to => "bookmarks#index"
  
  resources :bookmarks
  resources :tags, :only => :index
  
end

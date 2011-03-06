Booktastic::Application.routes.draw do
  root :to => "domains#index"
  
  resources :domains, :only => :index do
    resources :bookmarks
  end
  resources :bookmarks
  
  resources :tags, :only => :index
  
end

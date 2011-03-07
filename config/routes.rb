Booktastic::Application.routes.draw do
  root :to => "domains#index"
  
  resources :domains, :only => :index do
    resources :bookmarks
  end
  resources :bookmarks do
    collection do
      get 'search'
    end
  end
  
  resources :tags, :only => :index
  
end

Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter

  resources :booka_lines, :path => 'series'
  resources :comments, :path => 'comentar'

  resources :users, :path => 'participantes'

  scope '/admin' do
    resources :versions, :path => 'versiones'
  end

  resources :projects, :path => '' do
    resources :contents, :path => 'materiales'
    resources :posts, :path => 'paginas'
    resources :permissions, :path => 'participantes'
  end

end

Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  scope(:path_names => {:new => "nueva", :edit => "editar"}) do
    resources :booka_lines, :path => 'series'

    resources :users, :path => 'participantes' do
      get 'email_notifications', :on => :member
      resources :authentications, :path => 'autorizaciones'
      resources :notifications, :path => 'actividad', :only => [:index, :show, :update] do
        get 'clear', :on => :collection
      end
    end

    resources :contents, :only => [:search] do
      get 'search', on: :collection
    end

    resources :versions, :path => 'ver', :only => [:index, :show]

    resource :system
    resources :comments, :path => 'comentar'
    resources :invitations, :path => 'invitacion', :only => :create
    resources :feedbacks, :path => 'tu_opinion'

    namespace :backend do
      root to: "projects#index"
      resources :users
      resources :booka_lines
      resources :projects
      resources :pages
      resources :versions
    end

    namespace :alacarte do
      root to: "carte_books#index"
      resources :carte_books, :path => 'libros' do
        get :content, on: :member, path: 'contenido'
      end
    end


    match "/auth/:provider/callback" => "sessions#create"
    match "/cerrar" => "sessions#destroy", :as => :logout
    match "/identificarse" => "sessions#new", :as => :login
    match "/enter/:id" => "sessions#enter", :as => :enter
    match "/invitacion/:id/:code" => "invitations#show"

    constraints CanAccessResque do
      mount Resque::Server, at: 'resque'
    end


    resources :projects, :path => '' do
      resources :read_pages, :path => 'leer'

      scope module: :contents do
        resources :contents, :path => 'materiales' do
          resources :assets, :path => 'archivos', :only => [:index]
        end
      end

      resources :posts, :path => 'entrada'

      scope module: :community do
        resources :permissions, :path => 'comunidad'
      end

      scope module: :forum do
        resources :topics, :path => 'edicion' do
          resources :proposals, :path => 'propuestas'
          resources :agreements, :path => 'acuerdos' #, :only => [:new, :edit]
          resources :tasks, :path => 'tareas' #, :only => [:new, :edit]
        end
      end

      resources :pages, :path => 'paginas' do
        resource :positions, :only => :update
      end

      resources :assets, :path => 'archivos'
      resources :project_proposals, :path => 'propuestas' do
        get 'my_proposal', :on => :collection, :path => 'mi_propuesta'
      end
    end
  end
end

Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/invitacion/:id/:code" => "invitations#show"

  scope(:path_names => {:new => "nueva", :edit => "editar"}) do
    resources :booka_lines, :path => 'series'

    resources :users, :path => 'participantes' do
      get 'email_notifications', :on => :member
      resources :authentications, :path => 'autorizaciones'
      resources :notifications, :path => 'actividad', :only => [:index, :show, :update] do
        get 'clear', :on => :collection
      end
    end
    resources :versions, :path => 'ver', :only => [:index, :show]

    resource :system
    resources :comments, :path => 'comentar'
    resources :invitations, :path => 'invitacion', :only => :create
    resources :feedbacks, :path => 'tu_opinion'


    resources :projects, :path => '' do
      resources :read_pages, :path => 'leer'
      resources :contents, :path => 'materiales'
      resources :posts, :path => 'entrada'
      resources :permissions, :path => 'comunidad'
      resources :topics, :path => 'edicion' do
        resources :proposals, :path => 'propuestas'
        resources :agreements, :path => 'acuerdos'#, :only => [:new, :edit]
        resources :tasks, :path => 'tareas'#, :only => [:new, :edit]
      end
      resources :pages, :path => 'paginas'
      resources :assets, :path => 'archivos'
      resources :project_proposals, :path => 'propuestas' do
        get 'my_proposal', :on => :collection, :path => 'mi_propuesta'
      end
    end
  end

end

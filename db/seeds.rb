# encoding: utf-8

def content(file)
  path = File.join(Rails.root, 'db/content', file)
  File.read(path)
end

def new_serie(user, project, title, name)
  BookaLine.create!(:title => title, :slug => name, :icon_path => "/assets/iconos/#{name}.png",
                    :user_id => user.id, :project_id => project,
                    :body => content("series/#{name}.md"), :content_type => 'text/markdown')
end

def new_project(user, serie, title, name, stages)
  serie_id = serie ? serie.id : nil
  Project.create!(:title => title, :slug => name, :user_id => user.id, :booka_line_id => serie_id,
                  :content_type => 'text/markdown', :body => content("projects/#{name}.md"), :stages => stages)
end

def add_users(who, project, users)
  users.each do |user|
    project.permissions.create!(:user_id => user.id, :level => 'admin', :last_modifier_id => who.id)
  end
end

def new_post(user, project, title, name, published = true)
  Post.create!(:title => title, :slug => name, :user_id => user.id, :published => published,
               :content_type => 'text/markdown', :body => content("posts/#{name}.md"), :project_id => project.id)
end

def new_content(user, project, title, author, name)
  Content.create!(:user_id => user.id, :project_id => project.id, :title => title, :author => author,
                  :content_type => 'text/markdown', :body => content("content/#{name}.md"))
end

def new_asset(user, content, title, url)
  Asset.create!(:user_id => user.id, :project_id => content.project_id, :title => title,
                :url_file => url, :resource => content)
end

def new_topic(user, project, title, name)
  Topic.create(:user_id => user.id, :project_id => project.id, :title => title,
               :content_type => 'text/markdown', :body => content("topics/#{name}.md"))
end

def new_response(model, user, topic, title, body)
  model.create!(:user => user, :topic => topic, :project => topic.project,
                :title => title, :content_type => 'text/markdown', :body => body)
end

def new_proposal(user, topic, title, body)
  new_response(Proposal, user, topic, title, body)
end

def new_agreement(user, topic, title, body)
  new_response(Agreement, user, topic, title, body)
end

def new_task(user, topic, title, body)
  new_response(Task, user, topic, title, body)
end

def new_page(user, project, title, name)
  Page.create!(:user => user, :project => project, :title => title,
               :content_type => 'text/markdown', :body => content("pages/#{name}.md"))
end

if (User.count == 0)
  admin = User.create!(:name => 'Administrador', :email => 'admin@plataformabooka.net', :roles => 'admin')
  User.create!(:name => 'Anónimo', :email => 'anonymous@plataformabooka.net', :roles => 'anonymous')
  User.create!(:name => 'Visitante', :email => 'visitor@plataformabooka.net', :roles => '')
  dani = User.create!(:name => 'Danigb', :email => 'danigb@gmail.com', :roles => 'super admin')
  paula = User.create!(:name => 'Paula', :email => 'alvarpau@gmail.com', :roles => 'admin')
  samuel = User.create!(:name => 'Samuel', :email => 'samuelgarciaperez@gmail.com', :roles => 'admin')

  # BOOKA
  booka = new_project(admin, nil, 'Guía Booka', 'booka', 'topics pages')
  add_users(admin, booka, [admin, dani, paula, samuel])
  new_post(admin, booka, 'Plataforma Booka', 'booka', false) # welcome page

  new_page(dani, booka, '1. Qué es booka', 'booka/que')
  new_page(dani, booka, '2. Mesas de booka', 'booka/propuestas')
  new_page(dani, booka, '2.1 Mesa de materiales', 'booka/materiales')
  new_page(dani, booka, '2.2 Mesa de edición', 'booka/edicion')
  new_page(dani, booka, '2.3 Mesa de lectura', 'booka/lectura')
  new_page(dani, booka, '2.4 Comunidad', 'booka/comunidad')
  new_page(dani, booka, '3. Preguntas más frecuentas', 'booka/faq')

  topic = new_topic(dani, booka, 'Creación de la guía', 'booka/guia')
  new_proposal(dani, topic, 'Dedicar una semana a los contenidos', 'Buscar un sitio de trabajo y ponernos juntas a trabajar')
  new_agreement(dani, topic, 'Dedicar una semana a los contenidos', 'Buscar un sitio de trabajo y ponernos juntas a trabajar')
  new_task(dani, topic, 'Crear la página "Qué es Booka"', 'Necesitamos una página para explicar el proyecto.')


  rewrite = new_serie(admin, booka, 'Re-write this book', 'rewrite')
  new_serie(admin, booka, 'Networked Books', 'networked')
  new_serie(admin, booka, 'Books à la carte', 'alacarte')

  ## CCC
  ccc = new_project(paula, rewrite, 'Arquitecturas Colectivas / Collective Architectures', 'ccc', 'contents topics pages')
  add_users(paula, ccc, [dani, paula, samuel])
  catedrales = new_content(paula, ccc, 'De catedrales a contenedores', 'Jose María Galán', 'ccc/catedrales')
  new_asset(paula, catedrales, 'Vigilantes de la playa', 'http://bookasite.s3.amazonaws.com/booka/file/11/foto1.jpg')
  new_asset(paula, catedrales, 'Una buena dicha', 'http://bookasite.s3.amazonaws.com/booka/file/12/foto2.jpg')
  new_asset(paula, catedrales, 'Wish you were here', 'http://bookasite.s3.amazonaws.com/booka/file/13/foto3.jpg')
  new_content(paula, ccc, 'Arquitecturas colectivas', 'Santiago Cirugeda Parejo', 'ccc/colectivas')
  new_content(paula, ccc, 'Carta a los colectivos', 'Unai Reglero', 'ccc/carta')
  new_content(paula, ccc, 'Cun día en el Spider', 'Un relato de LaFundició', 'ccc/spider')
  new_content(paula, ccc, 'En construcción', 'Caldodecultivo, LaFundició, Recetas Urbanas, Straddle3 y Todo por la praxis', 'ccc/construccion')
  new_content(paula, ccc, 'Del trabajo autoorganizado a la reconstrucción del común', 'Judith Albors Casanova', 'ccc/trabajo')
  new_content(paula, ccc, 'Sinopsis temporal', '', 'ccc/sinopsis')

  gender = new_project(paula, rewrite, 'Genderless Architecture', 'genderless', 'contents topics')
  add_users(paula, gender, [dani, paula, samuel])

end

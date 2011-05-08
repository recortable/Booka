# encoding: utf-8

def content(file)
  path = File.join(Rails.root, 'db/content', file)
  File.read(path)
end

def new_serie(title, name)
  BookaLine.create!(:title => title, :slug => name, :icon_path => "/assets/iconos/#{name}.png",
                    :body => content("series/#{name}.md"), :content_type => 'text/markdown')
end

def new_project(user, serie, title, name)
  serie_id = serie ? serie.id : nil
  Project.create!(:title => title, :slug => name, :user_id => user.id, :booka_line_id => serie_id,
                  :content_type => 'text/markdown', :body => content("projects/#{name}.md"), :stages => 'intro')
end

def new_page(user, project, title, name)
  published = name.present?
  Post.create!(:title => title, :slug => name, :user_id => user.id, :published => published,
  :content_type => 'text/markdown', :body => content("pages/#{name}.md"), :project_id => project.id)
end

def new_content(user, project, title, author, name)
  Content.create(:user_id => user.id, :project_id => project.id, :title => title, :author => author,
  :content_type => 'text/markdown', :body => content("content/#{name}.md"))
end

if (User.count == 0)
  admin = User.create(:name => 'Admin', :email => 'admin@plataformabooka.net', :roles => 'admin')
  User.create(:name => 'Anónimo', :email => 'anonymous@plataformabooka.net', :roles => 'anonymous')
  User.create(:name => 'Visitante', :email => 'visitor@plataformabooka.net', :roles => '')
  User.create(:name => 'Danigb', :email => 'danigb@gmail.com', :roles => 'super admin')
  paula = User.create(:name => 'Paula', :email => 'alvarpau@gmail.com', :roles => 'admin')
  User.create(:name => 'Samuel', :email => 'samuelgarciaperez@gmail.com', :roles => 'admin')

  rewrite = new_serie('Re-write this book', 'rewrite')
  new_serie('Networked Books', 'networked')
  new_serie('Books à la carte', 'alacarte')

  guia = new_project(admin, nil, 'Plataformabooka.net', 'guia')
  new_page(admin, guia, 'Plataforma Booka', 'booka')

  ccc = new_project(admin, rewrite, 'Arquitecturas Colectivas / Collective Architectures', 'ccc')
  new_content(paula, ccc, 'De catedrales a contenedores', 'Jose María Galán', 'ccc/catedrales')
  new_content(paula, ccc, 'Arquitecturas colectivas', 'Santiago Cirugeda Parejo', 'ccc/colectivas')
  new_content(paula, ccc, 'Carta a los colectivos', 'Unai Reglero', 'ccc/carta')
  new_content(paula, ccc, 'Cun día en el Spider', 'Un relato de LaFundició', 'ccc/spider')
  new_content(paula, ccc, 'En construcción', 'Caldodecultivo, LaFundició, Recetas Urbanas, Straddle3 y Todo por la praxis', 'ccc/construccion')
  new_content(paula, ccc, 'Del trabajo autoorganizado a la reconstrucción del común', 'Judith Albors Casanova', 'ccc/trabajo')
  new_content(paula, ccc, 'Sinopsis temporal', '', 'ccc/sinopsis')

  new_project(admin, rewrite, 'Genderless Architecture', 'genderless')

end

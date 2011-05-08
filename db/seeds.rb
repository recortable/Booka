# encoding: utf-8

User.create(:name => 'Admin', :email => 'admin@plataformabooka.net', :roles => 'admin')
User.create(:name => 'Anónimo', :email => 'anonymous@plataformabooka.net', :roles => 'anonymous')
User.create(:name => 'Visitante', :email => 'visitor@plataformabooka.net', :roles => '')
User.create(:name => 'Danigb', :email => 'danigb@gmail.com', :roles => 'super admin')
User.create(:name => 'Paula', :email => 'alvarpau@gmail.com', :roles => 'admin')
User.create(:name => 'Samuel', :email => 'samuelgarciaperez@gmail.com', :roles => 'admin')

BookaLine.create!(:title => 're-write this book', :slug => 'rewrite', :icon_path => '/assets/iconos/rewrite.png')
BookaLine.create!(:title => 'vibooka', :slug => 'vibooka', :icon_path => '/assets/iconos/vibooka.png')
BookaLine.create!(:title => 'libros a la carta', :slug => 'alacarta', :icon_path => '/assets/iconos/carta.png')

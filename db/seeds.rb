# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Daley', city: cities.first)

User.create(:name => 'Admin', :email => 'admin@plataformabooka.net', :roles => 'admin')
User.create(:name => 'Danigb', :email => 'danigb@gmail.com', :roles => 'admin')
User.create(:name => 'Paula', :email => 'alvarpau@gmail.com', :roles => 'admin')
User.create(:name => 'Samuel', :email => 'samuelgarciaperez@gmail.com', :roles => 'admin')

Collection.create!(:title => 're-write this book', :icon_path => '/assets/iconos/rewrite.jpg')
Collection.create!(:title => 'vibooka', :icon_path => '/assets/iconos/vibooka.jpg')
Collection.create!(:title => 'libros a la carta', :icon_path => '/assets/iconos/carta.jpg')

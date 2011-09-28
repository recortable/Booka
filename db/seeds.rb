# encoding: utf-8

admin = User.create!(name: 'Administrador', email: 'admin@plataformabooka.net', roles: 'admin')
User.create!(name: 'Anónimo', email: 'anonymous@plataformabooka.net', roles: 'anonymous')
booka = BookaLine.create!(user: admin, title: 'Booka', slug: 'booka')
guia = Project.create!(title: 'Guía Booka', slug: 'guia', content_type: 'text/markdown',
                       user: admin, booka_line: booka, body: 'Guía Booka')
Post.create!(user: admin, project: guia, title: 'Booka', slug: 'booka',
             body: 'Bienvenido a Booka', content_type: 'text/markdown')
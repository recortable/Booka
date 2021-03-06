# SOURCES setup users: http://www.viget.com/extend/building-an-environment-from-scratch-with-capistrano-2/
# setup deploy: http://www.capify.org/getting-started/from-the-beginning/

# default_run_options[:pty] = true
set :application, "PlataformaBooka"
set :deploy_to, "/home/deploy/#{application}"
set :user, "deploy"
set :use_sudo, false

set :scm, "git"
set :repository, "git://github.com/recortable/Booka.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, false


role :app, "recortable.net"
role :web, "recortable.net"
role :db, "recortable.net", :primary => true

# Add RVM's lib directory to the load path.
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# Load RVM's capistrano plugin.
require "rvm/capistrano"


set :rvm_ruby_string, '1.9.2@booka'
set :rvm_type, :user # Don't use system-wide RVM

after "deploy", "deploy:cleanup"

load 'config/deploy/symlink'
# Precompile assets in local
load 'deploy/assets'

load 'config/deploy/mysql'
load 'config/deploy/local_assets'

load 'config/deploy/unicorn'
#load 'conifg/deploy/passenger'

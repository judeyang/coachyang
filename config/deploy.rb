require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/puma'
require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)

set :application_name, 'CoachYang'
set :domain, 'deploy@47.52.110.39'
set :deploy_to, '/www/coach_yang'
set :repository, 'https://github.com/judeyang/coachyang.git'
set :branch, 'master'


set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')


task :environment do
  invoke :'rbenv:load'
end

task :setup do
  # command %{rbenv install 2.3.1}
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
  comment "Be sure to edit #{fetch(:shared_path)}/config/database.yml, #{fetch(:shared_path)}/secrets.yml and #{fetch(:shared_path)}/puma.rb."
end

desc "Deploys the current version to the server."
task :deploy do
  # invoke :'git:ensure_pushed'
  deploy do
    comment "Deploying #{fetch(:application_name)} to #{fetch(:domain)}:#{fetch(:deploy_to)}"
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    command %{#{fetch(:rails)} db:seed}
    command %{yarn install}
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/start.txt}
        invoke :'puma:start'
      end
    end
  end
end

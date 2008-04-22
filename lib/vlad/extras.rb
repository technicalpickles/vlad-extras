require 'yaml'
require 'rubygems'
require 'vlad'

namespace :vlad do
  set :admin_db_user, 'root'
  
  desc "Sets up the database user"
  remote_task :setup_database, :roles => :db do
    read_config
    sql = [
      "create database #{db_name};",
      "grant all privileges on #{db_name}.* to #{db_user}@localhost identified by '#{db_password}';"
    ].compact.join ''
    execute_sql sql
  end
  
  def execute_sql(sql)
    cmd = [
           "mysql",
           "--user='#{admin_db_user}'",
           "--password='#{admin_db_password}'",
           %Q(--execute="#{sql}")
         ].compact.join ' '
    run cmd
  end
  
  def read_config
    db_config = YAML.load_file('config/database.yml')
    set :db_user, db_config[rails_env]["username"]
    set :db_password, db_config[rails_env]["password"] 
    set :db_name, db_config[rails_env]["database"]
  end
end
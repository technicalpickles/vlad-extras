= vlad-extras

These are some extra vlad tasks. The database related ones are inspired by the capistrano recipes from the railsmachine gem.

To use the database tasks, add to `config/deploy.rb`:

    set :admin_db_user, 'root'
    set :admin_db_password, 'topsekrit'

Then use it like:

    rake vlad:setup_database

== Resources

 * http://hitsquad.rubyforge.org/vlad/
 * https://rubyforge.org/projects/railsmachine/
Chef::Log.info("Running deploy/before_migrate.rb")

environment_variables = node[:deploy][:admcustomerservice][:environment_variables]
environment_variables.each do |key, value|
  Chef::Log.info("Setting ENV[#{key}] to #{value}")
  ENV[key] = value
end

env = node[:deploy][:admcustomerservice][:rails_env]
current_release = release_path

execute "rake assets:precompile" do
  cwd current_release
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => env
end

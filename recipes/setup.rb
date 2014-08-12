#
# Cookbook Name:: example_app
# Recipe:: setup
#

user "example_app" do
  shell "/bin/bash"
  comment "User account for example_app"
end

directory "/srv/example_app" do
  owner "example_app"
  group "www-data"
  mode "0755"
end

git "/srv/example_app" do
  repository node['example_app']['repository']
  user "example_app"
  group "example_app"
  revision node['example_app']['revision']
end

supervisor_service "example_app" do
  command "node helloworld.js"
  directory "/srv/example_app"
  autostart true
  autorestart true
  user "example_app"
end

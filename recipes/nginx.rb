#
# Cookbook Name:: example_app
# Recipe:: nginx
#

if node['example_app']['setup_nginx'] then
  include_recipe 'nginx'
end

template "/etc/nginx/sites-available/example_app" do
  source "site.erb"
  mode "0644"
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end

execute "nxensite example_app" do
  not_if { ::File.exists?("/etc/nginx/sites-enabled/example_app") }
  notifies :restart, "service[nginx]"
end

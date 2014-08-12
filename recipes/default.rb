#
# Cookbook Name:: example_app
# Recipe:: default
#

include_recipe 'git'

if node['example_app']['setup_supervisor'] then
  include_recipe 'supervisor'
end

if node['example_app']['setup_nodejs'] then
  include_recipe 'nodejs'
end

include_recipe 'example_app::setup'

if node['example_app']['webserver'] == :nginx then
  include_recipe 'example_app::nginx'
end

require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe user('example_app') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
end

describe file('/srv/example_app') do
  it { should be_directory }
  it { should be_owned_by 'example_app' }
  it { should be_grouped_into 'www-data' }
end

describe port('1337') do
  it { should be_listening }
end

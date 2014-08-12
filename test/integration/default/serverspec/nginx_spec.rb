require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe port('80') do
  it { should be_listening }
end

describe file('/etc/nginx/sites-available/example_app') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/nginx/sites-enabled/example_app') do
  it { should be_linked_to '/etc/nginx/sites-available/example_app' }
end

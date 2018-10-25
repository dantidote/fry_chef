#
# Cookbook:: fry
# Recipe:: docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform']
when 'raspbian'
  execute 'get-docker' do
    command 'curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh'
    not_if { File.exists?('/usr/bin/docker') }
  end
  package 'docker-ce'
else
  package 'docker'
end

service 'docker' do
  action [:enable, :start]
end

#
# Cookbook:: fry_chef
# Recipe:: juicy
#
# Copyright:: 2018, The Authors, All Rights Reserved.


node.default['juicy']['script_location'] = "/tmp/juicy.py"
node.default['juicy']['api_key'] = ""

package 'python-requests'

git '/usr/local/lib/python2.7/site-packages/'  do
  repository 'https://github.com/jesserockz/python-juicenet.git'
end

template node['juicy']['script_location'] do
  source "juicy.py.erb"
end

cron 'juicy' do
  command "/usr/bin/python #{node['juicy']['script_location']}"
  user 'root'
  minute '*'
end

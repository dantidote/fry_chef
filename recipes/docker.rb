#
# Cookbook:: fry
# Recipe:: docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

service 'docker' do
  action [:enable, :start]
end

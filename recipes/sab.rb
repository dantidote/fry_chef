#
# Cookbook:: fry
# Recipe:: sab
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/sab' do
  tag 'latest'
  source '/root/docker_sab'
  action :build_if_missing
end

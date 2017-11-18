#
# Cookbook:: fry
# Recipe:: sonarr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/sonarr' do
  tag 'latest'
  source '/root/docker_sonarr'
  action :build_if_missing
end

#
# Cookbook:: fry
# Recipe:: storj
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/storj' do
  #tag 'latest'
  source '/root/docker_storj'
  action :build_if_missing
end

docker_container 'storj' do
  repo 'dantidote/storj'
  entrypoint '/bin/sh'
  tty true
  env 'HOME=/configs/home'
  volumes ['/media/storage/storj:/storj',
           '/media/storage/docker/storj/logs:/logs',
           '/media/storage/docker/storj/configs:/configs',
           '/media/storage/docker/storj/configs/collectd.conf:/etc/collectd/collectd.conf',
           '/media/storage/docker/storj/configs/types.db:/usr/share/collectd/types.db']
  port '4000-4003:4000-4003'
  user '1009'
  memory '4294967296'
  memory_swap '8589934592'
end

docker_container 'storj2' do
  repo 'dantidote/storj'
  entrypoint '/bin/sh'
  tty true
  env 'HOME=/configs/home'
  volumes ['/media/ext1/:/storj/5',
           '/media/ext2/:/storj/6',
           '/media/storage/docker/storj/logs:/logs',
           '/media/storage/docker/storj/configs:/configs',
           '/media/storage/docker/storj/configs/collectd.conf:/etc/collectd/collectd.conf',
           '/media/storage/docker/storj/configs/types.db:/usr/share/collectd/types.db']
  port '4004-4005:4004-4005'
  user '1009'
  memory '4294967296'
  memory_swap '4294967296'
end

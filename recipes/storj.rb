#
# Cookbook:: fry
# Recipe:: storj
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/storj' do
  #tag 'latest'
  source '/root/docker_storj'
  nocache true
  read_timeout 600
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
end

docker_container 'storj2' do
  repo 'dantidote/storj'
  entrypoint '/bin/sh'
  tty true
  env 'HOME=/configs/home2'
  volumes ['/media/ext1/:/storj/5',
           '/media/ext2/:/storj/6',
           '/media/storage/docker/storj/logs:/logs',
           '/media/storage/docker/storj/configs:/configs',
           '/media/storage/docker/storj/configs/collectd.conf:/etc/collectd/collectd.conf',
           '/media/storage/docker/storj/configs/types.db:/usr/share/collectd/types.db']
  port '4004-4005:4004-4005'
  user '1009'
  memory '4294967296'
end


bash 'starting storj daemon and farmers' do
  cwd '/media/storage/docker/storj'
  code './start_storjshare.sh'
  not_if "test $(docker exec storj /usr/bin/storjshare status | grep running | wc -l) -eq 4 "
end


bash 'starting storj2 daemon and farmers' do
  cwd '/media/storage/docker/storj'
  code './start_storjshare.sh'
  not_if 'test $(docker exec storj2 /usr/bin/storjshare status | grep running | wc -l) -eq 2'
end

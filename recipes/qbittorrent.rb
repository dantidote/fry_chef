#
# Cookbook:: fry_chef
# Recipe:: qbittorrent
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'docker'

docker_image 'linuxserver/qbittorrent'

docker_container 'qbittorrent' do
  repo 'linuxserver/qbittorrent'
  volumes ['/media/storage/Torrent:/downloads',
           '/home/qbittorrent/.config/qbittorrent:/config']
  port ['8083:8083', '6881:6881', '6881:6881/udp']
  env ['WEBUI_PORT=8083','PUID=1011','PGID=1111']
  restart_policy 'always'
end

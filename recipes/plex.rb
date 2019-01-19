#
# Cookbook:: fry_chef
# Recipe:: plex
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_repository 'plexmediaserver' do
  uri 'https://downloads.plex.tv/repo/deb'
  key 'https://downloads.plex.tv/plex-keys/PlexSign.key'
  distribution 'public'
  components ["main"]
end

package 'plexmediaserver'

service 'plexmediaserver' do
  action [:start,:enable]
end

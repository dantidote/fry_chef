#
# Cookbook:: fry
# Recipe:: gemini
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cron 'gemini' do
  command '/media/storage/Source/tothemoon.gemini/gemini.pl'
  user 'root'
  hour '5'
  minute '59'
end

cron 'gdax' do
  command '/media/storage/Source/tothemoon.gdax/tothemoon.py'
  user 'root'
  hour '5'
  minute '59'
end

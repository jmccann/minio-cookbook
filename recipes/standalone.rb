#
# Cookbook Name:: minio
# Recipe:: default
#
# Copyright (c) 2017 Jacob McCann, All Rights Reserved.

include_recipe 'jmccann-docker-host::default'

docker_image 'minio' do
  repo node['minio']['repo']
  tag node['minio']['tag']
end

docker_container 'minio' do
  repo node['minio']['repo']
  tag node['minio']['tag']
  port "#{node['minio']['port']}:9000"
  volumes node['minio']['volumes']
  restart_policy 'always'
  command "server #{node['minio']['paths'].join(' ')}"
end

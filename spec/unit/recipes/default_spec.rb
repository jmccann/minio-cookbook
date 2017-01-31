#
# Cookbook Name:: minio
# Spec:: default
#
# Copyright (c) 2017 Jacob McCann, All Rights Reserved.

require 'spec_helper'

describe 'minio::default' do
  context 'When all attributes are default, on ubuntu' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'pulls minio image' do
      expect(chef_run).to pull_docker_image 'minio'
    end

    it 'starts minio container' do
      expect(chef_run).to run_docker_container('minio').with(command: 'server /export')
    end
  end

  context 'When all attributes are set, on ubuntu' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node, _server|
        node.override['minio']['repo'] = 'jmccann/minio'
        node.override['minio']['tag'] = '20170131'
        node.override['minio']['port'] = 443
        node.override['minio']['volumes'] = ['/root/.minio:/root/.minio', '/export:/mnt1', '/mnt2:/mnt2']
        node.override['minio']['paths'] = ['/mnt1', '/mnt2']
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'pulls minio image' do
      expect(chef_run).to pull_docker_image('minio').with(repo: 'jmccann/minio', tag: '20170131')
    end

    it 'starts minio container' do
      expect(chef_run).to run_docker_container('minio')
        .with(command: 'server /mnt1 /mnt2', port: '443:9000',
              volumes_binds: ['/root/.minio:/root/.minio', '/export:/mnt1', '/mnt2:/mnt2'])
    end
  end
end

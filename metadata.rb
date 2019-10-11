name             'minio'
maintainer       'Patrick Schaumburg'
maintainer_email 'info@p-schaumburg.de'
license          'Apache-2.0'
description      'Installs/Configures minio server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/tecracer/minio-cookbook'
issues_url       'https://github.com/tecracer/minio-cookbook/issues'
version          '0.2.0'

chef_version '>= 14.0'

depends 'jmccann-docker-host', '~> 0.3'

supports 'ubuntu', '= 16.04'
name             'minio'
maintainer       'Jacob McCann'
maintainer_email 'jacob.mccann2@target.com'
license          'all_rights'
description      'Installs/Configures minio'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/jmccann/minio-cookbook'
issues_url       'https://github.com/jmccann/minio-cookbook/issues'
version          '0.1.0'

depends 'jmccann-docker-host', '~> 0.3'

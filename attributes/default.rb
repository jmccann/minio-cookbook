default['minio']['repo'] = 'minio/minio'
default['minio']['tag'] = 'latest'
default['minio']['port'] = 80
default['minio']['volumes'] = ['/root/.minio:/root/.minio']
default['minio']['paths'] = ['/export']

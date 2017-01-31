# minio

Simple cookbook to standup a minio server.

## Supported Platforms

Tested And Validated On
- Ubuntu 16.04

## Usage

TODO: Include usage patterns of any providers or recipes.

### Attribtues

* `node['minio']['repo']` (default: `'minio/minio'`) - The docker repo to pull minio from
* `node['minio']['tag']` (default: `'latest'`) - The docker tag to pull minio with
* `node['minio']['port']` (default: `80`) - The host port to bind minio to
* `node['minio']['volumes']` (default: `['/root/.minio:/root/.minio']`) - The volumes to bind mount
* `node['minio']['paths']` (default: `['/export']`) - The paths to serve from minio container

### minio::default

Include `minio` in your run_list to spin up minio on an existing docker host.

```json
{
  "run_list": [
    "recipe[minio::default]"
  ]
}
```

### minio::standalone

Include `standalone` in your run_list to spin up a docker host and minio.

```json
{
  "run_list": [
    "recipe[minio::standalone]"
  ]
}
```

## Testing

* Linting - Cookstyle and Foodcritic
* Spec - ChefSpec
* Integration - Test Kitchen

Testing requires [ChefDK](https://downloads.chef.io/chef-dk/) be installed using it's native gems.

```
foodcritic -f any -X spec .
cookstyle
rspec --color --format progress
```

If you run into issues testing please first remove any additional gems you may
have installed into your ChefDK environment.  Extra gems can be found and removed
at `~/.chefdk/gem`.

## License and Authors

Author:: Jacob McCann (<jacob.mccann2@target.com>)

```text
Copyright (c) 2017 Jacob McCann, All Rights Reserved.
```

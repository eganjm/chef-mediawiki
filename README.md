# mediawiki-cookbook

This cookbook install and configure [Mediawiki](http://www.mediawiki.org).

## Supported Platforms

* Ubuntu 14.04
* Debian 7

## Attributes

* default['mediawiki']['major'] = '1.24'
* default['mediawiki']['release'] = '1'
* default['mediawiki']['mysql_root_pw'] = 'password'
* default['mediawiki']['apps'] = 'mediawiki'
* default['mediawiki']['admin'] = 'mediawiki'
* default['mediawiki']['password'] = 'password'
* default['mediawiki']['db_server'] = 'localhost'
* default['mediawiki']['apps_server'] = 'localhost'
* default['mediawiki']['domain'] = 'mediawiki.dev'
* default['mediawiki']['title'] = 'my_title'
* default['mediawiki']['lang'] = 'en'

## Usage

This cookbook have two recipes, one of them is used to install and configure the database part. The second one is used to install and configure mediawiki services. You can split the two services depending on your architecture.

### To install and configure the database

Include `mediawiki` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mediawiki::database]"
  ]
}
```

You need to setup the "apps_server" attribute so the mysql ACL will be configure properly.

### To install and configure the mediawiki application

Include `mediawiki` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mediawiki::apps]"
  ]
}
```

You need to setup the "db_server" attribute so the mediawiki application will be configure properly.

### or install both on the same machine

Include `mediawiki` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mediawiki::database]",
    "recipe[mediawiki::apps]"
  ]
}
```

## License and Authors

```
Copyright 2015 Léonard TAVAE

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Authors :

* Léonard TAVAE (<leonard.tavae@informatique.gov.pf>)


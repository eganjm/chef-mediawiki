#
# Cookbook Name:: mediawiki
# Recipe:: database
#
# Copyright (C) 2015 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.set['mysql']['server_root_password'] = node['mediawiki']['mysql_root_pw']

# install the database software
include_recipe 'mysql::server'

# create the database
include_recipe 'database::mysql'

mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  password: node['mediawiki']['mysql_root_pw']
}

mysql_database node['mediawiki']['apps'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['mediawiki']['admin'] do
  connection mysql_connection_info
  password node['mediawiki']['password']
  action :create
end

mysql_database_user node['mediawiki']['admin'] do
  connection mysql_connection_info
  password node['mediawiki']['password']
  database_name node['mediawiki']['apps']
  host node['mediawiki']['apps_server']
  action :grant
end

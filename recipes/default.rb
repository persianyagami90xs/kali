# -*- coding: utf-8 -*-
#
# Cookbook Name:: kali
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'

apt_repository 'kali' do
  uri 'http://http.kali.org/kali'
  distribution 'kali'
  components ['main', 'non-free', 'contrib']
  deb_src true
end

apt_repository 'kali-security' do
  uri 'http://security.kali.org/kali-security'
  distribution 'kali/updates'
  components ['main', 'non-free', 'contrib']
  deb_src false
end

apt_preference 'kali' do
  glob '*'
  pin 'origin http.kali.org'
  pin_priority '700'
end

package 'kali-linux'

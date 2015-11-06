# Overrides
normal['opsworks_java']['jvm_version'] = '8'

normal['opsworks_java']['java_app_server_version'] = '8.0'
normal['opsworks_java']['tomcat']['base_version'] = node['opsworks_java']['java_app_server_version'].to_i

# New Functionality-related
default['opsworks_java']['tomcat8']['apt_repository']['ppa_name'] = 'dirk-computer42-c42-backport'
default['opsworks_java']['tomcat8']['apt_repository']['ppa_uri'] = 'ppa:dirk-computer42/c42-backport'
default['opsworks_java']['tomcat8']['apt_repository']['distribution'] = 'trusty'
default['opsworks_java']['tomcat8']['apt_preference']['package'] = 'tomcat8'
default['opsworks_java']['tomcat8']['apt_preference']['pin'] = "release o=LP-PPA-#{node['opsworks_java']['tomcat8']['apt_repository']['ppa_name']}"
default['opsworks_java']['tomcat8']['apt_preference']['pin_priority'] = '500'

default['opsworks_java']['java8']['apt_repository']['ppa_name'] = 'openjdk-r-ppa'
default['opsworks_java']['java8']['apt_repository']['ppa_uri'] = 'ppa:openjdk-r/ppa'
default['opsworks_java']['java8']['apt_repository']['distribution'] = 'trusty'
default['opsworks_java']['java8']['apt_preference']['package'] = 'openjdk-8-jdk'
default['opsworks_java']['java8']['apt_preference']['pin'] = "release o=LP-PPA-#{node['opsworks_java']['java8']['apt_repository']['ppa_name']}"
default['opsworks_java']['java8']['apt_preference']['pin_priority'] = '500'

default['opsworks_java']['jvm_pkg']['long_name'] = "java-1.#{node['opsworks_java']['jvm_version']}.0-openjdk-amd64"

# Additional Overrides (side-effects of above overrides)

case node[:platform_family]
when 'debian'
  default['opsworks_java']['jvm_pkg']['name'] = "openjdk-#{node['opsworks_java']['jvm_version']}-jdk"
when 'rhel'
  default['opsworks_java']['jvm_pkg']['name'] = "java-1.#{node['opsworks_java']['jvm_version']}.0-openjdk-devel"
end

if ! rhel7?
  normal['opsworks_java']['tomcat']['service_name'] = "tomcat#{node['opsworks_java']['tomcat']['base_version']}"
  normal['opsworks_java']['tomcat']['catalina_base_dir'] = "/etc/tomcat#{node['opsworks_java']['tomcat']['base_version']}"
  normal['opsworks_java']['tomcat']['webapps_base_dir'] = "/var/lib/tomcat#{node['opsworks_java']['tomcat']['base_version']}/webapps"
  normal['opsworks_java']['tomcat']['lib_dir'] = "/usr/share/tomcat#{node['opsworks_java']['tomcat']['base_version']}/lib"
end

default['opsworks_java']['tomcat']['context_dir'] = ::File.join(node['opsworks_java']['tomcat']['catalina_base_dir'], 'Catalina', 'localhost')

case node[:platform_family]
when 'debian'
  default['opsworks_java']['tomcat']['user'] = "tomcat#{node['opsworks_java']['tomcat']['base_version']}"
  default['opsworks_java']['tomcat']['group'] = "tomcat#{node['opsworks_java']['tomcat']['base_version']}"
end
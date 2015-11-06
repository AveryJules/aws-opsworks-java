# java8 is not available via Trusty repository therefore we acquire it via a ppa (it's not currently available through backports either)

# add ppa repository

apt_repository node['opsworks_java']['java8']['apt_repository']['ppa_name'] do
  uri          node['opsworks_java']['java8']['apt_repository']['ppa_uri']
  distribution node['opsworks_java']['java8']['apt_repository']['distribution']
end

# update preference to pin java8 to newly added ppa

apt_preference node['opsworks_java']['java8']['apt_preference']['package'] do
  pin          node['opsworks_java']['java8']['apt_preference']['pin']
  pin_priority node['opsworks_java']['java8']['apt_preference']['pin_priority']
end

# use java8 as jre and jdk throughout the system

#execute '' do
#  command 'update-java-alternatives -s #{node['opsworks_java']['jvm_pkg']['long_name']}'
#end
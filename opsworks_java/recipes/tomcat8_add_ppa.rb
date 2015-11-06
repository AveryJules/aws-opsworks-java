# tomcat8 is not available via Trusty repository therefore we acquire it via a ppa (it's not currently available through backports either)

# add ppa repository

apt_repository node['opsworks_java']['tomcat8']['apt_repository']['ppa_name'] do
  uri          node['opsworks_java']['tomcat8']['apt_repository']['ppa_uri']
  distribution node['opsworks_java']['tomcat8']['apt_repository']['distribution']
end

# update preference to pin tomcat8 to newly added ppa

apt_preference node['opsworks_java']['tomcat8']['apt_preference']['package'] do
  pin          node['opsworks_java']['tomcat8']['apt_preference']['pin']
  pin_priority node['opsworks_java']['tomcat8']['apt_preference']['pin_priority']
end

#Contents:
#Package: tomcat8
#Pin: release o=LP-PPA-dirk-computer42-c42-backport
#Pin-Priority: 500

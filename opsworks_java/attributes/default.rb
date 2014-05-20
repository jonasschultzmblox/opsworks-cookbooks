###
# Do not use this file to override the opsworks_java cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "opsworks_java/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'opsworks_java/attributes/default.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###

default['opsworks_java'] = {}

default['opsworks_java']['jvm'] = 'openjdk'
default['opsworks_java']['jvm_version'] = '7'
default['opsworks_java']['jvm_options'] = ''

default['opsworks_java']['jvm_pkg'] = {}
default['opsworks_java']['jvm_pkg']['use_custom_pkg_location'] = false
default['opsworks_java']['jvm_pkg']['custom_pkg_location_url_debian'] = 'http://aws.amazon.com/'
default['opsworks_java']['jvm_pkg']['custom_pkg_location_url_rhel'] = 'https://aws.amazon.com/'
case node[:platform_family]
when 'debian'
  default['opsworks_java']['jvm_pkg']['name'] = "openjdk-#{node['opsworks_java']['jvm_version']}-jdk"
when 'rhel'
  default['opsworks_java']['jvm_pkg']['name'] = "java-1.#{node['opsworks_java']['jvm_version']}.0-openjdk-devel"
end
default['opsworks_java']['jvm_pkg']['java_home_basedir'] = '/usr/local'

default['opsworks_java']['datasources'] = {}

include_attribute "opsworks_java::customize"

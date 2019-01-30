name 'fry'
maintainer 'Dan DeWaele'
maintainer_email 'dantidote@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures fry'
long_description 'Installs/Configures fry'
version '0.3.4'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'resolver', '~> 2.0'
depends 'docker', '~> 4.9'
depends 'chef-client', '~> 11.0'
depends 'ssh_authorized_keys', '~> 0.4'
depends 'network_interfaces_v2', '~> 2.11'



# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/fry/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/fry'

# -*- encoding : utf-8 -*-

$as_vagrant = 'sudo -u vagrant -H bash -l -c'
$home = '/home/vagrant'
$kerozen = '/vagrant/'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => "test -e ${home}/.rvm"
  }

  include locales
}

class { 'apt_get_update':
  stage => preinstall
}

# --- MongoDB -----------------------------------------------------------------

class { 'mongodb':
  init => 'upstart'
}

# --- Packages -----------------------------------------------------------------

package { 'curl':
  ensure => installed
}

package { 'build-essential':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

# Nokogiri dependencies.
package { ['libxml2', 'libxml2-dev', 'libxslt1-dev']:
  ensure => installed
}

# ExecJS runtime.
package { 'nodejs':
  ensure => installed
}

# --- Ruby ---------------------------------------------------------------------

# Install RVM
exec { 'install_rvm':
  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable'",
  creates => "${home}/.rvm/bin/rvm",
  require => Package['curl']
}

# Install Ruby 2.0
exec { 'install_ruby':
  command => "${as_vagrant} '${home}/.rvm/bin/rvm install 1.9.3 --autolibs=3 --latest-binary && rvm --fuzzy alias create default 1.9.3'",
  creates => "${home}/.rvm/bin/ruby",
  timeout => 800,
  require => Exec['install_rvm']
}

# Install Bundler
exec { 'install_bundler':
  command => "${as_vagrant} 'gem install bundler --no-rdoc --no-ri'",
  creates => "${home}/.rvm/bin/bundle",
  require => Exec['install_ruby']
}

# --- Kerozen --------------------------------------------------------------------

# Install project gems
exec { 'bundle_update':
  command => "${as_vagrant} 'bundle update'",
  cwd => "${kerozen}",
  timeout => 600,
  require => [ Exec['install_bundler'], Package['git-core'] ]
}

# Migrate development database
exec { 'migrate_development_database':
  command => "${as_vagrant} 'rake db:migrate'",
  cwd => "${kerozen}",
  require => [ Exec['bundle_update'], Class['mongodb'] ]
}

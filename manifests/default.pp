Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

# Install some default packages
$default_packages = [ 'build-essential', 'curl', 'git', 'subversion', 'ant', 'software-properties-common', 'python-software-properties',]
package { $default_packages :
    ensure => present,
}
class tools {

    # Install some default packages
    $packages = [
        'build-essential',
        'curl',
        'git',
        'subversion',
        'software-properties-common',
        'python-software-properties',
    ]

    package { $packages :
        ensure => present,
        require => Exec["apt-get update"]
    }

}
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

# Install some default packages
$default_packages = [ 'build-essential', 'curl', 'git', 'subversion', 'software-properties-common', 'python-software-properties',]
package { $default_packages :
    ensure => present,
}

include 'docker'

docker::image { 'bradegler/java7': }
docker::image { 'bradegler/java8': }
docker::image { 'bradegler/scala': }
docker::image { 'bradegler/node': }
docker::image { 'bradegler/go': }
docker::image { 'bradegler/redis': }
docker::image { 'bradegler/nginx': }

class{git:
    svn => true,
    gui => true,
}

git::repo{'dotfiles':
    path   => '/opt/repos/dotfiles',
    source => 'https://github.com/bradegler/dotfiles.git'
}

node 'devbox' {

    include os-prep, docker-images
    Class['os-prep'] -> Class['docker-images']
}

class os-prep {

    # Install some default packages
    $default_packages = [ 'build-essential', 'curl', 'git', 'subversion', 'software-properties-common', 'python-software-properties',]
    package { $default_packages :
        ensure => present,
    }

    file { "/opt/repos":
        ensure => "directory",
    }

    class{git:
        svn => true,
        gui => true,
    }

    git::repo{'dotfiles':
        path   => '/opt/repos/dotfiles',
        source => 'https://github.com/bradegler/dotfiles.git'
    }
}

class docker-images {

    include 'docker'

    docker::image { 'bradegler/java7': }
    docker::image { 'bradegler/java8': }
    docker::image { 'bradegler/scala': }
    docker::image { 'bradegler/node': }
    docker::image { 'bradegler/go': }
    docker::image { 'bradegler/redis': }
    docker::image { 'bradegler/nginx': }

}

class dockerimages {

    include docker

    docker::image { 'bradegler/java7':
        require => Class['docker'],
    }
    docker::image { 'bradegler/java8':
        require => Class['docker'],
    }
    docker::image { 'bradegler/scala':
        require => Class['docker'],
    }
    docker::image { 'bradegler/node':
        require => Class['docker'],
    }
    docker::image { 'bradegler/go':
        require => Class['docker'],
    }
    docker::image { 'bradegler/redis':
        require => Class['docker'],
    }
    docker::image { 'bradegler/nginx':
        require => Class['docker'],
    }

    exec {"vagrant docker membership":
        command => "/usr/sbin/usermod -aG docker vagrant",
        require => Class['docker'],
    }
}

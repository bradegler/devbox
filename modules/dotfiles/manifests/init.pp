class dotfiles {

    vcsrepo { '/opt/repos/dotfiles':
      ensure   => present,
      provider => git,
      source   => "https://github.com/bradegler/dotfiles.git",
    }

    file { "/home/vagrant/.dotfiles":
        ensure => 'link',
        target => '/opt/repos/dotfiles',
        require => Vcsrepo[ "/opt/repos/dotfiles"],
    }

    exec { "link dotfiles":
        command => "/opt/repos/dotfiles/setup.sh",
        require => File["/home/vagrant/.dotfiles"],
    }
}
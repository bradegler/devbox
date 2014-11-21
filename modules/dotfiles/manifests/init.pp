class dotfiles {

    file {'/home/vagrant':
      ensure => directory,
      mode   => 644,
    }

    file { '/home/vagrant/.ssh':
      ensure  => directory,
      mode    => 600,
      require => File['/home/vagrant'],
    }

    file { '/home/vagrant/.ssh/config':
      ensure  => file,
      content => "Host github.com\nHostName ssh.github.com\nPort 443",
      require => File['/home/vagrant/.ssh'],
    }

    vcsrepo { '/opt/repos/dotfiles':
      ensure   => present,
      provider => git,
      source   => "https://github.com/bradegler/dotfiles.git",
      require  => File['/home/vagrant/.ssh/config'],
    }

    file { "/home/vagrant/.dotfiles":
      ensure => 'link',
      target => '/opt/repos/dotfiles',
      require => Vcsrepo[ "/opt/repos/dotfiles"],
    }

    exec { "link dotfiles":
      cwd     => "/home/vagrant",
      command => ".dotfiles/setup.sh /home/vagrant",
      creates => "/home/vagrant/.shellaliases",
      require => File["/home/vagrant/.dotfiles"],
    }
}
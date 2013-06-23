package 'git'

# sqlite3
package 'sqlite3'
package 'libsqlite3-dev'

# postgres
package 'postgresql'
package 'libpq-dev'

# mysql
package 'mysql-server'
package 'libmysqlclient-dev'

# ruby stuff

# ruby-install

ruby_install_version = '0.1.4'
ruby_install_url     = "https://github.com/postmodern/ruby-install/archive/v#{ruby_install_version}.tar.gz"
ruby_install_dir     = "ruby-install-#{ruby_install_version}"
ruby_install_tar     = "#{ruby_install_dir}.tar.gz"

execute 'Installing ruby-install' do
  command <<-STRING
    cd /tmp;
    wget -O #{ruby_install_tar} #{ruby_install_url};
    tar -xf #{ruby_install_tar};
    cd #{ruby_install_dir};
    sudo make install;
  STRING

  not_if { File.exist?('/usr/local/bin/ruby-install') }
end

# chruby

chruby_version = '0.3.5'
chruby_url     = "https://github.com/postmodern/chruby/archive/v#{chruby_version}.tar.gz"
chruby_dir     = "chruby-#{chruby_version}"
chruby_tar     = "#{chruby_dir}.tar.gz"

execute 'Installing chruby' do
  command <<-STRING
    cd /tmp;
    wget -O #{chruby_tar} #{chruby_url};
    tar -xf #{chruby_tar};
    cd #{chruby_dir};
    sudo make install;
  STRING

  not_if { File.exist?('/usr/local/bin/chruby') }
end

[ ['ruby', '1.9.3'], ['ruby', '2.0.0'], ['jruby', '1.7.4'], ['rubinius', '2.0.0'] ].each do |spec|
  ruby_vm, ruby_version = spec

  execute("Installing #{ruby_vm} #{ruby_version}") do
    command "ruby-install #{ruby_vm} #{ruby_version}"
    not_if { !Dir["/opt/rubies/#{ruby_vm}-#{ruby_version}-p*"].empty? }
  end
end

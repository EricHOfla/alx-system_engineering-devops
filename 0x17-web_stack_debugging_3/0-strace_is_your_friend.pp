# This Puppet manifest resolves common causes of a 500 Internal Server Error in Apache on a LAMP stack.
# It ensures Apache is running, corrects permissions, verifies PHP, ensures MySQL is running, and restarts Apache.

# Ensure Apache is running and enabled to start on boot
service { 'apache2':
  ensure => 'running',
  enable => true,
}

# Correct permissions in the document root
exec { 'fix-apache-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  unless  => 'test -w /var/www/html',
  require => Service['apache2'],
}

# Verify PHP is installed and running
exec { 'verify-php-configuration':
  command => 'php -v', # Check PHP status
  path    => '/usr/bin:/usr/local/bin',
  require => Service['apache2'],
}

# Ensure MySQL is running
service { 'mysql':
  ensure => 'running',
  enable => true,
}

# Restart Apache to apply changes
exec { 'restart-apache':
  command => 'systemctl restart apache2',
  require => [Exec['fix-apache-permissions'], Exec['verify-php-configuration']],
}


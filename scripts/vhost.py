#!/usr/bin/env python


import sys


VHOST = '''
<VirtualHost *:80>
    ServerName {hostname}
    DocumentRoot "{dirname}"
    <Directory />
        Options FollowSymLinks
        AllowOverride All
    </Directory>
    <Directory {dirname}>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

    ErrorLog /private/var/log/apache2/{hostname}_error.log
    CustomLog /private/var/log/apache2/{hostname}_access.log combined
</VirtualHost>
'''


def main():
    (vhost_file, hostname, dirname) = sys.argv[1:]

    with open(vhost_file) as f:
        config = f.read()

    if hostname not in config or dirname not in config:
        with open(vhost_file, 'a') as f:
            f.write(VHOST.format(hostname=hostname, dirname=dirname))


if __name__ == '__main__':
    main()

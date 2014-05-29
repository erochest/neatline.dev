#!/usr/bin/env python


import sys


VHOST = '''
<VirtualHost *:80>
    ServerName {}
    DocumentRoot "{}"
</VirtualHost>
'''


def main():
    (vhost_file, hostname, dirname) = sys.argv[1:]

    with open(vhost_file) as f:
        config = f.read()

    if hostname not in config or dirname not in config:
        with open(vhost_file, 'a') as f:
            f.write(VHOST.format(hostname, dirname))


if __name__ == '__main__':
    main()

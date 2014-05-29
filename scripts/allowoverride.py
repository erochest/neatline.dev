#!/usr/bin/env python


import fileinput
import sys


# This is a simple state machine with these nodes:

# 0 -- start (-> 1)
# 1 -- Start valid Directory block (-> 0)


DIR_START = {
    '<Directory />',
    '<Directory "/Library/WebServer/Documents">',
    }
DIR_END = '</Directory>'


def main():
    state = 0
    for line in fileinput.input(inplace=True):
        text = line.strip()
        if state == 0:
            if text in DIR_START:
                state = 1
        elif state == 1:
            if text == 'AllowOverride None':
                line = line.replace('None', 'All')
            elif text == DIR_END:
                state = 0

        sys.stdout.write(line)


if __name__ == '__main__':
    main()

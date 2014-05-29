
# neatline.dev

This uses [Ansible][ansible] to install and set up a Neatline development
environment on Mac OS 10.9.*x*.

This assumes that you have [Homebrew][homebrew] installed, and that you've used
it to install [Python 2.7][python] and Ansible.

```
brew install python
brew install ansible
```

Once this is done, edit the vars section of `playbook.yaml` to reflect your
system. Afterward, just run the `neatline-dev` script.

```
./neatline-dev
```

This will prompt you for your password so that it can execute some files using
[`sudo`][sudo].

Once it's done, you should have a fresh version of Omeka installed. You can
access it using by pointing your browser to the value that you set for
`dev_hostname` in the playbook vars. (In the repository, that is
`omeka-neatline.dev`.)

[ansible]: http://www.ansible.com/home
[homebrew]: http://brew.sh/
[python]: http://www.python.org/
[sudo]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/Manpages/man8/sudo.8.html


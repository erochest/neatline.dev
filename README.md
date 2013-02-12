
# Omeka VM

This uses [Vagrant][vagrant] and [Puppet][puppet] to create an [Omeka][omeka]
VM. 

Also, this is set to work with Omeka 1.5.3 right now. It definitely won't work
with Omeka 2.0. This may become an option at some point, but for right now,
you've been warned.

## About

This creates a VM running [Ubuntu][ubuntu] 12.10 64-bit Server. Currently, this
uses [nginx][nginx] for the web server to save resources, but I plan to add an
option to use [Apache][apache] in the future. It installs Omeka from the
stable-1.5 branch.

## Dependencies

To use this, you'll need a few things on the host machine (the one you're using
right now).

* [VirtualBox][vbox]
* [Vagrant][vagrant]

## Usage

This is a command-line-driven process. If you don't feel comfortable with that,
you should find someone who is to sit beside you.

First, clone this into a directory. There are a few files you may want to
change.

### Customizing

Just call the `bootstrap` script. This will prompt you for any parameters and
create some files.

    > bootstrap
    VM hostname
    omeka2.dev
    VM IP
    33.33.33.8
    Github Plugin (OWNER/NAME)
    scholarslab/NeatlineFeatures
    Plugin title  |NeatlineFeatures|

    Creating Rakefile...
    Creating Vagrantfile...
    Creating manifests/base.pp...
    Creating manifests/local-host.pp...
    done

### Building the VM

Once the files are to your liking, just do this.

    > rake create

### Cleaning up

If you want to destroy the VM and remove the Omeka directory, just execute this command.

    > rake raze

**WARNING**: You *will* lose data!

## Workflow

Once the VM has been created, you can give a pretty standard workflow.

1. When you sit down to work on the project, issue this:

   > vagrant up --no-provision

2. When you're done for the day, do this:

   > vagrant suspend

Because of the way that Vagrant handles network interfaces, you can really only
have one VM up at a time. *Be sure to suspend your VM before you try to start
up another one.*

[vagrant]: http://www.vagrantup.com/
[puppet]: http://puppetlabs.com/
[omeka]: http://omeka.org/
[ubuntu]: http://www.ubuntu.com/
[nginx]: http://nginx.org/
[apache]: http://www.apache.org/
[vbox]: https://www.virtualbox.org/
[nltime]: http://neatline.org/plugins/neatline-time/


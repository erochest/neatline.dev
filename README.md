
# Omeka VM

This uses [Vagrant][vagrant] and [Puppet][puppet] to create an [Omeka][omeka]
VM. 

## About

This creates a VM running [Ubuntu][ubuntu] 13.04 64-bit Server. It installs
Omeka from the stable-2.0 branch.

## Dependencies

To use this, you'll need a few things on the host machine (the one you're using
right now).

* [Python 2.7][python]
* [pip][pip]
* [VirtualBox][vbox]
* [Vagrant][vagrant]

## Installation

Install VirtualBox from its [website][vbox].

Install Vagrant:

    gem install vagrant

## Usage

This is a command-line-driven process. If you don't feel comfortable with that,
you should find someone who is to sit beside you.

First, clone this into a directory. There are a few files you may want to
change.

### Installing

You can install dependencies.

Change into the new directory.

    cd omeka-vm

*(Optional.)* If you use [virtualenv][virtualenv], initialize a new
environment and activate it.

    virtualenv .
    . ./bin/activate

Install the required packages.

    pip install -r requirements.txt

### Customizing

To customize the environment, just call the `bootstrap` script. This can be
either by setting command-line parameters or interactively, or using
a combination of those two.

#### Command-Line Options

When using command-line options, you specify the customizations using flags and
parameters on the command line.

Here are the options `bootstrap` takes.

```
usage: bootstrap [-h] [-i] [-b] [-H VM-HOST] [-I VM-IP] [-p PLUGIN] [-t THEME]

Sets up the directory with the configuration to create a Vagrant VM running
Omeka.

optional arguments:
  -h, --help            show this help message and exit
  -i, --interactive     Force all interactive prompts. Command-line options
                        will be used for defaults.
  -b, --batch           For NO interactive prompts. The process will be run
                        with whatever information is given on the command
                        line. (This is the opposite of -i, --interactive.
  -H VM-HOST, --host VM-HOST
                        The name to use when connecting to the VM from the
                        host.
  -I VM-IP, --ip VM-IP  The IP address to use when connecting to the VM from
                        the host.
  -p PLUGIN, --plugin PLUGIN
                        The git repo to pull the plugin from. If you need to
                        name the plugin something special, use a pipe
                        character to specify the path (e.g.,
                        "git://host/path/myPlugin_Something|Something").
                        bootstrap recognizes both "plugin_Something" and
                        "Something" as valid names (and strips the "plugin_"
                        off accordingly). This option can be given multiple
                        times.
  -t THEME, --theme THEME
                        The git repo to pull the theme from. If you need to
                        name the theme something special, use a pipe character
                        to specify the path (e.g.,
                        "git://host/path/myTheme_Something|Something").
                        bootstrap recognizes both "theme_Something" and
                        "Something as valid names (and strips the "theme_" off
                        accordingly). This option can be given multiple times.

If no options are given, the script is run interactively. If a command-line
parameter is given, that will be skipped in the interactive prompts. If all
command-line parameters are supplied, the script will not be run
interactively.
```

Notice that you can include the `--plugin` and `--theme` flags more than once.
Or not at all.

#### Interactive

If any parameters are missing on the command line or if the `--interactive`
flag is set, you'll be prompted to enter that information interactively:

```
$ ./bootstrap
Enter a value for each item or leave blank to skip or move on to the next item.
'?' displays help for that item.
VM Host: omeka.dev
VM IP Address: 33.33.33.4
Plugin Spec: git@github.com:scholarslab/Neatline.git
Plugin Spec: git@github.com:scholarslab/NeatlineTime.git
Plugin Spec:
Theme Spec: git@github.com:scholarslab/astrolabe.git
Theme Spec:
Creating ./Rakefile...
Creating ./Vagrantfile...
Creating ./manifests/base.pp...
Creating ./manifests/local-host.pp...
```

For the Omeka plugins and themes, you can enter no values, or multiple values.
Just enter a blank line when you're done.

#### Combination

If you specify some of the parameters on the command line, but not all,
`bootstrap` will prompt for the rest interactively. To suppress this, include
the `--batch` flag.

### Bootstrap Output

The `bootstrap` script creates four files.

`Rakefile` has some tasks to control creating, initializing, and tearing down
the VM. We'll use that more in a moment.

`Vagrantfile` has the configuration for Vagrant to create and provision the VM.

`./manifests/base.pp` has the [Puppet][puppet] configuration for provisioning
the VM. This specifies where on the VM to install Omeka and what themes and
plugins to download.

`./manifests/local-host.pp` has the [Puppet][puppet] configuration to
associating the VM host name with its IP address **on the host machine**. This
is really only useful if you have Puppet installed on the host, which you
probably don't.

### Building the VM

Once the files are to your liking, just do this.

    > rake create

If you get errors while running this, try re-provisioning the VM:

    > vagrant provision

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

[python]: http://python.org
[pip]: https://pypi.python.org/pypi/pip
[virtualenv]: https://pypi.python.org/pypi/virtualenv

[vagrant]: http://www.vagrantup.com/
[puppet]: http://puppetlabs.com/
[omeka]: http://omeka.org/
[ubuntu]: http://www.ubuntu.com/
[nginx]: http://nginx.org/
[apache]: http://www.apache.org/
[vbox]: https://www.virtualbox.org/
[nltime]: http://neatline.org/plugins/neatline-time/


Vlipco's Vagrant Fedora Box
=====

This is an ansible provisioned version of Chef's Fedora20 base box providing a more comfortable working environment similar to the our engineers own machines. It's just a box that feels like home.

Tested with Packer 0.6.0 and Vagrant 1.5.4

This is a VM with Chef's Fedora 20 (From the Bento project)

To build the image run:

```
misc/get-box
packer build fedora20.json
```

The resulting box will be put in `boxes/vlipco/fedora20.box`. Only Virtualbox is supported at the moment, but adding other providers is trivial thanks to the Bento project wide coverage.

To test the resulting image, you must first add it to vagrant. From the root of the repo, you can do `vagrant box add --name vlipco/fedora20 boxes/vlipco/fedora20.box`. You can then go to any folder and do `vagrant init vlipco/fedora20` to create a starting Vagrantfile. To start the machine do `vagrant up` then `vagrant ssh`

Beware that this imports the image only if it's not present already, hence if you build the image again and want to see the changes, first delete the image in Vagrant with `vagrant box remove vlipco/fedora20` 


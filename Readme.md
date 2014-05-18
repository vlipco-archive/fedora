Vlipco's Vagrant Fedora Box
=====

This is an ansible provisioned version of Chef's fedora-20 base box providing a more comfortable working environment similar to the our engineers own machines. It's just a box that feels like home.

Tested with Packer 0.6.0 and Vagrant 1.5.4

This is a VM with Chef's Fedora 20 (From the Bento project)

To build the image run:

```
misc/get-box
packer build fedora-20.json
```

The resulting box will be put in `boxes/vlipco/fedora-20.box`. Only Virtualbox is supported at the moment, but adding other providers is trivial thanks to the Bento project wide coverage.

To try the resulting image:

- From the root of the repo, add it to vagrant with `vagrant box add --name vlipco/fedora-20 boxes/vlipco/fedora-20.box`
- You can then go to any folder and do `vagrant init vlipco/fedora-20` to create a starting Vagrantfile. 
- To start the machine do `vagrant up`
- Then get into it with `vagrant ssh`

Note. Remember to reimport the box to vagrant everytime you do a fresh build with any changes. For this you can run `vagrant box remove vlipco/fedora-20` It's annoying and should be soon fixed once this box is published to Vagrant Cloud.

INSTALL forego, hg
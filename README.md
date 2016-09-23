# Sandboxes

## Required Software
- [VMware Fusion](https://www.vmware.com/products/fusion/fusion-evaluation) and associated VMware Fusion license
- [Docker Toolbox](https://github.com/docker/toolbox/releases/)
- [Packer](https://www.packer.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Vagrant VMware Provider Plugin](https://www.vagrantup.com/docs/vmware/installation.html) and associated Vagrant VMware Plugin license
- [Vagrant Triggers Plugin](https://github.com/emyl/vagrant-triggers)
- [Hostmanager](https://github.com/jayjanssen/percona-xtradb-cluster-tutorial/issues/38) installed on local machine

## Repository Configuration

1. Clone the `sandboxes` repo.

  ```
  MacOSX$ git clone git@github.com:yhuang/sandboxes.git
  MacOSX$ cd sandboxes
  ```

2. Download `CentOS-7-x86_64-DVD-1511.iso` from a trusted source.  Create the `iso` directory under the `sandboxes` top-level directory, and put the ISO file under the `iso` directory.

3. Get all the necessary Funding Circle `.pem` keys from S3.


## Create the Necessary Vagrant Machines

### `DevOps` Machine

#### Create the `devops` Vagrant Machine


1. Build the `devops` Vagrant box.

  ```
  MacOSX$ packer build packer-templates/devops.json
  ```

2. Add the `devops` Vagrant box.

  ```
  MacOSX$ vagrant box add builds/devops.vmware.box --name devops
  ```

3. Launch the `devops` Vagrant box.

  ```
  MacOSX$ cd vagrantfiles/devops; vagrant up; cd ../..
  ```

4. Log onto machine via `ssh`

  ```
  MacOSX$ cd vagrantfiles/devops; vagrant ssh
  ```
  `vagrant ssh` must be invoked where the `devops` Vagrantfile resides, but `docker-machine ssh devops` can be invoked anywhere.

### `Opsworks` Machine

#### Create the `opsworks` Vagrant Machine

1. Build the `opsworks` Vagrant box.

  ```
  MacOSX$ packer build packer-templates/opsworks.json
  ```

2. Add the `opsworks` Vagrant box.

  ```
  MacOSX$ vagrant box add builds/opsworks.vmware.box --name opsworks
  ```

3. Launch the `opsworks` Vagrant box.

  ```
  MacOSX$ cd vagrantfiles/opsworks; vagrant up; cd ../..
  ```

4. Log onto machine via `ssh`

  ```
  MacOSX$ cd vagrantfiles/opworks; vagrant ssh
  ```

  `vagrant ssh` must be invoked where the `opsworks` Vagrantfile resides.

#### Configure box

1. Clone the `fc-us-cloud-provisioner` repository. Your box may not have permissions to clone the repo yet. If so, proceed with the [Configure Each Machine](configure-each-machine) instructions, and then return to this step.

  ```
  vagrant@opsworks% git clone fc-us-cloud-provisioner
  ```

2. Install dependencies for `fc-us-cloud-provisisoner`

  ```
  vagrant@opsworks% cd fc-us-cloud-provisioner
  vagrant@opsworks% gem install bundler
  vagrant@opsworks% bundle
  ```

## Configure Each Machine

These steps assume the following about the host Mac OS X machine:

* The ssh keys to remote machines are stored under `$HOME/.pem/` on Mac OS X;
* The public ssh key and private ssh key for the user on Mac OS X are `$HOME/.ssh/id_rsa.pub` and `$HOME/.ssh/id_rsa` respectively;
* The service account tokens are exported as environmental variables in `$HOME/.credentials`; and
* The project directories are under `$HOME/workspace/`.

Each vagrant box needs the following configurations applied to it:

1. Symlink credentials for the FC repositories

  ```
  vagrant@opsworks% ln -s /host-data/.pem/ $HOME/.pem
  ```

2. Symlink credentials for user's own GitHub

  ```
  vagrant@opsworks% ln -s /host-data/.ssh/id_rsa.pub $HOME/.ssh/id_rsa.pub
  vagrant@opsworks% ln -s /host-data/.ssh/id_rsa $HOME/.ssh/id_rsa
  ```

3. Symlink credentials for user's AWS account

  ```
  vagrant@opsworks% ln -s /host-data/.credentials .credentials
  vagrant@opsworks% source $HOME/.bash_profile
  ```

4. Symlink FC workspaces

  ```
  vagrant@opsworks% ln -s /host-data/workspace/ $HOME/workspace
  ```


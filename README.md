# sandboxes

#### Required Software
- [VMware Fusion](https://www.vmware.com/products/fusion/fusion-evaluation)
- [Docker Toolbox](https://github.com/docker/toolbox/releases/)
- [Packer](https://www.packer.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Vagrant VMware Provider Plugin](https://www.vagrantup.com/docs/vmware/installation.html)
- [Vagrant Triggers Plugin](https://github.com/emyl/vagrant-triggers)

#### Create the `devops` Vagrant Machine

  1. Clone the `sandboxes` repo.

  ```
  $ git clone git@github.com:yhuang/sandboxes.git
  $ cd sandboxes
  ```

  2. Download `CentOS-7-x86_64-DVD-1511.iso` from a trusted source.  Create the `iso` directory under the `sandboxes` top-level directory, and put the ISO file under the `iso` directory.

  3. Build the `devops` Vagrant box.

  ```
  $ packer build packer-templates/devops.json
  ```

  4. Add the `devops` Vagrant box.

  ```
  $ vagrant box add builds/devops.vmware.box --name devops
  ```

  5. Launch the `devops` Vagrant box.

  ```
  $ cd devops; vagrant up; cd ..
  ```

#### The `devops` Vagrant Machine Setup
Once up, the `devops` Vagrant machine may be accessed via either `vagrant ssh`
```
$ cd devops; vagrant ssh
```
or `docker-machine ssh`:
```
$ docker-machine ssh devops
```

`vagrant ssh` must be invoked where the `devops` Vagrantfile resides, but `docker-machine ssh devops` can be invoked anywhere.

#### Set up the `devops` Vagrant Machine
These steps assume the following on the host Mac OS X machine:

  1. The ssh keys to remote machines are stored under `$HOME/.pem/`;

  ```
  $ ln -s /host-data/.pem/ $HOME/.pem
  ```

  2. The public ssh key and private ssh key for the user on Mac OS X are `$HOME/.ssh/id_rsa.pub` and `$HOME/.ssh/id_rsa` respectively;

  ```
  $ ln -s /host-data/.ssh/id_rsa.pub $HOME/.ssh/id_rsa.pub
  $ ln -s /host-data/.ssh/id_rsa $HOME/.ssh/id_rsa
  $ chmod 644 $HOME/.ssh/id_rsa.pub
  $ chmod 600 $HOME/.ssh/id_rsa
  ```

  3. The service account tokens are exported as environmental variables in `$HOME/.credentials`; and

  ```
  $ ln -s /host-data/.credentials .credentials
  $ source $HOME/.bash_profile
  ```

  4. The project directories are under `$HOME/workspace/`.

  ```
  $ ln -s /host-data/workspace/ $HOME/workspace
  ```

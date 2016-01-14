# sandboxes

```
$ ln -s /host-data/.pem/ $HOME/.pem
$ ln -s /host-data/.aws $HOME/.aws
$ ln -s /host-data/workspace/ $HOME/workspace

$ ln -s /host-data/.ssh/id_rsa $HOME/.ssh/id_rsa
$ ln -s /host-data/.ssh/id_rsa.pub $HOME/.ssh/id_rsa.pub

$ chmod 600 $HOME/.ssh/id_rsa
$ chmod 644 $HOME/.ssh/id_rsa.pub

Edit .bashrc to include the following keys:
\# Custom Environment Variables
export ATLAS_TOKEN=xxxxx

export AWS_ACCESS_KEY_ID=xxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=$AWS_REGION

$ source $HOME/.bashrc
$ cd $HOME/workspace
$ Run `bundle` once inside a given project for the first time.
```

# sandboxes

$ ln -s /vagrant/.pem/ $HOME/.pem
$ ln -s /vagrant/.aws $HOME/.aws
$ ln -s /vagrant/workspace/ $HOME/workspace

Edit .bashrc to include the following keys:
# Custom Environment Variables
export ATLAS_TOKEN=xxxxx

export AWS_ACCESS_KEY_ID=xxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=$AWS_REGION

$ source $HOME/.bashrc
$ cd $HOME/workspace
$ bundle

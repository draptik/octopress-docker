# TL/DR

Start the docker container:

```sh
cd 02*
./run-container.sh
```

Within docker container:

```sh
alias la='ls -al'
cd ~
./post-install.sh
cd /octopress
rake new_post["test"]
rake generate
rake preview
rake deploy
```

# Octopress in a docker container

IMPORTANT: This setup currently only works for Linux hosts. Windows hosts using docker require additional tweaks for mounting shared volumes in docker.

The docker image size is about 0.5GB.

## TL/DR;

Clone octopress project to `share`:

```sh
cd share
git clone -b source <octopress-git-repo> octopress
cd octopress
## MUST BE SSH!
git clone -b master git://<octopress-git-repo> _deploy
```

### From scratch

Build docker images and start docker octopress container:

```sh
cd 00* && ./build-image.sh # takes a while (compiles ruby from scratch)
cd ../01* && ./build-image.sh
cd ../02* && ./build-image.sh && ./run-container.sh
```

### Normal usage

IMPORTANT: Change the git user name/email in file `02_octopress/post-install.sh`. This info is required for deploying.

Start the docker container:

```sh
cd 02*
./run-container.sh
```

Within docker container:

```sh
alias la='ls -al'
cd ~
./post-install.sh
cd /octopress
rake new_post["test"]
rake generate
rake preview
```

On the host (!): Opening a browser at `localhost:4001` should display the new test post.

On the host (!): Use the `share` folder for editing content.

If everything is fine: Deploy using

```sh
rake deploy
```

The last step requires a functional ssh connection.


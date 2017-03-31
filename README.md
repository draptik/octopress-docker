# Octopress in a docker container

## TL/DR;

Clone octopress project to `share`:

```sh
cd share
git clone -b source <octopress-git-repo> octopress
cd octopress
git clone <octopress-git-repo> _deploy
```

### From scratch

Build docker images and start docker octopress container:

```sh
cd 00* && ./build-image.sh # takes a while (compiles ruby from scratch)
cd ../01* && ./build-image.sh
cd ../02* && ./build-image.sh && ./run-container.sh
```

### Normal usage

Start the docker container:

```sh
cd 02*
./run-container.sh
```

Within docker container:

```sh
cd ~
./post-install.sh
cd /octopress
rake new_post["test"]
rake generate
rake preview
```

On the host (!): Opening a browser at `localhost:4001` should display the new test post.

If everything is fine: Deploy using

```sh
rake deploy
```

The last step requires a functional ssh connection.


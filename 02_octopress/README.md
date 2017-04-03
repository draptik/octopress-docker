# Initial installation

Run `./build-image.sh`.

# Prerequisites

The current version of our blog source code should be located within the sibling folder `share/octopress` of this file.

To checkout the current version of our octopress blog:
```sh
cd ../share
## HTTPS or SSH
git clone -b source <my-octopress-git-source> octopress
cd octopress
## Must be SSH!
git clone git://<my-octopress-git-source> _deploy
```

IMPORTANT: Change the git user name and email in the file `post-install.sh`! Otherwise you will not be able to deploy.

# Usage

Run `./run-container.sh`. 

Depending on the usage of the `--rm` flag (which removes the container after exiting) in the `run-container.sh` script we also have to run the `post-install.sh` script.

The `post-install.sh` script installs some ruby gems and then installs the ruby bundle for the blog.
Make sure the `post-install.sh` script has executable rights (`chmod 755 ~/post-install.sh`).


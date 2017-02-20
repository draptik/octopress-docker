FROM draptik/ruby1.9.3-python2.7-nodejs-user:0.1

MAINTAINER Patrick Drechsler <socialcoding@pdrechsler.de>

# I am not really sure why this is needed, because we have an ENTRYPOINT in the parent image.
RUN useradd -ms /bin/bash user

# Setup ruby/bundler to work with non-admin user
RUN echo "gem: --user-install" > /home/user/.gemrc && chown user:user /home/user/.gemrc
RUN echo "PATH=\"/home/user/.gem/ruby/1.9.1/bin:$PATH\"" >> /home/user/.bashrc && chown user:user /home/user/.bashrc

WORKDIR /octopress

FROM njrarltcda00369.linux.us.ams1907.com/rhel7.2:latest

MAINTAINER Nick Hale <nhale@ups.com>

USER root

WORKDIR /opt

# Copy the nodejs binaries
ADD node-v4.6.0-linux-x64.tar.xz /opt
RUN mv node-v4.6.0-linux-x64 node

# Change the permissions of both binaries
RUN chmod 777 -R node/bin

# Add the nodejs binaries to the path
ENV PATH /opt/node/bin:$PATH

# Switch to the unprivileged user
USER 1001

# Print out the usage in the event that the pod runs without an overriding command
CMD ["/usr/bin/usage"]

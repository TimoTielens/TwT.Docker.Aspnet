# Setup SSH that can be used by Azure
# https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux&tabs=debian#enable-ssh

# Install SSH
echo "Installing SSH"
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server

echo "Configuring SSH"
RUN echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh
COPY ./Tools/sshd_config /etc/ssh/
RUN ssh-keygen -A
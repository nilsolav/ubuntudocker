FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install required packages and tools
RUN apt-get update && apt-get install -y \
    tigervnc-standalone-server novnc websockify \
    autocutsel openbox tint2 xterm emacs git \
    fonts-powerline fonts-firacode unzip wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Copy desktop configuration files
COPY openbox /etc/xdg/openbox
COPY tint2 /etc/xdg/tint2

# Redirect / to vnc.html in noVNC
COPY novnc/index.html /usr/share/novnc/index.html
#RUN ln -sf /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Expose ports (6080 for noVNC, 5900 for VNC)
EXPOSE 6080 5900

# Start TigerVNC server with Openbox, noVNC, and LSSS (auto-restart LSSS)
ENV SCREEN_RESOLUTION=1366x768
ENV DISPLAY=:0

# Copy entrypoint script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Set root password to 'rootpassword' (change as needed)
# Commented out to avoid security issues in production
RUN echo 'root:rootpassword' | chpasswd

# Create non-root user 'lsss' with home directory and zsh shell
ARG USER_NAME=nilsolav
ARG USER_UID=1000  
ARG USER_GID=1000 
ARG USER_SHELL=/bin/zsh
ARG USER_HOME=/home/nilsolav
RUN groupadd --gid $USER_GID $USER_NAME \
    && useradd --create-home --home-dir $USER_HOME \
       --shell $USER_SHELL --uid $USER_UID --gid $USER_GID $USER_NAME
USER $USER_NAME
WORKDIR $USER_HOME

RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


# Use script as CMD
CMD ["/usr/local/bin/start.sh"]
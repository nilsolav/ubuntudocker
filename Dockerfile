FROM pytorch/pytorch:latest

RUN mkdir /install
WORKDIR /install
RUN apt-get update
RUN apt-get -qq -y install git emacs zsh wget curl
# Install R
#RUN apt-get -qq -y install r-base

# Install Rstox
#RUN r install.packages("RstoxBase", repos = c("https://stoxproject.github.io/repo", "https://cloud.r-project.org"))

# Install Oh-My-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install emacs+elpy
COPY .emacs /root/.emacs

CMD zsh


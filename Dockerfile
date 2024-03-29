FROM ubuntu:23.10

RUN mkdir /install
WORKDIR /install
RUN apt-get update
RUN apt-get -qq -y install git emacs zsh wget curl sudo pip python3.6

# Install Rstox
#RUN r install.packages("RstoxBase", repos = c("https://stoxproject.github.io/repo", "https://cloud.r-project.org"))
#RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create ans switch to user
#RUN useradd --create-home --shell /bin/zsh nilsolav
#USER nilsolav
# Install Oh-My-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install emacs+elpy
COPY .emacs /root/.emacs
COPY requirements.txt /install
RUN pip install -r requirements.txt --break-system-packages
CMD zsh


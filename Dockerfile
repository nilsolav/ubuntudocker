FROM pytorch/pytorch:latest

RUN mkdir /install
WORKDIR /install
RUN apt-get update
RUN apt-get -qq -y install git emacs zsh wget curl sudo
RUN conda install -c conda-forge jupyterlab plotly jupyter-dash dash pandas anaconda ipywidgets
# wget https://github.com/plotly/jupyter-dash/blob/master/notebooks/getting_started.ipynb

# Install R
#RUN apt-get -qq -y install r-base

# Install Rstox
#RUN r install.packages("RstoxBase", repos = c("https://stoxproject.github.io/repo", "https://cloud.r-project.org"))
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create ans switch to user
RUN useradd --create-home --shell /bin/zsh nilsolav
USER nilsolav
# Install Oh-My-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install emacs+elpy
COPY .emacs /home/nilsolav/.emacs

CMD zsh


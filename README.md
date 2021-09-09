# ubuntudocker

docker build --tag nilsolavubuntu .

docker run --rm -it -d --name nilsolavubuntu -v /localscratch_hdd/nilsolav:/data/ -v /home/nilsolav/repos:/repos/ nilsolavubuntu

docker exec -it nilsolavubuntu zsh

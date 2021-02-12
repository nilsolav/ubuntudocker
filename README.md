# ubuntudocker

Dockerhub integration
docker build --tag nilsolavubuntu .
docker run --rm -it -d --name nilsolavubuntu -v /localscratch/nilsolav:/data/ -v /home/nilsolav/repos:/repos/ nilsolavubuntu:test
docker run --rm -it -d --name nilsolavubuntu nilsolavubuntu:test
docker exec -it nilsolavubuntu zsh

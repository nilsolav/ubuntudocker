# ubuntudocker

## On host machine

mkdir ~/repos

cd ~/repos

git clone https://github.com/nilsolav/ubuntudocker/

docker build --tag nilsolavubuntu .

docker run --rm -it -d --name nilsolavubuntu -v /localscratch_hdd/:/data/ nilsolavubuntu:latest

docker exec -it nilsolavubuntu zsh

## Inside container

<git install repo>

Start emacs:

package-refresh-contents RET

package-install RET elpy RET

elpy-enable

elpy-set-project-root


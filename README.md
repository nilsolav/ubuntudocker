# ubuntudocker

## On host machine

mkdir ~/repos

cd ~/repos

git clone https://github.com/nilsolav/ubuntudocker/

docker build --tag nilsolavubuntu .

docker run -it -d --name nilsolavubuntu -v /localscratch_hdd/:/localscratch_hdd/ -p 8081:8081 nilsolavubuntu:latest

docker exec -it nilsolavubuntu zsh

Run container as root:

docker exec -u root -t -i nilsolavubuntu /bin/zsh

## Inside container

<git install repo>

Start emacs:

package-refresh-contents RET

package-install RET elpy RET

Add to .emacs:
(setq elpy-shell-starting-directory (quote current-directory))

(elpy-enable)

OR 
elpy-enable

elpy-set-project-root


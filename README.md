# ubuntudocker
(mkdir ~/repos)

cd ~/repos

git clone https://github.com/nilsolav/ubuntudocker/

docker build --tag nilsolavubuntu .

docker run --rm -it -d --name nilsolavubuntu -v /localscratch_hdd/nilsolav:/data/ -v /home/nilsolav/repos:/repos/ nilsolavubuntu

docker run --rm -it -d --name nilsolavubuntu -v /localscratch_hdd/nilsolav:/data/ -v /home/nilsolav/repos:/repos/ nilsolavubuntu:latest

docker exec -it nilsolavubuntu zsh

Example for setting up the testing for the report generator:

```bash
export DATAIN='/localscratch_hdd/crimac/2012/S2012837'
export DATAOUT='/localscratch_hdd/nilsolavc/2012/S2012837'
export SURVEY='S2012837' # Assumes that ${SURVEY}_sv.zarr file exists
export PREDICTIONFILE='${SURVEY}_labels.zarr'
export REPORTFILE='${SURVEY}_report_1.zarr'

docker run -rm -it --name ubuntudocker \
-v "${DATAIN}/ACOUSTIC/GRIDDED":/datain \
-v "${DATAIN}/ACOUSTIC/PREDICTIONS":/predin \
-v "${DATAOUT}/ACOUSTIC/REPORTS"/:/dataout \
--security-opt label=disable \
--env SURVEY=$SURVEY \
--env PREDICTIONFILE=$PREDICTIONFILE \
--env REPORTFILE=$REPORTFILE \
reportgeneration:latest
```

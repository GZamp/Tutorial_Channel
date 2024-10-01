#!/bin/bash 

casename=channel
rm  -f $casename.sch
echo $casename > SESSION.NAME
echo $PWD/ >> SESSION.NAME

mpirun -n 4 ./nek5000 | tee log_01.txt

mkdir output_03
mv la2* s??channel0.f* t??channel0.f* pts* output_02



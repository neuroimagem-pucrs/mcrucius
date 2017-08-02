#! /bin/bash

RESULTS_FOLDER=/media/DATA/MCRUCIUS/REHO
MASK=/media/DATA/MCRUCIUS/CAT013/visit1/PROC.RST/mask_group+tlrc

if [ ! -d $RESULTS_FOLDER ] ; then
	mkdir $RESULTS_FOLDER
fi

cd $RESULTS_FOLDER

3dClustSim 								\
-mask $MASK							 	\
-fwhmxyz 8.009071282	8.156992949	7.758440897 			\
-niter 10000 								\
-prefix clustsim


exit

x	y	z
8.009071282       8.156992949      7.758440897

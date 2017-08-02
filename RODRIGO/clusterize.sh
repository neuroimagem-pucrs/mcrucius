#! /bin/bash

MASK=/media/DATA/IDEAL_BRAINS/MNI152_T1_1mm_brain.nii.gz
OUTPUT_FOLDER=/media/DATA/MCRUCIUS/REHO/CLUSTERIZED
FINAL_DATA=/media/DATA/MCRUCIUS/REHO/3dMVM/anova_final+tlrc
BRIKS=(9 13 15 17 19 21 23 25 27 29 31 33 35 37 39)
NAME_BRIKS=('V2-V1' 'G1(V2-V1)-G2(V2-V1)' 'G1(V2-V1)' 'G2(V2-V1)' 'R(V2-V1)-L(V2-V1)' 'R(V2-V1)' 'L(V2-V1)' 'G1(R(V2-V1)-L(V2-V1))' 'G1(R(V2-V1))' 'G1(L(V2-V1))' 'G2(R(V2-V1)-L(V2-V1))' 'G2(R(V2-V1))' 'G2(L(V2-V1))' 'R(G1(V2-V1)-G2(V2-V1))' 'L(G1(V2-V1)-G2(V2-V1))')
NUMBER_OF_BRIKS=15

if [ ! -d $OUTPUT_FOLDER ] ; then
	mkdir $OUTPUT_FOLDER
fi

cd $OUTPUT_FOLDER

# First we need to resample these statistical results to 1x1x1
if [ ! -f anova.1x1x1+tlrc.HEAD ] ; then
	3dresample -rmode Cu -master $MASK -prefix anova.1x1x1 -inset $FINAL_DATA
fi

# Cluster these data and get the cluster report

echo "Cluster Report pthr 0.001" > anova.1x1x1.clusterized.pthr0.001.1D
echo "Cluster Report pthr 0.005" > anova.1x1x1.clusterized.pthr0.005.1D

for INDEX in {0..14} ; do
	# pthr = 0.001
	3dmerge -1clust 1.73 573 -1thresh 3.962 -1dindex ${BRIKS[$INDEX]} -1tindex ${BRIKS[$INDEX]}	\
	-prefix ${NAME_BRIKS[$INDEX]}.pthr0.001	 							\
	anova.1x1x1+tlrc
	
	echo "                                  " >> anova.1x1x1.clusterized.pthr0.001.1D
	echo "----------------------------------" >> anova.1x1x1.clusterized.pthr0.001.1D
	echo ${NAME_BRIKS[$INDEX]}.pthr0.001 >> anova.1x1x1.clusterized.pthr0.001.1D

	3dclust -1Dformat -nosum -1dindex ${BRIKS[$INDEX]} -1tindex ${BRIKS[$INDEX]} -2thresh -3.962 3.962 				\
	-dxyz=1 1.73 573 anova.1x1x1+tlrc >> anova.1x1x1.clusterized.pthr0.001.1D

	# pthr = 0.005
	3dmerge -1clust 1.73 1245 -1thresh 3.222 -1dindex ${BRIKS[$INDEX]} -1tindex ${BRIKS[$INDEX]}	\
	-prefix ${NAME_BRIKS[$INDEX]}.pthr0.005								\
	anova.1x1x1+tlrc

	echo "                                  " >> anova.1x1x1.clusterized.pthr0.005.1D
	echo "----------------------------------" >> anova.1x1x1.clusterized.pthr0.005.1D
	echo ${NAME_BRIKS[$INDEX]}.pthr0.005 >> anova.1x1x1.clusterized.pthr0.005.1D

	3dclust -1Dformat -nosum -1dindex ${BRIKS[$INDEX]} -1tindex ${BRIKS[$INDEX]} -2thresh -3.222 3.222 				\
	-dxyz=1 1.73 1245 anova.1x1x1+tlrc >> anova.1x1x1.clusterized.pthr0.005.1D
done

#!/bin/bash

study=CAT
subjs=(007)
visits=(visit1)

SKULL_STRIP_DATA=NS14

for subj in ${subjs[*]} ; do
	for visit in ${visits[*]} ; do
		cd ~/DATA/MCRUCIUS/$study$subj/$visit/ANAT

		if [ ! -f ./MNI_caez_N27+tlrc.HEAD ]; then
			cp ~/neuro-scripts/rodrigo.kreutz/MNI_caez_N27+tlrc.BRIK.gz ./
			cp ~/neuro-scripts/rodrigo.kreutz/MNI_caez_N27+tlrc.HEAD ./
		fi

		if [ ! -f ./$SKULL_STRIP_DATA+orig.HEAD ]; then
			rm skull_strip_out_hull.ply
			3dSkullStrip -input $study$subj.ANAT.nii.gz 	\
		     		     -touchup 				\
		     		     -shrink_fac_bot_lim 0.65 		\
				     -use_edge				\
		     		     -perc_int 0.05			\
		     		     -no_pushout			\
		     		     -init_radius 75			\
				     -ld 30				\
				     -niter 250				\
				     -avoid_vent -avoid_vent		\
				     -NN_smooth 20			\
		     		     -prefix $SKULL_STRIP_DATA
		else
			echo "Arquivo Skullstrip ja existe."
		fi

		#if [ ! -f ./NS+tlrc.HEAD ]; then
		#	@auto_tlrc -base MNI_caez_N27+tlrc -input NS+orig -no_ss
		#	3dQwarp	-workhard			\
 		#		-maxlev 7			\
 		#		-nowarp				\
		#		-blur 0 3			\
		#		-overwrite			\
 		#		-base MNI_caez_N27+tlrc.HEAD	\
 		#		-source NS+tlrc.HEAD		\
		#		-prefix NS
		#	3dmerge -1noneg -1clip 10 -prefix NS -overwrite NS+tlrc.HEAD
		#else
		#	echo "Arquivo TLRC ja existe."
		#fi

		gzip -9v *.BRIK
	done
done


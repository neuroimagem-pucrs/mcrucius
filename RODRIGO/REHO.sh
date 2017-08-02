#!/bin/bash

study=CAT
subjs=(007)
visits=(visit1 visit2)
project_dir=~/DATA/MCRUCIUS
reho_neigh=(7 19 27)

for rneigh in ${reho_neigh[*]}; do

for subj in ${subjs[*]}; do
	for visit in ${visits[*]}; do
		if [ -d $project_dir/$study$subj/$visit/PROC.RST ] ; then
			cd $project_dir/$study$subj/$visit/PROC.RST

			if [ ! -f rest_REHO_nneigh${rneigh}_$study$subj.nii.gz ] ; then
				if [ -f errts.$study$subj+tlrc.HEAD ] ; then
					3dReHo -inset errts.$study$subj+tlrc -prefix rest_REHO_nneigh${rneigh}_$study$subj.nii.gz -nneigh $rneigh
				fi
				if [ -f errts.$study$subj.tproject+tlrc.HEAD ] ; then
					3dReHo -inset errts.$study$subj.tproject+tlrc -prefix rest_REHO_nneigh${rneigh}_$study$subj.nii.gz -nneigh $rneigh
				fi
			fi

			#if [ "$visit" == "visit1" ]; then
			#	if [ -z "$REHO_visit1_w" ]; then
			#		REHO_visit1_w="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[0]"
			#	else
			#		REHO_visit1_w="${REHO_visit1_w} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[0]"
			#	fi
			#	if [ -z "$REHO_visit1_s" ]; then
			#		REHO_visit1_s="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[1]"
			#	else
			#		REHO_visit1_s="${REHO_visit1_s} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[1]"
			#	fi
			#else
			#	if [ -z "$REHO_visit2_w" ]; then
			#		REHO_visit2_w="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[0]"
			#	else
			#		REHO_visit2_w="${REHO_visit2_w} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[0]"
			#	fi
			#	if [ -z "$REHO_visit2_s" ]; then
			#		REHO_visit2_s="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[1]"
			#	else
			#		REHO_visit2_s="${REHO_visit2_s} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST/rest_REHO_nneigh${rneigh}_$study$subj.nii.gz[1]"
			#	fi
			#fi
		fi
	done
done

#cd $project_dir

#if [ -d ./REHO ] ; then
#	cd REHO
#else
#	mkdir REHO
#	cd REHO
#fi

#if [ ! -f W_nneigh${rneigh}.nii.gz ] ; then
#	3dttest++ -setA V1 ${REHO_visit1_w} -setB V2 ${REHO_visit2_w} -paired -prefix W_nneigh${rneigh}.nii.gz
#fi
#if [ ! -f chi-square_nneigh${rneigh}.nii.gz ]  ; then
#	3dttest++ -setA V1 ${REHO_visit1_s} -setB V2 ${REHO_visit2_s} -paired -prefix chi-square_nneigh${rneigh}.nii.gz
#fi

#REHO_visit2_s=""
#REHO_visit2_w=""
#REHO_visit1_s=""
#REHO_visit1_w=""

done

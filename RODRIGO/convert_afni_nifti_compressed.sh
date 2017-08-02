#! /bin/bash

study=CAT
subjs=(001 002 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019)
visits=(visit1 visit2)
project_dir=~/DATA/MCRUCIUS

for subj in ${subjs[*]}; do
        for visit in ${visits[*]}; do
                cd $project_dir/$study$subj/$visit/PROC.RST
		if [ ! -f anat_final.$study$subj.nii.gz ]; then
                	3dAFNItoNIFTI anat_final.$study$subj+tlrc.BRIK.gz
			gzip -1v anat_final.$study$subj.nii
		fi
	done
done

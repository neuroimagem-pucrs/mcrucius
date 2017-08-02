#!/bin/bash

study=CAT
subjs=(001 002 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020)
visits=(visit1 visit2)
project_dir=~/DATA/MCRUCIUS
VMHC_patients_weighted=()


TISSUE_PRIORS_MASK=/usr/local/MATLAB/R2013a/toolbox/SPM/spm8/toolbox/Seg/TPM.nii # brick 0 -> GM


#echo "subjvisit global_avg" > $project_dir/VMHC/Covariates.1D
echo "subjvisit global_avg" > $project_dir/VMHC/Covariates_intrahemispheric.1D

for subj in ${subjs[*]}; do
	for visit in ${visits[*]}; do
		if [ -d $project_dir/$study$subj/$visit/PROC.RST_VMHC ] ; then
			
			cd $project_dir/$study$subj/$visit/PROC.RST_VMHC
#
#			if [ ! -f errts.$study$subj.tproject.nii.gz ]; then
#                		3dAFNItoNIFTI errts.$study$subj.tproject+tlrc
#				gzip -1v errts.$study$subj.tproject.nii
#				rm errts.$study$subj.tproject.nii
#			fi
#
#			fslswapdim errts.$study$subj.tproject.nii.gz -x y z errts.$study$subj.flippedLR.nii.gz
			3dLRflip -AP -prefix errts.$study$subj.flippedAP.nii.gz errts.$study$subj.tproject.nii.gz
#
#			3dTcorrelate -pearson -polort -1 -prefix VMHC_FWHM.nii.gz errts.$study$subj.tproject.nii.gz errts.$study$subj.flippedLR.nii.gz
			3dTcorrelate -pearson -polort -1 -prefix VMHC_FWHM_intrahemispheric.nii.gz errts.$study$subj.tproject.nii.gz errts.$study$subj.flippedAP.nii.gz
#
#			3dcalc -a VMHC_FWHM.nii.gz -expr 'log((a+1)/(1-a))/2' -prefix VMHC_FWHM_Z.nii.gz
			3dcalc -a VMHC_FWHM_intrahemispheric.nii.gz -expr 'log((a+1)/(1-a))/2' -prefix VMHC_FWHM_Z_intrahemispheric.nii.gz
#			
#			3dresample -master VMHC_FWHM_Z.nii.gz -prefix TPM_GM_3x3x3.nii.gz -inset $TISSUE_PRIORS_MASK['0']
#
#			3dcalc -a VMHC_FWHM_Z.nii.gz -b TPM_GM_3x3x3.nii.gz -expr 'a*b' -prefix VMHC_FWHM_Z_weighted.nii.gz
			3dcalc -a VMHC_FWHM_Z_intrahemispheric.nii.gz -b TPM_GM_3x3x3.nii.gz -expr 'a*b' -prefix VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz
#
#			fslmaths TPM_GM_3x3x3.nii.gz -thr 0.4 -bin TPM_GM_3x3x3_bin.nii.gz
#
#			echo $study$subj - $visit     "->"     "Mean VMHC"
#			echo ""
#			3dmaskave -mask TPM_GM_3x3x3_bin.nii.gz VMHC_FWHM_Z.nii.gz
#
#			echo ""
			
			if [ "$visit" == "visit1" ]; then
				if [ -z "$VMHC_visit1" ]; then
					VMHC_visit1="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted.nii.gz"
				else
					VMHC_visit1="${VMHC_visit1} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted.nii.gz"
				fi
				
#				echo "s$subj$visit" `3dmaskave -mask TPM_GM_3x3x3_bin.nii.gz VMHC_FWHM_Z_weighted.nii.gz` >> $project_dir/VMHC/Covariates.1D
				if [ -z "$VMHC_intrahemispheric_visit1" ]; then
					VMHC_intrahemispheric_visit1="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz"
				else
					VMHC_intrahemispheric_visit1="${VMHC_intrahemispheric_visit1} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz"
				fi
				
				echo "s$subj$visit" `3dmaskave -mask TPM_GM_3x3x3_bin.nii.gz VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz` >> $project_dir/VMHC/Covariates_intrahemispheric.1D
			else
				if [ -z "$VMHC_visit2" ]; then
					VMHC_visit2="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted.nii.gz"
				else
					VMHC_visit2="${VMHC_visit2} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted.nii.gz"
				fi
				if [ -z "$VMHC_intrahemispheric_visit2" ]; then
					VMHC_intrahemispheric_visit2="s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz"
				else
					VMHC_intrahemispheric_visit2="${VMHC_intrahemispheric_visit2} s$subj$visit $project_dir/$study$subj/$visit/PROC.RST_VMHC/VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz"
				fi

#				echo "s$subj$visit" `3dmaskave -mask TPM_GM_3x3x3_bin.nii.gz VMHC_FWHM_Z_weighted.nii.gz` >> $project_dir/VMHC/Covariates.1D
				echo "s$subj$visit" `3dmaskave -mask TPM_GM_3x3x3_bin.nii.gz VMHC_FWHM_Z_weighted_intrahemispheric.nii.gz` >> $project_dir/VMHC/Covariates_intrahemispheric.1D
			fi
		fi
	done
done

cd $project_dir/VMHC

#echo ${VMHC_visit1}
#echo ""
#echo ${VMHC_visit2}

#3dttest++ -setA V1 ${VMHC_visit1} -setB V2 ${VMHC_visit2} -covariates Covariates.1D -prefix VMHC_V1vsV2_with_covariates.nii.gz
#3dttest++ -setA V1 ${VMHC_visit1} -setB V2 ${VMHC_visit2} -paired -prefix VMHC_V1vsV2_paired.nii.gz

3dttest++ -setA V1 ${VMHC_intrahemispheric_visit1} -setB V2 ${VMHC_intrahemispheric_visit2} -covariates Covariates_intrahemispheric.1D -prefix VMHC_intrahemispheric_V1vsV2_with_covariates.nii.gz
3dttest++ -setA V1 ${VMHC_intrahemispheric_visit1} -setB V2 ${VMHC_intrahemispheric_visit2} -paired -prefix VMHC_intrahemispheric_V1vsV2_paired.nii.gz


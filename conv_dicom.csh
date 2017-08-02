#! /bin/csh 


### In this script we will read the dicom files and convert them to NII. In the process we will also create the 
### subject folders as well as putting th nii files in the correct location. 
### Note, this script assumes that the subject folder exists, and inside it there is a "dicom" folder in it with the 
### dicom files in it
### 
### Author: Alexandre Franco
### Dez 17, 2013

### SOMENTE EDITAR ESTA PARTE PARA CADA SUJEITO@@@@@
set study = CAT
set subj = 018
set visit = visit2

set anat = 005
set rst = 006



###########################@@@@@@@@@@@@@@@@@@@@
 
# get out of script folder
cd ..

# go inside subject folder
cd ${study}${subj}
cd ${visit}

# convert dicom images to nii
set subj_folder = `pwd`

if (0) then

dcm2nii -c -g -o ${subj_folder} DICOM/*

exit
endif



##########################################################

# T1 - Anatomical 
set image = ANAT
set number = ${anat}
mkdir ${image}
cd ${image}
mv ../2*s${number}*.nii.gz ${study}${subj}.${image}.nii.gz
3dcopy ${study}${subj}.${image}.nii.gz ${study}${subj}.${image}+orig
cd $subj_folder


##########################################################
# Resting state
set image = RST
set number = ${rst}
mkdir ${image}
cd ${image}
mv ../2*s${number}*.nii.gz ${study}${subj}.${image}.nii.gz
3dcopy ${study}${subj}.${image}.nii.gz ${study}${subj}.${image}+orig
cd $subj_folder

##########################################################





# remove the rest of the junk that comes from dcm2nii
rm -v *nii.gz

# Now we can compact the dicom folder
# tar -zcvf dicom.tar.gz DICOM

# Now we can delete the original dicom folder
rm -rfv DICOM/



exit
















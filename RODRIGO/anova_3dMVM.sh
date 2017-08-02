#! /bin/bash

DATA_FOLDER=/media/DATA/MCRUCIUS/ICA/DR
# O que esta comentado ja foi rodado!!
COMPONENTS=(AUD LFRONT MTEMP PODMN PUT RFRONT EXEC MOTPL PMOT PRDMN PVIS SVIS)
RESULTS_FOLDER=/media/DATA/MCRUCIUS/ICA/ANOVA/09_07_2015

for COMPONENT in ${COMPONENTS[*]}; do
	if [ ! -d $RESULTS_FOLDER ] ; then
		mkdir $RESULTS_FOLDER
		exit
	fi

	cd $RESULTS_FOLDER

	3dMVM	-prefix anova_$COMPONENT -jobs 6								\
		-wsVars Visit												\
		-bsVars	'Group+SideOp'											\
		-num_glt 4												\
		-gltLabel 1 G1vsG2 -gltCode 1 'Group : 1*G1 -1*G2'							\
		-gltLabel 2 V1vsV2 -gltCode 2 'Visit : 1*V1 -1*V2'							\
		-gltLabel 3 RvsL   -gltCode 3 'SideOp : 1*R -1*L'							\
		-gltLabel 4 G1vsG2_for_V1vsV2 -gltCode 4 'Group : 1*G1 -1*G2   Visit : 1*V1 -1*V2'			\
		-dataTable												\
		Subj	Group	Visit	SideOp	InputFile								\
		001	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT001.visit1.$COMPONENT.Z_standard+tlrc	\
		001	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT001.visit2.$COMPONENT.Z_standard+tlrc	\
		002	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT002.visit1.$COMPONENT.Z_standard+tlrc	\
		002	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT002.visit2.$COMPONENT.Z_standard+tlrc	\
		004	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT004.visit1.$COMPONENT.Z_standard+tlrc	\
		004	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT004.visit2.$COMPONENT.Z_standard+tlrc	\
		005	G2	V1	L	$DATA_FOLDER/$COMPONENT/CAT005.visit1.$COMPONENT.Z_standard+tlrc	\
		005	G2	V2	L	$DATA_FOLDER/$COMPONENT/CAT005.visit2.$COMPONENT.Z_standard+tlrc	\
		006	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT006.visit1.$COMPONENT.Z_standard+tlrc	\
		006	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT006.visit2.$COMPONENT.Z_standard+tlrc	\
		007	G2	V1	L	$DATA_FOLDER/$COMPONENT/CAT007.visit1.$COMPONENT.Z_standard+tlrc	\
		007	G2	V2	L	$DATA_FOLDER/$COMPONENT/CAT007.visit2.$COMPONENT.Z_standard+tlrc	\
		008	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT008.visit1.$COMPONENT.Z_standard+tlrc	\
		008	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT008.visit2.$COMPONENT.Z_standard+tlrc	\
		009	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT009.visit1.$COMPONENT.Z_standard+tlrc	\
		009	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT009.visit2.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT010.visit1.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT010.visit2.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT011.visit1.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT011.visit2.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT012.visit1.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT012.visit2.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT013.visit1.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT013.visit2.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT014.visit1.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT014.visit2.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT015.visit1.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT015.visit2.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT016.visit1.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT016.visit2.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT017.visit1.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT017.visit2.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT018.visit1.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT018.visit2.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT019.visit1.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT019.visit2.$COMPONENT.Z_standard+tlrc
done



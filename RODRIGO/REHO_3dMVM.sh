#! /bin/bash

DATA_FOLDER=~/DATA/MCRUCIUS
RESULTS_FOLDER=~/DATA/MCRUCIUS/REHO/3dMVM/1-2016
reho_neigh=(7 19 27)

for rneigh in ${reho_neigh[*]}; do

	if [ ! -d $RESULTS_FOLDER ] ; then
		mkdir $RESULTS_FOLDER
	fi

	cd $RESULTS_FOLDER

	3dMVM	-prefix anova_final_nneigh$rneigh -jobs 6																\
		-wsVars Visit																	\
		-bsVars	'Group+SideOp'																\
		-num_glt 17																	\
		-gltLabel 	1	'G1-G2' 			-gltCode 1	'Group : 1*G1 -1*G2'							\
		-gltLabel 	2	'V2-V1' 			-gltCode 2	'Visit : -1*V1 1*V2'							\
		-gltLabel 	3	'R-L'   			-gltCode 3	'SideOp : 1*R -1*L'							\
		-gltLabel 	4	'G1(V2-V1)-G2(V2-V1)' 		-gltCode 4 	'Group : 1*G1 -1*G2   	Visit : -1*V1 1*V2'				\
		-gltLabel 	5	'G1(V2-V1)' 			-gltCode 5	'Group : 1*G1   	Visit : -1*V1 1*V2'				\
		-gltLabel 	6	'G2(V2-V1)' 			-gltCode 6	'Group : 1*G2   	Visit : -1*V1 1*V2'				\
		-gltLabel 	7	'R(V2-V1)-L(V2-V1)' 		-gltCode 7 	'SideOp : 1*R -1*L   	Visit : -1*V1 1*V2'				\
		-gltLabel 	8	'R(V2-V1)' 			-gltCode 8	'SideOp : 1*R   	Visit : -1*V1 1*V2'				\
		-gltLabel 	9 	'L(V2-V1)' 			-gltCode 9	'SideOp : 1*L   	Visit : -1*V1 1*V2'				\
		-gltLabel 	10	'G1(R(V2-V1)-L(V2-V1))' 	-gltCode 10 	'Group : 1*G1   	SideOp : 1*R -1*L   	Visit : -1*V1 1*V2'	\
		-gltLabel 	11 	'G1(R(V2-V1)' 			-gltCode 11	'Group : 1*G1   	SideOp : 1*R   		Visit : -1*V1 1*V2'	\
		-gltLabel 	12 	'G1(L(V2-V1)' 			-gltCode 12	'Group : 1*G1   	SideOp : 1*L   		Visit : -1*V1 1*V2'	\
		-gltLabel 	13 	'G2(R(V2-V1)-L(V2-V1))' 	-gltCode 13 	'Group : 1*G2   	SideOp : 1*R -1*L   	Visit : -1*V1 1*V2'   	\
                -gltLabel 	14 	'G2(R(V2-V1)'			-gltCode 14	'Group : 1*G2   	SideOp : 1*R   		Visit : -1*V1 1*V2'	\
                -gltLabel 	15 	'G2(L(V2-V1)' 			-gltCode 15	'Group : 1*G2   	SideOp : 1*L   		Visit : -1*V1 1*V2'	\
		-gltLabel 	16 	'R(G1(V2-V1)-G2(V2-V1))' 	-gltCode 16 	'SideOp : 1*R    	Group : 1*G1 -1*G2   	Visit : -1*V1 1*V2'	\
		-gltLabel 	17	'L(G1(V2-V1)-G2(V2-V1))'	-gltCode 17 	'SideOp : 1*L    	Group : 1*G1 -1*G2   	Visit : -1*V1 1*V2'	\
		-dataTable																	\
		Subj	Group	Visit	SideOp	InputFile													\
		001	G1	V1	R	$DATA_FOLDER/CAT001/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT001.nii.gz[0] 					\
		001	G1	V2	R	$DATA_FOLDER/CAT001/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT001.nii.gz[0] 					\
		002	G2	V1	R	$DATA_FOLDER/CAT002/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT002.nii.gz[0] 					\
		002	G2	V2	R	$DATA_FOLDER/CAT002/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT002.nii.gz[0] 					\
		004	G1	V1	L	$DATA_FOLDER/CAT004/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT004.nii.gz[0] 					\
		004	G1	V2	L	$DATA_FOLDER/CAT004/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT004.nii.gz[0] 					\
		005	G2	V1	L	$DATA_FOLDER/CAT005/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT005.nii.gz[0] 					\
		005	G2	V2	L	$DATA_FOLDER/CAT005/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT005.nii.gz[0] 					\
		006	G1	V1	L	$DATA_FOLDER/CAT006/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT006.nii.gz[0] 					\
		006	G1	V2	L	$DATA_FOLDER/CAT006/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT006.nii.gz[0] 					\
		008	G2	V1	R	$DATA_FOLDER/CAT008/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT008.nii.gz[0] 					\
		008	G2	V2	R	$DATA_FOLDER/CAT008/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT008.nii.gz[0] 					\
		009	G1	V1	R	$DATA_FOLDER/CAT009/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT009.nii.gz[0] 					\
		009	G1	V2	R	$DATA_FOLDER/CAT009/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT009.nii.gz[0] 					\
		010	G1	V1	R	$DATA_FOLDER/CAT010/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT010.nii.gz[0] 					\
		010	G1	V2	R	$DATA_FOLDER/CAT010/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT010.nii.gz[0] 					\
		011	G1	V1	R	$DATA_FOLDER/CAT011/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT011.nii.gz[0] 					\
		011	G1	V2	R	$DATA_FOLDER/CAT011/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT011.nii.gz[0] 					\
		012	G2	V1	R	$DATA_FOLDER/CAT012/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT012.nii.gz[0] 					\
		012	G2	V2	R	$DATA_FOLDER/CAT012/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT012.nii.gz[0] 					\
		013	G1	V1	L	$DATA_FOLDER/CAT013/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT013.nii.gz[0] 					\
		013	G1	V2	L	$DATA_FOLDER/CAT013/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT013.nii.gz[0] 					\
		014	G1	V1	R	$DATA_FOLDER/CAT014/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT014.nii.gz[0] 					\
		014	G1	V2	R	$DATA_FOLDER/CAT014/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT014.nii.gz[0] 					\
		015	G2	V1	R	$DATA_FOLDER/CAT015/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT015.nii.gz[0] 					\
		015	G2	V2	R	$DATA_FOLDER/CAT015/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT015.nii.gz[0] 					\
		016	G1	V1	L	$DATA_FOLDER/CAT016/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT016.nii.gz[0] 					\
		016	G1	V2	L	$DATA_FOLDER/CAT016/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT016.nii.gz[0] 					\
		017	G2	V1	R	$DATA_FOLDER/CAT017/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT017.nii.gz[0] 					\
		017	G2	V2	R	$DATA_FOLDER/CAT017/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT017.nii.gz[0] 					\
		018	G1	V1	L	$DATA_FOLDER/CAT018/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT018.nii.gz[0] 					\
		018	G1	V2	L	$DATA_FOLDER/CAT018/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT018.nii.gz[0] 					\
		019	G1	V1	L	$DATA_FOLDER/CAT019/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT019.nii.gz[0] 					\
		019	G1	V2	L	$DATA_FOLDER/CAT019/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT019.nii.gz[0]					\
		020	G1	V1	L	$DATA_FOLDER/CAT020/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT020.nii.gz[0]					\
		020	G1	V2	L	$DATA_FOLDER/CAT020/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT020.nii.gz[0]					\
		021	G1	V1	R	$DATA_FOLDER/CAT021/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT021.nii.gz[0]					\
		021	G1	V2	R	$DATA_FOLDER/CAT021/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT021.nii.gz[0]					\
		022	G2	V1	R	$DATA_FOLDER/CAT022/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT022.nii.gz[0]					\
		022	G2	V2	R	$DATA_FOLDER/CAT022/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT022.nii.gz[0]					\
		023	G2	V1	R	$DATA_FOLDER/CAT023/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT023.nii.gz[0]					\
		023	G2	V2	R	$DATA_FOLDER/CAT023/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT023.nii.gz[0]					\
		024	G2	V1	L	$DATA_FOLDER/CAT024/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT024.nii.gz[0]					\
		024	G2	V2	L	$DATA_FOLDER/CAT024/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT024.nii.gz[0]					\
		025	G1	V1	L	$DATA_FOLDER/CAT025/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT025.nii.gz[0]					\
		025	G1	V2	L	$DATA_FOLDER/CAT025/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT025.nii.gz[0]					\
		026	G2	V1	L	$DATA_FOLDER/CAT026/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT026.nii.gz[0]					\
		026	G2	V2	L	$DATA_FOLDER/CAT026/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT026.nii.gz[0]					\
		027	G1	V1	L	$DATA_FOLDER/CAT027/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT027.nii.gz[0]					\
		027	G1	V2	L	$DATA_FOLDER/CAT027/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT027.nii.gz[0]					\
		028	G1	V1	L	$DATA_FOLDER/CAT028/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT028.nii.gz[0]					\
		028	G1	V2	L	$DATA_FOLDER/CAT028/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT028.nii.gz[0]					\
		029	G2	V1	R	$DATA_FOLDER/CAT029/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT029.nii.gz[0]					\
		029	G2	V2	R	$DATA_FOLDER/CAT029/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT029.nii.gz[0]					\
		030	G2	V1	L	$DATA_FOLDER/CAT030/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT030.nii.gz[0]					\
		030	G2	V2	L	$DATA_FOLDER/CAT030/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT030.nii.gz[0]					\
		032	G2	V1	R	$DATA_FOLDER/CAT032/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT032.nii.gz[0]					\
		032	G2	V2	R	$DATA_FOLDER/CAT032/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT032.nii.gz[0]

done



#		007	G2	V1	L	$DATA_FOLDER/CAT007/visit1/PROC.RST/rest_REHO_nneigh${rneigh}_CAT007.nii.gz[0]					\
#		007	G2	V2	L	$DATA_FOLDER/CAT007/visit2/PROC.RST/rest_REHO_nneigh${rneigh}_CAT007.nii.gz[0]					\





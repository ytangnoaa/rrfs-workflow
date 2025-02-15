MACHINE="wcoss2"
ACCOUNT="RRFS-DEV"
HPSS_ACCOUNT="RRFS-DEV"
EXPT_SUBDIR="test_firewx"

envir="rrfsfw"
NET="rrfsfw"
TAG="c0v00"
MODEL="rrfsfw"
RUN="rrfsfw"

STMP=""
PTMP=""

VERBOSE="TRUE"
PRINT_ESMF="TRUE"

USE_CRON_TO_RELAUNCH="FALSE"
CRON_RELAUNCH_INTVL_MNTS="03"

PREEXISTING_DIR_METHOD="rename"

PREDEF_GRID_NAME="RRFS_FIREWX_1.5km"
#CENTLON="-106.0"
#CENTLAT="39.2"
QUILTING="TRUE"

CCPP_PHYS_SUITE="FV3_HRRR_gf_nogwd"
FCST_LEN_HRS="36"
LBC_SPEC_INTVL_HRS="1"
BOUNDARY_LEN_HRS="36"
BOUNDARY_PROC_GROUP_NUM="36"

DATE_FIRST_CYCL="20231111"
DATE_LAST_CYCL="20231111"
CYCL_HRS=( "18" )

RUN_TASK_MAKE_GRID="TRUE"
RUN_TASK_MAKE_OROG="TRUE"
RUN_TASK_MAKE_SFC_CLIMO="TRUE"
RUN_TASK_RUN_PRDGEN="TRUE"
NNODES_MAKE_SFC_CLIMO="6"
PPN_MAKE_SFC_CLIMO="12"

# Temporary solution until high resolution fix files are added to common directory
SFC_CLIMO_INPUT_DIR="/lfs/h2/emc/lam/noscrub/Benjamin.Blake/fix_sfc_climo"

EXTRN_MDL_NAME_ICS="RRFS"
EXTRN_MDL_NAME_LBCS="RRFS"

PPN_MAKE_ICS="6"
NNODES_MAKE_ICS="8"
PPN_MAKE_LBCS="36"
NNODES_MAKE_LBCS="1"
TPP_MAKE_LBCS="1"

WTIME_RUN_FCST="01:10:00"
PPN_RUN_FCST="63"
NNODES_RUN_FCST="4"
TPP_RUN_FCST="2"

DO_NON_DA_RUN="TRUE"
DO_RETRO="TRUE"
DO_SMOKE_DUST="FALSE"
VCOORD_FILE="global_hyblev_fcst_rrfsL65.txt"
WFLOW_XML_TMPL_FN="FV3LAM_wflow_nonDA.xml"
FV3_NML_YAML_CONFIG_FN=""
FV3_NML_BASE_SUITE_FN="input.nml.RRFSFW"

USE_USER_STAGED_EXTRN_FILES="TRUE"
EXTRN_MDL_SOURCE_BASEDIR_ICS="/lfs/h2/emc/lam/noscrub/RRFS_input/input_model_data/RRFS/2023111118"
EXTRN_MDL_SOURCE_BASEDIR_LBCS="/lfs/h2/emc/lam/noscrub/RRFS_input/input_model_data/RRFS/2023111118"

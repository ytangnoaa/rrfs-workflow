MACHINE="hera"
#RESERVATION="rrfsens"
#RESERVATION_POST="rrfsdet"

################################################################
#EXPT_BASEDIR="YourOwnSpace"
EXPT_SUBDIR="rrfs_test_da_ens"

version="v0.0.0"
envir="test"
NET="rrfs"
TAG="c0v00"
MODEL="rrfs"
RUN="rrfs"
RUN_ensctrl="rrfs"

PTMP="/scratch2/NCEPDEV/stmp3/${USER}/rrfs_test_da_ens"
STMP="${PTMP}"

EXTRN_MDL_DATE_JULIAN="TRUE"
PREDEF_GRID_NAME=RRFS_CONUS_3km
. set_rrfs_config_general.sh

ACCOUNT="fv3-cam"
HPSS_ACCOUNT="fv3-cam"

#USE_CRON_TO_RELAUNCH="TRUE"
#CRON_RELAUNCH_INTVL_MNTS="05"
################################################################

DO_ENSEMBLE="TRUE"
#DO_ENSFCST="TRUE"
#DO_DACYCLE="TRUE"
#DO_SURFACE_CYCLE="TRUE"
DO_SPINUP="TRUE"
DO_SAVE_DA_OUTPUT="TRUE"
DO_POST_SPINUP="TRUE"
DO_POST_PROD="TRUE"
DO_RETRO="TRUE"
DO_NONVAR_CLDANAL="TRUE"
#DO_ENVAR_RADAR_REF="TRUE"
DO_SMOKE_DUST="FALSE"
DO_PM_DA="FALSE"
DO_GLM_FED_DA="TRUE"
GLMFED_DATA_MODE="EMC"  # retros 20220608-now use FULL; retros 20230714-now and real-time on Jet use FULL or TILES
#DO_REFL2TTEN="FALSE"
#RADARREFL_TIMELEVEL=(0)
#FH_DFI_RADAR="0.0,0.25,0.5"
#DO_SOIL_ADJUST="TRUE"
#DO_RADDA="FALSE"
#DO_BUFRSND="TRUE"
#USE_FVCOM="TRUE"
#PREP_FVCOM="TRUE"
USE_CLM="TRUE"
DO_PARALLEL_PRDGEN="FALSE"
DO_GSIDIAG_OFFLINE="FALSE"

if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
  DO_SPINUP="FALSE"
  DO_SAVE_DA_OUTPUT="FALSE"
  DO_NONVAR_CLDANAL="FALSE"
  DO_POST_PROD="TRUE"
fi

EXTRN_MDL_ICS_OFFSET_HRS="6"
LBC_SPEC_INTVL_HRS="1"
EXTRN_MDL_LBCS_OFFSET_HRS="6"
BOUNDARY_LEN_HRS="12"
BOUNDARY_PROC_GROUP_NUM="4"

EXTRN_MDL_NAME_ICS="GDASENKF"
FV3GFS_FILE_FMT_ICS="netcdf"
EXTRN_MDL_NAME_LBCS="GEFS"

# available retro period:
# 20230419-27; 20230610-18; 20230729-0807; 20230826-31; 20220720-27; 20220429-0506; 20220201-07
DATE_FIRST_CYCL="20230610"
DATE_LAST_CYCL="20230610"
CYCL_HRS=( "18" )
CYCL_HRS_SPINSTART=("06" "18")
CYCL_HRS_PRODSTART=("07" "19")
if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
  CYCL_HRS_STOCH=("00" "06" "12" "18")
fi
#CYCL_HRS_RECENTER=("19")
CYCLEMONTH="06"
CYCLEDAY="10"

STARTYEAR=${DATE_FIRST_CYCL:0:4}
STARTMONTH=${DATE_FIRST_CYCL:4:2}
STARTDAY=${DATE_FIRST_CYCL:6:2}
STARTHOUR="00"
ENDYEAR=${DATE_LAST_CYCL:0:4}
ENDMONTH=${DATE_LAST_CYCL:4:2}
ENDDAY=${DATE_LAST_CYCL:6:2}
ENDHOUR="23"

PREEXISTING_DIR_METHOD="upgrade" # "rename"
INITIAL_CYCLEDEF="${DATE_FIRST_CYCL}0600 ${DATE_LAST_CYCL}2300 12:00:00"
BOUNDARY_CYCLEDEF="${DATE_FIRST_CYCL}0600 ${DATE_LAST_CYCL}2300 06:00:00"
PROD_CYCLEDEF="${DATE_FIRST_CYCL}0700 ${DATE_LAST_CYCL}2300 01:00:00"
PRODLONG_CYCLEDEF="00 01 01 01 2100 *"
#RECENTER_CYCLEDEF="00 19 * 10 2022 *"
#ARCHIVE_CYCLEDEF="${DATE_FIRST_CYCL}1500 ${DATE_LAST_CYCL}2300 24:00:00"
ARCHIVE_CYCLEDEF="${DATE_LAST_CYCL}2300 ${DATE_LAST_CYCL}2300 24:00:00"
if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
  BOUNDARY_LEN_HRS="36"
  LBC_SPEC_INTVL_HRS="3"
  DO_SPINUP="FALSE"
  INITIAL_CYCLEDEF="00 01 01 01 2100 *"
  BOUNDARY_CYCLEDEF="${DATE_FIRST_CYCL}0000 ${DATE_LAST_CYCL}2300 06:00:00"
  PROD_CYCLEDEF="${DATE_FIRST_CYCL}0000 ${DATE_LAST_CYCL}2300 06:00:00"
  PRODLONG_CYCLEDEF="00 01 01 01 2100 *"
  RECENTER_CYCLEDEF="${DATE_FIRST_CYCL}0000 ${DATE_LAST_CYCL}2300 06:00:00"
fi
if [[ $DO_SPINUP == "TRUE" ]] ; then
  SPINUP_CYCLEDEF="${DATE_FIRST_CYCL}0600 ${DATE_LAST_CYCL}2300 12:00:00"
fi
if [[ $DO_SAVE_DA_OUTPUT == "TRUE" ]] ; then
  SAVEDA_CYCLEDEF="${DATE_FIRST_CYCL}1200 ${DATE_LAST_CYCL}2300 06:00:00"
fi

FCST_LEN_HRS="1"
FCST_LEN_HRS_SPINUP="1"
POSTPROC_LEN_HRS="1"
#FCST_LEN_HRS_CYCLES=(48 18 18 18 18 18 48 18 18 18 18 18 48 18 18 18 18 18 48 18 18 18 18 18)
for i in {0..23}; do FCST_LEN_HRS_CYCLES[$i]=1; done
for i in {0..23..6}; do FCST_LEN_HRS_CYCLES[$i]=1; done
if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
  for i in {0..23..06}; do FCST_LEN_HRS_CYCLES[$i]=24; done
  FCST_LEN_HRS="6"
  POSTPROC_LEN_HRS="24"
  BOUNDARY_PROC_GROUP_NUM="8"
fi
DA_CYCLE_INTERV="1"
RESTART_INTERVAL="1"
RESTART_INTERVAL_LONG="1"
netcdf_diag=.true.
binary_diag=.false.
WRTCMP_output_file="netcdf_parallel"
WRTCMP_ideflate="1"
WRTCMP_quantize_nsd="18"

## set up post
OUTPUT_FH="1 -1"

WTIME_RUN_FCST="01:00:00"
WTIME_MAKE_LBCS="02:00:00"

ARCHIVEDIR="/1year/BMC/wrfruc/rrfs_b"
NCL_REGION="conus"

if [[ ${DO_ENSEMBLE}  == "TRUE" ]]; then
   NUM_ENS_MEMBERS=3
#   DO_ENSCONTROL="TRUE"
   DO_GSIOBSERVER="TRUE"
   DO_ENKFUPDATE="TRUE"
#   DO_RECENTER="TRUE"
   DO_ENS_GRAPHICS="FALSE"
   DO_ENKF_RADAR_REF="TRUE"
   DO_ENSPOST="TRUE"
   DO_ENSINIT="TRUE"

   RADAR_REF_THINNING="2"
   ARCHIVEDIR="/5year/BMC/wrfruc/rrfs_ens"
   CLEAN_OLDFCST_HRS="12"
   CLEAN_OLDSTMPPOST_HRS="12"
   cld_bld_hgt=0.0
   l_precip_clear_only=.true.
   write_diag_2=.true.

   START_TIME_SPINUP="00:30:00"

   NUM_ENS_MEMBERS_FCST=3
   if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
     NUM_ENS_MEMBERS=${NUM_ENS_MEMBERS_FCST}
     WTIME_RUN_FCST="04:45:00"
     WTIME_MAKE_LBCS="01:30:00"

     DO_ENSFCST_MULPHY="TRUE"
     DO_SPP="TRUE"
     DO_SPPT="FALSE"
     DO_SKEB="FALSE"
     SPPT_MAG="0.5"
     DO_LSM_SPP="TRUE"
     DO_RECENTER="TRUE"
   fi
   CLEAN_OLDFCST_HRS="48"
   CLEAN_OLDSTMPPOST_HRS="48"
fi

. set_rrfs_config.sh

STMP="${PTMP}/stmp_ensda"
if [[ ${DO_ENSFCST} == "TRUE" ]] ; then
  STMP="${PTMP}/stmp_ensfcst"
fi
NWGES="${PTMP}/nwges"
ENSCTRL_STMP="/scratch2/NCEPDEV/fv3-cam/UFS_SRW_App/develop/input_model_data/DAeng_ens_restart"
ENSCTRL_PTMP="${PTMP}"
ENSCTRL_NWGES="${NWGES}"


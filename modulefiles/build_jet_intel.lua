help([[
This module loads libraries for building the RRFS workflow on
the NOAA RDHPC machine Jet using Intel-2022.1.2
]])

whatis([===[Loads libraries needed for building the RRFS workflow on Jet ]===])

prepend_path("MODULEPATH", "/mnt/lfs4/HFIP/hfv3gfs/role.epic/spack-stack/spack-stack-1.5.1/envs/gsi-addon/install/modulefiles/Core")

load(pathJoin("stack-intel", os.getenv("stack_intel_ver") or "2021.5.0"))
load(pathJoin("stack-intel-oneapi-mpi", os.getenv("stack_impi_ver") or "2021.5.1"))
load(pathJoin("cmake", os.getenv("cmake_ver") or "3.23.1"))

load("rrfs_common")

prepend_path("MODULEPATH", "/lfs4/BMC/nrtrr/FIX_EXEC_MODULE/lua")
load("prod_util/2.0.15")

unload("python/3.10.8")

setenv("CMAKE_C_COMPILER","mpiicc")
setenv("CMAKE_CXX_COMPILER","mpiicpc")
setenv("CMAKE_Fortran_COMPILER","mpiifort")
setenv("CMAKE_Platform","jet.intel")
setenv("BLENDINGPYTHON","/contrib/miniconda3/4.5.12/envs/pygraf/bin/python")

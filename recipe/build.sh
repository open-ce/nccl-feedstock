# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2018, 2019. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************

## The make environment in NCCL is fairly configurable which is good
## because we want to use the `nvcc` wrapper package in Open-CE.
## Setting CUDA_HOME here to the conda environment will work for that. 
## NCCL, however, also uses some static libraries from the CUDA Toolkit
## and so we'll use it's CUDA_LIB env variable to tell it about the local
## installation as well.

export CUDA_HOME=$CONDA_PREFIX
export CUDA_LIB=${OPEN_CE_CUDA_HOME}/lib64
 
make -j src.build
rm -rf build/obj/
cp -R build/* $PREFIX/

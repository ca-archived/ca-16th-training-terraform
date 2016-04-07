#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./destroy-team.sh ${TF_BUCKET} team_a
./destroy-team.sh ${TF_BUCKET} team_b
./destroy-team.sh ${TF_BUCKET} team_c
./destroy-team.sh ${TF_BUCKET} team_d
./destroy-team.sh ${TF_BUCKET} team_e
./destroy-team.sh ${TF_BUCKET} team_f
./destroy-team.sh ${TF_BUCKET} team_g
./destroy-team.sh ${TF_BUCKET} team_h
./destroy-team.sh ${TF_BUCKET} team_i
./destroy-team.sh ${TF_BUCKET} team_j
./destroy-team.sh ${TF_BUCKET} team_k
./destroy-team.sh ${TF_BUCKET} team_l

popd > /dev/null

#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./plan-team.sh ${TF_BUCKET} team_a
./plan-team.sh ${TF_BUCKET} team_b
./plan-team.sh ${TF_BUCKET} team_c
./plan-team.sh ${TF_BUCKET} team_d
./plan-team.sh ${TF_BUCKET} team_e
./plan-team.sh ${TF_BUCKET} team_f
./plan-team.sh ${TF_BUCKET} team_g
./plan-team.sh ${TF_BUCKET} team_h
./plan-team.sh ${TF_BUCKET} team_i
./plan-team.sh ${TF_BUCKET} team_j
./plan-team.sh ${TF_BUCKET} team_k
./plan-team.sh ${TF_BUCKET} team_l

popd > /dev/null

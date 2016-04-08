#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./aws-plan-team.sh ${TF_BUCKET} team_a
./aws-plan-team.sh ${TF_BUCKET} team_b
./aws-plan-team.sh ${TF_BUCKET} team_c
./aws-plan-team.sh ${TF_BUCKET} team_d
./aws-plan-team.sh ${TF_BUCKET} team_e
./aws-plan-team.sh ${TF_BUCKET} team_f
./aws-plan-team.sh ${TF_BUCKET} team_g
./aws-plan-team.sh ${TF_BUCKET} team_h
./aws-plan-team.sh ${TF_BUCKET} team_i
./aws-plan-team.sh ${TF_BUCKET} team_j
./aws-plan-team.sh ${TF_BUCKET} team_k
./aws-plan-team.sh ${TF_BUCKET} team_l

popd > /dev/null

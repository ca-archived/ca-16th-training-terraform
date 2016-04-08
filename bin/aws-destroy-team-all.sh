#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./aws-destroy-team.sh ${TF_BUCKET} team_a
./aws-destroy-team.sh ${TF_BUCKET} team_b
./aws-destroy-team.sh ${TF_BUCKET} team_c
./aws-destroy-team.sh ${TF_BUCKET} team_d
./aws-destroy-team.sh ${TF_BUCKET} team_e
./aws-destroy-team.sh ${TF_BUCKET} team_f
./aws-destroy-team.sh ${TF_BUCKET} team_g
./aws-destroy-team.sh ${TF_BUCKET} team_h
./aws-destroy-team.sh ${TF_BUCKET} team_i
./aws-destroy-team.sh ${TF_BUCKET} team_j
./aws-destroy-team.sh ${TF_BUCKET} team_k
./aws-destroy-team.sh ${TF_BUCKET} team_l

popd > /dev/null

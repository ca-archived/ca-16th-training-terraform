#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./aws-apply-team.sh ${TF_BUCKET} team_a
./aws-apply-team.sh ${TF_BUCKET} team_b
./aws-apply-team.sh ${TF_BUCKET} team_c
./aws-apply-team.sh ${TF_BUCKET} team_d
./aws-apply-team.sh ${TF_BUCKET} team_e
./aws-apply-team.sh ${TF_BUCKET} team_f
./aws-apply-team.sh ${TF_BUCKET} team_g
./aws-apply-team.sh ${TF_BUCKET} team_h
./aws-apply-team.sh ${TF_BUCKET} team_i
./aws-apply-team.sh ${TF_BUCKET} team_j
./aws-apply-team.sh ${TF_BUCKET} team_k
./aws-apply-team.sh ${TF_BUCKET} team_l

popd > /dev/null

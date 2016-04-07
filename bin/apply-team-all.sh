#!/bin/bash

pushd . > /dev/null
cd `dirname $0`

./apply-team.sh ${TF_BUCKET} team_a
./apply-team.sh ${TF_BUCKET} team_b
./apply-team.sh ${TF_BUCKET} team_c
./apply-team.sh ${TF_BUCKET} team_d
./apply-team.sh ${TF_BUCKET} team_e
./apply-team.sh ${TF_BUCKET} team_f
./apply-team.sh ${TF_BUCKET} team_g
./apply-team.sh ${TF_BUCKET} team_h
./apply-team.sh ${TF_BUCKET} team_i
./apply-team.sh ${TF_BUCKET} team_j
./apply-team.sh ${TF_BUCKET} team_k
./apply-team.sh ${TF_BUCKET} team_l

popd > /dev/null

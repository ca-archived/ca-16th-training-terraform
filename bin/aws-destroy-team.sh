#!/bin/bash

export AWS_DEFAULT_REGION="ap-northeast-1"
TERRAFORM=~/terraform/terraform

bucket=$1
team=$2

pushd . > /dev/null
cd `dirname $0`/../aws-team
rm -rf .terraform
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup

${TERRAFORM} remote config -backend=S3 -backend-config="bucket=${bucket}" -backend-config="key=aws/${team}"
${TERRAFORM} plan -destroy --var-file=../conf/account_${team}.tfvars
${TERRAFORM} destroy -force --var-file=../conf/account_${team}.tfvars
${TERRAFORM} remote push

rm -rf .terraform
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup

popd > /dev/null

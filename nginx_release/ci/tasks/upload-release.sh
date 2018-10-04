#!/usr/bin/env bash
set -x
#For the purpose of this tutorial, there are credentials being commited here.
#This is on purpose and will be covered in the security tutorial.
#The director is expected to be secured and only locally available for this lab session
#But this does not demonostrate a best practice

export BOSH_DEPLOYMENT=byllc-nginx
export BOSH_DIRECTOR=https://10.200.192.0:25555/
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=agile-defense
export BOSH_ENVIRONMENT=training-bosh
export WORKSPACE=`pwd`

cd source-code/nginx_release

ls -lah

bosh alias-env --ca-cert ${WORKSPACE}/cert-file/training-bosh.pem -e ${BOSH_DIRECTOR} training-bosh

bosh login

bosh upload-release

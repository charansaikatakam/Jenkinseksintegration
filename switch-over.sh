#!/bin/bash
acc_id=$1
profile=$2
region=$3
eksassumeroletemporarycreds=$(aws sts assume-role --role-arn arn:aws:iam::$acc_id:role/eksjenkinsrole --role-session-name "eksadminrole")
accesskey=$(echo $eksassumeroletemporarycreds | jq -r '.Credentials.AccessKeyId')
secretkey=$(echo $eksassumeroletemporarycreds | jq -r '.Credentials.SecretAccessKey')
sessiontoken=$(echo $eksassumeroletemporarycreds | jq -r '.Credentials.SessionToken')
aws configure set aws_access_key_id $accesskey --profile $profile
aws configure set aws_secret_access_key $secretkey --profile $profile
aws configure set aws_session_token $sessiontoken --profile $profile
aws configure set region $region --profile $profile

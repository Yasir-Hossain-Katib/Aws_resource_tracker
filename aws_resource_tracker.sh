#!/bin/bash

#############
#Author : Katib
#date: 25 February
#version:v1
##
#This script will report the AWS resource usage
##################
set -x

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM users

#list s3 buckets
echo "print list of s3 buckets"
aws s3 ls > resource_tracker

#list EC2 instances
echo "print list of ec2 instances"

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resource_tracker

#list lambda
echo "print list of lambda functions" 
aws lambda list-functions > resource_tracker


#list IAM users
echo "print list of IAM users"
aws iam list-users > resource_tracker
                        

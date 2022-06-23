#!/bin/bash
START_DATE=`date -d "${days_backwards:-20} day ago" +%F `

printf "%s\n" "Listing AMIs for region useast since ${START_DATE}" 
aws ec2 describe-images --region us-east-1 --output table \
--filters Name=is-public,Values=false \
--query "sort_by(Images[?CreationDate>=\`${START_DATE}\`],&CreationDate)[].[Name,ImageId,ImageType,CreationDate,State]"

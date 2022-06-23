#!/bin/bash

export AWS_ACCESS_KEY_ID="ASIA5A5D7DEE5HFMJUPM"
export AWS_SECRET_ACCESS_KEY="hedo+fXlYjfWvGcCNDB/joYxQAwqivmN9UwizvB+"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEFYaCXVzLWVhc3QtMSJHMEUCIBickPBvUxqnYTuXXCUvewJVGUxWWMjKlbrfJN7nSY9aAiEAk4RPwRA9FyPVshV58drybR+Qomz/oqa/rCfx7E9U+KYqoAMIbxACGgw4OTUzMDc2ODQxMDUiDOlYFtzkynPUp65vYSr9AvN5Zl/yIYVZqSqWaEa7XzK8QSzYfR27MhRabnTp660ugrUiJdmAiEOIDIX1V/EEzeXi+k4WLyGw3FCopriHvat6YMQpjLFjyQxmazU0mH7yu4mE9/R4LpIkeD4Nf2NF3JgyzaW/XkNqskeh8919NH/pX1PG5/iqijCb7UTybScCaOKDsFt5o1GjaLGsRN+Fwkg465kSigw9MfrCEua+ux3Kt9A6MKGyL+aTjn9gWGG7rO7AW70gfaO3YdOeKNPGDJdqmlGSMrBXcmoEUqFA9vG4or+53yfgVpAgzftOD/DC0UDgm1q+NQW9PDrgpwc9Ht1hCLA0qMoEBlNkT2UTGyovxR1ffKOVDzEsRt8qV6RX9J5V6PHB753alzdfNU8Jsutgza8k6OCBM39zkcWcsEMmHjrdU8xoIZ2A7vdthDvNSaFvZ6afwn7PuXoC0paxoW2OHdCZQ1EWNs2DvCncWXUVIm2Eb2Ce43Gu6k7bOe8oHXS9q1VUxIIlwQN0zDDr+s+VBjqmAR55h9oKFFB3Qo2IeSnrwIZ8xX84JfxOoAe2Sq4IGdEdsKAKTKIgFBGeJJeXo1g2h5f18PvbW2yV+pUzVJuhN+d+/3+ktD8v45FgKUBg9KiSyiZseuciZO9wP4rOdyMUVSvsuKZsLXeKgXBJ83YPB/uv7TEpgZkW50FLzOefwiHQpmgxLU5IUQQMVMsC/7nNt6bAaHlTEzXq+oq0IzoURYPbHEdCa/c="
START_DATE=`date -d "${days_backwards:-20} day ago" +%F `
echo "yo"
printf "%s\n" "Listing AMIs for region useast since ${START_DATE}" 
aws ec2 describe-images --region us-east-1 --output table \
--filters Name=is-public,Values=false \
--query "sort_by(Images[?CreationDate>=\`${START_DATE}\`],&CreationDate)[].[Name,ImageId,ImageType,CreationDate,State]"

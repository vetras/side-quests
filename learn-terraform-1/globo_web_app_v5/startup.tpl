#! /bin/bash

# install nginx
sudo amazon-linux-extras install -y nginx1
sudo service nginx start

# delete the default file nginx creates
sudo rm /usr/share/nginx/html/index.html

#
# This AMI has the AWS cli pre-installed. So we can use that to get data from S3
# /home/ec2-user is the default HOME directory on this AMI
#
aws s3 cp s3://${s3_bucket}/website/index.html /home/ec2-user/index.html
aws s3 cp s3://${s3_bucket}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png

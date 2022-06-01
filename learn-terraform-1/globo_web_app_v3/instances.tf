
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = "t2.nano"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]
  tags                   = local.tags

  user_data = <<EOF
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
aws s3 cp s3://${aws_s3_bucket.b.id}/website/index.html /home/ec2-user/index.html
aws s3 cp s3://${aws_s3_bucket.b.id}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
EOF

}

resource "aws_instance" "nginx2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = "t2.nano"
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]
  tags                   = local.tags

  user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
aws s3 cp s3://${aws_s3_bucket.b.id}/website/index.html /home/ec2-user/index.html
aws s3 cp s3://${aws_s3_bucket.b.id}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
EOF

}
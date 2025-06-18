#!/bin/bash

# Run commands as ec2-user
su - ec2-user <<'EOF'
cd ~/
rm -rf terraform-aws-multi-env-webapp
git clone https://github.com/Nisarg153/terraform-aws-multi-env-webapp
cd terraform-aws-multi-env-webapp/app_code
echo "Deploying Git SHA: ${project_prefix}-${git_sha}" >> /home/ec2-user/deploy.log
npm install express body-parser aws-sdk
sudo npm install -g pm2
pm2 start app.js --name app
pm2 startup systemd -u ec2-user --hp /home/ec2-user | tail -n 1 | sh
pm2 save

EOF
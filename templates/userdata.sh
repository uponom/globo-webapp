#! /bin/bash
playbookdir=/var/ansible_playbooks

sudo dnf update
sudo dnf install -y git ansible

sudo mkdir $playbookdir

tmpdir=$(mktemp -d)
git clone ${playbook_repo} $tmpdir
sudo cp -r "$tmpdir/ansible-playbook/"* $playbookdir 
rm -rf $tmpdir

aws secretsmanager get-secret-value --secret-id "${secret_id}" --region ${region} --query SecretString --output text > /var/ansible_playbooks/api_key.txt 2>&1
aws ssm get-parameter --name "${host_list}" --region ${region} --query Parameter.Value --output text > /var/ansible_playbooks/host_list.txt 2>&1
aws ssm get-parameter --name "${site_name}" --region ${region} --query Parameter.Value --output text > /var/ansible_playbooks/site_name.txt 2>&1

ansible-playbook "$playbookdir/playbook.yml" -i "$playbookdir/hosts"

# # sudo amazon-linux-extras install -y nginx1
# sudo dnf install -y nginx
# # sudo service nginx start
# sudo systemctl start nginx
# sudo rm /usr/share/nginx/html/index.html
# echo '<html><head><title>Taco Wagon Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
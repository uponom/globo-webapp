#! /bin/bash
playbookdir=/var/ansible_playbooks

sudo dnf update
sudo dnf install -y git ansible

sudo mkdir $playbookdir

tmpdir=$(mktemp -d)
git clone ${playbook_repo} $tmpdir
cp -r "$tmpdir/ansible-playbook/*" $playbookdir 

#sudo git clone ${playbook_repo} /var/ansible_playbooks
ansible-playbook /var/ansible_playbooks/playbook.yml -i /var/ansible_playbooks/hosts

# # sudo amazon-linux-extras install -y nginx1
# sudo dnf install -y nginx
# # sudo service nginx start
# sudo systemctl start nginx
# sudo rm /usr/share/nginx/html/index.html
# echo '<html><head><title>Taco Wagon Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
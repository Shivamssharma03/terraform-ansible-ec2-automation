[nginx]
${nginx_ip}

[apache]
${apache_ip}

[all:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=${privatekey}
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

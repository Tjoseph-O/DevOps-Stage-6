
[app_servers]
todo-app ansible_host=${server_ip} ansible_user=${ssh_user} ansible_ssh_private_key_file=${ssh_key_path} ansible_ssh_common_args='-o IdentitiesOnly=yes -o StrictHostKeyChecking=no'

[app_servers:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_become_method=sudo
ansible_become=yes
domain_name=${domain_name}

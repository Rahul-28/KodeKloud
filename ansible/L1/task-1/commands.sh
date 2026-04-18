# 1. Check inventory syntax  
ansible-inventory -i inventory --list

# 2. Check playbook syntax
ansible-playbook playbook.yml -i inventory --syntax-check

# 4. Dry run (what-if)
ansible-playbook playbook.yml -i inventory --check
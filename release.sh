#!/bin/sh

./build.sh

ansible maddy \
    -m ansible.builtin.copy \
    -a 'src=maddy dest=/usr/local/bin/maddy owner=root group=root' \
    --become \
    --become-user root \
    --become-method sudo

for host in lavana kapha rakta
do
    ansible "$host" \
        -m systemd \
        -a 'name=maddy@$host enabled=true state=restarted' \
        --become \
        --become-user root \
        --become-method sudo
done
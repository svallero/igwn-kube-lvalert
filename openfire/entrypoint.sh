#!/bin/sh

# Take some env variable and substitute in the openfire config templates
eval "echo \"$(cat /etc/openfire/openfire.template)\"" > /etc/openfire/openfire.xml

# This is the original container entrypoint
/sbin/my_init

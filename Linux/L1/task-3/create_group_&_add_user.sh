useradd stark && groupadd nautilus_developers -U stark

# proof that group was created and stark was added to it
# getent group nautilus_developers
# output => nautilus_developers:x:1003:stark
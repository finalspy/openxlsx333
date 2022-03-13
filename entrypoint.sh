#!/bin/bash
umask 0002
setfacl -m u::rwx,u:ssh_user:rwx,g::---,g:admin_group:rwx,o::--- /target_folder
setfacl -d -m u::rwx,u:ssh_user:rwx,g::---,g:admin_group:rwx,o::--- /target_folder

touch /target_folder/reference.file
Rscript writexl.R > /dev/null
Rscript openxlsx.R > /dev/null

ls -l /target_folder

FROM r-base:4.1.2

RUN useradd -m my_user && \
    useradd -m ssh_user && \
    groupadd admin_group && \
    mkdir /target_folder && \
#    chgrp nobody /target_folder && \
    chown my_user /target_folder && \
#    echo "deb http://http.us.debian.org/debian/ testing non-free contrib main" >> /etc/apt/sources.list && \
    apt-get update -qq && apt-get install -qqy --no-install-recommends \
        acl \
        libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    setfacl -m u::rwx,u:ssh_user:rwx,g::---,g:admin_group:rwx,o::--- /target_folder && \
    setfacl -d -m u::rwx,u:ssh_user:rwx,g::---,g:admin_group:rwx,o::--- /target_folder && \
    chmod 777 /usr/local/lib/R/site-library && \
    install2.r --error --skipinstalled \
        writexl \
        openxlsx

USER my_user

WORKDIR /home/my_user

ADD entrypoint.sh /entrypoint
ADD writexl.R .
ADD openxlsx.R .

#CMD bash
ENTRYPOINT /entrypoint

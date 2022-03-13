FROM r-base:4.1.2

RUN apt-get update -qq && apt-get install -qqy --no-install-recommends \
        acl \
        libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN chmod 777 /usr/local/lib/R/site-library && \
    install2.r --error --skipinstalled \
        writexl \
        openxlsx

RUN useradd -m my_user && \
    useradd -m ssh_user && \
    groupadd admin_group && \
    mkdir /target_folder && \
    chgrp nogroup /target_folder && \
    chown my_user /target_folder
    
USER my_user

WORKDIR /home/my_user

ADD entrypoint.sh /entrypoint
ADD writexl.R .
ADD openxlsx.R .

#CMD bash
ENTRYPOINT /entrypoint

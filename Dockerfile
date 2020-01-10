FROM rucio/rucio-clients 

# Copy in files to identify and trust host certs/CAs
COPY EGI-trustanchors.repo /etc/yum.repos.d/
COPY voms-escape.cloud.cnaf.infn.it.vomses /etc/vomses/
COPY voms-escape.cloud.cnaf.infn.it.lsc /etc/grid-security/vomsdir/
COPY rucio.cfg.j2 / 

RUN yum clean metadata

# Packages we need to enable ESCAPE VO 
RUN yum -y install ca-certificates vim 
RUN yum -y install ca-policy-egi-core

# Add a non-privileged user
RUN useradd --create-home --skel /dev/null user
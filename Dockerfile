FROM centos

LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.s2i.scripts-url="image:///usr/libexec/s2i"

ENV HOME=/opt/app-root

RUN curl -o epel.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    curl -o remi.rpm  http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    rpm -Uvh remi.rpm epel.rpm && rm remi.rpm epel.rpm

RUN yum install -y --setopt=tsflags=nodocs yum-utils && yum-config-manager --enable remi-php71 && \
    yum install -y --setopt=tsflags=nodocs php php-mongodb git unzip && yum clean all && rm -rf /var/cache/yum

RUN mkdir -p /usr/libexec/s2i

COPY assemble run /usr/libexec/s2i/

RUN chmod 777 /usr/libexec/s2i/{assemble,run}

EXPOSE 8080

RUN mkdir -p ${HOME} && useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin default && chown -R 1001:0 ${HOME}

USER 1001
WORKDIR ${HOME}
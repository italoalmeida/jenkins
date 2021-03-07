FROM jenkins/jenkins:lts

USER root

# Download and install JDK 15
RUN mkdir -p /usr/lib/jvm && \
 wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/15.0.2+7/0d1cfde4252546c6931946de8db48ee2/jdk-15.0.2_linux-x64_bin.tar.gz -P /usr/lib/jvm && \
 tar -xvzf /usr/lib/jvm/jdk-15.0.2_linux-x64_bin.tar.gz -C /usr/lib/jvm && \
 rm -rf /usr/lib/jvm/jdk-15.0.2_linux-x64_bin.tar.gz

# Download and install Docker
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-20.10.5.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download

RUN groupadd -g 999 docker && \
 usermod -aG docker jenkins

USER jenkins

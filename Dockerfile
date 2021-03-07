FROM jenkins/jenkins:lts

USER root

# Download and install JDK 15
RUN mkdir -p /usr/lib/jvm && \
 curl -L https://download.oracle.com/otn-pub/java/jdk/15.0.2+7/0d1cfde4252546c6931946de8db48ee2/jdk-15.0.2_linux-x64_bin.tar.gz | tar -xz -C /usr/lib/jvm

# Download and install Docker
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-20.10.5.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download

RUN groupadd -g 999 docker && \
 usermod -aG docker jenkins

USER jenkins

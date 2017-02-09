FROM jenkins
USER root
RUN apt-get update && \
    apt-get install -y apparmor apt-transport-https p7zip-full ca-certificates rsync yum-utils createrepo build-essential && \
    curl -sSL https://get.docker.com/ > /tmp/docker.sh && \
    bash /tmp/docker.sh && \
    usermod -aG docker jenkins && \
    curl -sL https://deb.nodesource.com/setup_6.x > /tmp/nodejs.sh && \
    bash /tmp/nodejs.sh && \
    apt-get install -y nodejs && \
    npm install bower -g && \
    curl -sSL https://get.rvm.io > /tmp/ruby.sh && \
    usermod -G rvm -a jenkins && \
    bash /tmp/ruby.sh stable --ruby --gems=jekyll && \
    wget -O /tmp/apache-maven-3.3.9-bin.tar.gz http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    cd /opt && \
    tar -xzvf /tmp/apache-maven-3.3.9-bin.tar.gz && \
    echo export PATH=/opt/apache-maven-3.3.9/bin:\$PATH >> /etc/profile.d/maven.sh && \
    apt-get install -y nuget
USER jenkins

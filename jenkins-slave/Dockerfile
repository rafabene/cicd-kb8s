FROM cloudbees/java-build-tools

USER root
RUN apt-get update && \
apt-get -y install apt-transport-https \
    libz-dev \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce
RUN apt-get install -y docker-ce
RUN usermod -a -G docker jenkins

RUN wget https://github.com/oracle/graal/releases/download/vm-1.0.0-rc15/graalvm-ce-1.0.0-rc15-linux-amd64.tar.gz && tar zxvf graalvm-ce-1.0.0-rc15-linux-amd64.tar.gz

ENV GRAALVM_HOME=/graalvm-ce-1.0.0-rc15

RUN export PATH=$GRAALVM_HOME/bin:$PATH

USER jenkins
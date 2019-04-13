FROM jenkins/jenkins:lts
EXPOSE 50000
EXPOSE 8080
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_OPTS=-Dhudson.footerURL=http://rafabene.com
FROM jenkins/jenkins:lts
EXPOSE 50000
EXPOSE 8080
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false -Dhudson.footerURL=http://rafabene.com
# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes

#Pipeline
RUN /usr/local/bin/install-plugins.sh workflow-aggregator

#Github integration
RUN /usr/local/bin/install-plugins.sh github-pullrequest

ADD --chown=jenkins:jenkins config.xml /var/jenkins_home/

ADD --chown=jenkins:jenkins jobs/ /var/jenkins_home/jobs/

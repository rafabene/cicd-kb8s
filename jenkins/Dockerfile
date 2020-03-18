FROM jenkins/jenkins:lts
EXPOSE 50000
EXPOSE 8080
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false -Dhudson.footerURL=http://rafabene.com

# kubernetes - Scaling 
# ssh-slaves - Distributed Builds plugins 
# workflow-aggregator - Pipeline 
# github-pullrequest - Github integration 
RUN /usr/local/bin/install-plugins.sh ssh-slaves github-pullrequest workflow-aggregator kubernetes

ADD --chown=jenkins:jenkins config.xml /var/jenkins_home/

ADD --chown=jenkins:jenkins jobs/ /var/jenkins_home/jobs/

# Jenkins Slave image

This image is based on [cloudbees/java-build-tools](https://hub.docker.com/r/cloudbees/java-build-tools/) image that provides tools like

- Java
- Maven
- Kubernetes CLI
- Ant
- etc

To build our [Quarkus](https://quarkus.io) microservice, we need also 

- [GraalVM](http://graalvm.org)
- Docker

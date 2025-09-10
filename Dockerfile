# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables to skip interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Java, wget, and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget git curl gnupg && \
    apt-get clean

# Create a Jenkins user
RUN useradd -m -d /home/jenkins jenkins

# Set working directory
WORKDIR /opt/jenkins

# Download Jenkins WAR file (latest LTS or specific version)
ENV JENKINS_VERSION 2.426.1

RUN wget https://get.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war

# Expose Jenkins port
EXPOSE 8000

# Set user
USER jenkins

# Set entrypoint to run Jenkins
CMD ["java", "-jar", "/opt/jenkins/jenkins.war"]  how to build image using this detail steps in jenkins

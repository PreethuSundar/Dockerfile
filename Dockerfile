# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install tools
USER root

# Install basic packages (optional)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create a user with sudo privileges (optional)
RUN adduser --disabled-password --gecos "" jenkins_user && \
    echo "jenkins_user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch back to Jenkins user
USER jenkins

# Expose default port
EXPOSE 8080
EXPOSE 50000

# Default command (already defined by base image)
# CMD ["bash", "-c", "/usr/bin/java -jar /usr/share/jenkins/jenkins.war"]

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

# Switch back to Jenkins user
USER jenkins

# Expose default ports
EXPOSE 8080
EXPOSE 50000

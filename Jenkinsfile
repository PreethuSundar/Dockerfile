pipeline {
    agent any

    environment {
        IMAGE_NAME = "custom-jenkins"
        IMAGE_TAG = "2.426.1"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning code... (skipped if building from local workspace)"
                // In a real scenario, Jenkins would clone the repo here
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh """
                        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }

        stage('Verify Image') {
            steps {
                sh "docker images | grep ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "Docker image built successfully!"
        }
        failure {
            echo "Docker image build failed!"
        }
    }
}

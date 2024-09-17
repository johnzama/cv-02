pipeline {
    agent any

    environment {
        // Set the Docker image ID
        DOCKER_IMAGE_ID = '7c06d808540c'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone your GitHub repository
                git 'https://github.com/johnzama/cv-02.git'
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any running container with the same name
                    sh 'docker stop resume-container || true'
                    // Remove any existing container with the same name
                    sh 'docker rm resume-container || true'
                    // Run the Docker container using the image ID on port 84
                    sh "docker run -d --name resume-container -p 84:96 ${DOCKER_IMAGE_ID}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Resume website is successfully deployed on port 84!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}


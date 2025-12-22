pipeline {
    agent any

    stages {

        stage('Check-In') {
            steps {
                echo "Code successfully checked-in from GitHub"
                git 'https://github.com/sumitsonwane31/form---docker.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building Docker Image"
                sh 'docker build -t form-image:1.0 .'
            }
        }

        stage('Test') {
            steps {
                echo "Testing Docker Image"
                sh '''
                docker images | grep form-image
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Docker Container"
                sh '''
                docker rm -f form-container || true
                docker run -d -p 8080:80 --name form-container form-image:1.0
                '''
            }
        }
    }
}

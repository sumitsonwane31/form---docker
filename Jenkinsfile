pipeline {
    agent any

    stages {

        stage('Check-In') {
            steps {
                echo "Code checked-in from GitHub (SCM Checkout successful)"
            }
        }

        stage('Build') {
            steps {
                bat 'docker build -t myimage:latest .'
            }
        }

        stage('Test') {
            steps {
                bat 'docker run -d --name test-container -p 8081:80 myimage:latest'
                powershell 'Start-Sleep -Seconds 5'
                bat 'curl http://localhost:8081'
                bat 'docker stop test-container'
                bat 'docker rm test-container'
            }
        }

        stage('Deploy') {
            steps {
                bat 'kubectl apply -f k8s/deployment.yaml'
                bat 'kubectl apply -f k8s/service.yaml'
                bat 'kubectl rollout status deployment/form-app'
            }
        }
    }
}

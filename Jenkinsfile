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
                bat 'docker build -t myimage .'
            }
        }


        stage('Test') {
    steps {
        bat 'docker run -d --name test-container -p 8081:80 myimage'
        bat 'timeout /t 5'
        bat 'curl http://localhost:8081'
        bat 'docker stop test-container'
        bat 'docker rm test-container'
            }
        }

stage('Deploy') {
    steps {
        // Linux: sh 'docker run -d -p 8080:80 myimage'
        bat 'docker run -d -p 8080:80 myimage'
            }
        }
    }
}    

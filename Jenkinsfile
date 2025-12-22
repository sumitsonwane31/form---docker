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
                echo "Testing Docker Image"
                sh 'docker images | grep form-image'
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker run -d -p 8080:80 myimage'
            }
        }

    }
}

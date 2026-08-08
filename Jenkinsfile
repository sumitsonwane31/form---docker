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
        // Linux: sh 'docker run --rm myimage curl http://localhost'
        bat 'docker run --rm myimage curl http://localhost'
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

pipeline {
    
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'deploy', url: 'https://github.com/turingOps/crud-app/tree/deploy'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm start'
            }
        }
    }
}
pipeline {
    
    agent any
    tools {
        nodejs 'node-24'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'deploy', url: 'https://github.com/turingOps/crud-app.git'
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
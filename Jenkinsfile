pipeline {
    
    agent {
        docker {
            image 'node:18-alpine'
            args '-u root:root'  // allow npm to install globally if needed
        }
    
    }

    stages {
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
pipeline {
    
    agent any
    environment {
        IMAGE_NAME = 'marshkelvin0/crud-app'
        IMAGE_TAG = '${IMAGE_NAME}:${env.GIT_COMMIT}'
    }
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


        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin echo "Logged in to Docker Hub"'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_TAG} .'
                    echo "Built Docker image: ${IMAGE_TAG}"
                    sh 'docker image ls'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push ${IMAGE_TAG}'
                    echo "Pushed Docker image: ${IMAGE_TAG}"
                }
            }
        }
        
        
    }
}
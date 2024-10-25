pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    
                    sh 'docker build -t node-hello-world .'
                    // Check if there are any dangling images
                    def danglingImages = sh(script: 'docker images --filter "dangling=true" -q --no-trunc', returnStdout: true).trim()
                    
                    // If dangling images exist, remove them
                    if (danglingImages) {
                        sh 'docker rmi --force $(docker images --filter "dangling=true" -q --no-trunc)'
                        
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Optionally add tests here
                    sh 'echo "Running tests..."'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Define Docker Hub credentials
                    def dockerHubCredentials = 'dockerhub-credentials' // Use the credentials ID you set

                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
                    }

                    // Tag the image before pushing
                    sh 'docker tag node-hello-world wonbot/node-hello-world:latest' // Tag with your Docker Hub username
                    
                    // Push the image to Docker Hub
                    sh 'docker push wonbot/node-hello-world:latest' // Push to Docker Hub
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'echo "Running Deployment..."'
                    // Run the Docker container
                    // sh 'docker run -d -p 3000:3000 --name hello_nodejs node-hello-world'
                }
            }
        }
    }

    // post {
    //     always {
    //         script {
    //             // Clean up the Docker container after deployment
    //             sh 'docker kill hello_nodejs'
    //             sh 'docker rm hello_nodejs'
    //         }
    //     }
    // }
}

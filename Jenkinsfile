pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Check if there are any dangling images
                    def danglingImages = sh(script: 'docker images --filter "dangling=true" -q --no-trunc', returnStdout: true).trim()
                    
                    // If dangling images exist, remove them
                    if (danglingImages) {
                        sh "docker rmi --force ${danglingImages}"
                    }
                    sh 'docker build -t node-hello-world .'
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

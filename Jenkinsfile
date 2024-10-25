pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Pull the latest code and build Docker image
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

        // stage('Deploy') {
        //     steps {
        //         script {
        //             // Run the Docker container
        //             sh 'docker run -d --name node-hello-world node-hello-world'
        //         }
        //     }
        // }
    }

    // post {
    //     always {
    //         script {
    //             // Clean up the Docker container after deployment
    //             sh 'docker rm -f node-hello-world || true'
    //         }
    //     }
    // }
}

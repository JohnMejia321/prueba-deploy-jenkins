pipeline {
    agent any

    stages {
        stage('Check Pods') {
            steps {
                script {
                    // Utiliza el ID de la credencial para acceder al archivo kubeconfig
                    withCredentials([file(credentialsId: 'mycubeconfig', variable: 'KUBECONFIG')]) {
                        bat "kubectl get pods --kubeconfig=${KUBECONFIG}"
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

pipeline {
    agent any
    
    stages {
       stage('Deploy with Kubernetes') {
            steps {
                // Descargar el archivo deployment.yaml y aplicar en Kubernetes
                /* script {
                    withCredentials([file(credentialsId: 'mycubeconfig', variable: 'KUBECONFIG')]) {
                    bat 'kubectl get pods --kubeconfig=${KUBECONFIG}'
                }  */
                 script {
                    // Utiliza el ID de la credencial para acceder al archivo kubeconfig
                    withCredentials([file(credentialsId: 'mycubeconfig', variable: 'KUBECONFIG')]) {
                        bat "kubectl get pods --kubeconfig=${KUBECONFIG}"
                    }
                
                }
            }
        }
    }
}

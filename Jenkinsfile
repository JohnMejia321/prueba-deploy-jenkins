pipeline {
    agent any

    environment {
        GOOGLE_PROJECT = 'united-impact-419116'
        GOOGLE_ZONE = 'us-central1'
        GOOGLE_CLUSTER_NAME = 'autopilot-cluster-1'
        GOOGLE_USER = 'jmejia@innerconsulting.com'
        GOOGLE_PASSWORD = 'fredy555'
    }

    stages {
        stage('Build') {
            steps {
                // Construir el proyecto y generar el artefacto JAR
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Buscar el Dockerfile y crear la imagen Docker
                bat 'docker build -t my-docker-image-v2:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Iniciar sesión en Docker Hub y enviar la imagen
                bat 'docker login -u johnmejia9887654321 -p fredy555.'
                bat 'docker tag my-docker-image-v2:latest johnmejia9887654321/my-docker-image-v2:latest'
                bat 'docker push johnmejia9887654321/my-docker-image-v2:latest'
            }
        }

        stage('Authenticate with Google Cloud') {
            steps {
                // Iniciar sesión en Google Cloud con usuario y contraseña
                bat "gcloud auth login $GOOGLE_USER --password $GOOGLE_PASSWORD"

                // Configurar la zona y el proyecto de Google Cloud
                bat "gcloud config set project $GOOGLE_PROJECT"
                bat "gcloud config set compute/zone $GOOGLE_ZONE"

                // Obtener las credenciales del clúster de Kubernetes en GKE
                bat "gcloud container clusters get-credentials $GOOGLE_CLUSTER_NAME --zone $GOOGLE_ZONE"
            }
        }

        stage('Deploy with Kubernetes') {
            steps {
                // Descargar el archivo deployment.yaml y aplicar en Kubernetes
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}

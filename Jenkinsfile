pipeline {
    agent any
    environment {
        CONTENEDOR = 'mi-contenedor' // Nombre del contenedor Docker
        IMAGEN = 'mi-imagen'        // Nombre de la imagen Docker
    }
    stages {
        stage('Preparar Entorno Docker') {
            steps {
                script {
                    // Detiene y elimina el contenedor si ya existe
                    sh "docker stop ${env.CONTENEDOR} || true"
                    sh "docker rm ${env.CONTENEDOR} || true"
                }
            }
        }

        stage('Clonar Repositorio') {
            steps {
                script {
                    // Clona el repositorio desde GitHub
                    git 'https://github.com/andressrojasr/todo.git'
                }
            }
        }

        stage('Construir Imagen Docker') {
            steps {
                script {
                    // Construye la imagen Docker usando la variable definida
                    sh "docker build -t ${env.IMAGEN} ."
                }
            }
        }

        stage('Desplegar en Docker') {
            steps {
                script {
                    // Ejecuta el contenedor Docker usando la imagen creada
                    sh "docker run -d -p 8100:80 --name ${env.CONTENEDOR} ${env.IMAGEN}"
                }
            }
        }
    }
}
pipeline {
	agent any
	environment {
		IMAGE = 'nebojsailic2614/nginx'
	}
	stages {
		stage('Test env') {
			steps {
				sh 'docker version'
			}
		}
		stage('Build the custom image') {
			steps {
				script {
					def customImage = docker.build('$IMAGE')
				
					customImage.inside {
						sh 'which nano'
					}
				}
			}
		}
		stage('Push the image') {
			steps {
				script {
					docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
					customImage.push()
					}
				}
			}
		}
	}

}

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

		stage('Start container') {
			steps {
				sh 'docker run -d -p 8082:80 $IMAGE'
			}
		}
	}

}

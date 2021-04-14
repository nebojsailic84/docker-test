pipeline {
	agent any
	environment {
		TAG = 'latest'
	}
	
	stages {
		stage('Test env') {
			steps {
				sh 'docker version'
			}
		}

		stage('Pull the nginx image') {
			steps {
				sh 'docker pull nginx:$TAG'
			}

		}

		stage('Start container') {
			steps {
				sh 'docker run -d -p 8082:80 nginx:$TAG'
			}
		}
	}

}

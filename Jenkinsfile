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
					docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
						customImage.push('custom')
					}
					
				}
			}
		}
		stage('K8s Deployment')  {
			steps {
				input 'Do you  want to proceed?'
				milestone 1
				kubernetesDeploy (
					kubeconfigId: 'kubeconfig',
					dockerCredentials: [[credentialsId: 'docker_hub_login']],
					configs: 'deployment.yaml',
					enableConfigSubstitution: true
				)
			}
		}
	}
}

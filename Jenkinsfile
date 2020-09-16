pipeline {
    agent any
    stages {
        
        stage('Build Started'){
            steps{
                sh "echo Building ${env.JOB_NAME} ${env.BUILD_NUMBER}"
            }
        }
        
        stage('Checking and Installing Hadolint'){
            steps{
                sh '''
                    if ! [ -x "$(command -v hadolint)" ]; then
                        echo 'Installing hadolint' >&2
                        make install
                    fi
                '''
            }
        }
        
        stage('Linting Docker File'){
            steps{
                sh 'make lint'
            }
        }
        
        stage('Building Docker Image ') {
            steps {
                sh 'sudo bash run_docker.sh'
            }
        }
        
        stage('Push Image To Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker tag nisha2305/capstone_microservice nisha2305/capstone_microservice:v1
                        docker push nisha2305/capstone_microservice:v1
					'''
				}
			}
		}
     }           
  /*
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS EKS ....'
                  withAWS(credentials: 'aws_cred', region: 'ap-south-1') {
                      sh "aws eks --region ap-south-1 update-kubeconfig --name capstone"
                      sh "kubectl config use-context arn:aws:eks:ap-south-1:936344068960:cluster/capstone"
                      sh "kubectl apply -f ./clusters/deploy.yaml"
                      
                }
            }
        }
        */
    }
}
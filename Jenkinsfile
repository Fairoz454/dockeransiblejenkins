pipeline {
    
    agent any
    tools {
     maven 'maven3'
    }
    environment {
      DOCKER_TAG = getversion()
    }

    
    stages{
        
        stage('SCM'){
            
            steps{
                
                git credentialsId: 'javahome4', 
                    url: 'https://github.com/Fairoz454/dockeransiblejenkins.git'
            
                    
            }
        }      
        
        
        stage('Maven Build'){
            
            steps{
                
                sh "mvn clean package"
                
                     
            }
        }
        
        stage('docker Build'){
            
            steps{
                
                sh "docker build . -t fairoz/fairozapp:${DOCKER_TAG}"
    
            }
        }
       
        stage('dockerhub push'){            
            steps{
                withCredentials([string(credentialsId: 'Docker-Hub', variable: 'dockerhubpwd')]) { 
                    sh "docker login -u fairoz -p ${dockerhubpwd}"
                              
                  }

                    sh "docker push fairoz/fairozapp:${DOCKER_TAG}"
            }        
        }
        stage('docker deploy')
            steps{
                
                ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, extras: "-e DOCKER_TAG="${DOCKER_TAG}", installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml
            }
        }        
    }
}

def getversion(){
def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
return commitHash
}


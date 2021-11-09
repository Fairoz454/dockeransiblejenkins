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
                
    }
}

def getversion(){
def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
return commitHash
}


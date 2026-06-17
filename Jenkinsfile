pipeline {
    agent any 

    environment {
        // 1. Where your project code lives on your separate Git Server
        GITHUB_REPO       = 'https://github.com/srikanth1830/project.git'
        
        // 2. The exact Name of your SonarQube link inside Jenkins System Settings
        SONAR_SERVER_NAME = 'my-sonar-sytem'
        
        // 3. Your running separate JFrog server web URL (Port 8082 for your version)
        JFROG_URL         = 'http://44.202.62.235:8081/artifactory'
        
        // 4. The exact Repository Key you created inside the JFrog Web UI
        JFROG_REPO        = 'libs-release-local'
        
        // 5. Generates your build file name dynamically (e.g., app-v1.war, app-v2.war)
        WAR_VERSION       = "app-v${BUILD_NUMBER}.war" 
        
        // 🚨 UPDATE THIS with your actual separate Ansible Server Private IP
        ANSIBLE_SERVER_IP = '172.31.31.155' 
    }
 tools {
        maven 'maven3'
    }

    stages {
        stage('Stage 1: Fetch Code from Git Server') {
            steps {
                cleanWs()
                // Pulls code from your separate Git Server into the Jenkins workspace
                git branch: 'dance', url: "${GITHUB_REPO}"
                echo "Code pulled successfully from the dance branch!"
            }
        }

        stage('Stage 2: SonarQube Security Scan') {
            steps {
                echo "Triggering network analysis on separate SonarQube server..."
                // Matches the exact projectKey 'my-jenkins-app' shown on your dashboard image
                withSonarQubeEnv("${SONAR_SERVER_NAME}") {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=my-jenkins-app'
                }
            }
        }

        stage('Stage 3: Package & Upload to JFrog') {
            steps {
                echo "Compiling the application..."
                sh 'mvn clean package -DskipTests'
                
                // Simple admin authentication works perfectly with your 7.38.10 version
                echo "Uploading .war package over the network to separate JFrog server..."
                sh "curl -u admin:password -X PUT ${JFROG_URL}/${JFROG_REPO}/${WAR_VERSION} -T target/*.war"
            }
        }

        stage('Stage 4: Set Up Files on Separate Ansible Machine') {
            steps {
                echo "Sending application deployment files to separate Ansible master..."
                
                // 1. Ensure the directory path exists on your separate Ansible server
                sh "ssh -o StrictHostKeyChecking=no ram@${ANSIBLE_SERVER_IP} 'sudo mkdir -p /opt/docker && sudo chown -R ram:ram /opt/docker && sudo chmod 755 /opt/docker'"
                
                // 2. Tell the Ansible server to download the war directly from the separate JFrog server
                sh "ssh ram@${ANSIBLE_SERVER_IP} 'curl -u admin:password -X GET ${JFROG_URL}/${JFROG_REPO}/${WAR_VERSION} -o /opt/docker/app.war'"
                
                // 3. Copy your Dockerfile and Playbook files from Jenkins over to the separate Ansible machine via native SSH trust
                sh "scp Dockerfile *.yml ram@${ANSIBLE_SERVER_IP}:/opt/docker/"
            }
        }

        stage('Stage 5: Trigger Playbooks on Separate Ansible Machine') {
            steps {
                echo "Telling separate Ansible machine to execute deployments onto Kubernetes..."
                
                // Grabs your secret text from Jenkins vault using the ID and drops it into 'DOCKER_PASS'
                withCredentials([string(credentialsId: 'dockerhub-password-id', variable: 'DOCKER_PASS')]) {
                    sh """
                        ssh ram@${ANSIBLE_SERVER_IP} "
                            cd /opt/docker
                            
                            # Passes the real password text safely over the network to your playbook placeholder
                            ansible-playbook push-image.yml --extra-vars 'DOCKER_HUB_PASSWORD=${DOCKER_PASS}'
                            
                            # Deploys your manifests onto your Kubernetes cluster
                            ansible-playbook k8s-deploy-playbook.yml
                            ansible-playbook k8s-service-playbook.yml
                        "
                    """
                }
            }
        }
    }
}


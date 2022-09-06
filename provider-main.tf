terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    
    }
    jenkins = {
      source = "taiidani/jenkins"
      version = "0.9.2"
    }
    nginx = {
      source = "getstackhead/nginx"
      version = "1.3.2"
    }
  }
}


provider "aws" {
#Config
  
  }

# Configure the Jenkins Provider
provider "jenkins" {
  server_url = "" # Or use JENKINS_URL env var
  username   = "username"            # Or use JENKINS_USERNAME env var
  password   = "password"            # Or use JENKINS_PASSWORD env var
  ca_cert = ""                       # Or use JENKINS_CA_CERT env var
}


# Configure provider
provider "nginx" {
  directory_available = "/etc/nginx/conf.d"  # if not set, defaults to /etc/nginx/sites-available
  enable_symlinks = false # all resources are created in the path defined at directory_available. directory_enabled is ignored.
}

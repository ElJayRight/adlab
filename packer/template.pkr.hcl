packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "domain_controller" {

  ami_name      = "domain_controller"
  instance_type = "t2.micro"
  region        = "ap-southeast-2"
  profile       = "terraform"
  source_ami    = "ami-0bcf9688fa5e01340"
  winrm_username  = "ansible"
  communicator = "winrm"
  user_data_file = "./winrmtime.ps1"
}

build {
  name    = "building domain controller image"
  sources = ["source.amazon-ebs.domain_controller"]
  
  provisioner "ansible" {
    playbook_file = "../ansible/build-dc.yml"
  }
}

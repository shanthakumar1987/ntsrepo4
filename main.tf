provider "aws" {
	 
	  region     = "us-east-1"
	}

variable "private_key_pair" {
  default = "nts15.pem"
}

resource "aws_instance"  "web_server" {
  ami           = "ami-0b72821e2f351e396"  
  instance_type = "t2.micro"
  key_name      = "nts15"  
  tags = {
    "Name": "ec2-shantha"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2"
    ]

    connection {
      #type        = "ssh"
      user        = "ubuntu"  # Replace with appropriate user for your AMI
      private_key = "${file(var.private_key_pair)}"
      host        = "${aws_instance.web_server.public_ip}"
    }
  }
}

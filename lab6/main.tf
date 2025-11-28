terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket  = "mp-tf-backend-state-eu-central-1"
    key     = "aws_simple_lab/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "rand" {
  byte_length = 4
}

# EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0d527b8c289b4af7f"
  instance_type = "t3.micro"   # исправлено!

  tags = {
    Name = "WebServer-${var.env}"
  }
}

# S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "mp-simple-bucket-${var.env}-${random_id.rand.hex}"

  tags = {
    Name = "SimpleBucket-${var.env}"
  }
}

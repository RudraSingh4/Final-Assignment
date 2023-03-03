terraform {
  backend "s3"{
    bucket = "rudra006"
    key = "backend.tfstate"
    region ="ap-south-1"
    
  }
}
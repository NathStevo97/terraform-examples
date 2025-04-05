terraform {
  backend "s3" {
    bucket         = "demoremotebackend"
    key            = "remotedemo.tfstate"
    region         = "eu-west-2"
    access_key     = "<access key>"
    secret_key     = "<secret key>"
    #dynamodb_table = "s3-state-lock"
  }
}
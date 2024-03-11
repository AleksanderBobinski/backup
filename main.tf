terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "daneborg"
    key    = "daneborg.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}


resource "aws_s3_bucket" "borg" {
  bucket        = "daneborg"
  force_destroy = false

  tags = {
    Name = "Borg backup"
  }

  #checkov:skip=CKV_AWS_18
  #checkov:skip=CKV2_AWS_62
  #checkov:skip=CKV_AWS_21
  #checkov:skip=CKV_AWS_144
  #checkov:skip=CKV_AWS_145
}

resource "aws_s3_bucket_lifecycle_configuration" "borg" {
  bucket = aws_s3_bucket.borg.id

  rule {
    id = "deepa"
    filter {}
    abort_incomplete_multipart_upload {
      days_after_initiation = 1
    }

    transition {
      days          = 0
      storage_class = "DEEP_ARCHIVE"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "borg" {
  bucket = aws_s3_bucket.borg.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

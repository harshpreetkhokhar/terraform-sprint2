resource "random_id" "suffix" {
  count  = length(var.s3-var1) 
  byte_length = 4 
}
resource "random_id" "suffix_single" {
  byte_length = 4 
}
#single_S3

 resource "aws_s3_bucket" "bucketsyy" {
  bucket = "hash221-${random_id.suffix_single.hex}"
  tags={
    name="harsh_s3"
    Environment="Dev"
    Project     = "Terraform_sprint2"
  }
 }


#S3 using count
resource "aws_s3_bucket" "newbucket" {
  count = 3
  bucket = "s3-count-bucket-${random_id.suffix_single.hex}-${count.index}"
  tags = {
    Environment = "Dev"
    Project     = "Terraform_sprint2"
    Name        = var.bucket_names[count.index]
  }
}




#S3 using for each
resource "aws_s3_bucket" "newbuckettt" {
  for_each = {
   "harshy-1" = "ap-south-1",
    "shreyya-2" = "ap-south-1",
    "sameeksha-3"= "ap-south-1"  }
     bucket = each.key
      tags = {
    Environment = "Dev"
    Project     ="Terraform_sprint2"
    Name        ="bucket_using_for-each"

  }
}



#s3 using for each with variable
resource "aws_s3_bucket" "var-s3" {
  for_each = var.s3-var
  bucket = each.key
   tags = {
    Environment = "Dev"
    Project     = "Terraform_sprint2"
    Name        = "bucket_using_for-each1"
  }
}



#s3 using count with variable
resource "aws_s3_bucket" "var-s3_1" {
  count = length(var.s3-var1)

  bucket = "${var.s3-var1[count.index]}-${random_id.suffix[count.index].hex}"
  
  tags = {
    Environment = "Dev"
    Project     = "Terraform_sprint2"
    Name        = var.bucket_names[count.index]
  }
}
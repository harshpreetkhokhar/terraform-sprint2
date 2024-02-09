variable "s3-var" {
    type= map(string)
    default = {"harshh":"bucket-1",
    "shreyaa":"bucket-2",
    "sameeksha":"bucket-2"}
}



variable "s3-var1" {
    type= list(string)
    default = ["gaurav","raj","surajjj"]
}

variable "bucket_names" {
  type    = list(string)
}
variable "bucket_names_new" {
  type    = list(string)
      
}
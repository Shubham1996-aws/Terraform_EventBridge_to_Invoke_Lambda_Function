variable "region" {
  default = "ap-southeast-2"
}

variable "profile" {
  default = "shubham"
}

variable "schedule_expression" {
  default = "cron(* * * * ? *)"
}
variable "lambda_function_arn" {
  default = "arn:aws:lambda:ap-southeast-2:383452002839:function:myfunction"
}

variable "function_name" {
  default = "myfunction"
}

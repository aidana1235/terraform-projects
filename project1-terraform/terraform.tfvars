instance_type ="t2.micro"
enviroment = "dev"
region = "us-east-1"
force_destroy = true
buckets = ["qaz", "wsx","edc","rfv"]
#inbound_email = true
#outbound_email = true
username = "nurs"

elb_name = "aidLB"
az = ["us-east-1a", "us-east-1b"]
timeout = "400"
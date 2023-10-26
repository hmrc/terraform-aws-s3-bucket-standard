module github.com/hmrc/terraform-aws-s3-bucket-standard/test

go 1.16 //go.mod file indicates go 1.16, but maximum "supported" version in terratest is 1.14 https://github.com/gruntwork-io/terratest/pull/1036

require (
	github.com/aws/aws-sdk-go-v2 v1.20.3
	github.com/aws/aws-sdk-go-v2/config v1.18.35
	github.com/aws/aws-sdk-go-v2/credentials v1.13.34
	github.com/aws/aws-sdk-go-v2/feature/s3/manager v1.11.79
	github.com/aws/aws-sdk-go-v2/service/s3 v1.38.4
	github.com/aws/aws-sdk-go-v2/service/sts v1.21.4
	github.com/gruntwork-io/terratest v0.38.5
	github.com/stretchr/testify v1.7.0
)

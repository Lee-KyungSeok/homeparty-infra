# Homeparty VPC 세팅

## aws config 세팅
* ~/.aws/credentials

```bash
# dev 환경
[homeparty_dev]
aws_access_key_id = xxxxxxxxx
aws_secret_access_key = xxxxxxx

[homeparty_prod]
aws_access_key_id = xxxxxxxxx
aws_secret_access_key = xxxxxxx
```

## 실행
* 각각의 환경에 맞는 디렉토리 내에서 실행
  * 예) network/dev 에서 실행

```sh
# terraform init
$ terraform init -backend-config=backend.tfvars

# terraform plan
$ terraform plan -out=./tfplan -var-file=variables.tfvars

# terraform apply
$ terraform apply ./tfplan

# terraform destory
$ terraform destroy -var-file=variables.tfvars
```
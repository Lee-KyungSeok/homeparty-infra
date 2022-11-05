# Homeparty Database 세팅

## 사전작업
* network 세팅이 필요합니다.

## aws config 세팅
* 아래는 기본 세팅이며 경우에 띠라서 알아서 profile 을 설정해야 한다.
* ~/.aws/credentials

```bash
##### 예시 ######

# dev 환경
[homeparty_dev]
aws_access_key_id = xxxxxxxxx
aws_secret_access_key = xxxxxxx

# prod 환경
[homeparty_prod]
aws_access_key_id = xxxxxxxxx
aws_secret_access_key = xxxxxxx
```

## 실행
* private.tfvars 를 생성해서 username 과 password 를 입력해주세요
  * 생성 후에 패스워드는 다시 변경하는 것이 보안적으로 안전합니다.
```terraform
rds_username = ""
rds_password = ""
```
* 각각의 환경에 맞는 디렉토리 내에서 실행
  * 예) database/dev 에서 실행

```sh
# terraform init
$ terraform init -backend-config=backend.tfvars

# terraform plan
$ terraform plan -out=./tfplan -var-file=private.tfvars -var="aws_profile=homeparty_dev"

# terraform apply
$ terraform apply ./tfplan

# terraform destory
$ terraform destroy -var-file=parivate.tfvars -var="aws_profile=homeparty_dev"
```
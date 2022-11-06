# Homeparty VPC 세팅

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
* 각각의 환경에 맞는 디렉토리 내에서 실행
  * 예) network/dev 에서 실행

```sh
# terragrunt init
$ terragrunt init

# terragrunt plan
$ terragrunt plan -out=./tfplan -var="aws_profile=homeparty_dev"

# terraform apply
$ terragrunt apply ./tfplan

# terraform destory
$ terragrunt destroy -var="aws_profile=homeparty_dev"
```
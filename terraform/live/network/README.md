# Homeparty VPC 세팅

## aws config 세팅
* 아래는 기본 세팅이며 경우에 띠라서 알아서 profile 을 설정해야 한다.
* 기본 path: (~/.aws/credentials)

```
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
  * 예) main-database/stage 에서 실행

```sh
# terragrunt init
$ terragrunt init

# terragrunt plan
$ terragrunt plan -out=./tfplan

# terragrunt apply
$ terragrunt apply ./tfplan

# terragrunt destroy
$ terragrunt destroy
```

* AWS profile 을 변경한다면 아래 명령어를 이용해주세요

```sh
# terragrunt init
$ AWS_PROFILE=default terragrunt init

# terragrunt plan
$ AWS_PROFILE=default terragrunt plan -out=./tfplan

# terragrunt apply
$ AWS_PROFILE=default terragrunt apply ./tfplan

# terragrunt destory
$ AWS_PROFILE=default terragrunt destroy
```

* 캐시 제거
  * `.terragrunt-cache` 파일이 용량이 크므로 주기적으로 삭제를 권장합니다.
```bash
$ rm -R .terragrunt-cache
```
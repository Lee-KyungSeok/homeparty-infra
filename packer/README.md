# 홈파티 Image Build

## aws config 세팅
* 아래는 기본 세팅이며 경우에 띠라서 알아서 profile 을 설정해야 한다.
* 기본 path: (~/.aws/credentials)
* aws config (~/.aws/config) 도 바꿔준다.

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

```sh
$ packer init .
$ packer build \
  -var "aws_profile=homeparty_dev" \
  .
```
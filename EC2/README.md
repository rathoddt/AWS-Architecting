## EC


### Instance profile
Inline policy - policy attached to one user or group
STS allows you to assume role


```
aws iam create-role --role-name DEV_ROLE --assume-role-policy-document file://trust_policy.json

 aws iam create-policy --policy-name DevS3Access --policy-document file://s3-access-policy.json
# "Arn": "arn:aws:iam::622255088086:policy/DevS3Access",

aws iam attach-role-policy --role-name DEV_ROLE --policy-arn arn:aws:iam::622255088086:policy/DevS3Access

aws iam list-attached-role-policies --role-name DEV_ROLE

aws iam add-role-to-instance-profile --instance-profile-name DEV_PROFILE --role-name DEV_ROLE

aws iam get-instance-profile --instance-profile-name DEV_PROFILE

aws ec2 associate-iam-instance-profile --instance-id i-07e025e8ad198cc2c --iam-instance-profile Name="DEV_PROFILE"

aws ec2 describe-instances --instance-id i-07e025e8ad198cc2c

aws sts get-caller-identity
```


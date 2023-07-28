
```
eksctl utils associate-iam-oidc-provider --cluster eks-demo --approve


eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster eks-demo \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole

eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster eks-demo \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-name AmazonEKS_EBS_CSI_DriverRole-02

eksctl create addon --name aws-ebs-csi-driver --cluster devcluster --service-account-role-arn arn:aws:iam::401231317770:role/AmazonEKS_EBS_CSI_DriverRole --force

eksctl create addon \
     --name aws-ebs-csi-driver \
     --cluster eks-demo \
     --service-account-role-arn \
     arn:aws:iam::213561708854:role/AmazonEKS_EBS_CSI_DriverRole \
     --force
```

https://repost.aws/knowledge-center/eks-persistent-storage
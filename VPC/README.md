# Amazon Virtual Private Cloud

https://cidr.xyz/

## Subnets
https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html

    `10.0.0.0`: Network address.  

    `10.0.0.1` : Reserved by AWS for the VPC router.  

    `10.0.0.2`: Reserved by AWS. The IP address of the DNS server is the base of the VPC network range plus two. For VPCs with multiple CIDR blocks, the IP address of the DNS server is located in the primary CIDR. We also reserve the base of each subnet range plus two for all CIDR blocks in the VPC. For more information, see Amazon DNS server.  

    `10.0.0.3`: Reserved by AWS for future use.  

    `10.0.0.255`: Network broadcast address. AWS do not support broadcast in a VPC, therefore we reserve this address.  

 ## VPC Peering
 - Create VPC peering
 - Accept the peering request
 - Add route table entry in both VPC's RT with CIDR range & target as VPC Perring connection name

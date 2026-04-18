#gives manual for creating  a security group
aws ec2 create-security-group help

#create a security group according to requirements
aws ec2 create-security-group --group-name nautilus-sg --description "Security group for Nautilus App Servers"

#add inbound rules to the created security group (SSH PORT)
aws ec2 authorize-security-group-ingress --group-id sg-0e46de65e90462a8e --protocol tcp --port 22 --cidr 0.0.0.0/0

#add inbound rules to the created security group (HTTP PORT)
aws ec2 authorize-security-group-ingress --group-id sg-0e46de65e90462a8e --protocol tcp --port 80 --cidr 0.0.0.0/0


#check if the rules are applied to the nautilus-sg security group
cmd  => aws ec2 describe-security-groups --group-ids sg-0e46de65e90462a8e

#output
{
    "SecurityGroups": [
        {
            "GroupId": "sg-0e46de65e90462a8e",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ],
            "VpcId": "vpc-0dffcb96fbd99155b",
            "SecurityGroupArn": "arn:aws:ec2:us-east-1:649428214798:security-group/sg-0e46de65e90462a8e",
            "OwnerId": "649428214798",
            "GroupName": "nautilus-sg",
            "Description": "Security group for Nautilus App Servers",
            "IpPermissions": [
                {
                    "IpProtocol": "tcp",
                    "FromPort": 80,
                    "ToPort": 80,
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                },
                {
                    "IpProtocol": "tcp",
                    "FromPort": 22,
                    "ToPort": 22,
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ]
        }
    ]
}
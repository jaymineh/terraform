provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "userA" {
  name = "JMN"
}

resource "aws_iam_policy" "policyA" {
  name = "GlacierPolicy"

  policy = <<EOF
  {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:GetResourcePolicy",
				"ec2:GetDefaultCreditSpecification",
				"ec2:GetIpamResourceCidrs",
				"ec2:GetIpamPoolCidrs",
				"ec2:GetInstanceUefiData",
				"ec2:DeleteTags",
				"ec2:GetEbsEncryptionByDefault",
				"ec2:ExportClientVpnClientConfiguration",
				"ec2:GetCapacityReservationUsage",
				"ec2:GetHostReservationPurchasePreview",
				"ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
				"ec2:GetSubnetCidrReservations",
				"ec2:GetConsoleScreenshot",
				"ec2:GetConsoleOutput",
				"ec2:ExportClientVpnClientCertificateRevocationList",
				"ec2:GetLaunchTemplateData",
				"ec2:GetSerialConsoleAccessStatus",
				"ec2:GetFlowLogsIntegrationTemplate",
				"ec2:GetEbsDefaultKmsKeyId",
				"ec2:GetIpamDiscoveredResourceCidrs",
				"ec2:GetManagedPrefixListEntries",
				"ec2:GetCoipPoolUsage",
				"ec2:CreateTags",
				"ec2:GetNetworkInsightsAccessScopeContent",
				"ec2:GetReservedInstancesExchangeQuote",
				"ec2:GetAssociatedEnclaveCertificateIamRoles",
				"ec2:GetIpamAddressHistory",
				"ec2:GetPasswordData",
				"ec2:GetAssociatedIpv6PoolCidrs",
				"ec2:GetSpotPlacementScores",
				"ec2:GetManagedPrefixListAssociations",
				"ec2:GetAwsNetworkPerformanceData",
				"ec2:GetIpamDiscoveredAccounts"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.userA.name]
  policy_arn = aws_iam_policy.policyA.arn
}

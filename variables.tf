variable "company_name" {
  type        = string
  description = "used in resource naming"
}
variable "environment" {
  type        = string
  description = "used in resource naming and namespacing"
}
variable "region" {
  type        = string
  description = "aws region to deploy into"
}
variable "app_vpc_cidr" {
  type        = string
  description = "desired value for the VPC CIDR if create_vpc is true. If create_vpc is false, then the CIDR of the VPC being used in vpc_id."
}
variable "initial_database" {
  type        = string
  description = "name of initial database in RDS"
}
variable "master_db_username" {
  type        = string
  description = "master db username to use for RDS"
}
variable "master_db_password" {
  type        = string
  description = "password to user for master user in RDS"
}
variable "tags" {
  type        = map(any)
  default     = {}
  description = "optional AWS tags to apply to most resources deployed with this stack"
}
variable "kms_grantees" {
  type        = list(string)
  description = "ARNs of IAM users to allow decrypt and encrypt access to KMS keys"
  default     = []
}
variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "optional snapshot to use to create RDS instance"
}
variable "alarms_email_recipients" {
  type        = list(string)
  default     = []
  description = "list of emails to receive various alarms for this stack"
}
variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "if true, will skip the final snapshot if the RDS instance is deleted"
}
variable "deploy_read_replica" {
  type        = bool
  default     = false
  description = "if true, deploys an optional read replica for the RDS instance"
}
variable "database_security_group_additional_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
  }))
  default     = []
  description = "optional additional security group rules for the database security group."
}
variable "services_to_grant_kms_access_to" {
  type        = list(string)
  default     = []
  description = "list of additional AWS services to permit for encrypting / decrypting the KMS keys in this stack"
}
variable "create_vpc" {
  type        = bool
  default     = true
  description = "if true, will create a new VPC to host resources in this stack. If false, vpc_id, private_subnet_ids and public_subnet_ids are required"
}
variable "vpc_id" {
  type        = string
  description = "only needed if create_vpc is false. VPC to use to host resources in this stack"
  default     = ""
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "only needed if create_vpc is false. Private subnets to use to host some private resources in this stack"
  default     = []
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "only needed if create_vpc is false. Public subnets to use to host some public resources in this stack"
  default     = []
}
variable "database_instance_type" {
  type    = string
  default = "db.t3.xlarge"
}
variable "eks_cluster_name" {
  type        = string
  default     = ""
  description = "Name of EKS cluster to be used to create OIDC providers for IAM roles. Only required if deploy_eks is false"
}
variable "iam_arns_to_grant_sns_kms_access_to" {
  type    = list(string)
  default = []
}
variable "use_only_private_subnets" {
  type        = bool
  default     = false
  description = "If true, will use only private subnets to provision all network-dependant resources"
}

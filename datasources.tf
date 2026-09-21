##################################################################################
# DATA SOURCES
##################################################################################

data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "tfe_outputs" "networking" {
  organization = var.tfe_organization
  workspace    = var.tfe_workspace_name
}
# Secrets and Secure Variables

data "aws_secretsmanager_secret" "secure" {
  secret_id = var.secretsManagerArn
}

locals {
  secrets = jsondecode(data.aws_secretsmanager_secret.secure.secret_string)
}

/* 
Example reference to secrets in a resource:
    password = local.secrets["password"]
*/
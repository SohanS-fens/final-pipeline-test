# Login-profile and create iam user can be called as below as per need
module "aws_create_iam_user" {
  source = "./create_iam_user"
  for_each = var.users
  iam_user_name = each.key
}

# # Module to add iam_login_profile
module "aws_iam_login_profile" {
  source = "./iam_login_profile"
  users = var.users
}

# Module to add iam_role to iam user
module "aws_iam_role" {
  source = "./iam_role"
  depends_on = [ module.aws_create_iam_user ]
}

# Module to add access_key to iam user
module "aws_iam_access_key" {
  source = "./iam_access_key"
  users  = var.users
    depends_on = [ module.aws_create_iam_user ]

}

# Module to attach iam_user_policy
module "aws_iam_user_attach_policy" {
  source   = "./attach_policy"
  for_each = var.users
  users    = each.key
    depends_on = [ module.aws_create_iam_user ]

}

# Module to create a tls certificate
module "aws_iam_user_tls_certificate" {
  source = "./tls_certificate"
    depends_on = [ module.aws_create_iam_user ]

}
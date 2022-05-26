module "skip-default-networking" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/compute.skipDefaultNetworkCreation"
  policy_type     = "boolean"
  enforce         = true
  policy_for      = "organization"
  organization_id = var.org_id
  exclude_folders = var.excluded_folders
}

module "enforce-resource-locations" {
  source            = "terraform-google-modules/org-policy/google"
  version           = "5.1.0"
  constraint        = "constraints/gcp.resourceLocations"
  enforce           = null
  allow             = ["us-locations", "in:eu-locations"]
  allow_list_length = 2
  policy_type       = "list"
  policy_for        = "folder"
  folder_id         = var.folder
  exclude_folders   = var.excluded_folders
}

module "require-shielded-vm" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/compute.requireShieldedVm"
  policy_type     = "boolean"
  enforce         = true
  policy_for      = "folder"
  folder_id       = var.folder
  exclude_folders = var.excluded_folders
}

module "disable-serial-port-access" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/compute.disableSerialPortAccess"
  policy_type     = "boolean"
  enforce         = true
  policy_for      = "folder"
  folder_id       = var.folder
  exclude_folders = var.excluded_folders
}

module "deny-external-public-ip-for-vm" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/compute.vmExternalIpAccess"
  policy_type     = "list"
  enforce         = true
  policy_for      = "organization"
  organization_id = var.org_id
  exclude_folders = var.excluded_folders
}

module "deny-external-public-ip-for-sql" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/sql.restrictPublicIp"
  policy_type     = "boolean"
  enforce         = true
  policy_for      = "organization"
  organization_id = var.org_id
  exclude_folders = var.excluded_folders
}

module "enforce-uniform-bucket-level-access" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "5.1.0"
  constraint      = "constraints/storage.uniformBucketLevelAccess"
  policy_type     = "boolean"
  enforce         = true
  policy_for      = "organization"
  organization_id = var.org_id
  exclude_folders = var.excluded_folders
}
# module "enforce-shared-vpc-hosts" {
#   source            = "terraform-google-modules/org-policy/google"
#   version           = "5.1.0"
#   constraint        = "constraints/compute.restrictSharedVpcHostProjects"
#   enforce           = null
#   allow             = ["projects/shared-vpc-project-id"]
#   allow_list_length = 1
#   policy_type       = "list"
#   policy_for        = "organization"
#   organization_id   = var.org_id
# }

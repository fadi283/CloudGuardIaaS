locals {
  gw_versions = [
    "R80.40-BYOL",
    "R80.40-PAYG-NGTP",
    "R80.40-PAYG-NGTX",
    "R81-BYOL",
    "R81-PAYG-NGTP",
    "R81-PAYG-NGTX"
  ]
  mgmt_versions = [
    "R80.40-BYOL",
    "R80.40-PAYG",
    "R81-BYOL",
    "R81-PAYG"
  ]
  mds_versions = [
    "R80.40-BYOL",
    "R81-BYOL"
  ]
  standalone_versions = [
    "R80.40-PAYG-NGTP",
    "R81-PAYG-NGTP"
  ]
}

locals {
  gw_values = var.chkp_type == "gateway" ? local.gw_versions : []
  mgmt_values = var.chkp_type == "management" ? local.mgmt_versions : []
  mds_values = var.chkp_type == "mds" ? local.mds_versions : []
  standalone_values = var.chkp_type == "standalone" ? local.standalone_versions : []
  allowed_values = coalescelist(local.gw_values, local.mgmt_values, local.standalone_values, local.mds_values)
  is_allowed_type = index(local.allowed_values, var.version_license)
}
provider "vcd" {
  user              = var.VCD_USER
  password          = var.VCD_PASSWORD
  org               = var.VCD_ORG
  url               = var.VCD_URL
  vdc               = var.VCD_VDC
  max_retry_timeout = var.VCD_MAX_RETRY_TIMEOUT
}

resource "vcd_vapp" "vapp" {
  name         	= var.VAPP_NAME
  power_on     	= false
}

resource "vcd_vapp_vm" "vm" {
  vapp_name        = var.VAPP_NAME
  name                   = "vm"
  catalog_name     = var.VCD_CATALOG_NAME
  template_name    = var.VCD_TEMPLATE_VM
  memory                = 2000
  cpus                     = 2
  storage_profile  = var.STORAGE_POLICY_DEFAULT

  override_template_disk {
    bus_type         = "paravirtual"
    size_in_mb       = "22384"
    bus_number       = 0
    unit_number      = 0
    iops             = "3500" 
    storage_profile  = var.STORAGE_POLICY_DEFAULT
  }
}

variable "linux_virtual_machine_name" {
  description = "The main name for the Linux Virtual Machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the VM should exist."
  type        = string
}

variable "location" {
  description = "The Azure location where the Linux Virtual Machine should exist."
  type        = string
}

variable "network_interface_ids" {
  description = "A list of Network Interface IDs to attach to this VM. The first will be primary."
  type        = list(string)
}

variable "admin_public_key" {
  description = "The Public SSH Key (in ssh-rsa or ssh-ed25519 format) for the admin user."
  type        = string
  sensitive   = true
}

variable "linux_virtual_machine_prefix" {
  description = "A prefix to add to the VM name, e.g., 'vm'."
  type        = string
  default     = "vm"
}

variable "size" {
  description = "The SKU (size) of the Virtual Machine."
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "The username of the local administrator."
  type        = string
  default     = "adminuser"
}

variable "os_disk_caching" {
  description = "The Type of Caching for the OS Disk. (e.g., ReadWrite, ReadOnly)."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "The Type of Storage Account for the OS Disk. (e.g., Standard_LRS, Premium_LRS)."
  type        = string
  default     = "Standard_LRS"
}

variable "source_image_publisher" {
  description = "Specifies the publisher of the image used to create the VM."
  type        = string
  default     = "Canonical"
}

variable "source_image_offer" {
  description = "Specifies the offer of the image used to create the VM."
  type        = string
}

variable "source_image_sku" {
  description = "Specifies the SKU of the image used to create the VM."
  type        = string
}

variable "source_image_version" {
  description = "Specifies the version of the image used to create the VM."
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "A map of tags to assign to the Virtual Machine."
  type        = map(string)
  default     = {}
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}

#variable private_key_path {
#  description = "Path to the private key used for ssh access"
#}

variable app_disk_image {
  description = "Disk image"
}

variable zone {
  description = "Region"
  default     = "europe-west2-c"
}

variable app_name {
  description = "App name"
}

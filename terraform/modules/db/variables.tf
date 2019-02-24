variable public_key_path {
  description = "Path to the public key used for ssh access"
}

#variable private_key_path {
#  description = "Path to the private key used for ssh access"
#}

variable zone {
  description = "Region"
  default     = "europe-west2-c"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable db_name {
  description = "DB name"
}

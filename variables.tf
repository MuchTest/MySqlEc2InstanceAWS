variable "private_key_path" {
  # add path to private ssh keys 
  # example: "/root/.ssh/id_rsa"

  default = ""
}

variable "public_key_path" {
  # add path to public ssh keys
  # example: /root/.ssh/id_rsa.pub

  default = ""
}

variable "uregion" {
  default = ""
}

variable "uvpc" {
  default = ""
}

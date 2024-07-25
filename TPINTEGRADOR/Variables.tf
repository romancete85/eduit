variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region to deploy the Droplets"
  type        = string
  default     = "nyc3"
}

variable "image" {
  description = "Image to use for the Droplets"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "droplet_count" {
  description = "Number of Droplets"
  type        = number
  default     = 2
}

variable "ssh_key" {
  description = "SSH public key to access the Droplets"
  type        = string
}

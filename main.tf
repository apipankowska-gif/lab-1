variable "server-name" {
  type        = string
  description = "name of a serwer"
}

output "out" {
  value = var.server-name
}
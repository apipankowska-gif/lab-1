# Write a calculator

# Allowed: +, -, *, /
variable "operand" {
  type = string
  validation {
    condition     = contains (["+", "-", "*", "/"], var.operand)
    error_message = "Niewłaściwy operator"
  }
}

variable "a" {
  type = number
}

variable "b" {
  type = number
}

locals {
  nieZero = var.operand == "/" && var.b == 0
  dodaj = var.a + var.b  
  odejmij = var.a - var.b  
  pomnoz = var.a * var.b  
  podziel = local.nieZero == false ? var.a / var.b : 0
  resultTmp  = var.operand == "+" ? local.dodaj : var.operand == "-" ? local.odejmij : var.operand == "*" ? local.pomnoz : var.operand == "/" ? local.podziel : 0
}

output "result" {
  value = local.resultTmp
}

output "resultVal" {
  value = local.nieZero == true ? "Nie dziel przez ZERO !!!!" : "wynik gotowy !!!"
}
# Write a calculator

variable "a" {
  type = number
    validation {
    condition     = var.a > 0
    error_message = "Zmienna powinna być liczbą"
  }
}

variable "b" {
  type = number
}

# Allowed: +, -, *, /
variable "operand" {
  type = string
  validation {
    condition     = contains (["+", "-", "*", "/"], var.operand)
    error_message = "Niewłaściwy operator"
  }
  
}

locals {
  dodaj = var.a + var.b  
  odejmij = var.a - var.b  
  pomnoz = var.a * var.b  
  podziel = var.a / var.b   
  resultTmp  = var.operand == "+" ? local.dodaj : var.operand == "-" ? local.odejmij : var.operand == "*" ? local.pomnoz : var.operand == "/" ? local.podziel : 0
 }

output "result" {
  value = local.resultTmp
}
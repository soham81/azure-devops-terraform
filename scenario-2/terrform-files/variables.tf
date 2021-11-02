
variable "subscription_id" {
   type = string
}
variable "client_id" {
    type = string
 }
  variable "client_secret" {
    type = string
}
  variable "tenant_id" {
    type = string
}
variable "location_acronym" {
   type = string
}

variable "location" {
  type = string
}

variable "application_acronym" {

  type = string
}

variable "environment_acronym" {
  type = string
}


#Vnet
variable "mainvnetname" {
    type = string
 }

 variable "mainvnetrg"{
    type = string
 }


 variable "vnet_adress_space"{
    type = string
 }

 #Subnet

 variable "subnet1" {
    type = string
 }

 variable "subnet2"{
    type = string
 }

 variable "subnet_address_space1"{
    type = string
 }

  variable "subnet_address_space2"{
    type = string
 }

 #VM
  variable "vmpassword1"{
    type = string
 }

 variable "vmpassword2"{
    type = string
 }

   variable "machine_disk_size"{
   type = string

   }

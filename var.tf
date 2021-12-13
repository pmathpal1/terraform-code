variable rg_name {
    type = string
}

variable publicIPname{
    type = string
}

variable FirewallRG {
    type = string
}

variable Firewall {
    type = string
}


variable location {
    type = string
}

variable vnet {
    type = list(object(
        {
         name = string
         address_space = string
        }
    ))
}

variable subnet {
    type = list(object(
        {
         subnet_name = string
         address_prefix = string
         name = string
        }
    ))
}

variable route_table{
    type = list
}


variable route1 {
    type = list(object(
        {
         routetable = string
         name = string
         address_prefix = string
         next_hop_type = string
         }
       
    ))
}
/*
variable route2 {
    type = list(object(
        {
         #routetable = string
         name = string
         address_prefix = string
         next_hop_type = string
         }
       
    ))
}

variable "images" {
  type    = "map"
  default = {
    "routetable1" = "default"
    "routetable1" = "spoke2tospoke1"
    "routetable2" = "spoke1tospoke2"
    "routetable2" = "default"
  }
}*/
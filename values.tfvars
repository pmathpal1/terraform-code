rg_name     = "hei-gis-infraint-P"
location = "East US"
#routetable= ["subnet1-rt","subnet2-rt"]

vnet = [
    {name = "hei-gis-infraint-P-hub-vnet" ,address_space= "10.0.0.0/16"}, 
    {name = "hei-gis-infraint-P-Spoke1-vnet",address_space= "20.0.0.0/16"}, 
    {name = "hei-gis-infraint-P-Spoke2-vnet",address_space= "30.0.0.0/16"} 
]

subnet = [
{name = "hei-gis-infraint-P-Spoke1-vnet", subnet_name = "hei-gis-infraint-P-Spoke1-subnet",address_prefix= "20.0.0.0/24"},
{name = "hei-gis-infraint-P-Spoke2-vnet", subnet_name = "hei-gis-infraint-P-Spoke2-subnet",address_prefix= "30.0.0.0/24"},
{name = "hei-gis-infraint-P-hub-vnet", subnet_name = "AzureFirewallSubnet" ,address_prefix= "10.0.0.0/24"}
]

FirewallRG = "hei-gis-infraint-P-RG"
publicIPname = "hei-gis-infraint-P-firewall-pubip"
Firewall = "hei-gis-infraint-P-Firewall"


route_table = ["rt-hei-gis-infraint-P-01", "rt-hei-gis-infraint-P-02"]

#routetable1 = [,"routetable2","routetable1","routetable2"]

route1 = [
 {routetable = "rt-hei-gis-infraint-P-01", name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"},
 {routetable = "rt-hei-gis-infraint-P-02",name = "to_20.0.0.0", address_prefix = "30.0.0.0/24", next_hop_type = "VirtualAppliance"}, 
 {routetable = "rt-hei-gis-infraint-P-01",name ="to_30.0.0.0",address_prefix = "20.0.0.0/24", next_hop_type = "VirtualAppliance"},
 {routetable = "rt-hei-gis-infraint-P-02",name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"}
 
]
/*
route2 = [
 {name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"},
 #{name = "spoke1tospoke2", address_prefix = "30.0.0.0/24", next_hop_type = "VirtualAppliance"}   
 {name = "spoke2tospoke1",address_prefix = "20.0.0.0/24", next_hop_type = "VirtualAppliance"}
 
]


*/
#fix winrm max envelope error
Set-WSManInstance -ResourceURI winrm/config -ValueSet @{MaxEnvelopeSizekb = “600”}

#get cluster IP
Get-ClusterResource | Where-Object ResourceType -eq "IP Address" | Get-ClusterParameter

#add DNS entry for cluster
Add-DnsServerResourceRecordA -Name "(cluster name)" -ZoneName "(domain)" -IPv4Address "(cluster IP)"

#spoof device as SATA
#HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\(controller driver name)\Parameters
"BusType"=dword:0000000b (instead of 00000008)
#fix winrm max envelope error
Set-WSManInstance -ResourceURI winrm/config -ValueSet @{MaxEnvelopeSizekb = “600”}

#get cluster IP
Get-ClusterResource | Where-Object ResourceType -eq "IP Address" | Get-ClusterParameter

#add DNS entry for cluster
Add-DnsServerResourceRecordA -Name "(cluster name)" -ZoneName "(domain)" -IPv4Address "(cluster IP)"


$computerName = $args[0]
$disks = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computerName

Write-Host "$($computerName)"
Write-Host "======================================================================="
Write-Host "Disk Info:"
foreach($disk in $disks){
    Write-Host "Drive: $($disk.DeviceID)`tSize: $("{0:N2}" -f ($disk.Size / 1GB))"
}
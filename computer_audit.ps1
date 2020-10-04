# Takes in computer to be audited as an argument for the script 
# c:\projects\computer_audit.ps1 <ComputerName>
$computerName = $args[0]

# Get disk info using wmi object class Win32_LogicalDisk
# Tip: to find classes available do a search as shown here PS C:> Get-WmiObject -List *disk* 
$disks = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computerName

Write-Host "$($computerName)"
Write-Host "======================================================================="
Write-Host "Disk Info:"
foreach($disk in $disks){
    Write-Host "Drive: $($disk.DeviceID)`tSize: $("{0:N2}" -f ($disk.Size / 1GB))"
}
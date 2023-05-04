#create the array to perform work on***************************
function createArray {
$Folder = Read-Host -Prompt 'What folder do you want to use?'
$String = Read-Host -Prompt 'what search string to you want?'
#Start-Sleep -s 1
#$VMGUESTS = (Get-Folder $Folder | Get-VM)
$VMGUESTS = (Get-Folder $Folder | Get-VM | where {$_.name -like "*$String*"})
echo "************ADDING THESE VMS TO THE WORKING LIST***********************"
$VMGUESTS

[Array]$ALLVMGUESTS = [Array]$VMGUESTS + [Array]$ALLVMGUESTS
$ALLVMGUESTS = $ALLVMGUESTS | select -uniq

getChoice

}
#****************************************************************


#gets a valid choice*******************************************
function getChoice {
DO{
$c2=2
$c2 = Read-Host -Prompt 'Would you like to add more VMs? If you enter an invalid response Ill ask again. (Yes=1 No=2)'
$c2
} While (($c2 -lt "1") -or ($c2 -gt "2"))

If ($c2 -eq 2)
{echo "******HERE ARE ALL THE BOXES YOU WILL BE WORKING ON!!!!************"
doWork
}
Else {createArray}
}


#*******************************************************************
#THIS IS THE LOOP TO MANIPULATE VMS******************************
#INSERT YOUR CODE HERE AND USE VMGUEST AS VARIABLE FOR VM********
#*******************************************************************
function doWork{
ForEach ($VMGuest in $ALLVMGUESTS) {
#get the number from the state name string for correct state PW variable assignment
$CurrentState = $VMGuest.name.Substring(1,2)

#***********************************************************
$PW = ""
switch ($CurrentState) {
"01" {$PW = ""; break}
"02" {$PW = ""; break}
"03" {$PW = ""; break}
"04" {$PW = ""; break}
"05" {$PW = ""; break}
"06" {$PW = ""; break}
"07" {$PW = ""; break}
"08" {$PW = ""; break}
"09" {$PW = ""; break}
"10" {$PW = ""; break}
"11" {$PW = ""; break}
"12" {$PW = ""; break}
"13" {$PW = ""; break}
"14" {$PW = ""; break}
"15" {$PW = ""; break}
"16" {$PW = ""; break}
"17" {$PW = ""; break}
"18" {$PW = ""; break}
"19" {$PW = ""; break}
"20" {$PW = ""; break}
"21" {$PW = ""; break}
"22" {$PW = ""; break}
"23" {$PW = ""; break}
"24" {$PW = ""; break}
"31" {$PW = ""; break}
"32" {$PW = ""; break}
"33" {$PW = ""; break}
"34" {$PW = ""; break}
"38" {$PW = ""; break}
"39" {$PW = ""; break}
"40" {$PW = ""; break}
default {$PW = "DO NOT KNOW THIS STATES PW!!!"; break}
}
#***********************************************************

#$envString = 'PATH="/opt/remnux-dshell:/opt/remnux-procdot:/opt/remnux-ratdecoders:/opt/remnux-rabcdasm:/opt/remnux-vivisect:/opt/remnux-peepdf:/opt/remnux-thug/src:/opt/remnux-pdfxray-lite:/opt/remnux-viper:/opt/remnux-oletools:/opt/remnux-balbuzard:/opt/remnux-didier:/opt/remnux-scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"'
#$etcHOSTS = "127.0.0.1	S$CurrentState-Z0-REMNUX"
Echo "Running on State Number:"
$CurrentState
Echo "With the password:"
$PW


#Invoke-VMScript -VM $VMGuest -ScriptText "echo $envString > '/tmp/environment'; echo $PW | sudo -S cp -rf /tmp/environment /etc/environment;" -GuestUser remnux -GuestPassword $PW 
#Invoke-VMScript -VM $VMGuest -ScriptText "echo $etcHosts > '/tmp/hosts'; echo $PW | sudo -S cp -rf /tmp/hosts /etc/hosts; echo $PW | sudo -S reboot" -GuestUser remnux -GuestPassword $PW 
#Copy-VMGuestFile -LocalToGuest -Source "C:\Users\mmuessen\Desktop\RedTemp\auth_key.sh" -VM $VMGuest -Destination "/.ssh/auth_key.sh" -GuestUser admin -GuestPassword pfsense -Force
#Invoke-VMScript -VM $VMGuest -ScriptText 'echo "PermitRootLogin yes" | cat - >> /etc/ssh/sshd_config; reboot' -GuestUser root -GuestPassword $PW 
Echo "`n"
#Get-VM -Name $VMGuest | Get-NetworkAdapter -Name "Network Adapter 1" | Set-NetworkAdapter -NetworkName "CS_S$CurrentState`_Z6" -Confirm:$false -RunAsync
#Get-VM -Name $VMGuest | Get-NetworkAdapter -Name "Network Adapter 2" | Set-NetworkAdapter -NetworkName "CS_RDP_S$CurrentState" -Confirm:$false -RunAsync
#Copy-VMGuestFile -GuesttoLocal -Source /Desktop/ssh/auth_key.ssh -VM oldCS19-OPFOR-02 -Destination C:\Users\mmuessen\Desktop\RedTemp\auth_key.ssh -GuestUser opfor -GuestPassword P1ckl3Ju1c3! -Force

}
#$envString
exit
}
#********************************************************************


#Start Script first checking to make sure modules are imported and connecting to VIServer on first run
if (Get-Module -ListAvailable -Name vmware.vimautomation.core)
{createArray}
else 
{Add-PSSnapin vmware.vimautomation.core
Connect-VIServer 172.20.4.100
createArray}

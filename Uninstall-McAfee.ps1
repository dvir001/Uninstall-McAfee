$source = 'https://github.com/dvir001/Uninstall-McAfee/releases/download/10.3.115.0/MCPR.zip'
$zipDir = 'C:\Windows\Temp'
$unzipDir = 'C:\Windows\Temp'
$zipName = 'MCPR.zip'
$unzipName = 'MCPR'
$exeName = 'Mccleanup.exe'
$argumentList = '-p StopServices, MFSY, PEF, MXD, CSP, Sustainability, MOCP, MFP, APPSTATS, Auth, EMproxy, FWdiver, HW, MAS, MAT, MBK, MCPR, McProxy, McSvcHost, VUL, MHN, MNA, MOBK, MPFP, MPFPCU, MPS, SHRED, MPSCU, MQC, MQCCU, MSAD, MSHR, MSK, MSKCU, MWL, NMC, RedirSvc, VS, REMEDIATION, MSC, YAP, TRUEKEY, LAM, PCB, Symlink, SafeConnect, MGS, WMIRemover, RESIDUE -v -s'

$zipLocation = $zipDir + '\' + $zipName
$unzipLocation = $unzipDir + '\' + $unzipName
$exeLocation = $unzipDir + '\' + $unzipName + '\' + $exeName

if ((Test-Path $zipLocation) -ne "True") { Invoke-WebRequest $source -OutFile $zipLocation } <# Lookup if the zip is there #>
if ((Test-Path $unzipLocation) -ne "True") { Expand-Archive -Path $zipLocation -DestinationPath $unzipLocation } <# Lookup if the folder is there #>
if ((Test-Path $exeLocation) -eq "True") { Start-Process -FilePath $exeLocation -ArgumentList $argumentList } <# Lookup if the exe is there #>

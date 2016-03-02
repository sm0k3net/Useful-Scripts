#Parameters
param(
[String]$type,
[Int32]$count=5
)

#Date
$logsDate = Get-Date -UFormat "%Y%m%d"

#Logs output path
$logsOutput = "C:\Users\yourusername\Desktop\"+$logsDate+"_"+$type+".txt"


#Showing & storing data
if ($type -eq 'list') {
	clear
		echo 'Listing log types:'
		$logs = Get-EventLog -List
		echo $logs
} 
Else {
	Clear-Content $logsOutput
	clear
	echo 'Storing logs into file...'
		$logs = Get-EventLog -log $type -Newest $count
			foreach($logItem in $logs) {
				$logMsg = (($logItem | format-list -property *) | Out-String) -replace "\s+", " "
				echo $logMsg >> $logsOutput
			}
		echo "Done!"
}

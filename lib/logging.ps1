function logging() {

    if ($args -lt 2) {

        $date = (Get-Date -UFormat "%m%d%y @ %R >> ").Replace(":","")
        [string]$string = $date + "Logging function requires at least two arguments: `nFile Name `nString(n)"
        $string | Out-File "C:\users\public\logging.log" -Encoding ascii -Append

    } else {

        [string]$logFile = $args[0] + ".log"
        $logFile = "C:\users\public\$logFile"

        for ($i = 1; $i -lt $args.Length; $i++) {

            $date = (Get-Date -UFormat "%m%d%y @ %R >> ").Replace(":","")
            [string]$string = $date + $args[$i]
            $string | Out-File $logFile -Encoding ascii -Append -Force

        }

    }

}
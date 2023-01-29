Set-Location "\\JVM202\File_200\05\Scripts\jvm205\bin"

. ..\..\lib\logging.ps1
. ..\..\lib\tryCommand.ps1

function checkProcess($name) {

    $checkProcess = Get-Process -Name $name

    return $checkProcess

}

$log = "start_plex"
$plex = "C:\Program Files\Plex\Plex Media Server\Plex Media Server.exe"
$testShare = Test-Path "\\jvm202\Plex\" -ErrorAction SilentlyContinue

if (!($testShare)) {

    logging $log "Plex Share is missing"

    
} else {
    
    if (!($Error)) {
        
        $process = checkProcess "Plex Media Server"

        if ($process) {

                logging $log "Plex Media Server is already running"

            } else {

                logging $log "Starting Plex"
                start $plex
        
                $process = checkProcess "Plex Media Server"

                logging $log "Process started - $($process.ProcessName) : $($process.Id)"

            }

    } else {

        logging $log "startPlex returned $($Error.Count) errors"

        for ($i = 0; $i -lt $Error.Count; $i++) {

            [string]$string = $i - $Error
            logging $log $string

        }

    }

}
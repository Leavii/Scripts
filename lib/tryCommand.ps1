function tryCommand($command) {

    if ($command) {

        Try {

            Invoke-Command -ScriptBlock $command -ErrorAction SilentlyContinue

        } Catch {

        

        }

        if ($Error) {

            return $Error

        } else {

            return "Success"

        }

    }

}
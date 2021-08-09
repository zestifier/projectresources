$host.ui.RawUI.WindowTitle = “ServerCookerTTS MultiThread (Thread)”
function StartProgram {
    $Body = @{
    'avatar_url' = $pfp
    'username' = $name
    'content' = $message
    'tts' = $tts
    }

    Invoke-RestMethod -Uri $webhookUri -Method 'post' -Body $Body
    echo 'Success!'
    StartProgram
}

echo 'Loading information...'
$pfp = type $env:TEMP\spamtemp\pfp.txt
echo 'Loaded PFP link.'
$name = type $env:TEMP\spamtemp\name.txt
echo 'Loaded username.'
$message = type $env:TEMP\spamtemp\message.txt
echo 'Loaded message.'
$tts = type $env:TEMP\spamtemp\tts.txt
echo 'Loaded TTS settings.'
echo 'Starting...'
StartProgram
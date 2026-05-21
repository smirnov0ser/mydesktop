function Start-App {
    param(
        [Parameter(Mandatory=$true)][string]$Path,
        [Parameter(Mandatory=$true)][string]$Name
    )
    if (-not (Test-Path $Path)) {
        Write-Host "  $Name - файл не найден" -ForegroundColor Red
        return
    }
    $procName = [System.IO.Path]::GetFileNameWithoutExtension($Path)
    try {
        if ($p = Get-Process -Name $procName -ErrorAction SilentlyContinue) {
            Write-Host "  $Name уже запущен" -ForegroundColor Yellow
        } else {
            Start-Process -FilePath $Path -NoNewWindow
            Write-Host "  $Name запущен" -ForegroundColor Green
        }
    } catch {
        Write-Host "  $Name ошибка: $_" -ForegroundColor Red
    }
}

Write-Host "Загрузка приложений..." -ForegroundColor Green
Start-App -Path "C:\Program Files\Notepad++\notepad++.exe" -Name "Notepad++"
Start-App -Path "C:\Program Files (x86)\mRemoteNG\mRemoteNG.exe" -Name "mRemoteNG"
Start-App -Path "C:\Program Files\Google\Chrome\Application\chrome.exe" -Name "Chrome"
Start-App -Path "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE" -Name "Outlook"
Start-App -Path "C:\Users\smirn\AppData\Local\Programs\Dion\Dion.exe" -Name "Dion"
Start-App -Path "C:\Users\smirn\AppData\Roaming\Telegram Desktop\Telegram.exe" -Name "Telegram"
Start-App -Path "C:\Users\smirn\AppData\Local\Handy\handy.exe" -Name "Handy"
Start-App -Path "C:\Users\smirn\AppData\Local\Programs\LM Studio\LM Studio.exe" -Name "LMStudio"
Start-App -Path "C:\Users\smirn\AppData\Local\Programs\@opencode-aidesktop\OpenCode.exe" -Name "OpenCode"

Write-Host "Открываю ЛУРВы..." -ForegroundColor Green
Start-Process -FilePath "C:\Users\smirn\OneDrive\ЛУРВы"
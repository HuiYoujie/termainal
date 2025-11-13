# ===========================
# PowerShell 终端增强配置
# ===========================

# oh-my-posh 初始化
oh-my-posh init pwsh | Invoke-Expression
Set-PoshPrompt -Theme paradox

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# fzf
if (Get-Command fzf -ErrorAction SilentlyContinue) {
    Write-Host "fzf 已加载 ✅"
}

# lsd alias
Set-Alias ls lsd
function ll { lsd -l --group-dirs first }

# Linux 风格别名
Set-Alias which Get-Command
Set-Alias cat Get-Content
function touch($file) {
    if (!(Test-Path $file)) { New-Item -ItemType File -Path $file | Out-Null }
    else { (Get-Item $file).LastWriteTime = Get-Date }
}
Set-Alias rm Remove-Item
Set-Alias cp Copy-Item
Set-Alias mv Move-Item
Set-Alias clear Clear-Host
function grep($pattern, $path) {
    Get-Content $path | Select-String $pattern
}
Set-Alias pwd Get-Location

Write-Host "✅ PowerShell 配置加载完成" -ForegroundColor Green

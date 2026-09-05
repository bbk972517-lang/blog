param([Parameter(Mandatory=$true)][ValidatePattern('^[a-z0-9-]+\.netlify\.app$')][string]$NetlifyDomain)
$ErrorActionPreference = 'Stop'
$blogConfigPath = Join-Path $PSScriptRoot 'static\admin\config.yml'
$blogConfig = Get-Content -Raw -LiteralPath $blogConfigPath | ConvertFrom-Json
$blogConfig.backend.site_domain = $NetlifyDomain
$blogConfig | ConvertTo-Json -Depth 60 | Set-Content -LiteralPath $blogConfigPath -Encoding utf8
Write-Host '登录服务域名已更新。请提交文件到 GitHub，然后等待 Pages 发布。此操作不需要任何密钥。'

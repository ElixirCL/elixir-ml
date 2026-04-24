# publish.ps1
# Script de automatización para desplegar Elixir-ML

$ErrorActionPreference = "Stop"

Write-Host "--- Iniciando proceso de publicación ---" -ForegroundColor Cyan

# 1. Preparación inicial: Capturar cambios de contenido
Write-Host "[1/7] Capturando cambios en el código fuente..." -ForegroundColor Yellow
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
git commit -m "site: actualización de contenido y manual [$fecha]"
if ($LASTEXITCODE -ne 0) {
    Write-Host "No hay cambios nuevos en las fuentes." -ForegroundColor Gray
}

# 2. Sincronización
Write-Host "[2/7] Sincronizando con los repositorios remotos (rebase)..." -ForegroundColor Yellow
git pull --rebase fork main
git pull --rebase origin main

# 3. Limpieza
Write-Host "[3/7] Limpiando carpeta docs/..." -ForegroundColor Yellow
if (Test-Path "docs") {
    Remove-Item -Recurse -Force docs
}

# 4. Construcción del sitio
Write-Host "[4/7] Generando sitio con Antora (ahora verá los últimos cambios)..." -ForegroundColor Yellow
npx antora antora-playbook.yml --stacktrace

# 5. Evitar Jekyll en GitHub Pages
Write-Host "[5/7] Configurando .nojekyll..." -ForegroundColor Yellow
New-Item -Path "docs/.nojekyll" -ItemType File -Force | Out-Null

# 6. Consolidar cambios del sitio generado
Write-Host "[6/7] Consolidando archivos generados en el commit..." -ForegroundColor Yellow
git add docs/
git commit --amend --no-edit
if ($LASTEXITCODE -ne 0) {
    Write-Host "No hubo cambios en la carpeta docs." -ForegroundColor Gray
}

# 7. Push
Write-Host "[7/7] Subiendo cambios a GitHub..." -ForegroundColor Yellow
git push fork main
git push origin main

Write-Host "--- Proceso completado con éxito ---" -ForegroundColor Green

# 7. Abrir navegador
Write-Host "Abriendo el sitio en el navegador..." -ForegroundColor Cyan
Start-Process "https://elixircl.github.io/elixir-ml"

$backupPath = "C:\AD_backup"

# Créer le répertoire de sauvegarde s'il n'existe pas
if (-Not (Test-Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath
}

# Lancer ntdsutil et exécuter les commandes nécessaires
Start-Process -FilePath "ntdsutil.exe" -ArgumentList "activate instance ntds", "ifm", "create full $backupPath", "quit", "quit" -NoNewWindow -Wait

Write-Host "Backup completed successfully at $backupPath"
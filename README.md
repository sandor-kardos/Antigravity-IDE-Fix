# Antigravity IDE Fix (AntiGraviFIX)

A lightweight, native workspace utility script designed to resolve a critical application deployment clash on Windows, where the agent-first "Antigravity 2.0" framework overrides the traditional "Antigravity IDE".

## The Problem Context

The Antigravity 2.0 ecosystem forcefully deploys its agent files directly into the local user installation directory, specifically targeting the directory path: 

`%LOCALAPPDATA%\Programs\Antigravity\resources`

It injects two overriding production structures:
- An unpacked asset directory named `app`
- An archive deployment package named `app.asar`

Electron-based runtimes inherently prioritize these exact initialization paths. As a result, when you try to launch your classic coding workspace, the framework intercepts the request and traps you inside an unskippable "Build with Google" AI onboarding wizard. This forcefully overrides established user intent and prevents access to the original workspace.

## How the Utility Works

The `IDEBACK.ps1` script performs a silent, non-destructive conflict resolution:
1. Validates that the Antigravity resources path exists.
2. Checks for the overriding `app` directory and forcefully renames it to `app.bak`.
3. Checks for the overriding `app.asar` deployment package and forcefully renames it to `app.asar.bak`.

By neutralizing these overriding assets, the traditional Antigravity IDE is allowed to boot normally without being intercepted by the Antigravity 2.0 wizard.

## Execution Commands

1. Open PowerShell on your Windows machine.
2. Navigate to the directory containing the script.
3. Execute the script:

```powershell
.\IDEBACK.ps1
```

*Note: You may need to bypass the execution policy if scripts are disabled on your system:*
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\IDEBACK.ps1
```

## Migrating Legacy Themes & Settings

Once the fix is applied and your classic Antigravity IDE is launching correctly, you may want to restore your previous configuration profiles.

1. Navigate to your local Antigravity roaming app data folder: `%APPDATA%\Antigravity`
2. Locate your legacy configuration backups (often in a folder like `Backups` or containing your older `settings.json` and theme folders).
3. Copy your required legacy themes and settings.
4. Paste them into the active `%APPDATA%\Antigravity` directory to overwrite the default/reset configurations.
5. Restart the IDE to apply your restored environment.

---
[LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7463179361693900800)
[Visit Project Origin](https://github.com/sandor-kardos/Antigravity-IDE-Fix) | Developed by [Sandor Kardos](https://sandorkardos.com)

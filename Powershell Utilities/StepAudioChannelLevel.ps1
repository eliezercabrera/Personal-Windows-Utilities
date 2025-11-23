param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Left", "Right")]
    [string]$Channel,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Increase", "Decrease")]
    [string]$LevelChangeType
)

# --- Script starts here ---

Write-Host $Channel
Write-Host $LevelChangeType

Add-Type -TypeDefinition $(Get-Content -Path "C:\Users\Eli\Code\PersonalWindowsUtilities\Powershell Utilities\AudioManager.cs" -Raw)

switch ($LevelChangeType) {
    "Increase" { $StepAmount = 1.0 }
    "Decrease" { $StepAmount = -1.0 }
}

switch ($Channel) {
    "Left" {
        [AudioSettings]::StepChannelVolumeLevel(0, $StepAmount)
    }
    "Right" {
        [AudioSettings]::StepChannelVolumeLevel(1, $StepAmount)
    }
}

Start-Sleep -Second 10
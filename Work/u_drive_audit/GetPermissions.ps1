function GetPermissions {
    param (
        $folder
    )
    (Get-Acl -Path $folder).access | Format-Table IdentityReference    
}

# GetPermissions('C:\Users\patrickoreilly\Desktop\')
GetPermissions('U:\ApplicationMaintenance')
# GetPermissions('U:\')
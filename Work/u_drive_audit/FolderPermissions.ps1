param([string]$path)

function GetPermissions {
    param (
        $path
    )
    $raw_permissions = (Get-Acl -Path $path).access | Format-Table IdentityReference   
    $raw_permissions = ((Out-String -InputObject $raw_permissions) -replace '.*\\', "")
    $raw_permissions = $raw_permissions -split "`r`n"
    $raw_permissions[3..($raw_permissions.Length - 1)]
}

$permitted = GetPermissions($path)


function IsUserOrGroup {
    param (
        $SamName
    )
    $SamName = strip($SamName)
    if ($SamName) {
        (Get-ADObject -Filter "SamAccountName -like '$SamName'").ObjectClass    
    }
}

function strip {
    param (
        $var
    )
    $var = $var -replace " ", ""
    $var = $var -replace "\n", ""
    $var
}

function GetUsersName {
    param (
        $SamName
    )
    Get-ADUser -Filter "SamAccountName -like '$SamName*'" | ForEach-Object { $_.name }   
}

function ADGrpMem {
    param (
        $group
    )
    Get-ADGroupMember -Identity $group | ForEach-Object { $_.name } 
}

for ($i = 0; $i -lt ($permitted.Length - 1); $i++) {
    if (IsUserOrGroup($permitted[$i])) {
        if ((IsUserOrGroup($permitted[$i])) -like 'user') {
            GetUsersName(strip($permitted[$i]))
        }
        else {
            if (((Get-ADGroup -Identity (strip($permitted[$i]))).groupscope) -like 'global') {
                $permitted[$i]
                "_____________"
                ADGrpMem(strip($permitted[$i]))
                "_____________"

            }
        }
    }
}


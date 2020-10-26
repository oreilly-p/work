function GetUsersName {
    param (
        $SamName
    )
    Get-ADUser -Filter "SamAccountName -like '$SamName*'" | Format-Table name   
}

$NameOfUser = GetUsersName('pat')
# GetUsersName('tcu')
# GetUsersName('awa')

$NameOfUser
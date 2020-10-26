function IsUserOrGroup {
    param (
        $SamName
    )
    (Get-ADObject -Filter "SamAccountName -like '*$SamName*'").ObjectClass    
}

IsUserOrGroup('gbl')
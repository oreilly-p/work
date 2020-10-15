function ADGrpMem {
    param (
        $group
    )
    
    Get-ADGroupMember -Identity $group | formattable name

}

ADGrpMem('GBLFinance')
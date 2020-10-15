function ADGrpMem {
    param (
        $group
    )
    
    Get-ADGroupMember -Identity $group | ft name

}

ADGrpMem(<GROUP>)
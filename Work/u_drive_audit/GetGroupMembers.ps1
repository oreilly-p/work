function ADGrpMem {
    param (
        $group
    )
    
    Get-ADGroupMember -Identity $group |Format-Table name

}

# ADGrpMem('GblProductDev')
# ADGrpMem('GblFinance')
# ADGrpMem('GblTelesales')
# ADGrpMem('Domain Admins')
ADGrpMem('administrators')
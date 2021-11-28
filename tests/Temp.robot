*Settings*
Documentation       Temp

Library     Collections

*Test Cases*
Trabalhando com Listas
    @{avengers}     Create List     Tony Stark      Kamalakhan      Steve Rogers

    Append To List  ${avengers}     Bruce Banner
    Append To List  ${avengers}     Scot Lang

    Log To Console      ${avengers}

    FOR     ${a}        IN      @{avengers}
        Log To Console  ${a}
    END

    @{avengers2}        Create List     Tony Stark      Miss Marvel     Steve Rogers    Bruce Banner    Scot Lang

    Lists Should Be equal   ${avengers}     ${avengers2}
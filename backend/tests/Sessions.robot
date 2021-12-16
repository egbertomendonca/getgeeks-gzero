*Settings*
Documentation       Session route test suite

Resource        ${EXECDIR}/resources/Base.robot


*Variables*
&{inv_pass}         email=kate@hotmail.com      password=abc123
&{inv_email}        email=kate.com.br           password=abc123
&{email_404}        email=kate@404.com          password=abc123
&{empty_email}      email=${EMPTY}              password=abc123
&{wo_email}         password=abc123
&{empty_pass}       email=kate@hotmail.com      password=${EMPTY}
&{wo_pass}          email=kate@hotmail.com      

*Test Cases*
User Session

    # Dado que temos um usuário cadastrado

    ${payload}      Factory User Session    signup     
    POST User       ${payload} 
    
    ${payload}      Factory User Session    login
    
    # Quando faço uma requisição POST na rota /sessions
    
    ${response}             POST Session  ${payload}

    # Então o status code deve ser 200

    Status Should Be        200                     ${response}

    # E deve gerar um token JWT
    
    ${size}                 Get Length              ${response.json()}[token]
    ${expected_size}        Convert To Integer      140

    Should Be Equal         ${expected_size}        ${size}

    # E esse token deve expirar em 10 dias

    Should Be Equal         10d                     ${response.json()}[expires_in]


Should Not Get token
    [Template]          Attempt POST Session
    
    ${inv_pass}         401     Unauthorized 
    ${inv_email}        400     Incorrect email
    ${email_404}        401     Unauthorized
    ${empty_email}      400     Required email
    ${wo_email}         400     Required email   
    ${empty_pass}       400     Required pass
    ${wo_pass}          400     Required pass

*Keywords*
Attempt POST Session
    [Arguments]     ${payload}      ${status_code}      ${error_message}

    ${response}     POST Session  ${payload}

    Status Should Be        ${status_code}      ${response}
    Should Be Equal         ${error_message}    ${response.json()}[error]




# Incorrect pass
#     ${payload}              Create Dictionary       email=kate@hotmail.com        password=abc123    

#     ${response}             POST Session  ${payload}

#     Status Should Be        401             ${response}
#     Should Be Equal         Unauthorized    ${response.json()}[error]

# User not found
#     ${payload}              Create Dictionary       email=kate@404.com        password=abc123    

#     ${response}             POST Session  ${payload}

#     Status Should Be        401             ${response}
#     Should Be Equal         Unauthorized    ${response.json()}[error]

# Incorrect email
#     ${payload}              Create Dictionary       email=kate.com.br        password=abc123    

#     ${response}             POST Session  ${payload}

#     Status Should Be        400                 ${response}
#     Should Be Equal         Incorrect email     ${response.json()}[error]

# Empty email
#     ${payload}              Create Dictionary       email=${EMPTY}        password=abc123    

#     ${response}             POST Session  ${payload}

#     Status Should Be        400             ${response}
#     Should Be Equal         Required email  ${response.json()}[error]

# Without email
#     ${payload}              Create Dictionary       password=abc123    

#     ${response}             POST Session  ${payload}

#     Status Should Be        400             ${response}
#     Should Be Equal         Required email  ${response.json()}[error]

# Empty pass
#     ${payload}              Create Dictionary       email=kate@hotmail.com        password=${EMPTY}    

#     ${response}             POST Session  ${payload}

#     Status Should Be        400             ${response}
#     Should Be Equal         Required pass  ${response.json()}[error]

# Without pass
#     ${payload}              Create Dictionary       email=kate@hotmail.com   

#     ${response}             POST Session  ${payload}

#     Status Should Be        400             ${response}
#     Should Be Equal         Required pass  ${response.json()}[error]

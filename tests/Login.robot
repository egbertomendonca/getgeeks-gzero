*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login

    ${user}                     Factory User Login     

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}


Incorrect Pass
    [Tags]      inv_pass

    ${user}     Create Dictionary       email=egbertomendonca@gmail.com     password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

User not found
    [Tags]      user_404

    ${user}     Create Dictionary       email=egberto@gmail.com     password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      inv_email

    ${user}     Create Dictionary       email=egberto.gmail.com     password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]      req_email

    ${user}     Create Dictionary       email=     password=abc123


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório

Required Password
    [Tags]      req_password

    ${user}     Create Dictionary       email=egberto@gmail.com     password=


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be  Senha obrigatória

Required Email and Password
    [Tags]      req_email_password

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page   
    Submit Credentials
    Alert Spans Should Be   ${expected_alerts}

    
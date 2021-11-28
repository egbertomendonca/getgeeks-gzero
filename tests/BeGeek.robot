*Settings*
Documentation       BeGeek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Be a Geek

    # Dado que eu tenho um usuário comum
    ${user}     Factory User        be_geek

    # E faço login na plaaforma getgeeks
    Do Login    ${user}

    # Quando submeto o formulário para me tornar um Geek (prestador de serviços)
    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
 
    # Então devo ver a mensagem de sucesso
    Geek Form Should Be Success

   





*Settings*
Documentation       BeGeek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
Be a Geek
    [Tags]      smoke

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










# Short Description
      

#     ${user}        Factory User        short_desc
#     Do Login            ${user}

#     Go To Geek Form
#     Fill Geek Form      ${user}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be  A descrição deve ter no minimo 80 caracteres


# Long Description
#     [Tags]  long_desc      

#     ${user}        Factory User        long_desc
#     Do Login            ${user}

#     Go To Geek Form
#     Fill Geek Form      ${user}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be  A descrição deve ter no máximo 255 caracteres

# Empty Description
#     [Tags]      empty_desc

#     ${user}        Factory User        empty_desc
#     Do Login            ${user}

#     Go To Geek Form
#     Fill Geek Form      ${user}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be  Informe a descrição do seu trabalho

# Empty Whats
#     [Tags]      empty_whats

#     ${user}        Factory User        empty_whats
#     Do Login            ${user}

#     Go To Geek Form
#     Fill Geek Form      ${user}[geek_profile]
#     Submit Geek Form
#     Alert Span Should Be  O Whatsapp deve ter 11 digitos contando com o DDD

   





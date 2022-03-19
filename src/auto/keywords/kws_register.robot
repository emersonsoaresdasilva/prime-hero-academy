*** Settings ***
Documentation       Aqui estarão presentes todas as keywords dos testes de cadastro
...                 do site automationpractice.com

Resource            ../../config/package.robot

*** Keywords ***
Acessar a página home do site
    Acessar a página home do site Automation Practice

Clicar em "${button}"
    Wait Until Element Is Visible       xpath=//*[contains(text(), '${button}')]
    Click Element                       xpath=//*[contains(text(), '${button}')]
    
Clicar em Create an account
    Wait Until Element Is Visible       id=SubmitCreate
    Click Element                       id=SubmitCreate
    
Informar um e-mail válido
    ${FAKE_EMAIL}                       FakerLibrary.Free Email
    Wait Until Element Is Visible       email_create
    Input Text                          email_create
    ...                                 ${FAKE_EMAIL}
    
Preencher os dados obrigatórios
    ${FAKE_NAME}                        FakerLibrary.First Name
    ${FAKE_LASTNAME}                    FakerLibrary.Last Name
    ${FAKE_PASSWORD}                    FakerLibrary.Password
    ${FAKE_CITY}                        FakerLibrary.City
    ${FAKE_PHONE}                       FakerLibrary.Phone Number

    Wait Until Element Is Visible       ${REGISTER.form_register}
    Click Element                       ${REGISTER.check_mr}
    
    Input Text                          ${REGISTER.first_name}          ${FAKE_NAME}
    Input Text                          ${REGISTER.last_name}           ${FAKE_LASTNAME}
    Input Text                          ${REGISTER.password}            ${FAKE_PASSWORD}
    Select From List By Value           ${REGISTER.select_days}         1
    Select From List By Value           ${REGISTER.select_months}       8
    Select From List By Value           ${REGISTER.select_year}         2001

    Input Text                          ${REGISTER.company}             Prime Control
    Input Text                          ${REGISTER.address1}            Rua das Automações

    Input Text                          ${REGISTER.city}                ${FAKE_CITY}
    Select From List By Value           ${REGISTER.state}               24
    Input Text                          ${REGISTER.postcode}            00000
    Input Text                          ${REGISTER.other}               Robô de teste
    Input Text                          ${REGISTER.mobile}              ${FAKE_PHONE}
    Input Text                          ${REGISTER.alias}               Testando o robô

Submeter cadastro
    Click Element                       ${REGISTER.btn_register}
    
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Page Contains            Welcome to your account. Here you can manage all of your personal information and orders.

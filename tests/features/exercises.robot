*** Settings ***
Documentation               Aqui estarão presentes todos os exercícios da aula de automação.
...                         Então não se sinta perdido pois aqui a gente descreve o que ta fazendo.
...                         Divirta-se!

*** Variables ***
&{PESSOA}                   nome=Emerson
...                         sobrenome=Soares
...                         idade=20
...                         endereco=Rua das Automações
...                         carro=Robô
...                         data_nascimento=01/08/2001

@{FRUTAS}        
...                         manga
...                         morango    
...                         abacaxi
...                         melancia
...                         laranja

*** Keywords ***
Somar dois numeros
    [Arguments]             ${primeiro_numero}
    ...                     ${segundo_numero}
    ${soma}                 Evaluate
    ...                     ${primeiro_numero}+${segundo_numero}
    Log To Console          ${soma}

Somar os numeros "${primeiro_numero}" e "${segundo_numero}"
    ${soma}                 Evaluate
    ...                     ${primeiro_numero}+${segundo_numero}
    Log To Console          ${soma} 

Criar E-mail
    [Arguments]             ${nome}
    ...                     ${sobrenome}
    Log To Console          ${nome}.${sobrenome}@primecontrol.com.br

    ${email}                Convert To String
    ...                     ${nome}.${sobrenome}@primecontrol.com.br
    Log To Console          ${email}

    ${concatenar}           Catenate
    ...                     SEPARATOR=.
    ...                     ${nome}
    ...                     ${sobrenome}
    ...                     @primecontrol.com.br
    Log To Console          ${concatenar}

Contar de 0 a 9
    FOR    ${counter}   IN RANGE    0    9
        Log To Console  ${counter}
    END

Imprimir lista de FRUTAS
    @{FRUTAS}               Create List
    ...                     Banana
    ...                     Maçã
    ...                     Melão
    ...                     Uva
    ...                     Abacaxi
    
    FOR    ${fruta}    IN   @{FRUTAS}
        Log To Console      ${fruta}
    END

Imprimindo a profecia
    @{PAISES}               Create List
    ...                     USA
    ...                     Brasil
    ...                     Argentina
    ...                     Uruguai
    ...                     Peru
    
    FOR    ${país}    IN    @{PAISES}
        Log To Console  Eu profetizo que irei para: ${país}.
    END

Imprimindo em qual numero estou
    FOR    ${counter}   IN RANGE    0    11
        Log To Console    Estou no número: ${counter} 
    END

*** Test Cases ***
Cenario imprimindo de 0 a 10
    [Tags]          ESTOU
    Imprimindo em qual numero estou

Cenario: Profetizando
    [Tags]          PROFECIA
    Imprimindo a profecia

Cenario: Imprimindo lista de FRUTAS
    [Tags]          FRUTAS
    Imprimir lista de FRUTAS

Cenario: Validar contagem de 0 a 9
    [Tags]          CONTADOR
    Contar de 0 a 9

Cenario: Validar criacao de email
    [Tags]          EMAIL
    Criar E-mail    Emerson     Soares

Cenario: Validar soma de dois numeros
    [Tags]          SOMA
    Somar dois numeros  546  789

Cenario: Somar numeros com argumento embutido
    [Tags]          EMBUTIDO
    Somar os numeros "951" e "102"

Imprimindo no console as informações da PESSOA
    [Tags]          PESSOA
    Log To Console  \n${PESSOA.nome}
    Log To Console  ${PESSOA.sobrenome}
    Log To Console  ${PESSOA.idade}
    Log To Console  ${PESSOA.endereco}
    Log To Console  ${PESSOA.carro}
    Log To Console  ${PESSOA.data_nascimento}\n

Cenario: Validar impressão da lista
    [Tags]          LISTA        
    Log To Console  \n${FRUTAS[0]}
    Log To Console  ${FRUTAS[1]}
    Log To Console  ${FRUTAS[2]}
    Log To Console  ${FRUTAS[3]}
    Log To Console  ${FRUTAS[4]}\n

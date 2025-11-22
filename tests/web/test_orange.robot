*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/variables.robot
Resource   ../resources/locators.robot

Suite Setup    Verificar Navegador Aberto

*** Test Cases ***
Validar Cadastro
    Realizar login
    Acessar Admin
    ${usuario_existe}=    Verificar Se Usuario Existe    ${NAMEUSER}
    IF    ${usuario_existe}
        Excluir Usuario
    END
    Cadastrar Usuario

Validar Alteracao
    Sleep   3s
    ${URL_ATUAL}=    Get Location

    IF      '${URL_ATUAL}' == '${URL_LOGIN}'
        Realizar login
        Acessar Admin
    ELSE IF    '${URL_ATUAL}' != '${URL_ADMIN}'
        Acessar Admin
    END
    ${usuario_existe}=    Verificar Se Usuario Existe    ${NAMEUSER}
    IF    ${usuario_existe} == False
        Cadastrar Usuario
        Pesquisar Usuario
        Sleep   2s
        END
    Altualizar Nome Usuario

Excluir Usuario
    Sleep   3s
    ${URL_ATUAL}=    Get Location

    IF      '${URL_ATUAL}' == '${URL_LOGIN}'
        Realizar login
        Acessar Admin
    ELIF    '${URL_ATUAL}' != '${URL_ADMIN}'
        Acessar Admin
    END
    ${usuario_existe}=    Verificar Se Usuario Existe    ${NAMEUSER2}
    IF    ${usuario_existe} == False
        Cadastrar Usuario
        Pesquisar Usuario
        Sleep 2s
    END
    Excluir Usuario
    
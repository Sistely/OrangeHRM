*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource   variables.robot
Resource   locators.robot

*** Keywords ***
Verificar Navegador Aberto
    ${status}=    Run Keyword And Return Status    Get Window Titles
    IF    not ${status}
        Open Browser    ${URL_LOGIN}    ${BROWSER}
        Maximize Browser Window
    END

Realizar login
    Wait Until Page Contains Element    ${LOGIN}    10s
    Input Text      ${USERNAME}     ${USER_LOGIN}
    Input Text      ${PASSWORD}     ${PASS_LOGIN}
    Click Element   ${LOGIN}
    Wait Until Page Contains Element    ${LBLDASHBOARD}    10s
    Location Should Be   ${URL_DASHBOARD}

Acessar Admin
    Click Element   ${ADMIN}
    Location Should Be   ${URL_ADMIN}
    Wait Until Page Contains Element    ${LBLADMIN}     10s

Excluir Usuario
    Sleep   2s
    Click Element   ${BTNEXCLUIR}
    Click Element   ${CONEXCLUIR}
    Wait Until Element Is Visible    ${TOASTSUCCESS}    5s

Verificar Se Usuario Existe
    [Arguments]    ${USER_CURRENT}
    Location Should Be   ${URL_ADMIN}
    Wait Until Page Contains Element    ${LBLADMIN}     10s

    Limpar Input    ${LBLUSERNAME}
    Sleep   4s

    Input Text      ${LBLUSERNAME}    ${USER_CURRENT}
    Click Element   ${SEARCH}
    Sleep   1s

    ${LBLUSERSEARCH}=    Set Variable    xpath=//div[@role="row"]//div[contains(text(),"${USER_CURRENT}")]

    ${existe}=    Run Keyword And Return Status
    ...    Page Should Contain Element    ${LBLUSERSEARCH}

    RETURN    ${existe}

Limpar Input
    [Arguments]    ${LBLUSERNAME}
    
    ${element}=    Get WebElement    ${LBLUSERNAME}

    # Pegar o valor que está dentro do input
    ${texto}=    Get Element Attribute    ${LBLUSERNAME}    value

    ${TAMANHO}=    Evaluate    len("${texto}")

    FOR    ${i}    IN RANGE    ${TAMANHO}
        Press Keys    ${LBLUSERNAME}    BACKSPACE
    END

Pesquisar Usuario
    Wait Until Page Contains Element    ${LBLADMIN}     10s
    Limpar Input    ${LBLUSERNAME}
    Sleep   3s
    Input Text      ${LBLUSERNAME}      ${NAMEUSER}
    Click Element   ${SEARCH}
    Sleep   1s

Salvar Nome Do Usuario Logado
    ${nome}=    Get Text    ${LOGGEDUSER}
    Set Suite Variable    ${EMPLOYEE}    ${nome}
    Log    Nome capturado: ${EMPLOYEE}

Selecionar Employee Name
    [Arguments]    ${EMPLOYEE}
    ${first}=    Evaluate    "${EMPLOYEE}".split()[0]
    ${last}=     Evaluate    "${EMPLOYEE}".split()[-1]
    ${RESULTEMPLOYEE}=    Set Variable    xpath=//div[contains(@class,"oxd-autocomplete-option")][contains(., "${first}")][contains(., "${last}")]
    [Return]    ${RESULTEMPLOYEE}

Cadastrar Usuario
    [Arguments]    ${nome}
    Click Element   ${ADD}
    Wait Until Page Contains Element   ${LBLADDUSER}   10s
    Click Element   ${USERROLE}
    Click Element   ${USERROLEADMIN}
    Click Element   ${STATUS}
    Click Element   ${STATUSENABLE}
    Salvar Nome Do Usuario Logado
    Input Text      ${EMPLOYEENAME}     ${EMPLOYEE}
    Sleep   3s
    ${SELECTEMP}=   Selecionar Employee Name        ${EMPLOYEE}
    Wait Until Element Is Visible    ${SEARCHEEMP}      10s
    Click Element   ${SELECTEMP}
    Input Text      ${LBLUSERNAME}      ${nome}
    Input Text      ${PASSWORDCAD}      ${PASSUSER}
    Input Text      ${CONPASSWORD}      ${PASSUSER}        
    Click Element   ${SAVE}
    Wait Until Element Is Visible    ${TOASTSUCCESS}    5s

Altualizar Nome Usuario
    Click Element   ${BTNUPDATE}
    Sleep       3s
    Wait Until Page Contains Element    ${LBLUSERNAME}    10s
    Sleep       3s
    Limpar Input    ${LBLUSERNAME}
    Sleep       3s
    Input Text      ${LBLUSERNAME}      ${NAMEUSER2}
    Sleep       3s
    Click Element   ${SAVE}
    Sleep       3s
    Wait Until Element Is Visible    ${TOASTSUCCESS}    5s
    Sleep       3s


Fechar Navegador
    Close Browser
    


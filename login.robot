*** Settings ***
Library         SeleniumLibrary
Suite Setup     Open Browser  ${WebSauceDemo}  ${BROWSER}
Suite Teardown  Close Browser

*** Variables ***
${WebSauceDemo}  https://www.saucedemo.com/
${BROWSER}       chrome

# Locator
${usernameField}   //input[@id='user-name']
${passwordField}   //input[@id='password']
${buttonLogin}     //*[@id="login-button"]

*** Keywords ***
Input valid Username
    Wait Until Element Is Visible  ${usernameField}
    Input Text    ${usernameField}    standard_user

Input valid Password
    Input Text    ${passwordField}    secret_sauce

Input invalid Username
    Wait Until Element Is Visible  ${usernameField}
    Input Text    ${usernameField}    invaliduname

Input invalid Password
    Wait Until Element Is Visible  ${passwordField}
    Input Text    ${passwordField}    invalidpass

Click button login
    Click Element    ${buttonLogin}
    Sleep    1s

Verify on Login Page
    Page Should Contain    Products

*** Test Cases ***
User Login with Valid Data
    Input valid Username
    Input valid Password
    Click button login
    Verify on Login Page
    Close Browser

User Login with Invalid Username
    Open Browser  ${WebSauceDemo}  ${BROWSER}
    Input invalid Username
    Input valid Password
    Click button login
    Close Browser

User Login with Invalid Password
    Open Browser  ${WebSauceDemo}  ${BROWSER}
    Input valid Username
    Input invalid Password
    Click button login
    Close Browser

User Login with Empty Data
    Open Browser  ${WebSauceDemo}  ${BROWSER}
    Click button login
    Close Browser
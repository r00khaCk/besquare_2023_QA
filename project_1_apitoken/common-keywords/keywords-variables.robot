*** Settings ***
Documentation       single test to access API Token

Library             SeleniumLibrary


*** Variables ***
${APP_DERIV_URL}        https://app.deriv.com
# credentials
${email_address}        ${EMPTY}
${password}             ${EMPTY}

# HTML elements
${email_field}          txtEmail
${password_field}       txtPass
${log_in_button}        dt_login_button
${account_icon}         //a[@class="trading-hub-header__setting"]
${api_token_tab}        //div[@id="/account/api-token"]


*** Keywords ***
Log in to account
    Open Browser    ${APP_DERIV_URL}    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    ${log_in_button}    10
    Click Element    ${log_in_button}
    Wait Until Page Contains Element    ${email_field}    10
    Input Text    ${email_field}    ${email_address}
    Input Password    ${password_field}    ${password}
    Click Element    //button[@name='login']

Access to API Token Page
    Wait Until Element Is Visible    ${account_icon}    15
    Click Element    ${account_icon}
    Wait Until Element Is Visible    ${api_token_tab}    15
    Click Element    ${api_token_tab}

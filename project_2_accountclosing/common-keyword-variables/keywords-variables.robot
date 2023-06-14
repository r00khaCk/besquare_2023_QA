*** Settings ***
Documentation       Common Keywords and Variables

Library             SeleniumLibrary
Resource            ../credential.robot


*** Variables ***
${APP_DERIV_URL}                https://app.deriv.com
${DERIV_URL}                    https://deriv.com/
${closing_account_url}          https://app.deriv.com/account/closing-account

# HTML elements
${email_field}                  txtEmail
${password_field}               txtPass
${log_in_button}                dt_login_button
${account_icon}                 //a[@class="trading-hub-header__setting"]
${closing_account_tab}          //div[@id="/account/closing-account"]

${deriv_website_login}          //div[@class="flex gap-8x align-items-center justify-center flex-dir-row-reverse md-flex-dir-row"]//button[@id="dm-nav-login-button"]
${account_icon_chartpage}       //*[@data-testid="dt_popover_wrapper"]//a[@class="account-settings-toggle"]
${deriv_app_page_loaded}        //*[@id="deriv_app"]
${traders_hub_button}           //*[@class="trading-hub-header__tradershub"]


*** Keywords ***
Log in to account
    Open Browser    ${DERIV_URL}    chrome
    Set Window Size    1280    1024
    Wait Until Element Is Enabled    ${deriv_website_login}    10
    Click Element    ${deriv_website_login}
    Wait Until Page Contains Element    ${email_field}    10
    Input Text    ${email_field}    ${email_address}
    Input Password    ${password_field}    ${password}
    Click Element    //button[@name='login']

Access to Close your Account Page
    Wait Until Element Is Enabled    ${account_icon_chartpage}    20
    Sleep    5
    Click Element    ${account_icon_chartpage}
    Wait Until Element Is Visible    ${closing_account_tab}    15
    Click Element    ${closing_account_tab}

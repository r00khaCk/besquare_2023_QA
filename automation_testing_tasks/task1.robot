*** Settings ***
Documentation       single test for switch and verify account

Library             SeleniumLibrary
Resource            credential.robot


*** Variables ***
${reset_balance}            //*[text()="Reset Balance"]//parent::button
${trader_hub_title}         //*[@class="main-title-bar__right"]//span[text()="Trader's Hub"]
${account_type_dropdown}    //*[@class="dc-dropdown-container"]
${dropdown_list}            //*[@class="dc-list"]
${demo_account}             //*[@id="demo"]
${verify_demo}              //*[text()="demo"]//parent::div[@class="currency-switcher-container__content--text currency-switcher-container__content--text--none"]


*** Test Cases ***
switchAccount
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${email_address}
    Input Password    txtPass    ${password}
    Click Element    //button[@name='login']
    Wait Until Page Contains Element    ${trader_hub_title}    10
    Click Element    ${account_type_dropdown}
    Wait Until Page Contains Element    ${dropdown_list}
    Sleep    5
    Click Element    ${demo_account}
    Wait Until Page Contains Element    ${verify_demo}
    Sleep    5

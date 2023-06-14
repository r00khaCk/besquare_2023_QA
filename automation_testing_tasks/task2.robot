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
${dTrader}                  //a[@href="/"]//button[@class="dc-btn dc-btn--primary"]
${derivTrader_loaded}       //*[@class="stx-subholder"]
${trade_asset_selector}     //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display"]
${chosen_trade_asset}       //*[text()="Volatility 10 (1s) Index"]//parent::div[@class="sc-mcd__item__name"]
# ${duration}    //*[@id="dropdown-display"]
# ${duration_dropdown}    //*[@class="dc-list dc-list--left"]//parent::div[@class="dc-dropdown__list dc-dropdown__list--left dc-dropdown__list--enter-done dc-dropdown__list--left--enter-done"]
${check_ticks}              //*[text()="5 Ticks"]//parent::div[@class="range-slider__caption"]
${buy_button}               //*[@id="dt_purchase_call_button"]
${open_positions_tab}       //*[@id="dt_positions_drawer"]


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
    Wait Until Page Contains Element    ${trader_hub_title}    15
    Click Element    ${account_type_dropdown}
    Wait Until Element Is Visible    ${dropdown_list}    15
    Click Element    ${demo_account}
    Wait Until Page Contains Element    ${verify_demo}    15
    Wait Until Page Contains Element    ${dTrader}    15
    Click Element    ${dTrader}
    Wait Until Page Contains Element    ${derivTrader_loaded}    15
    Wait Until Page Contains Element    ${trade_asset_selector}    100
    Click Element    ${trade_asset_selector}
    Wait Until Element Is Visible    ${chosen_trade_asset}    15
    Click Element    ${chosen_trade_asset}
    # Sleep    5
    Wait Until Page Contains Element    ${derivTrader_loaded}    15
    # Wait Until Page Contains Element    ${check_ticks}    15
    Wait Until Element Is Visible    ${buy_button}
    Click Element    ${buy_button}
    Wait Until Element Is Visible    ${open_positions_tab}    100
    # Sleep    8

*** Settings ***
Documentation       single test for checking relative barrier error

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
${chosen_trade_asset}       //*[text()="Forex"]
${aud-usd_asset}            //div[text()="AUD/USD"]//parent::span[@class="ic-frx ic-frxAUDUSD"]
${trade_types}              //div[@id="dt_contract_dropdown"]
${higher-lower_contract}    //div[@id="dt_contract_high_low_item"]
${duration}                 //input[@name="duration"]
${barrier}                  //*[@id="dt_barrier_1_input"]
${payout}                   //button[@id="dc_payout_toggle_item"]//parent::div[@class="dc-button-menu__wrapper"]
${payout_amount}            //input[@id="dt_amount_input"]
${buy_button}               //button[@id="dt_purchase_put_button"]
${open_positions_tab}       //*[@id="dt_positions_drawer"]


*** Test Cases ***
Prompting barrire error message
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${email_address}
    Input Password    txtPass    ${password}
    Click Element    //button[@name='login']
    Wait Until Element Is Visible    ${trader_hub_title}    15
    Click Element    ${account_type_dropdown}
    Wait Until Element Is Visible    ${dropdown_list}    15
    Click Element    ${demo_account}
    Wait Until Element Is Visible    ${dTrader}    15
    Click Element    ${dTrader}
    Wait Until Element Is Visible    ${trade_asset_selector}    100
    Click Element    ${trade_asset_selector}
    Wait Until Element Is Visible    ${derivTrader_loaded}    150
    Wait Until Element Is Visible    ${chosen_trade_asset}    20
    Click Element    ${chosen_trade_asset}
    Wait Until Element Is Visible    ${aud-usd_asset}    50
    Click Element    ${aud-usd_asset}
    Wait Until Element Is Visible    ${trade_types}    20
    Click Element    ${trade_types}
    Wait Until Element Is Visible    ${higher-lower_contract}    15
    Click Element    ${higher-lower_contract}
    Wait Until Element Is Visible    ${duration}    15
    Click Element    ${duration}
    Clear Element Text    ${duration}
    Input Text    ${duration}    2
    Wait Until Element Is Visible    ${barrier}    10
    Press Keys    ${barrier}    CTRL+a    DELETE
    Input Text    ${barrier}    -0.1
    ${is_visible}    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Contracts more than 24 hours in duration would need an absolute barrier.
    ...    10
    IF    ${is_visible}    Log To Console    Barrier error message shown

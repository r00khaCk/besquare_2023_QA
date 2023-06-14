*** Settings ***
Documentation       Checking multiplier contract parameter

Library             SeleniumLibrary
Resource            credential.robot


*** Variables ***
${trader_hub_title}         //*[@class="main-title-bar__right"]//span[text()="Trader's Hub"]
${account_type_dropdown}    //*[@class="dc-dropdown-container"]
${dropdown_list}            //*[@class="dc-list"]
${demo_account}             //*[@id="demo"]
${verify_demo}              //*[text()="demo"]//parent::div[@class="currency-switcher-container__content--text currency-switcher-container__content--text--none"]
${dTrader}                  //a[@href="/"]//button[@class="dc-btn dc-btn--primary"]
${derivTrader_loaded}       //*[@class="stx-subholder"]
${trade_asset_selector}     //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display"]
${chosen_trade_asset}       //*[text()="Volatility 50 Index"]//parent::div[@class="sc-mcd__item__name"]
${trade_types}              //div[@id="dt_contract_dropdown"]
${multiplier_contract}      //*[@id="dt_contract_multiplier_item"]
${stake_field}              //*[text()="Stake"]
${stake_amount}             //*[@id="dt_amount_input"]
${multiplier_dropdown}      //*[@class="dc-dropdown__display dc-dropdown__display--no-border"]//*[@name="multiplier"]
${multiplier_20}            //*[@class="dc-list dc-list--left"]//*[@id="20"]
${multiplier_40}            //*[@class="dc-list dc-list--left"]//*[@id="40"]
${multiplier_60}            //*[@class="dc-list dc-list--left"]//*[@id="60"]
${multiplier_100}           //*[@class="dc-list dc-list--left"]//*[@id="100"]
${multiplier_200}           //*[@class="dc-list dc-list--left"]//*[@id="200"]

${cancellation_checkbox}    //*[@class="dc-checkbox"]//*[text()="Deal cancellation"]
${cancellation_dropdown}    //*[@id="dropdown-display"]//*[@name="cancellation_duration"]
${cancellation_5}           //*[@class="dc-list dc-list--left"]//*[@id="5m"]
${cancellation_10}          //*[@class="dc-list dc-list--left"]//*[@id="10m"]
${cancellation_15}          //*[@class="dc-list dc-list--left"]//*[@id="15m"]
${cancellation_30}          //*[@class="dc-list dc-list--left"]//*[@id="30m"]
${cancellation_60}          //*[@class="dc-list dc-list--left"]//*[@id="60m"]


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
    Wait Until Element Is Visible    ${trade_asset_selector}    20
    Click Element    ${trade_asset_selector}
    Wait Until Element Is Visible    ${derivTrader_loaded}    15
    Wait Until Element Is Visible    ${chosen_trade_asset}    20
    Click Element    ${chosen_trade_asset}
    Wait Until Element Is Visible    ${trade_types}    10
    Click Element    ${trade_types}
    Wait Until Element Is Visible    ${multiplier_contract}    10
    Click Element    ${multiplier_contract}
    ${is_visible}    Run Keyword And Return Status
    ...    Wait Until Page Contains Element
    ...    ${stake_field}
    ...    10
    IF    ${is_visible}
        Log To Console    Only Stake field is visible
    ELSE
        Log To Console    Payout is visible
    END
    Press Keys    ${stake_amount}    CTRL+a    DELETE
    Input Text    ${stake_amount}    0

    ${stake_value}    Get Value    ${stake_amount}
    # ${stake_amount_value}    Set Variable    //*[@value="20000"]
    # ${stake_amount_value_as_int}    Convert To Integer    ${stake_amount_value}
    IF    ${stake_value} > 2000
        Log To Console    Stake amount exceeded
        Wait Until Page Contains    Maximum stake allowed is 2000.00.
    ELSE IF    ${stake_value} < 1
        Log To Console    Min stake amount not reached
        Wait Until Page Contains    Please enter a stake amount that's at least 1.00.
    END

    Wait Until Element Is Enabled    ${multiplier_dropdown}    10
    Click Element    ${multiplier_dropdown}
    Wait Until Page Contains Element    ${multiplier_20}    5
    Wait Until Page Contains Element    ${multiplier_40}    5
    Wait Until Page Contains Element    ${multiplier_60}    5
    Wait Until Page Contains Element    ${multiplier_100}    5
    Wait Until Page Contains Element    ${multiplier_200}    5
    Set Selenium Speed    1
    Wait Until Element Is Visible    ${cancellation_checkbox}    10
    Click Element    ${cancellation_checkbox}

    Wait Until Element Is Visible    ${cancellation_dropdown}    10
    Click Element    ${cancellation_dropdown}
    Wait Until Page Contains Element    ${cancellation_5}    9
    Wait Until Page Contains Element    ${cancellation_10}    5
    Wait Until Page Contains Element    ${cancellation_15}    5
    Wait Until Page Contains Element    ${cancellation_30}    5
    Wait Until Page Contains Element    ${cancellation_60}    5

    # ${textPresence}    Run Keyword And Return Status    Wait Until Page Contains Element    x20 x40 x60 x100 x200
    # IF    '${textPresence}
    #    Log To Console    All multipliers are present
    # ELSE
    #    Log To Console    Missing Multipliers
    # END

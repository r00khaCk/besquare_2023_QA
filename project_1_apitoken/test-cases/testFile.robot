*** Settings ***
Documentation       single test to access API Token

Library             SeleniumLibrary
Resource            ../common-keywords/keywords-variables.robot


*** Variables ***
# Access Scopes
${read_checkbox}                    //input[@name="read"]//parent::label[@class="dc-checkbox"]
${payments_checkbox}                //input[@name="payments"]//parent::label[@class="dc-checkbox"]
${admin_checkbox}                   //input[@name="admin"]//parent::label[@class="dc-checkbox"]
${trade_checkbox}                   //input[@name="trade"]//parent::label[@class="dc-checkbox"]
${tradingInformation_checkbox}      //input[@name="trading_information"]//parent::label[@class="dc-checkbox"]

# Token name and create token
${token_name}                       //input[@name="token_name"]
${create_button}                    //*[text()="Create"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${create_button_disabled}           //button[@disabled]

# test token
${admin_token}                      //*[text()="testAdminToken"]
${admin_table_row}                  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]

${trade_token}                      //*[text()="testTradeToken"]
${trade_table_row}                  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[8]

${adminTradeTradeInfo_token}        //*[text()="testTradeToken"]

# Icons on token
${delete_icon}                      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/div
${delete_message_box}               //*[@id="modal_root"]/div/div
${delete_confirmation_button}       //*[@id="modal_root"]/div/div/div[2]/button[2]

${show_icon}                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[8]/td[2]/div/div[3]/div/div

${copy_icon}                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[2]/div/div[2]/div/div
${copy_message_box}                 //*[@id="modal_root"]
${copy_confirmation_button}         //*[@id="modal_root"]/div/div/div[2]/button


*** Test Cases ***
# TEST CASE 2: users clicks on account icon and navigates to API Token tab
TestCase 2.1: SelectReadAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testReadToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

Test Case 2.2: SelectPaymentsAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${payments_checkbox}    15
    Click Element    ${payments_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testPaymentsToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

Test Case 2.3: SelectAdminAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${admin_checkbox}    15
    Click Element    ${admin_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testAdminToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

Test Case 2.4: SelectTradeAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${trade_checkbox}    15
    Click Element    ${trade_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testTradeToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

Test Case 2.5: SelectTradingInformationAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${tradingInformation_checkbox}    15
    Click Element    ${tradingInformation_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    test3
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

# TEST CASE 3: users selects more than 1 scope of access

TestCase 3.1: SelectReadPaymentsAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Click Element    ${payments_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testReadPaymentsToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

TestCase 3.2: SelectAdminTradeTradingInformationAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${admin_checkbox}    15
    Click Element    ${admin_checkbox}
    Click Element    ${trade_checkbox}
    Click Element    ${tradingInformation_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testAdminTradeTradeInfoToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

TestCase 3.3: SelectReadPaymentsAdminTradeAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Click Element    ${payments_checkbox}
    Click Element    ${admin_checkbox}
    Click Element    ${trade_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testReadPaymentsAdminTradeToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

TestCase 3.4: SelectAllAccess
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Click Element    ${payments_checkbox}
    Click Element    ${admin_checkbox}
    Click Element    ${trade_checkbox}
    Click Element    ${tradingInformation_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testAllToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

# TEST CASE 4: users enters duplicate token name

TestCase 4.1: Set Read token name to testReadToken (already exist)
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    testReadToken
    Wait Until Element Is Enabled    ${create_button}    10
    Click Element    ${create_button}
    Close Browser

# TEST CASE 5: users enter token name with special characters, numbers, letters or mixture

TestCase 5.1: Set Read token name to token$#
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    token$#
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Close Browser

TestCase 5.2: Set Read token name to 4523452345
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    4523452345
    Wait Until Element Is Enabled    ${create_button}    15
    Click Element    ${create_button}
    Close Browser

TestCase 5.3: Set Read token name to sfsadf234567
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    sfsadf234567
    Wait Until Element Is Enabled    ${create_button}    15
    Click Element    ${create_button}
    Close Browser

TestCase 5.4: Set Read token name to %$#234
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    %$#234
    Wait Until Element Is Visible    ${create_button_disabled}    15
    Close Browser

# TEST CASE 6: User enters more than 32 characters for token name

TestCase 6.1: Set Read token name to qwertyuioplkjhgfdsazxcvbnmkuytresdcvjuytre
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Click Element    ${read_checkbox}
    Wait Until Element Is Visible    ${token_name}    15
    Input Text    ${token_name}    qwertyuioplkjhgfdsazxcvbnmkuytresdcvjuytre
    Wait Until Element Is Visible    ${create_button_disabled}    15
    Close Browser

# TEST CASE 9: User clicks on "Delete this Token" icon

TestCase 6.1: Scroll to token testAdminToken and click on "Delete this token" icon
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Scroll Element Into View    ${admin_token}
    Click Element    ${delete_icon}
    Wait Until Element Is Visible    ${delete_message_box}    15
    Wait Until Element Is Enabled    ${delete_confirmation_button}    10
    Click Element    ${delete_confirmation_button}
    Close Browser

TestCase 6.2: Scroll to token testTradeToken and click on "Show this token" icon
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Scroll Element Into View    ${trade_token}
    Click Element    ${show_icon}
    Wait Until Element Contains    //p[text()="6vyRhYTRRRCrKXd"]    6vyRhYTRRRCrKXd
    Close Browser

TestCase 6.3: Scroll to token testAdminTradeTradeInfoToken and click on "Copy this token" icon
    Log in to account
    Access to API Token Page
    Wait Until Element Is Visible    ${read_checkbox}    15
    Scroll Element Into View    ${adminTradeTradeInfo_token}
    Click Element    ${copy_icon}
    Wait Until Element Is Visible    ${copy_message_box}    15
    Wait Until Element Is Enabled    ${copy_confirmation_button}    10
    Click Element    ${copy_confirmation_button}
    Close Browser

*** Settings ***
Documentation       single test to close accounts

Library             SeleniumLibrary
Resource            ../common-keyword-variables/keywords-variables.robot


*** Variables ***
# HTML page elements
${closing_account_page}             //div[@class="closing-account"]
${closing_account_reasons_page}     //*[text()="Please tell us why you’re leaving. (Select up to 3 reasons.)"]

${closed_account_prompt}            //p[text()="We’re sorry to see you leave. Your account is now closed."]

${reactivate_page}                  //div[@id="container"]//h2[text()="Want to start trading on Deriv again?"]
${reactivate_account_button}        //button[@id="btnGrant"]

# Interactable Elements
${securityPolicy_hyperlink}         //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
${close_my_account_button}          //*[text()="Close my account"]//parent::button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

${first_checkbox}                   //input[@name="financial-priorities"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]
${first_checkbox_clicked}           //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]
${second_checkbox}                  //input[@name="stop-trading"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]
${second_checkbox_clicked}          //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]
${third_checkbox}                   //input[@name="not-interested"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]
${third_checkbox_clicked}           //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox closing-account-reasons__checkbox"]

${other_platforms_textBox}          //textarea[@name="other_trading_platforms"]
${to_improve_textBox}               //textarea[@name="do_to_improve"]
${continue_button}                  //div[@class="dc-form-submit-button dc-form-submit-button--relative"]//button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${disabled_continue_button}         //*[text()="Continue"]//parent::button[@disabled]
${back_button}                      //*[text()="Back"]//parent::*[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]

${closing_account_message_box}      //div[@id="modal_root"]
${go_back_button}                   //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]//span[text()="Go Back"]
${close_account_button}             //div[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]//button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]


*** Test Cases ***
Test Case 2.1: User clicks on "Account" icon and then clicks on "Close your account" tab
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}
    Close Browser

Test Case 3.1: User clicks on "Security and privacy policy" hyperlink
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Enabled    ${securityPolicy_hyperlink}
    Click Element    ${securityPolicy_hyperlink}
    Switch Window    url=https://deriv.com/tnc/security-and-privacy.pdf
    Location Should Be    https://deriv.com/tnc/security-and-privacy.pdf
    Close Browser

Test Case 4.1: User selects 1 reason and closes the account
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}    10
    Reload Page
    Wait Until Element Is Enabled    ${close_my_account_button}    10
    Click Button    ${close_my_account_button}
    Wait Until Element Is Visible    ${closing_account_reasons_page}    10
    Wait Until Page Contains Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox}    10
    Click Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox_clicked}    10
    Click Element    ${other_platforms_textBox}
    Input Text    ${other_platforms_textBox}    Binance
    Click Element    ${to_improve_textBox}
    Input Text    ${to_improve_textBox}    Test reason
    Wait Until Page Contains    Binance    10
    Wait Until Page Contains    Test reason    10
    Wait Until Element Is Visible    ${continue_button}    10
    Click Element    ${continue_button}
    Sleep    5
    Wait Until Element Is Visible    ${closing_account_message_box}    10
    Wait Until Element Is Visible    ${close_account_button}    10
    Click Element    ${close_account_button}
    Wait Until Element Is Visible    ${closed_account_prompt}    20
    Wait Until Page Contains    Create free demo account    30
    Location Should Be    ${DERIV_URL}
    Close Browser

Test Case 4.2: User selects 2 reason and closes the account
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}    10
    Reload Page
    Wait Until Element Is Enabled    ${close_my_account_button}    10
    Click Button    ${close_my_account_button}
    Wait Until Element Is Visible    ${closing_account_reasons_page}    10
    Wait Until Page Contains Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox}    10
    Click Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox_clicked}    10
    Wait Until Page Contains Element    ${second_checkbox}    10
    Wait Until Element Is Visible    ${second_checkbox}    10
    Click Element    ${second_checkbox}
    Wait Until Element Is Visible    ${second_checkbox_clicked}    10
    Click Element    ${other_platforms_textBox}
    Input Text    ${other_platforms_textBox}    Binance
    Click Element    ${to_improve_textBox}
    Input Text    ${to_improve_textBox}    Test reason
    Wait Until Page Contains    Binance    10
    Wait Until Page Contains    Test reason    10
    Wait Until Element Is Visible    ${continue_button}    10
    Click Element    ${continue_button}
    Sleep    5
    Wait Until Element Is Visible    ${closing_account_message_box}    10
    Wait Until Element Is Visible    ${close_account_button}    10
    Click Element    ${close_account_button}
    Wait Until Element Is Visible    ${closed_account_prompt}    20
    Wait Until Page Contains    Create free demo account    30
    Location Should Be    ${DERIV_URL}
    Close Browser

Test Case 4.3: User selects 3 reason and closes the account
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}    10
    Reload Page
    Wait Until Element Is Enabled    ${close_my_account_button}    10
    Click Button    ${close_my_account_button}
    Wait Until Element Is Visible    ${closing_account_reasons_page}    10
    Wait Until Page Contains Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox}    10
    Click Element    ${first_checkbox}
    Wait Until Element Is Visible    ${first_checkbox_clicked}    10
    Wait Until Page Contains Element    ${second_checkbox}    10
    Wait Until Element Is Visible    ${second_checkbox}    10
    Click Element    ${second_checkbox}
    Wait Until Element Is Visible    ${second_checkbox_clicked}    10
    Wait Until Page Contains Element    ${third_checkbox}    10
    Wait Until Element Is Visible    ${third_checkbox}    10
    Click Element    ${third_checkbox}
    Wait Until Element Is Visible    ${third_checkbox_clicked}    10
    Click Element    ${other_platforms_textBox}
    Input Text    ${other_platforms_textBox}    Binance
    Click Element    ${to_improve_textBox}
    Input Text    ${to_improve_textBox}    Test reason
    Wait Until Page Contains    Binance    10
    Wait Until Page Contains    Test reason    10
    Wait Until Element Is Visible    ${continue_button}    10
    Click Element    ${continue_button}
    Sleep    5
    Wait Until Element Is Visible    ${closing_account_message_box}    10
    Wait Until Element Is Visible    ${close_account_button}    10
    Click Element    ${close_account_button}
    Wait Until Element Is Visible    ${closed_account_prompt}    20
    Wait Until Page Contains    Create free demo account    30
    Location Should Be    ${DERIV_URL}
    Close Browser

Test Case 4.4: User selects no reason and closes the account
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}    10
    Reload Page
    Wait Until Element Is Enabled    ${close_my_account_button}    10
    Click Button    ${close_my_account_button}
    Wait Until Element Is Visible    ${closing_account_reasons_page}    10
    Click Element    ${other_platforms_textBox}
    Input Text    ${other_platforms_textBox}    Binance
    Click Element    ${to_improve_textBox}
    Input Text    ${to_improve_textBox}    Test reason
    Wait Until Page Contains    Binance    10
    Wait Until Page Contains    Test reason    10
    Wait Until Element Is Visible    ${disabled_continue_button}    10
    ${is_visible}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${disabled_continue_button}
    ...    10
    IF    ${is_visible}
        Log To Console    Continue button disabled. No reason selected
    END
    Close Browser

Test Case 5: User clicks on the "Back" button at the "Closing Account Reasons" page
    Log in to account
    Access to Close your Account Page
    Wait Until Element Is Visible    ${closing_account_page}    10
    Reload Page
    Wait Until Element Is Enabled    ${close_my_account_button}    10
    Click Button    ${close_my_account_button}
    Wait Until Element Is Visible    ${closing_account_reasons_page}    10
    Wait Until Element Is Enabled    ${back_button}    10
    Click Element    ${back_button}
    Wait Until Page Contains    If you close your account    10
    Close Browser

Test Case 6: Users attempts to log in using an email that belongs to a closed account
    Log in to account
    Wait Until Element Is Visible    ${reactivate_page}    10
    ${is_visible}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${reactivate_page}
    ...    10
    IF    ${is_visible}    Log To Console    Reactivate Page displayed
    Close Browser

Test Case 7: User reactivates account by clicking on "Start Trading" button in Reactivate Page
    Log in to account
    Wait Until Element Is Visible    ${reactivate_page}    10
    Wait Until Element Is Enabled    ${reactivate_account_button}    10
    Click Element    ${reactivate_account_button}
    Wait Until Element Is Visible    ${deriv_app_page_loaded}    10
    ${is_visible}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${deriv_app_page_loaded}
    ...    10
    IF    ${is_visible}    Log To Console    Deriv App Page displayed
    Close Browser

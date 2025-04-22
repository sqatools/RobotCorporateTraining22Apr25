*** Settings ***
Library    SeleniumLibrary

Suite Setup        Open Browser     ${facebook_url}     ${browser}
Suite Teardown     Close Browser


*** Variables ***
${facebook_url}          https://www.facebook.com
${browser}               chrome
${facebook_username}     user1@gmail.com
${facebook_password}     admin@1234


${fb_first_name}       John
${fb_last_name}        Dew
${fb_date}             22
${fb_mobile}           6556466456456
${fb_new_password}     user@12345


*** Test Cases ***
Verify Facebook Login
    [Documentation]  This test will verify facebook login functionality
    [Tags]    smoke
    #Open Browser     https://www.facebook.com    chrome
    Input Text    email    user1@gmail.com
    Input Text    pass     admin@1234
    Click Element    login123
    Sleep    5s

Verify Facebook Login with read variables
    [Tags]    sanity
    [Documentation]  This test will verify facebook login functionality
    #Open Browser     ${facebook_url}     ${browser}
    Input Text    email    ${facebook_username}
    Input Text    pass     ${facebook_password}
    Click Element    login
    Sleep    5s


Create New Facebook Account
   [Tags]    singup
   [Documentation]   Test case to create facebook account
   Create Facebook Account     ${fb_first_name}    ${fblast_name}    ${fb_date}    ${fb_mobile}    ${fb_new_password}


*** Keywords ***

Create Facebook Account
   [Documentation]   Keyword to create facebook account
   [Arguments]    ${first_name}    ${last_name}    ${date}    ${mobile}    ${new_password}
   Click Element    xpath=//a[@data-testid="open-registration-form-button"]
   Input Text    firstname     ${first_name}
   Input Text    lastname      ${last_name}
   Select From List By Label    birthday_day     ${date}
   Input Text    reg_email__     ${mobile}
   Input Text    password_step_input      ${new_password}




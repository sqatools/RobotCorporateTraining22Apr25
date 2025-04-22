*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Resource   keyword_resource_file.robot
Resource   variables_file.robot


Suite Setup        Open Browser     ${goibibo_url}     ${browser}
Suite Teardown     Close Browser


*** Variables ***
${goibibo_url}          https://www.goibibo.com/
${browser}               chrome
${source_city}           Mumbai, India
${destination_city}      New Delhi, India


*** Test Cases ***
Select Source City and Destination City
    [Documentation]   Select Source City and Destination City
    Close Initial Popup
    Select Source City     ${source_city} 
    Select Destination City      ${destination_city}
    Sleep     5s

Select Departure Date and Verify
    [Documentation]     Select Departure Date and Verify
    Select Departure Date       ${departure_date}



*** Keywords ***

Close Initial Popup
    [Documentation]   close initial signup popup
    Wait Until Element Is Visible    //span[@class='logSprite icClose']     10s
    Click Element    //span[@class='logSprite icClose']


Select Source City
     [Documentation]    This keyword will select source city name
     [Arguments]    ${src_city_name}
     Wait Until Element Is Visible    //span[text()='From']//following-sibling::p
     Click Element     (//p[text()='Enter city or airport'])[1]
     Input Text        //input[@type='text']        ${src_city_name}
     Wait Until Element Is Visible    //span[text()='${src_city_name}']   10s
     Click Element    //span[text()='${src_city_name}']


Select Destination City
    [Documentation]    This keyword will select destination city name
    [Arguments]    ${dest_city_name}
    Input Text        //input[@type='text']        ${dest_city_name}
    Wait Until Element Is Visible    //span[text()='${dest_city_name}']     10s
    Click Element    //span[text()='${dest_city_name}']
    Take Screenshot     select_date.png

     





*** Settings ***
Library    SeleniumLibrary



*** Keywords ***
Select Departure Date
    [Documentation]     Select Departure Date
    [Arguments]     ${depart_date}
    Click Element      //span[text()='Departure']//parent::div
    Wait Until Element Is Visible    //div[contains(@aria-label,"${depart_date}")]
    Click Element     //div[contains(@aria-label,"${depart_date}")]



Enter Passenger Details
    [Documentation]    Enter Passenger Details
    [Arguments]   ${Adults}   ${child}   ${infants}

    Click Element     //span[text()='Travellers & Class']//parent::div
    FOR    ${counter}    IN RANGE    0    ${Adults}   1
        Log    ${counter}
        Click Element     //p[text()='Adults']//parent::div//span[3]
    END


    FOR    ${counter}    IN RANGE    0   ${child}   1
        Log    ${counter}
        Click Element     //p[text()='Children']//parent::div//span[3]
    END

    FOR    ${counter}    IN RANGE    0   ${infants}   1
        Log    ${counter}
        Click Element    //p[text()='Infants']//parent::div//span[3]
    END


Select Travel Class
   [Documentation]    Select Travel Class
   [Arguments]        ${travel_class}
   Click Element     //li[text()='${travel_class}']
   Click Element     //a[text()='Done']

Click to Search Button
   [Documentation]    Click to Search Button
   Click Element     //span[text()='SEARCH FLIGHTS']
   


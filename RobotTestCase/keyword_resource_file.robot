*** Settings ***
Library    SeleniumLibrary



*** Keywords ***
Select Departure Date
    [Documentation]     Select Departure Date
    [Arguments]     ${depart_date}
    Click Element      //span[text()='Departure']//parent::div
    Wait Until Element Is Visible    //div[contains(@aria-label,"${depart_date}")]
    Click Element     //div[contains(@aria-label,"${depart_date}")]



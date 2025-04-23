*** Settings ***
Library   SeleniumLibrary
Library   ScreenCapLibrary
#  pip install robotframework-screencaplibrary

#Suite Setup     Set Browser Implicit Wait    30
Suite Setup      Open Browser     ${goibob_bus_url}        ${Browser}

*** Variables ***
####### Locator Variables #############
${source_city_loc}        //input[@placeholder='Enter Source']
${source_city_dropdn}     //span[text()='${Source_City_Name}']//parent::li
${Dest_city_loc}          //input[@placeholder="Enter Destination"]
${Dest_city_dropdn}       //span[text()='${Dest_City_Name}']//parent::li
${date_calender_loc}      //input[@placeholder="Pick a date"]
${date_loc}               //span[text()='${travel_date}']//parent::li
${search_btn_loc}         //button[text()='Search Bus']

######## Test Data ################
${goibob_bus_url}        https://www.goibibo.com/bus/
${Browser}               Chrome
${source_city_name}      Mumbai, Maharashtra
${dest_city_name}        Pune, Maharashtra
${travel_date}           30


*** Test Cases ***
Automate Bus Booking Feature and Verify
        [Documentation]   Automate Bus Booking Feature and Verify
        Start Video Recording     alias=None  name=DemoRecoding  fps=None    size_percentage=1    embed=True    embed_width=100px  monitor=2
        Enter source and dest city       ${source_city_name}        ${dest_city_name}
        Select travel date
        click on search button
        Sleep      10s
        Stop Video Recording




*** Keywords ***


Enter source and dest city
     [Documentation]      Enter source and dest city
     [Arguments]    ${source_city}         ${dest_city}
     Input Text       ${source_city_loc}        ${source_city}
     Wait Until Element Is Visible              ${source_city_dropdn}   10s
     Click Element    ${source_city_dropdn}
     Input Text       ${Dest_city_loc}       ${dest_city}
     Wait Until Element Is Visible           ${Dest_city_dropdn}       10s
     Click Element    ${Dest_city_dropdn}

Select travel date
     [Documentation]   Select travel date
     Click Element        ${date_calender_loc}
     Click Element        ${date_loc}
     
click on search button
     Click Element        ${search_btn_loc}

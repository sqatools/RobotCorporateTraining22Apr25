*** Settings ***
Library   SeleniumLibrary
Library   ScreenCapLibrary
Library    XML
#  pip install robotframework-screencaplibrary

#Suite Setup     Set Browser Implicit Wait    30
Suite Setup      Open Browser     ${goibob_bus_url}        ${Browser}

*** Variables ***
####### Locator Variables #############
${source_city_loc}        //input[@placeholder='Enter Source123']
${source_city_dropdn}     //span[text()='${Source_City_Name}']//parent::li
${Dest_city_loc}          //input[@placeholder="Enter Destination"]
${Dest_city_dropdn}       //span[text()='${Dest_City_Name}']//parent::li
${date_calender_loc}      //input[@placeholder="Pick a date"]
${date_loc}               //span[text()='${travel_date}']//parent::li
${search_btn_loc}         //button[text()='Search Bus']
${selct_seat_loc}         (//p[text()='Zingbus Plus']//ancestor::div[contains(@class, 'ActivepcardInnerLayoutDiv')]//span[text()='SELECT SEAT']//ancestor::button)[1]
${boarding_point_loc}     //p[text()='Boarding Point']//parent::div//p[text()='Borivali East']//ancestor::label/label
${dropping_point_loc}     //p[text()='Dropping Point']//parent::div//p[text()='Vishal Nagar']//ancestor::label/label
${available_seats_loc}    (//*[contains(@class, 'BusSleeperIcon')]//parent::div)[1]
${continue_button_loc}    //button[text()='CONTINUE']
${full_name_loc}          //input[@placeholder="Enter Full Name"]
${age_loc}                //input[@placeholder="Age"]
${male_elem_loc}          //span[text()='Male']//parent::li
${female_elem_loc}        //span[text()='Female']//parent::li
${email_field_loc}        //input[@data-val="email"]
${mobile_field_loc}       //input[@data-val="contactNum"]
${billing_Add_loc}        Billing Address
${pin_code_loc}           Pincode
${state_dropdown_loc}     //label[text()='State']//parent::div
${state_select_loc}       //li[text()='Andaman and Nicobar']

######## Test Data ################
${goibob_bus_url}        https://www.goibibo.com/bus/
${Browser}               Chrome
${source_city_name}      Mumbai, Maharashtra
${dest_city_name}        Pune, Maharashtra
${travel_date}           30
${full_name}             Rahul Gupta
${age_val}               35
${male_female_val}       Male

*** Test Cases ***
Automate Bus Booking Feature and Verify
        [Documentation]   Automate Bus Booking Feature and Verify
        # Start Video Recording     alias=None  name=DemoRecoding  fps=None    size_percentage=1    embed=True    embed_width=100px  monitor=2
        Enter source and dest city       ${source_city_name}        ${dest_city_name}
        Select travel date
        click on search button
        Sleep      10s
        Select Passenger Seat
        Sleep      10s
        Enter Passenger Details         ${full_name}        ${age_val}     ${male_female_val}
        Enter billing details
        # Stop Video Recording




*** Keywords ***


Enter source and dest city
     [Documentation]      Enter source and dest city
     [Arguments]    ${source_city}         ${dest_city}
     Page Should Contain Element      ${source_city_loc}
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

Select Passenger Seat
    Wait Until Element Is Visible     ${selct_seat_loc}     30s
    Click Element        ${selct_seat_loc}
    Click Element        ${boarding_point_loc}
    Click Element        ${dropping_point_loc}
    Wait Until Element Is Visible    ${available_seats_loc}      30s
    Click Element    ${available_seats_loc}
    #${all_seats}=   Get List Items        ${available_seats_loc}
    #Click Element      ${all_seats[0]}
    Click Element      ${continue_button_loc}


Enter Passenger Details
    [Documentation]    Enter Passenger Details
    [Arguments]       ${fullname}      ${age}     ${male_femal}
    Wait Until Element Is Visible     ${full_name_loc}
    Page Should Contain Element    ${full_name_loc}
    Input Text     ${full_name_loc}    ${fullname}
    Input Text    ${age_loc}    ${age}
    Run Keyword If    '${male_femal}' == 'Male'
    ...    Click Element    ${male_elem_loc}
    ...  ELSE IF    '${male_femal}' == 'Female'
    ...    Click Element    ${female_elem_loc}

Enter billing details
    [Documentation]    Enter billing details
    Input Text       id=${billing_Add_loc}        Mumbai Thane
    Input Text    id=${pin_code_loc}              8789789798
    Click Element    ${state_dropdown_loc}
    Click Element    ${state_select_loc}

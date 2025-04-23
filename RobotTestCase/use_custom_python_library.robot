*** Settings ***
Library    utility.py    ${json_file_path}

*** Variables ***
${json_file_path}       ${CURDIR}/json_content.json
${Excel_file_path}      ${CURDIR}/test_data.xlsx

*** Test Cases ***

Read Json content with custom library
     ${data}=   read_json_data
     Log To Console    ${data}
     Log To Console   \n${data['username']}
     
Read excel data from file
     ${data}=    read_excel_data     ${Excel_file_path}    Sheet1   A1
     Log To Console    ${data}




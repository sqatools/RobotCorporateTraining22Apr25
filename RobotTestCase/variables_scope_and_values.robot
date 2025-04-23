*** Settings ***
Library     SeleniumLibrary
Library    Screenshot
Variables   python_variable.py
#Test Timeout   20s

*** Variables ***

# scaler variable
${BROWSER}      chrome
${URL}          https://www.goibibo.com/
${GREETING}     Good Morning

# list variable
@{city}       Mumbai     Pune    Bangalore

# List variable
@{URLS}       https://automationbysqatools.blogspot.com/2020/07/software-testing.html
...           https://automationbysqatools.blogspot.com/2020/08/manual-testing.html
...           https://automationbysqatools.blogspot.com/2020/07/testing-principles.html

${Upload_File_URL}     https://automationbysqatools.blogspot.com/2020/08/login.html

# Dict variable
&{user_details}        name=Rahul      age=50     address=Mumbai Thane
...                    city=Mumbai     company=TCS

              
# variable priority
# 1. command line variable
# 2. variable file values
# 3. suite level variable

*** Test Cases ***
launch website commandline variable
     Open Browser    ${URL}     ${BROWSER}
     Maximize Browser Window
     Log To Console        ${GREETING}

launch website commandline variable and scopes
     Open Browser    ${URL}     ${BROWSER}
     Maximize Browser Window
     Log To Console        ${GREETING}
     Sleep     5s


Read Variables Values
     Log To Console      ${city}
     FOR    ${element}    IN     @{city}
         Log To Console     ${element}

     END
     
     Log To Console    ${city[0]}
     
     
Launch All Urls in Browser
     Open Browser    ${URL}        ${BROWSER}
     Log To Console    ${URLS}
     FOR    ${link}    IN    @{URLS}
           Go To  ${link}
           Take Screenshot
           Sleep    5s
          
     END

Upload File and Verify
    Open Browser     ${Upload_File_URL}     ${BROWSER}
    Maximize Browser Window
    Choose File     myFile       E:\\Filesdata\\count_name.txt
    Sleep    5s
    Take Screenshot  fileupload.png
    Click Element    //input[@type='submit']
    Wait Until Page Contains      File Uploaded Successfully
    Sleep    10s



Read data from dictionary variable
   [Documentation]   Read data from dictionary variable
   Log To Console    ${user_details}
   Log To Console    Name ${user_details['name']}
   FOR    ${key}   ${val}    IN   &{user_details}
       Log To Console    ${key}
       Log To Console    ${val}

   END


Built-in varible in robot
   [Documentation]  In build varible in robot
   Log To Console    currect directory      ${CURDIR}
   Log To Console    execute directory ${EXECDIR}
   Log To Console    system Temp Path  ${TEMPDIR}


Nested Looping In Robotframework
   [Documentation]    Nested looping in robot
   FOR    ${i}    IN RANGE    1    5    1
       Log To Console   Address : ${i}
       FOR    ${j}    IN RANGE    1    4    1
           Log To Console   Item: ${j}

       END

   END


Nested Looping In Robotframework with IF
   [Documentation]    Nested looping in robot
   FOR    ${i}    IN RANGE    1    5    1
       Log To Console   Address : ${i}
       FOR    ${j}    IN RANGE    1    4    1
           IF    '${i}' == '3'
               Log To Console   Item: ${j}
           ELSE
                CONTINUE
           END


       END

   END


Program with Nested If Condition
    [Documentation]   Program with Nested If Condition
    ${round1}=  Set Variable   fail
    ${round2}=  Set Variable   Pass
    ${round3}=  Set Variable   Pass
    IF    '${round1}' == 'Pass'
        Log To Console    Congrats First Round is Cleared
        IF    '${round2}' == 'Pass'
            Log To Console    Congrats second Round is Cleared
            IF   '${round3}' == 'Pass'
                Log To Console    Congrats third Round is Cleared,
            ELSE
                 Log To Console    sorry failed in final Round, Try Next time
            END
        ELSE
             Log To Console    sorry failed in second Round, Try Next time
        END
    ELSE
         Log To Console   Sorry failed in First Round, Try Next time
    END


# write a robot program to get all even values from given list
# @{numbers}      5  8  9  2  6  8  12

# write a robot program to find prime number from 1 to 50


Program with If ELSE IF Condition
      ${marks}=   Set Variable   79
      IF    ${marks} < 50
          Log To Console    Failed in examination
      ELSE IF  ${marks} < 60
          Log To Console    Passed with B grade

      ELSE IF  ${marks} < 80
          Log To Console    Passed with A grade

      ELSE IF  ${marks} <= 100
          Log To Console    Passed with A++ grade
      END



Program with while loop
      ${var} =   Set Variable   1
      WHILE    ${var} < 10  # 1 < 10 | 2 < 10 | 3 < 10...  10 < 10
          Log To Console      ${var}
          ${var}=   Evaluate    ${var} + 1
      END



# write program to calculate sum of all value from 1 to 50
# check the given is prime or not
# reverse of the given number


write a program to get sum and other operation
   ${sum}=  Set Variable   0
   FOR    ${i}    IN RANGE    1    50    1
       ${sum}=   Evaluate    ${sum} + ${i} 
   END
   
   Log To Console    Sum of value: ${sum}
   
   ###########  reverse of output ###########
   # 1225
   ${num}=    Set Variable   ${sum}
   ${reverse}=  Set Variable   0
   WHILE    ${num} > 0
        ${temp} =  Evaluate    ${num}%10
        Log To Console   temp:${temp}
        ${reverse}=  Evaluate   ${reverse}*10 + ${temp}
        Log To Console    reverse:${reverse}
        ${num}=  Evaluate   ${num}//10
        Log To Console    num:${num}
        Log To Console    ___________________________
   END
   
   Log To Console    Reverse output: ${reverse} 



Write Program to Check Given Number is Prime Or Not
     ${num}=  Set Variable    10
     ${count}=  Set Variable  0
     FOR    ${val}    IN RANGE    2    ${num}    1 # 2
         Log To Console    ${val}
         ${temp}=   Evaluate    ${num}%${val}  # 10%2 == 0
         IF    ${temp} == 0
             ${count}=   Evaluate    ${count} + 1
             BREAK
         ELSE
            CONTINUE

         END

     END

     IF    ${count} == 0
          Log To Console    This is prime number: ${num}
     ELSE
          Log To Console    This is not prime number: ${num}
     END
   


Get List of all Prime Number From 1 to 100
    FOR    ${num}    IN RANGE    1    100    1
        Log    ${num}
        ${count}=  Set Variable   0
        FOR    ${val}    IN RANGE    2    ${num}    1
            Log    ${val}
            ${temp}=   Evaluate    ${num}%${val}
            IF    ${temp} == 0
                  ${count}=   Evaluate    ${count} + 1
                  BREAK
            ELSE
                 CONTINUE
            END

        END

        IF    ${count} == 0
             Log To Console    ${num}
        END

    END


#Q1 write a program to calculate the factorial any given number.
# 5 = 5*4*3*2*1

#Q2 write a program to get sum of all digits in given value.
# input = 123
# output = 6


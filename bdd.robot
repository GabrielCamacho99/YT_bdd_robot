*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Test Data
${Song Name}    Carmen Fantasy Mate Bekavac

#Config Variables
${URL}    https://www.youtube.com/
${Browser}    chrome

#Elements
${Button_Accept}    //button[@aria-label="Accept the use of cookies and other data for the purposes described"]
${Input_Search}     //input[@name="search_query"]
${Button_Search}    //button[@aria-label="Search"]
${First_Video}      (//ytd-video-renderer//a[@id="thumbnail" and contains(@href, "/watch")])[1]
${Proof}            //div[@id="owner"]

*** Keywords ***
Access website
    Open Browser    https://www.youtube.com/    chrome
    
Click Accept All
    Click Element    ${Button_Accept}
Type song name
    Wait Until Element Is Visible   ${Input_Search}   timeout=15s
    Sleep    1s
    Input Text    ${Input_Search}    ${Song Name}

Click Search Button
    Click Element    ${Button_Search}
Click First_Video
    Wait Until Element Is Visible    ${First_Video}    timeout=15s
    Click Element    ${First_Video}

Verify Video is playing
    Wait Until Element Is Visible    ${Proof}    timeout=10s
    Element Should Be Visible    ${Proof}
    Sleep    15s

*** Test Cases ***
Case 1: Execute YT video on it's website
    Access website
    Click Accept All
    Type song name
    Click Search Button
    Log    ${First_Video}
    Capture Page Screenshot
    Click First_Video
    Verify Video is playing
    Close Browser
    
     
*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot

*** Variables ***

# Login
${USERNAME}         name:username
${PASSWORD}         name:password
${LOGIN}            xpath=//button[@type="submit"]


${LBLDASHBOARD}     xpath=//h6[normalize-space()="Dashboard"]
${ADMIN}            xpath=//span[normalize-space()="Admin"]
${ADD}              xpath=//button[normalize-space()="Add"]
${LBLADMIN}         xpath=//h5[normalize-space()="System Users"]
${LBLADDUSER}       xpath=//h6[normalize-space()="Add User"]
${USERROLE}         xpath=//label[normalize-space()="User Role"]/ancestor::div[contains(@class,"oxd-input-group")]//div[contains(@class,"oxd-select-text-input")]
${USERROLEADMIN}    xpath=//div[@role="option" and normalize-space()="Admin"]
${STATUS}           xpath=//label[normalize-space()="Status"]/ancestor::div[contains(@class,"oxd-input-group")]//div[contains(@class,"oxd-select-text-input")]
${STATUSENABLE}     xpath=//div[@role="option" and normalize-space()="Enabled"]
${LOGGEDUSER}       xpath=//p[contains(@class,"oxd-userdropdown-name")]
${EMPLOYEENAME}     xpath=//label[normalize-space()="Employee Name"]/ancestor::div[contains(@class,"oxd-input-group")]//input
${SEARCHEEMP}       xpath=//div[contains(@class,"oxd-autocomplete-dropdown")]
${LBLUSERNAME}      xpath=//label[normalize-space()="Username"]/../following-sibling::div//input
${PASSWORDCAD}      xpath=//label[normalize-space()="Password"]/ancestor::div[contains(@class,"oxd-input-group")]//input
${CONPASSWORD}      xpath=//label[normalize-space()="Confirm Password"]/ancestor::div[contains(@class,"oxd-input-group")]//input
${SAVE}             xpath=//button[normalize-space()="Save"]
${TOASTSUCCESS}     xpath=//p[contains(@class,"oxd-toast-content-text") and text()="Success"]
${SEARCH}           xpath=//button[normalize-space()="Search"]
${BTNEXCLUIR}       xpath=//button[i[contains(@class,"bi-trash")]]
${CONEXCLUIR}       xpath=//button[contains(., "Yes, Delete")]
${TOASTINFO}        xpath=//p[contains(@class,"oxd-toast-content-text") and text()="Info"]
${BTNUPDATE}        xpath=//button[i[contains(@class,"bi-pencil-fill")]]
${LBLUSERNAMEUP}    xpath=//label[.="Username"]/../following-sibling::div//input
${LBL_EDITPROFILE}  xpath=//*[text()='Edit User']


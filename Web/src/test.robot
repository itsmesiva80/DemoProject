
*** Settings ***
Library           Selenium2Library
Library           String

*** Variables ***
${URL}            http://www.juke.com
${BROWSER}        Firefox
${DELAY}          0
${TITLE}	      Alle Filme, Songs und Bücher. Digital, immer und überall - JUKE!
${PASSWORD}       Passw0rd123
${REG_FORM}       Registrieren und loslegen!
${REG_SUCCESS}    Herzlich willkommen bei JUKE!
${FILM_SECTION}   Film-Highlights

*** Test Cases ***
Launch Application
    Open Home Page
    Verify Title

Register New User
    Open Registration Window
    Verify Registration Window
    Input User Data
    Verify Successful Registration

Film Section
    Verify Film Highlights

Buy Film
    Select Movie
    Verify Movie Details
    Checkout Movie
    Verify Paypal Page

Search Film
    Open Home Page
    Verify Title
    Input Film Name In Search Box

Search Results For Albums
    Verify Atleast One Item For Albums Is Listed

Search Results For Films
    Verify Atleast One Item For Films Is Listed

Search Results For Songs
    Verify Atleast One Item For Songs Is Listed

*** Keywords ***
Open Home Page
   Open Browser    ${URL}    ${BROWSER}
   Maximize Browser Window
   Set Selenium Speed    ${DELAY}

Verify Title
   Title Should Be   ${TITLE}

Open Registration Window
    Click Element       xpath = //div[3]/account-menu/div/dl
    Wait Until Element Is Visible  xpath = //div[3]/account-menu/div/div/div[3]/a/dl/dd
    Click Element       xpath = //div[3]/account-menu/div/div/div[3]/a/dl/dd
    Wait Until Element Is Visible   xpath = //*[@id='email']

Verify Registration Window
    Page Should Contain      ${REG_FORM}

Input User Data
    ${NEW_USER_ID} =   Generate Random String      10  [LETTERS]
    Input Text   xpath = //*[@id='email']   ${NEW_USER_ID}@grr.la
    Input Text  xpath = //*[@id='password']  ${PASSWORD}
    Click Button  xpath = //*[@class='btn-form primary'and @type='submit']
    Wait Until Element Is Visible   xpath =.//*[@id='firstName']
    Input Text      xpath =//*[@id='firstName']     ${NEW_USER_ID}
    Input Text      xpath =//*[@id='lastName']      T
    Input Text      xpath =//*[@id='confirmEmail']  ${NEW_USER_ID}@grr.la
    Click Button    xpath =//*[@id='btnRegisterSubmitForm']

Verify Successful Registration
    Set Browser Implicit Wait   30
    Wait Until Element Is Visible         xpath = //*[@class='btn-form secondary'and @type='button']
    Page Should Contain      ${REG_SUCCESS}
    Click Button        xpath = //*[@class='btn-form secondary'and @type='button']

Verify Film Highlights
    Page Should Contain      ${FILM_SECTION}

Select Movie
    Click Link    css = .showall.btn.btn-secondary[href*='film-highlights']
    Set Browser Implicit Wait   10
    Click Link    css = .metadata>h4>a[href*='independence-day-2-wiederkehr']

Verify Movie Details
    Wait Until Element Is Visible       xpath = .//*[@class="table table-striped table-hover"]/tbody/tr[4]/td[6]/div[@class="price-button"]
    Page Should Contain         Independence Day 2: Wiederkehr
    Page Should Contain         Kaufen - HD

Checkout Movie
    Click Button       xpath = .//*[@class="table table-striped table-hover"]/tbody/tr[4]/td[6]/div[@class="price-button"]/button[@class='btn btn-default badge btn-purchase btn-purchase-pricingplan']
    Set Browser Implicit Wait   30
    Page Should Contain       Kauf überprüfen
    Wait Until Element Is Visible      css= button[id=purchase-start-va-charge-button]
    Select From List      css = select[id=purchase-start-payment-options]   PayPal
    Click Button          css= button[id=payPayPalBtn]

Verify Paypal Page
    Set Browser Implicit Wait   60
    Page Should Contain      Juke Entertainment GmbH
    Page Should Contain      Bei PayPal einloggen
    Page Should Contain Element    css=a[id=cancelLink]
    Close Browser

Input Film Name In Search Box
    Input Text     css = input[id=searchfield]   ninja turtles
    Click Button   css = button[id=searchbutton]
    Set Browser Implicit Wait  10
    Page Should Contain     Suchergebnisse für “ninja turtles”

Verify Atleast One Item For Albums Is Listed
    ${Albums_Count} =   Get Matching Xpath Count    //*[@ng-switch-when='albums']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']
    Should be True    ${Albums_Count} > 0

Verify Atleast One Item For Films Is Listed
    ${Albums_Count} =   Get Matching Xpath Count    //*[@ng-switch-when='videos']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']
    Should be True    ${Albums_Count} > 0

Verify Atleast One Item For Songs Is Listed
    ${Count} =    Get Matching Xpath Count    //*[@ng-switch-when='tracks']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']
    Should be True    ${Count} > 0
    Close Browser

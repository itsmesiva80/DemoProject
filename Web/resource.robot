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

#Xpath and CSS Variables
${ELE_ACCOUNT_MENU}                 css = .navbar-btn-group>account-menu
${ELE_REGISTER}                     css = .easy-register>a>dl>dd
${TXT_EMAIL}                        xpath = //*[@id='email']
${TXT_PASSWORD}                     xpath = //*[@id='password']
${BTN_TO_REGISTER}                  xpath = //*[@class='btn-form primary'and @type='submit']
${TXT_CONFIRM_EMAIL}                xpath =//*[@id='confirmEmail']
${TXT_FIRST_NAME}                   xpath =//*[@id='firstName']
${TXT_LAST_NAME}                    xpath =//*[@id='lastName']
${BTN_REGISTER}                     xpath =//*[@id='btnRegisterSubmitForm']
${ELE_WELCOME}                      css =.text-primary.welcome
${BTN_REGISTER_CLOSE}               css = .btn-form.secondary[type=button]
${BTN_FILM_HIGHLIGHTS_SHOWALL}      css = .showall.btn.btn-secondary[href*='film-highlights']
${ELE_ELEVENTH_FILM}                xpath = //*[@id='content-div']/ui-view/section/div[2]/div[1]/react-component/div/div[11]
${BTN_PRICE_SD}                     xpath = //*[@class="table table-striped table-hover"]/tbody/tr[4]/td[6]/div[@class="price-button"]
${BTN_PRICE}                        xpath = //*[@class="table table-striped table-hover"]/tbody/tr[4]/td[6]/div[@class="price-button"]/button[@class='btn btn-default badge btn-purchase btn-purchase-pricingplan']
${BTN_PURCHASE_START}               css= button[id=purchase-start-va-charge-button]
${DPD_PAYMENT_OPTION}               css = select[id=purchase-start-payment-options]
${BTN_PAYBY_PAYPAL}                 css= button[id=payPayPalBtn]
${LNK_CANCEL_PAYPAL}                css=a[id=cancelLink]
${TXT_SEARCH}                       css = input[id=searchfield]
${BTN_SEARCH}                       css = button[id=searchbutton]
${GET_ALBUMS_COUNT_XPATH}           //*[@ng-switch-when='albums']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']
${GET_FILMS_COUNT_XPATH}            //*[@ng-switch-when='videos']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']
${GET_SONGS_COUNT_XPATH}            //*[@ng-switch-when='tracks']/react-component[@name='marqueeComponent']//div[@class="marquee-items-container"]/div[@class='marquee-items']


*** Keywords ***
Open Home Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Verify Title
    Title Should Be                 ${TITLE}

Open Registration Window
    Click Element                   ${ELE_ACCOUNT_MENU}
    Wait Until Element Is Visible   ${ELE_REGISTER}
    Click Element                   ${ELE_REGISTER}
    Wait Until Element Is Visible   ${TXT_EMAIL}

Verify Registration Window
    Page Should Contain             ${REG_FORM}

Input User Data
    ${NEW_USER_ID} =   Generate Random String      10  [LETTERS]
    Input Text                      ${TXT_EMAIL}         ${NEW_USER_ID}@grr.la
    Input Text                      ${TXT_PASSWORD}      ${PASSWORD}
    Click Button                    ${BTN_TO_REGISTER}
    Wait Until Element Is Visible   ${TXT_FIRST_NAME}
    Input Text                      ${TXT_FIRST_NAME}     ${NEW_USER_ID}
    Input Text                      ${TXT_LAST_NAME}      T
    Input Text                      ${TXT_CONFIRM_EMAIL}  ${NEW_USER_ID}@grr.la
    Click Button                    ${BTN_REGISTER}

Verify Successful Registration
    Set Browser Implicit Wait   30
    Wait Until Element Is Visible         ${BTN_REGISTER_CLOSE}
    Page Should Contain                   ${REG_SUCCESS}
    Click Button                          ${BTN_REGISTER_CLOSE}

Verify Film Highlights
    Page Should Contain                   ${FILM_SECTION}

Select Movie
    Click Link                            ${BTN_FILM_HIGHLIGHTS_SHOWALL}
    Set Browser Implicit Wait   20
    Click Element                         ${ELE_ELEVENTH_FILM}

Verify Movie Details
    Wait Until Element Is Visible         ${BTN_PRICE_SD}
    Page Should Contain                   Independence Day 2: Wiederkehr
    Page Should Contain                   Kaufen - HD

Checkout Movie
    Click Button                          ${BTN_PRICE}
    Set Browser Implicit Wait   30
    Page Should Contain                   Kauf überprüfen
    Wait Until Element Is Visible         ${BTN_PURCHASE_START}
    Select From List                      ${DPD_PAYMENT_OPTION}   PayPal
    Click Button                          ${BTN_PAYBY_PAYPAL}

Verify Paypal Page
    Set Browser Implicit Wait   60
    Page Should Contain                   Juke Entertainment GmbH
    Page Should Contain                   Bei PayPal einloggen
    Page Should Contain Element           ${LNK_CANCEL_PAYPAL}
    Close Browser

Input Film Name In Search Box
    Input Text     ${TXT_SEARCH}   ninja turtles
    Click Button   ${BTN_SEARCH}
    Set Browser Implicit Wait  10
    Page Should Contain     Suchergebnisse für “ninja turtles”

Verify Atleast One Item For Albums Is Listed
    ${Albums_Count} =   Get Matching Xpath Count    ${GET_ALBUMS_COUNT_XPATH}
    Should be True    ${Albums_Count} > 0

Verify Atleast One Item For Films Is Listed
    ${Albums_Count} =   Get Matching Xpath Count    ${GET_FILMS_COUNT_XPATH}
    Should be True    ${Albums_Count} > 0

Verify Atleast One Item For Songs Is Listed
    ${Count} =          Get Matching Xpath Count    ${GET_SONGS_COUNT_XPATH}
    Should be True    ${Count} > 0
    Close Browser

*** Settings ***
Documentation        Juke Web application automation test cases:
...                  1. Test suite with new user registration and checkout using Paypal.
...                  2. Tets suit with search for film and verify results
...
...                  This test has a workflow that is created using keywords in
...                  the imported resource file.
Resource             resource.robot


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

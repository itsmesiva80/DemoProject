#Cucumber BDD Scenarios

```
Feature: Mobile App Audio Plackback Functionality

  Scenario: Test Playback on android phone
    Given Juke anroid application
      And Application is launched
    When audio playback is started
      And close the application
    Then audio continues to play without stopping in the background

  Scenario: Test volume control on playback
    Given Audio application is launched
      And Audio is played
      And Application is closed
    When  Audio is palying on closed application
      And User increase or decrease volume from universal control
      And User mute and unmute from universal control
    Then the playback music is controlled accordingly
      And the playback music is muted or unmuted accordingly

  Scenario: Test pause and close on playback
    Given Audio application is playing
      And application is closed
    When Audio is playing on closed application
      And User pauses the application from universal control
      And User stops the application from universal control
    Then the application playback is paused
      And played when clicking on play
      And closes when clicking on close

  Scenario: Test Next and Previous tracks on playback
    Given Audio application is playing
      And application is closed
    When Audio is playing on closed application
      And user clicks on Next on universal control
      And user clicks on Previous on universal Control
    Then audio track is changed accordingly without going back to application

    Scenario: Test Display of metadata on playback
      Given Audio application is playing
        And application is closed
      When Audio is playing on closed application
        And User could see metadata on the mobile universal Control
      Then playback app metadata is same as metadata dispalyed on mobile universal Control

  *suggestion as new feature test case*
  Scenario: Test Repeat track on playback
    Given Audio application is playing
      And application is closed
    When Audio is playing on closed application
      And user clicks on repeat on universal control
    Then audio track is repeated without going back to application

  *suggestion as new feature test case*
  Scenario: Test Shuffel playlist on playback
    Given Audio application is playing on some playlist
      And application is closed
    When Audio is playing on closed application
      And user clicks on shuffel on universal control
    Then audio track are shufled without going back to application
      And playlist is not changed   

```      

**Note:** these scenarios are not automated.

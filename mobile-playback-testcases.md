#Cucumber BDD Scenarios

```
Feature: Mobile App Audio Plackback Functionality

  Scenario: Test Playback on android phone
    Given Juke anroid application
      And application is launched
    When audio playback is started
      And close the application
    Then audio continues to play without stopping in the background

  Scenario: Test Playback display on lock screen with next, previous, close and metadata
    Given audio application is launched
      And application is closed after play
    When audio playback is started
      And application is closed
    Then audio continues to play and playback is displayed on lockscreen with next, previous, close and metadata

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
      And User pauses the application from lock screen display control
      And User stops the application from lock screen display control
    Then the application playback is paused
      And played when clicking on play
      And closes when clicking on close

  Scenario: Test pause, play and stop on playback if universal control also provides
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
      And user clicks on Next on lock screen display control
      And user clicks on Previous on lock screen display control
    Then audio track is changed accordingly without going back to application

  Scenario: Test Display of metadata on playback
    Given Audio application is playing
      And application is closed
    When audio is playing on closed application
      And user taps onplayback app of lock screen display control
    Then prompts for lockscreen
      And user unlocks the screen
      And user should fall on playback application

  Scenario: Test open playback from lockscreen
    Given audio application is playing
      And application is closed
      And mobile screen is locked
    When audio is playing on closed application
      And user could see metadata on the mobile lock screen display control
    Then playback app metadata is same as metadata dispalyed on mobile lock screen display control

  *suggestion as new feature test case*
  Scenario: Test Repeat track on playback
    Given audio application is playing
      And application is closed
    When audio is playing on closed application
      And user clicks on repeat on lock screen display control
    Then audio track is repeated without going back to application

  *suggestion as new feature test case*
  Scenario: Test Shuffel playlist on playback
    Given audio application is playing on some playlist
      And application is closed
    When audio is playing on closed application
      And user clicks on shuffel on lock screen display control
    Then audio track are shufled without going back to application
      And playlist is not changed   

```      

**Note:** these scenarios are not automated.

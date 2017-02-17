#Cucumber BDD Scenarios

```
Feature: Mobile App Audio Plackback Functionality

  Scenario: Test Playback on android phone
    Given Juke anroid application
      And application is launched
    When audio playback is started
      And user closes the application
    Then audio continues to play in background


  Scenario: Test Playback display on lock screen with next, previous, close and metadata
    Given audio application is launched
      And application is closed after play
    When audio playback is started
      And user closes the application
    Then audio continues to play and playback is displayed on lockscreen with next, previous, close and metadata


  Scenario: Test volume control on playback
    Given Audio application is launched
      And Audio is played
      And Application is closed
    When  Audio is played in background
      And user <action> volume from universal control
    Then the music volume is <result>

    Examples:
    | action     | result     |
    | increase   | increased  |
    | decrease   | decreased  |
    | mute       | mutted     |
    | unmute     | unmuted    |


  Scenario: Test pause and close on playback
    Given Audio application is playing
      And application is closed
    When audio is playing in the background
      And user <action> the application from lock screen display control
    Then the application is <result>

    Examples:
    | action     | result  |
    | pause      | paused  |
    | close      | closed  |


  Scenario: Test pause, play and stop on playback if universal control also provides
    Given Audio application is playing
      And application is closed
    When audio is playing in the background
      And user <action> the application from universal control
    Then the application is <result>

    Examples:
    | action     | result  |
    | play       | played  |
    | pause      | paused  |
    | stop       | stopped |


  Scenario: Test Next and Previous tracks on playback
    Given Audio application is playing
      And application is closed
    When audio is playing in the background
      And user clicks on <action> on lock screen display control
    Then audio <result> without going back to application

    Examples:
    | action     | result                    |
    | next       | next track is played      |
    | previous   | previous track is played  |


  Scenario: Test Display of metadata on playback
    Given audio application is playing
      And application is closed
      And mobile screen is locked
    When audio is playing in the background
      And user could see metadata on the mobile lock screen display control
    Then app metadata is same as metadata dispalyed on mobile lock screen display control


  Scenario: Test open playback from lockscreen
    Given Audio application is playing
      And application is closed
    When audio is playing in the background
      And user taps on application of lock screen display control
    Then prompts for lockscreen
      And user unlocks the screen
      And Juke app should be displayed to user


  *suggestion as new feature test case*
  Scenario: Test Repeat track on playback
    Given audio application is playing
      And application is closed
    When audio is playing in the background
      And user clicks on repeat on lock screen display control
    Then audio track is repeated without going back to application


  *suggestion as new feature test case*
  Scenario: Test Shuffel playlist on playback
    Given audio application is playing on some playlist
      And application is closed
    When audio is playing in the background
      And user clicks on shuffel on lock screen display control
    Then audio tracks are shufled without going back to application
      And playlist is not changed   

```      

**Note:** these scenarios are not automated.

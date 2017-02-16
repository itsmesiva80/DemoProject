#Web Test Automation

Test cases are automated using Selenium Webdriver Robot Framework. Robot is choosen
as it is proven for easy maintance, reporting, logging and implementing. It is a TDD (Test-Driven Development) approach,
Python and Selenium2Library are used to build the test cases and keywords.
Test case design is simple user understanadable and implementation which consists of higher level of keywords.
Reporting, execution log and failure screenshots are exciting part in Robotframework.
To know better of Robot Framework please [click here](http://robotframework.org/robotframework/#user-guide).

###Prerequisite
Following need to be installed before we start executing the test:
- Python 2.7
- RobotFramework
- Selenium2Library
- Jython
- WebDrivers geckodriver and chrome driver
- Virtualenv (optional)

###Guidelines for installation
These instructions cover installing Robot Framework and its preconditions on different operating systems.
If you already have pip installed, it is enough to run.

But if you dont have python and pip installed, please follow the [guidelines](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#python-installation) in detail.

###Robot Framework installation

```
pip install robotframework

```

###Selenium2Library Installation

```
pip install robotframework-selenium2library

```

###Jython Installation

Installing Jython is a fairly easy procedure, and the first step is getting an installer from http://jython.org.
The installer is an executable JAR package, which you can run from the command line like java -jar jython_installer-<version>.jar.
Depending on the system configuration, it may also be possible to just double-click the installer.

###Webdriver Installation

Before you download webdrivers from external sources please verify in ' \Python27\Lib\site-packages\selenium\webdriver '
if geckodriver and chrome driver exist well and good other wise install from below sources:

- [geckodriver](https://github.com/mozilla/geckodriver/releases)
- [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/getting-started)

Virtualenv is optinal, you can download from [site](https://pypi.python.org/pypi/virtualenv).

###Configuring PATH

This is very important part in robot framework, please set your PATH variables for all above installations,
otherwise test case execution is not possible and reports are not saved in correct paths.

In Different OS PATH variables are set differently, so please follow the guidelines form this [site](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#configuring-path)

I will guide you to **Set path on Windows Machine**:

On Windows you can configure PATH by following the steps below. Notice that the exact setting names may be different on different Windows versions, but the basic approach should still be the same.

- Open Control Panel > System > Advanced > Environment Variables. There are User variables and System variables, and the difference between them is that user variables affect only the current users, whereas system variables affect all users.
- To edit an existing PATH value, select Edit and add ;<InstallationDir>;<ScriptsDir> at the end of the value (e.g. ;C:\Python27;C:\Python27\Scripts). Note that the semicolons (;) are important as they separate the different entries. To add a new PATH value, select New and set both the name and the value, this time without the leading semicolon.
- Exit the dialog with Ok to save the changes.
- Start a new command prompt for the changes to take effect.

**NOTE:Please follow the same steps for all the installations (Python, Robot Framework, gickodriver, chromedriver, Jython)**
For example my PATH looks like this:
`C:\Python27;C:\Python27\Scripts;C:\jython2.7.0\bin;C:\Python27\Lib\site-packages\selenium\webdriver;C:\Python27\Lib\site-packages\selenium\webdriver\geckodriver;`

###Verify Installation

```
robot --version
Robot Framework 3.0 (Python 2.7.10 on linux2)

```

When You see robot is installed and PATH variables are set, then you are good to go executing/creating tests using Robot Framework.

###Guidlines to run the test and verify reports

Execution of tests
```
cd /path/to/your/test/
robot test.robot

```
Find reports at the same path your test is located. Robot Framework will create temprary files in test location
following files can be found there:
- report.html high level report with test cases status and number of test cases executed and its status are shown.
- log.html is the detailed report of each test case execution, steps and data used in the test cases are shown. Can also be navigate from report.html
- output.xml is XML format of the entire test, log and report.

###Test location

All tests and reports are located
- Tests: `DemoProject\Web\test.robot`
- Reports `DemoProject\Web\log.html`

##Running from Docker

Dockerised build and execution is more simpler as installation of all prequisite will be handeled by dockerfile.
Make sure you have [Docker](https://docs.docker.com/engine/installation/) installed.

Build from source

```
 docker build -t robot_test .

```
It will take a while to install all the software, once docker image is built, run the below command
```
 docker run -v $(pwd)/Web/:/Web/ -e ROBOT_TESTS=/Web/ -e BROWSER=firefox robot_test

```
*Note:*
- *Docker setup works better on mac or linux/ubuntu os machines*
- *Define test case directory in param -v and change path from $(pwd)/Web/test1 to your defined path in your local computer.*

check the result on console and to verify the log and report access from where test is resided.

# YT_bdd_robot
Automation of an Youtube search and playing the 1st video that appears on the list.

In this test scenario the objective was to access Youtube on Chrome Browser -> input a song name in the search bar and click search -> click the 1st video on the list -> verify if it was playing -> close browser.

At first it had many bugs to correct , specially in the elements xpaths:
  - 1st it was the video selection from a list, as YT gets their own classes for the elements it can become harder for the robot to identify the specific element or return it has 'not found'
      at first i tried everything to correct this , from changing in between elements (and their xpaths) from inserting JS scripts to verify the xpaths and click elements, if they contained urls, etc
      but augmenting complexity originated other bugs such as , js script was not accepting the strings in any format even when passed as variables instead of typed directly in the script.

      So i gave it a day and came back at it , deleted all the js scripts, changed the element and xpath for the video , used "wait until element is visible" instead of "sleep" and this bug was solved. The video was always found and clicked

  - 2nd then another bug happened on the verification, when it asked for "element should be visible ${proof} "
    it didn't find the element ; after some more rigorous scrapping I found an element with an id instead of an YT class.
    
    I used that id for the ${proof} locator , but at first test it failed again saying that the element was not visible - and when i checked the print and report the page didn't get the chance to fully load before the verification.
    So I added a "wait until element is visible" before the "element should be visible"

The test passed completely after this change as you can check on the report.html.

-----------//--------------------//-------------

This was my first real website automation test as I started studying RobotFramework and it was truly important for me to understand the basic principles of using the correct xpaths to the given elements, about how the loading of each page can condition the functioning of the test , learned to use "wait until..." instead of "sleep" and it was an exercise of resilience in the face of bugs and failures.



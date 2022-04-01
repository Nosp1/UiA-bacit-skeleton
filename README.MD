# Java base skeleton for a Battlefield 2 Statistics/Leaderboards  web application
Modified version of Trym's skeleton to serve as a skeleton for a bf2s.com like web application with stats from a local Battlefield 2 gamespy server.
<br>

## Notice
I ditched Docker and all that. I personally could not find a way to link up with the existing 
BF2-database when using Docker. I'm sure it's possible, I just couldn't manage to do it. 

## How to use
### Prerequisites:
-A copy of Battlefield 2 version 1.41 or 1.5 (1.41 better with bots)<br>
-Battlefield 2 Dedicated Server<br>
-XAMPP (Version 7.4.28)<br>
-BF2Statistics Web Edition v3

##### 1. Install Battlefield 2 Dedicated Server, XAMPP and BF2Statistics Web Edition.    
Watch this video:<br>
https://youtu.be/WpNlfql3wPw <br>
and/or written guide:<br>
https://bf2statistics.com/threads/bf2statistics-web-edition-tutorial-and-tips.3022/

##### 2. Install MySQL and Apache as services in Xampp control panel
Open xampp control panel and tick off services for Apache and MySQL.
It makes it so you don't need to manually open xampp and start Apache and MySQL everytime you want to play or make the web application able to contact the DB. 


##### 3. Open this project in IntelliJ.

##### 4. Connect to the database in IntelliJ   
-Click on "Database" in the far right corner.<br>
-Click plus sign, then data source<br>
-Select MariaDB<br>
-Name it "bf2stats"<br>
-Host should be "localhost"<br>
-User should be "root"<br>
-Password should be blank as in nothing<br>
-database should be "bf2stats"<br>

Alternatively you can use "bf2statslogger" as user and "bf2" as password as in the guide you followed when installing Bf2statistics web edition.

##### 5. Connect the xampps tomcat to IntelliJ
-In intelliJ, click "run" on the top tool menu<br>
-Click "Edit configurations"<br>
-Click the "+"sign<br>
-Scroll down the list until you see Tomcat. Select "local" (NOT "tomcatEE")<br>
-A menu pops up. Select "Configure" to the right of "application server"<br>
-Click the "+"sign here as well<br>
-Hit the folder icon on "Tomcat Home" and navigate to Xampp's tomcat folder. This is mine "C:\Spillting\Battlefield_2_Server-greier\XAMPP\tomcat" 
-Name it with the tomcat version (or it does so automatically?) and click ok<br>
-Select the tomcat version you just made in "application server"<br>
-Choose what you want the url to be. Mine is "http://localhost:8080/Battlefield2Statistikk/" <br>
-Most likely there will be a red light bulb with and the text "Warning: No artifacts marked for deployment" click it "fix".<br>
-select "Battlefield2Statistikk:war exploded"<br>
-In the "Application context", shorten it down to just "/Battlefield2Statistikk" (or whatever suffix you gave the URL two steps ago.)<br>

##### 6. Start the tomcat server in IntelliJ
-click "services" in the menu down left<br>
-select the tomcat server and hit the green "run" button
-Wait for it to build the application.

##### 7. Test out the skeleton at http://localhost:8080/Battlefield2Statistikk/ (if you did not change the url)
-(IntelliJ should automatically launch your browser with this link)
<br>

<br>

Have fun and experiment :)
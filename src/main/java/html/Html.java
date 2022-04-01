package html;

import java.io.PrintWriter;

public class Html {
    public static void Start(PrintWriter out, String title) {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>"+title+"</title>");
        out.println("<link rel=\"stylesheet\" href=\"/Battlefield2Statistikk/Resources/Stylesheet/styles.css\">");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>"+title+"</h1>");
        //out.println("<body background=\"/Battlefield2Statistikk/Resources/Images/Battlefield2LogoBig.png\">");
    }

    public static void EndBasic(PrintWriter out) {
        out.println("</body>");
        out.println("</html>");
    }

    public static void MiniTutorial(PrintWriter out ) {
        out.println("<br/><h2>More about this skeleton and interesting Battlefield 2 links if you want to learn more.</h2>");
        out.print("<p>Playing Battlefield 2 is a fun and engaging way to create data for your database (It is also an excellent game unlike modern BF-games... ;) ). Creating data has never been more fun! 38 tables waits for you to tinker with. Invite friends over and have a LAN. " +
                  "With this you can make stat profile for players and round history. Be creative: create leaderboards for teamwork, kills with attack helicopters or find out who is the top 10 most accurate with a sniper rifle. You can also insert or update tables, like what promotions, weapon unlocks or points a player has or what his email or country is.</p>");
        out.println("<h3>Here is some bf2-stats sites you can use for inspo: </h3>");
        out.println("<p><a href=\"https://www.bf2hub.com/player/Clubradio\">(bf2hub version)</a> </p>");
        out.println("<p><a href=\"https://stats.lost-soldiers.org/?pid=235450654\">(bf2s version)</a> </p>");
        out.println("<p><a href=\"https://stats.playfh2.net/stats/playerstats/464842560\">(playfh2 version)</a> </p>");
        out.println("<h3>If you're also interested in modding BF2 check out these sites: </h3>");
        out.println("<p><a href=\"https://bf2statistics.com/\">(bf2statistics. The guys who made it possible to play this version of local BF2)</a> </p>");
        out.println("<p><a href=\"https://www.moddb.com/games/battlefield-2/\">(moddb. Downloads for mods and addons)</a> </p>");
        out.println("<p><a href=\"http://battlefieldsingleplayer.com/\">(battlefieldsingleplayer. The forum is the StackOverload of BF2. Not very active nowdays)</a> </p>");
        out.println("<p><a href=\"https://discord.gg/eFcgYKfe\">(refactor 2 modding. This Discord for modding BF2. Very active)</a> </p>");
        out.println("<p><a href=\"https://youtu.be/kXSJlsA9Ctw\">(my youtube channel. It has tutorials on how to customise and manage your private server and how to add modded stuff so the DB accepts it ;))</a> </p>");
    }
}
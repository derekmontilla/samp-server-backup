#include <a_samp>
#include <irc>
#include <dns>
#include <GeoIP>
//#include <dini>
#include <audio>
#include <sscanf2>
#include <a_mysql>
#include <floodcontrol>
//#include <YSF>
native WP_Hash(buffer[], len, const str[]);

#define IRC_SERVER "mr_pepino_ircserver"
#define IRC_PORT (6667)

#define BOT_1_NICKNAME "mr_pepino_nick" // Name that everyone will see
#define BOT_1_REALNAME "13xMovie vBot 1" // Name that will only be visible in a whois
#define BOT_1_USERNAME "mr_pepino_user" // Name that will be in front of the hostname (username@hostname)
#define BOT_1_PASSWORD "mr_pepino_pass"

#define BOT_2_NICKNAME "mr_pepino_nick2"
#define BOT_2_REALNAME "13xMovie vBot 2"
#define BOT_2_USERNAME "mr_pepino_user2"
#define BOT_2_PASSWORD "mr_pepino_pass2"

#define IRC_CHANNEL "#mr_pepino_irc"
#define IRCHOP_CHANNEL "%#mr_pepino_irc"
#define IRCOP_CHANNEL "@#mr_pepino_irc"
#define IRCSOP_CHANNEL "&#mr_pepino_irc"
#define IRCQOP_CHANNEL "~#mr_pepino_irc"

#define MAX_BOTS (2) // Maximum number of bots in the filterscript
#undef MAX_PLAYERS
#define MAX_PLAYERS 50 // Maximum number of players in your server
#define MAX_PLAYERS_ON_LINE 17

#define PLUGIN_VERSION "1.4.2"

// MYSQL START
new mysqlConnection,
	bool:mysqloffline = false;

//#define MYSQL_IP              	"game.host.net"
#define MYSQL_IP                "localhost"
#define MYSQL_USER				"root"
#define MYSQL_PASSWORD			""
#define MYSQL_DB				"xmovie"

#define MYSQL_TABLE_ACCOUNTS			"accounts"
#define MYSQL_TABLE_PLAYER_LOGS			"player_logs"
#define MYSQL_TABLE_PREFERENCES 		"preferences"
#define MYSQL_TABLE_BANS				"bans"
#define MYSQL_TABLE_TELEPORTS			"teleports"
#define MYSQL_TABLE_IPS         		"ips"
#define MYSQL_TABLE_ADVERTS     		"adverts"
#define MYSQL_TABLE_MEMOS       		"memos"
#define MYSQL_TABLE_OSTICKS     		"osticks"
#define MYSQL_TABLE_POSTICKS    		"posticks
#define	MYSQL_TABLE_HOSTBANS			"hostbans"
#define	MYSQL_TABLE_SERVER_LOGS			"server_logs"
#define	MYSQL_TABLE_SERVER_STATISTICS	"server_statistics"

#define mysql_run_query if (mysqloffline == false) querybalance++; mysql_function_query
// Tags for custom query callbacks: QS_ = QuerySelect
#define KickEx(%0) SetTimerEx("KickPlayer", 500, 0, "d", %0)

new querybalance;
// MYSQL END

#define IsVIP(%1) CallRemoteFunction("IsVIP", "i", %1)
#define IsAdmin(%1) CallRemoteFunction("IsAdmin", "i", %1)
#define GetPlayerAdminLevel(%1) CallRemoteFunction("GetPlayerAdminLevel", "i", %1)
#define IsPlayerRegistered(%1) CallRemoteFunction("IsPlayerRegistered", "i", %1)
#define IsPlayerLoggedIn(%1) CallRemoteFunction("IsPlayerLoggedIn", "i", %1)
#define GetPlayerAccountID(%1) CallRemoteFunction("GetPlayerAccountID", "i", %1)
#define GetPlayerCinc(%1) CallRemoteFunction("GetPlayerCinc", "i", %1)

#define printlog(%1,%2) printf("[%s] %s", %1, %2)
//#define printlog(%1,%2) CallRemoteFunction("printflog", "ss", %1, %2)

#define SPAM_MAX_MSGS 5
#define SPAM_TIMELIMIT 5 // 5 SECONDS

#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xFF0000FF
#define COLOR_PINK 0xFF69B4FF
#define COLOR_LPINK 0xF64BC2AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_DARKRED 0xDC143CAA // crimson
#define COLOR_DARKERRED 0x660000AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF8000FF
#define COLOR_LIME 0x10F441AA
#define COLOR_MAGENTA 0xFF00FFFF
#define COLOR_AQUA 0xF0F8FFAA
#define COLOR_LLBLUE 0x0080FFFF
#define COLOR_FLBLUE 0x6495EDAA
#define COLOR_BISQUE 0xFFE4C4AA
#define COLOR_BLACK 0x000000AA
#define COLOR_CHARTREUSE 0x7FFF00AA
#define COLOR_BROWN 0xA52A2AAA
#define COLOR_CORAL 0xFF7F50AA
#define COLOR_GOLD 0xB8860BAA
#define COLOR_GREENYELLOW 0xADFF2FAA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_IVORY 0xFFFF82AA
#define COLOR_LAWNGREEN 0x7CFC00AA
#define COLOR_SEAGREEN 0x20B2AAAA
#define COLOR_LIMEGREEN 0x32CD32AA //<--- Dark lime
#define COLOR_MAROON 0x800000AA
#define COLOR_OLIVE 0x808000AA
#define COLOR_ORANGERED 0xFF4500AA
#define COLOR_SPRINGGREEN 0x00FF7FAA
#define COLOR_TOMATO 0xFF6347AA
#define COLOR_YELLOWGREEN 0x9ACD32AA //- like military green
#define COLOR_MEDIUMAQUA 0x83BFBFAA
#define COLOR_MEDIUMMAGENTA 0x8B008BAA // dark magenta
#define COLOR_BLUE 0x0000FFFF
#define COLOR_NAVY 0x00FBFFAA
#define COLOR_DARKNAVY	0x006566AA
#define COLOR_LIGHTNAVY	0x8FFDFFAA

new gBotID[MAX_BOTS],
	gGroupID,

	serverstarted[20];

	//KEY[256],
	//VALUE[256];

enum player_enum
{
	spawned,
	muted,
	spamprotection,
	spamcount,
	HANDLEID_GLOBAL
};

static player[MAX_PLAYERS][player_enum];

new eightball[54][128] = {
	"Yes",
	"Maybe",
	"of course",
	"Are you crazy?!?!",
	"How should I know?",
	"As far as you know yeah!",
	"Why should i tell you!",
	"If i say yes will you shut up?",
	"i no spik engrisch",
	"Ummmm...... no",
	"I doubt it",
 	"Ask again later",
    "Not a chance",
    "As I see it, yes",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "It is certain",
    "It is decidedly so",
    "Most likely",
    "My reply is no",
    "My sources say no",
    "Outlook good",
    "Outlook not so good",
    "Reply hazy, try again",
    "Signs point to yes",
    "Very doubtful",
    "Without a doubt",
    "Yes",
    "Yes - definitely",
    "No",
    "You may rely on it",
    "Do I Look Like I Care?",
    "Yeah, Right",
    "Ask a better question",
    "Well, 3 years, 14 days, 9 hours, 32 minutes, and some odd seconds...wait, what was the question?",
    "zzzZZZzzz",
    "screw off, ask later",
    "HELL NO!",
    "how the hell should i know?",
    "penis!",
    "ah too drunk, i'll just say yes....",
    "SCREW OFF YOU SMELL",
    "Why the hell not? sure!",
    "01110101010101100001100101001000100100011001011001111010100100001001000010010",
    "Give me a cookie and I will say yes",
    "Thats what she said",
    "I'm to lazy to choose",
    "ohhhhhhh..... shiny.....",
    "Hello, is this thing on? I said NO!",
    "ask again.. ah never",
    "uh no frigging way",
    "Your mommy said no"
};

/*
	When the filterscript is loaded, two bots will connect and a group will be
	created for them.
*/

public OnFilterScriptInit()
{
	gBotID[0] = IRC_Connect(IRC_SERVER, IRC_PORT, BOT_1_NICKNAME, BOT_1_REALNAME, BOT_1_USERNAME); 	// Connect the first bot
	IRC_SetIntData(gBotID[0], E_IRC_CONNECT_DELAY, 5); 	// Set the connect delay to 5 seconds
	gBotID[1] = IRC_Connect(IRC_SERVER, IRC_PORT, BOT_2_NICKNAME, BOT_2_REALNAME, BOT_2_USERNAME); 	// Connect the second bot
	IRC_SetIntData(gBotID[1], E_IRC_CONNECT_DELAY, 10);	// Set the connect delay to 10 seconds
	gGroupID = IRC_CreateGroup();	// Create a group (the bots will be added to it upon connect)

	UpTime();
   	new ye, mo, da, h, m, s;
   	getdate(ye, mo, da);
   	gettime(h, m, s);
   	format(serverstarted, sizeof(serverstarted), "%d/%02d/%d - %02d:%02d", da, mo, ye, h, m);
	
	mysql_debug(0);
	mysqlConnection = mysql_connect(MYSQL_IP, MYSQL_USER, MYSQL_DB, MYSQL_PASSWORD);
	if (mysql_ping(mysqlConnection) == -1)
	{
        mysql_reconnect(mysqlConnection);
        if (mysql_ping(mysqlConnection) == -1)
		{
	    	mysql_close(mysqlConnection);
	        mysqloffline = true;
     		printlog("MYSQL", "Could not connect to MySQL database! Starting offline (IRC fs). (Code #1)");
	   	} else printlog("MYSQL", "Succesful reconnect to MySQL database (IRC fs).");
	} else printlog("MYSQL", "Succesfully connected to MySQL database (IRC fs).");
	return 1;
}

/*
	When the filterscript is unloaded, the bots will disconnect, and the group
	will be destroyed.
*/

public OnFilterScriptExit()
{
	//mysql_close(mysqlConnection); // already defined in gamemode

	IRC_Quit(gBotID[0], "-> Exit"); 	// Disconnect the first bot
	IRC_Quit(gBotID[1], "-> Exit"); 	// Disconnect the second bot
	IRC_DestroyGroup(gGroupID); 	// Destroy the group
	return 1;
}

/*
	The standard SA-MP callbacks are below. We will echo a few of them to the
	IRC channel.
*/

public OnPlayerConnect(playerid)
{
	new joinMsg[128],
		name[24],
		ip[16];

	GetPlayerName(playerid, name, sizeof(name));
	format(joinMsg, sizeof(joinMsg), "02[%d] 03*** %s has joined the server.", playerid, name);
	IRC_GroupSay(gGroupID, IRC_CHANNEL, joinMsg);

	GetPlayerIp(playerid, ip, sizeof(ip));
	rdns(ip, playerid);

	player[playerid][spawned] = 0;
	player[playerid][HANDLEID_GLOBAL] = -1;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (IsPlayerNPC(playerid))
	return 1;

	new
		leaveMsg[128],
		name[24],
		reasonMsg[20];

	switch(reason)
	{
		case 0: reasonMsg = "7Timeout3";
		case 1: reasonMsg = "Leaving";
		case 2: reasonMsg = "4Kicked/Banned3";
	}
	GetPlayerName(playerid, name, sizeof(name));
	format(leaveMsg, sizeof(leaveMsg), "02[%d] 03*** %s has left the server. (%s)", playerid, name, reasonMsg);
	IRC_GroupSay(gGroupID, IRC_CHANNEL, leaveMsg);
	return 1;
}

public OnReverseDNS(ip[], host[], extra)
{
	if (extra != -1)
	{
		if (extra < MAX_PLAYERS*2)
		{
			new rMsg[205],
				name[24],
				country[35],
				mysqlStr[125];

			GetCountryName(ip, country, sizeof(country));
			if (IsPlayerConnected(extra))
			{
				GetPlayerName(extra, name, sizeof(name));
				format(rMsg, sizeof(rMsg), "[%d] %s's IP: %s | Host: %s | Country: %s", extra, name, ip, host, country);
				SendMessageToAdmins(COLOR_LIGHTBLUE, rMsg, 2);
			} else {
				name = "RSK_ERROR";
			}
			format(rMsg, sizeof(rMsg), "2[%d]4 %s's IP:7 %s 11| 4Host:7 %s 11| 4Country:7 %s", extra, name, ip, host, country);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, rMsg);

		    mysql_real_escape_string(name, name);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_name` = '%s' AND `ip_connect_ip` = '%s' LIMIT 1", name, ip);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_LogPlayerAccount", "isss", extra, name, ip, host);

			mysql_run_query(mysqlConnection, "SELECT `host_name` FROM "MYSQL_TABLE_HOSTBANS"", true, "QS_CheckPlayerBlacklist", "iis", extra, GetPlayerCinc(extra), host);
		} else { // checking a player who is offline
		    extra -= MAX_PLAYERS*2;
		    
			new rMsg[205],
				name[24],
				country[35] = "Unknown";

			if (IsPlayerConnected(extra)) GetPlayerName(extra, name, sizeof(name));
			else name = "RSK_ERROR";

			GetCountryName(ip, country, sizeof(country));
			format(rMsg, sizeof(rMsg), "2[%d]4 %s's IP:7 %s 11| 4Host:7 %s 11| 4Last seen: 7Now online 11| 4Country:7 %s", extra, name, ip, host, country);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, rMsg);
			format(rMsg, sizeof(rMsg), "[%d] %s's IP: %s | Host: %s | Last seen: Now online | Country: %s", extra, name, ip, host, country);
			SendMessageToAdmins(COLOR_LIGHTBLUE, rMsg, 2);
		}
	}
	return 1;
}

public OnPlayerFloodControl(playerid, iCount, iTimeSpan)
{
    if(iCount > 3 && iTimeSpan < 10000) // player joins 3 times in 10 seconds
	{
	    //if (IsPlayerNPC(playerid) || !IsPlayerConnected(playerid))
	    if (!IsPlayerConnected(playerid))
	    return 1;
	
		new rMsg[75],
			name[24];
			
	    GetPlayerName(playerid, name, sizeof(name));
		format(rMsg, sizeof(rMsg),"4,1Server: Banned %s. (Reason: Possible bot)", name);
		IRC_GroupSay(gGroupID, IRC_CHANNEL, rMsg);
		format(rMsg, sizeof(rMsg),"Server: Banned %s. (Reason: Possible bot)", name);
		SendClientMessageToAll(COLOR_RED, rMsg);
		printlog("KICK-A", rMsg);
		BanEx(playerid, rMsg);
    }
    return 1;
}

public OnDNS(host[], ip[], extra)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	player[playerid][spawned] = 1;
	player[playerid][muted] = 0;
	player[playerid][spamprotection] = 0;
	player[playerid][spamcount] = 0;
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if (player[playerid][muted] == 0)
	{
		new msg[128], killerName[24], reasonMsg[32], playerName[24];
		GetPlayerName(killerid, killerName, sizeof(killerName));
		GetPlayerName(playerid, playerName, sizeof(playerName));
		if (killerid != INVALID_PLAYER_ID)
		{
			switch (reason)
			{
				case 0: reasonMsg = "Unarmed";
				case 1: reasonMsg = "Brass Knuckles";
				case 2: reasonMsg = "Golf Club";
				case 3: reasonMsg = "Night Stick";
				case 4: reasonMsg = "Knife";
				case 5: reasonMsg = "Baseball Bat";
				case 6: reasonMsg = "Shovel";
				case 7: reasonMsg = "Pool Cue";
				case 8: reasonMsg = "Katana";
				case 9: reasonMsg = "Chainsaw";
				case 10: reasonMsg = "Dildo";
				case 11: reasonMsg = "Dildo";
				case 12: reasonMsg = "Vibrator";
				case 13: reasonMsg = "Vibrator";
				case 14: reasonMsg = "Flowers";
				case 15: reasonMsg = "Cane";
				case 22: reasonMsg = "Pistol";
				case 23: reasonMsg = "Silenced Pistol";
				case 24: reasonMsg = "Desert Eagle";
				case 25: reasonMsg = "Shotgun";
				case 26: reasonMsg = "Sawn-off Shotgun";
				case 27: reasonMsg = "Combat Shotgun";
				case 28: reasonMsg = "MAC-10";
				case 29: reasonMsg = "MP5";
				case 30: reasonMsg = "AK-47";
				case 31:
				{
					if (GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
					{
						switch (GetVehicleModel(GetPlayerVehicleID(killerid)))
						{
							case 447:
							{
								reasonMsg = "Sea Sparrow Machine Gun";
							}
							default:
							{
								reasonMsg = "M4";
							}
						}
					}
					else
					{
						reasonMsg = "M4";
					}
				}
				case 32: reasonMsg = "TEC-9";
				case 33: reasonMsg = "Country Rifle";
				case 34: reasonMsg = "Sniper Rifle";
				case 37: reasonMsg = "Fire";
				case 38:
				{
					if (GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
					{
						switch(GetVehicleModel(GetPlayerVehicleID(killerid)))
						{
							case 425:
							{
								reasonMsg = "Hunter Machine Gun";
							}
							default:
							{
								reasonMsg = "Minigun";
							}
						}
					}
					else
					{
						reasonMsg = "Minigun";
					}
				}
				case 41: reasonMsg = "Spray Can";
				case 42: reasonMsg = "Fire Extinguisher";
				case 49: reasonMsg = "Vehicle Collision";
				case 50:
				{
					if (GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
					{
						switch(GetVehicleModel(GetPlayerVehicleID(killerid)))
						{
							case 417, 425, 447, 465, 469, 487, 488, 497, 501, 548, 563:
							{
								reasonMsg = "Helicopter Blades";
							}
							default:
							{
								reasonMsg = "Vehicle Collision";
							}
						}
					}
					else
					{
						reasonMsg = "Vehicle Collision";
					}
				}
				case 51:
				{
					if (GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
					{
						switch(GetVehicleModel(GetPlayerVehicleID(killerid)))
						{
							case 425:
							{
								reasonMsg = "Hunter Rockets";
							}
							case 432:
							{
								reasonMsg = "Rhino Turret";
							}
							case 520:
							{
								reasonMsg = "Hydra Rockets";
							}
							default:
							{
								reasonMsg = "Explosion";
							}
						}
					}
					else
					{
						reasonMsg = "Explosion";
					}
				}
				default:
				{
					reasonMsg = "Unknown";
				}
			}
			format(msg, sizeof(msg), "04*** %s killed %s. (%s)", killerName, playerName, reasonMsg);
		}
		else
		{
			switch (reason)
			{
				case 53: format(msg, sizeof(msg), "04*** %s died. (Drowned)", playerName);
				case 54: format(msg, sizeof(msg), "04*** %s died. (Collision)", playerName);
				default: format(msg, sizeof(msg), "04*** %s died.", playerName);
			}
		}
		IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
		SpamProtection(playerid);
	}
	return 1;
}

stock TimeStamp()
{
	new time = GetTickCount() / 1000;
	return time;
}

stock SpamProtection(playerid)
{
	if (player[playerid][spamcount] == 0) { player[playerid][spamprotection] = TimeStamp(); }

    player[playerid][spamcount]++;
	if (TimeStamp() - player[playerid][spamprotection] > SPAM_TIMELIMIT)
	{
		player[playerid][spamcount] = 1;
		player[playerid][spamprotection] = TimeStamp();
	}
	else if (player[playerid][spamcount] == SPAM_MAX_MSGS)
	{
		player[playerid][muted] = 1;
		
		new playername[24], logstring[128];
	    GetPlayerName(playerid, playername, sizeof(playername));
		format(logstring, sizeof(logstring),"Server: Possible fake-kill hack detected for %s (%d).", playername, playerid);
		SendMessageToAdmins(COLOR_RED, logstring, 1);
		printlog("SPAM-MI", logstring);

		format(logstring, sizeof(logstring),"8,1Server: Possible fake-kill hack detected for %s (%d).", playername, playerid);
		IRC_GroupSay(gGroupID, IRCOP_CHANNEL, logstring);
		SetTimerEx("SpamUnmute", 60000, 0, "i", playerid);
	}
 	return 1;
}

forward SpamUnmute(playerid);
public SpamUnmute(playerid)
{
	if (player[playerid][muted] == 0) return 1;
	
	player[playerid][muted] = 0;
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public Audio_OnStop(playerid, handleid)
{
	if (handleid == player[playerid][HANDLEID_GLOBAL]) player[playerid][HANDLEID_GLOBAL] = -1;
	return 1;
}

/*
	The IRC callbacks are below. Many of these are simply derived from parsed
	raw messages received from the IRC server. They can be used to inform the
	bot of new activity in any of the channels it has joined.
*/

/*
	This callback is executed whenever a bot successfully connects to an IRC
	server.
*/

public IRC_OnConnect(botid, ip[], port)
{
	//printf("*** IRC_OnConnect: Bot ID %d connected to %s:%d", botid, ip, port);
	IRC_JoinChannel(botid, IRC_CHANNEL); 	// Join the channel
	IRC_AddToGroup(gGroupID, botid); 	// Add the bot to the group

	if (botid == gBotID[0])
	{
		IRC_SendRaw(botid, "PRIVMSG NICKSERV IDENTIFY " BOT_1_PASSWORD);
		IRC_SetMode(botid, BOT_1_NICKNAME, "+B");
	}
	else if (botid == gBotID[1])
	{
		IRC_SendRaw(botid, "PRIVMSG NICKSERV IDENTIFY " BOT_2_PASSWORD);
		IRC_SetMode(botid, BOT_2_NICKNAME, "+B");
	}
	return 1;
}

/*
	This callback is executed whenever a current connection is closed. The
	plugin may automatically attempt to reconnect per user settings. IRC_Quit
	may be called at any time to stop the reconnection process.
*/

public IRC_OnDisconnect(botid, ip[], port, reason[])
{
	//printf("*** IRC_OnDisconnect: Bot ID %d disconnected from %s:%d (%s)", botid, ip, port, reason);
	// Remove the bot from the group
	IRC_RemoveFromGroup(gGroupID, botid);
	return 1;
}

/*
	This callback is executed whenever a connection attempt begins. IRC_Quit may
	be called at any time to stop the reconnection process.
*/

public IRC_OnConnectAttempt(botid, ip[], port)
{
	//printf("*** IRC_OnConnectAttempt: Bot ID %d attempting to connect to %s:%d...", botid, ip, port);

	//WriteIrcLog("Bot attempting to connect.");
	return 1;
}

/*
	This callback is executed whenever a connection attempt fails. IRC_Quit may
	be called at any time to stop the reconnection process.
*/

public IRC_OnConnectAttemptFail(botid, ip[], port, reason[])
{
	//printf("*** IRC_OnConnectAttemptFail: Bot ID %d failed to connect to %s:%d (%s)", botid, ip, port, reason);
	
	new cmdlog[128];
	format(cmdlog, sizeof(cmdlog), "Bot %d failed to connect. (%s)", botid, reason);
	WriteIrcLog(cmdlog);
	return 1;
}

WriteIrcLog(string[])
{
	new File:file,
		ye, mo, da,
		ho, mi, se,
		strlog[128];

	getdate(ye, mo, da);
	gettime(ho, mi, se);

	format(strlog, sizeof(strlog), "\r\n[%d-%02d-%02d] [%02d:%02d:%02d] %s", ye, mo, da, ho, mi, se, string);
	if (!fexist("irc_log.txt"))
	{
		file = fopen("irc_log.txt", io_write);
		if (file)
		{
			fwrite(file, strlog);
			fclose(file);
		}
	} else {
		file = fopen("irc_log.txt", io_append);
		if (file)
		{
			fwrite(file, strlog);
			fclose(file);
		}
	}
	return 1;
}

/*
	This callback is executed whenever a bot joins a channel.
*/

public IRC_OnJoinChannel(botid, channel[])
{
	//printf("*** IRC_OnJoinChannel: Bot ID %d joined channel %s", botid, channel);
	IRC_Say(botid, channel, "relax, take it easy.");
	return 1;
}

/*
	This callback is executed whenevever a bot leaves a channel.
*/

public IRC_OnLeaveChannel(botid, channel[], message[])
{
	//printf("*** IRC_OnLeaveChannel: Bot ID %d left channel %s (%s)", botid, channel, message);
	return 1;
}

/*
	This callback is executed whenevever a bot is kicked from a channel. If the
	bot cannot immediately rejoin the channel (in the event, for example, that
	the bot is kicked and then banned), you might want to set up a timer here
	for rejoin attempts.
*/

public IRC_OnKickedFromChannel(botid, channel[], oppeduser[], oppedhost[], message[])
{
	//printf("*** IRC_OnKickedFromChannel: Bot ID %d kicked by %s (%s) from channel %s (%s)", botid, oppeduser, oppedhost, channel, message);
	IRC_JoinChannel(botid, channel);
	return 1;
}

public IRC_OnUserDisconnect(botid, user[], host[], message[])
{
	//printf("*** IRC_OnUserDisconnect (Bot ID %d): User %s (%s) disconnected (%s)", botid, user, host, message);
	
	if (botid == gBotID[0])
	{
		new uMsg[128];

		format(uMsg, sizeof(uMsg), "[IRC] %s has quit (%s).", user, host);
		SendClientMessageToAll(COLOR_WHITE, uMsg);
	}
	return 1;
}

public IRC_OnUserJoinChannel(botid, channel[], user[], host[])
{
	//printf("*** IRC_OnUserJoinChannel (Bot ID %d): User %s (%s) joined channel %s", botid, user, host, channel);

	if (botid == gBotID[0] && !strcmp(channel, IRC_CHANNEL))
	{
	    new mysqlStr[106],
			uMsg[128];

	    mysql_real_escape_string(user, user);
	 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_MEMOS" WHERE `memo_target` = '%s' AND `memo_read` = 0", user);
		mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerMemos", "s", user);

		format(uMsg, sizeof(uMsg), "[IRC] %s has joined %s (%s).", user, channel, host);
		SendClientMessageToAll(COLOR_WHITE, uMsg);
	}
	return 1;
}

public IRC_OnUserLeaveChannel(botid, channel[], user[], host[], message[])
{
	//printf("*** IRC_OnUserLeaveChannel (Bot ID %d): User %s (%s) left channel %s (%s)", botid, user, host, channel, message);
	
	if (botid == gBotID[0] && !strcmp(channel, IRC_CHANNEL))
	{
		new uMsg[128];

		format(uMsg, sizeof(uMsg), "[IRC] %s has left %s (%s).", user, channel, host);
		SendClientMessageToAll(COLOR_WHITE, uMsg);
	}
	return 1;
}

public IRC_OnUserKickedFromChannel(botid, channel[], kickeduser[], oppeduser[], oppedhost[], message[])
{
	//printf("*** IRC_OnUserKickedFromChannel (Bot ID %d): User %s kicked by %s (%s) from channel %s (%s)", botid, kickeduser, oppeduser, oppedhost, channel, message);

	if (botid == gBotID[0])
	{
		new uMsg[128];

		format(uMsg, sizeof(uMsg), "[IRC] %s was kicked from channel %s.", kickeduser, channel);
		SendClientMessageToAll(COLOR_WHITE, uMsg);
	}
	return 1;
}

public IRC_OnUserNickChange(botid, oldnick[], newnick[], host[])
{
	//printf("*** IRC_OnUserNickChange (Bot ID %d): User %s (%s) changed his/her nick to %s", botid, oldnick, host, newnick);

	if (botid == gBotID[0])
	{
		new uMsg[128];

		format(uMsg, sizeof(uMsg), "[IRC] %s is now known as %s (%s).", oldnick, newnick, host);
		SendClientMessageToAll(COLOR_WHITE, uMsg);
	}
	return 1;
}

public IRC_OnUserSetChannelMode(botid, channel[], user[], host[], mode[])
{
	//printf("*** IRC_OnUserSetChannelMode (Bot ID %d): User %s (%s) on %s set mode: %s", botid, user, host, channel, mode);
	return 1;
}

public IRC_OnUserSetChannelTopic(botid, channel[], user[], host[], topic[])
{
	//printf("*** IRC_OnUserSetChannelTopic (Bot ID %d): User %s (%s) on %s set topic: %s", botid, user, host, channel, topic);
	return 1;
}

public IRC_OnUserSay(botid, recipient[], user[], host[], message[])
{
	//printf("*** IRC_OnUserSay (Bot ID %d): User %s (%s) sent message to %s: %s", botid, user, host, recipient, message);
	
	// Someone sent the first bot a private message
	if (!strcmp(recipient, BOT_1_NICKNAME) || !strcmp(recipient, BOT_2_NICKNAME))
	{
		//IRC_Say(botid, user, "You sent me a PM!");
		
		new command[10],
		    parameter[128];

		if (sscanf(message, "s[10]s[128]", command, parameter))
		//return IRC_Notice(botid, user, "13>> Hello, how can I help you? (Available commands: identify PASSWORD)");
		{
			new cmdlog[150];
			format(cmdlog, sizeof(cmdlog), "%s (%s) tried to issue an IRC command: %s", user, host, command);
			WriteIrcLog(cmdlog);
			return 1;
		}

		if (!strcmp(command, "identify", true))
		{
			if (mysqloffline)
			return 0; // database offline

		    if (strlen(parameter) < 5 || strlen(parameter) > 30)
		    return 1;
			//return IRC_Notice(botid, user, "4>> USAGE: identify PASSWORD");

		    new password[129],
				mysqlStr[255];

		    WP_Hash(password, sizeof(password), parameter);
		    mysql_real_escape_string(user, user);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_ACCOUNTS" WHERE `account_name` = '%s' AND `account_password` = '%s' LIMIT 1", user, password);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_LoginUserAccount", "si", user, botid);
		} else if (!strcmp(command, "raw", true))
		{
			if (IRC_IsOwner(botid, IRC_CHANNEL, user))
			{
				new BotID,
					rawcommand[100];

				if (sscanf(parameter, "is[100]", BotID, rawcommand))
				return IRC_Notice(botid, user, "4>> ERROR: RAW <botID> <command>");

				if (strcmp(command, "exit", true) != 0 && strcmp(command, "quit", true) != 0) // Bad commands
				{
					new
						msg[128];

					format(msg, sizeof(msg), "RAW command %s has been executed.", rawcommand);
					IRC_Say(botid, user, msg);
					IRC_SendRaw(BotID, rawcommand);
				}
			}
		} else if (!strcmp(command, "rcon", true))
		{
			if (IRC_IsOwner(botid, IRC_CHANNEL, user))
			{
				new rconcommand[100];

				if (sscanf(parameter, "s[100]", rconcommand))
				return IRC_Notice(botid, user, "4>> ERROR: RCON <command>");

				if (strcmp(rconcommand, "reloadfs irc", true) != 0) // Bad commands
				{
					new
						msg[128];
					format(msg, sizeof(msg), "RCON command %s has been executed.", rconcommand);
					IRC_Say(botid, user, msg);
					SendRconCommand(rconcommand);
					printlog("IRCON", msg);
				}
			}
		}
		new cmdlog[150];
		format(cmdlog, sizeof(cmdlog), "%s (%s) issues IRC command: %s", user, host, command);
		WriteIrcLog(cmdlog);
	}
	return 1;
}

public IRC_OnUserNotice(botid, recipient[], user[], host[], message[])
{
	//printf("*** IRC_OnUserNotice (Bot ID %d): User %s (%s) sent notice to %s: %s", botid, user, host, recipient, message);
	// Someone sent the second bot a notice (probably a network service)
	return 1;
}

public IRC_OnUserRequestCTCP(botid, user[], host[], message[])
{
	//printf("*** IRC_OnUserRequestCTCP (Bot ID %d): User %s (%s) sent CTCP request: %s", botid, user, host, message);
	// Someone sent a CTCP VERSION request
	if (!strcmp(message, "VERSION"))
	{
		IRC_ReplyCTCP(botid, user, "VERSION SA-MP IRC Plugin v" #PLUGIN_VERSION "");
	}
	else if (!strcmp(message, "PING"))
	{
		IRC_ReplyCTCP(botid, user, "PING PONG!");
	}
	else if (!strcmp(message, "FINGER"))
	{
		IRC_ReplyCTCP(botid, user, "FINGER Stop fingering me, you pervert!");
	}
	else if (!strcmp(message, "TIME"))
	{
		IRC_ReplyCTCP(botid, user, "TIME 1 January 1999 - 15:32 (3:32pm)");
	}
	return 1;
}

public IRC_OnUserReplyCTCP(botid, user[], host[], message[])
{
	//printf("*** IRC_OnUserReplyCTCP (Bot ID %d): User %s (%s) sent CTCP reply: %s", botid, user, host, message);
	return 1;
}

/*
	This callback is useful for logging, debugging, or catching error messages
	sent by the IRC server.
*/

public IRC_OnReceiveRaw(botid, message[])
{
	//WriteIrcLog(message);
	return 1;
}

public OnQueryError(errorid, error[], callback[], query[], connectionHandle)
{
	new errorStr[325],
  		File:file,
		ye, mo, da,
		ho, mi, se;

	getdate(ye, mo, da);
	gettime(ho, mi, se);

	if (!fexist("mysql_log.txt"))
	{
		file = fopen("mysql_log.txt", io_write);
		if (file)
		{
			format(errorStr, sizeof(errorStr), "\r\n[%d-%02d-%02d] [%02d:%02d:%02d] Error (%d): %s", ye, mo, da, ho, mi, se, errorid, error);
			fwrite(file, errorStr);
			format(errorStr, sizeof(errorStr), "\r\n[%d-%02d-%02d] [%02d:%02d:%02d] Query: %s", ye, mo, da, ho, mi, se, query);
			fwrite(file, errorStr);
			fclose(file);
		}
	} else {
		file = fopen("mysql_log.txt", io_append);
		if (file)
		{
			format(errorStr, sizeof(errorStr), "\r\n[%d-%02d-%02d] [%02d:%02d:%02d] Error (%d): %s", ye, mo, da, ho, mi, se, errorid, error);
			fwrite(file, errorStr);
			format(errorStr, sizeof(errorStr), "\r\n[%d-%02d-%02d] [%02d:%02d:%02d] Query: %s", ye, mo, da, ho, mi, se, query);
			fwrite(file, errorStr);
			fclose(file);
		}
	}
	//print(errorStr);
	format(errorStr, sizeof(errorStr), "OnQueryError (%d): %s", errorid, error);
	IRC_GroupSayEx(gGroupID, "&", IRC_CHANNEL, errorStr);

	switch(errorid)
	{
		case CR_COMMAND_OUT_OF_SYNC:
		{
			printf("Commands out of sync for threaded query: %s", query);
			printlog("MYSQL-E", "Commands out of sync. (Code #2)");
		}
		case ER_SYNTAX_ERROR:
		{
			printf("Something is wrong in your syntax, query: %s", query);
			printlog("MYSQL-E", "Something is wrong in your syntax. (Code #2)");
		}
		case 1040, 1041, 1154, 1203, 1226: // 2003
		{
		    if (mysqloffline == true)
		    return 1;
		
	    	mysql_close(mysqlConnection);
	        mysqloffline = true;
     		printlog("MYSQL-E", "Could not connect to MySQL database! Starting offline (IRC fs). (Code #2)");
  			printf("%s, query: %s", error, query);
		}
	}
	printlog("MYSQL-E", error);
	printlog("MYSQL-E", query);
	return 1;
}

/*
	Some examples of channel commands are here. You can add more very easily;
	their implementation is identical to that of ZeeX's zcmd.
*/

/* ----------------------------------FUN COMMANDS---------------------------------------*/
IRCCMD:gay(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new gname[24];
		if (!sscanf(params, "s[24] ", gname))
	    {
		    new upStr[128],
				gayPer = random(101);

        	format(upStr, sizeof(upStr), "13,8 %s is %d%% gay!", gname, gayPer);
			IRC_GroupSay(gGroupID, channel, upStr);
		}
	}
	return 1;
}

IRCCMD:match(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new gname[24],
			gname2[24];
		if (!sscanf(params, "s[24]s[24] ", gname, gname2))
	    {
		    new upStr[128],
				lovePer = random(101),
				lovesign[8];

			if (lovePer < 50) lovesign = "1</34";
			else lovesign = "13<33";
		    format(upStr, sizeof(upStr), "7[13Love10Match7]4 %s + %s 12=4 %d%% %s", gname, gname2, lovePer, lovesign);
			IRC_GroupSay(gGroupID, channel, upStr);
		}
	}
	return 1;
}

IRCCMD:greasy(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		if (!isnull(params))
	    {
			IRC_GroupSay(gGroupID, channel, eightball[random(54)]);
		}
	}
	return 1;
}

IRCCMD:owned(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		IRC_GroupSay(gGroupID, channel, "4,6øWñêÐ7,12øWñêÐ8,11øWñêÐ9,3øWñêÐ11,8øWñêÐ12,7øWñêÐ6,4øWñêÐ");
	}
	return 1;
}

IRCCMD:fail(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		IRC_GroupSay(gGroupID, channel, "4,6FåîL7,12FåîL8,11FåîL9,3FåîL11,8FåîL12,7FåîL6,4FåîL");
	}
	return 1;
}
/* -------------------------------END FUN COMMANDS--------------------------------------*/

IRCCMD:help(botid, channel[], user[], host[], params[])
{
	if (IRC_IsVoice(botid, channel, user))
	IRC_GroupNotice(gGroupID, user, "7[4+7]10 !msg | players | va");

	if (IRC_IsHalfop(botid, channel, user))
	IRC_GroupNotice(gGroupID, user, "7[4%7]10 !server | uptime | v | pm | memo | countries 5IRC: !gay | match | greasy | owned | fail");

	if (IRC_IsOp(botid, channel, user))
	IRC_GroupNotice(gGroupID, user, "7[4@7]10 !say | a | announce | slap | kill | explode | fakemsg|irc | info | ip/host/namematch(2) | kick | ban | 5IRC: !stfu");

	if (IRC_IsProtect(botid, channel, user))
	IRC_GroupNotice(gGroupID, user, "7[4&7]10 !(un)banip | (un)banhost | setname | asay | echo | play/splay/pause/resume");

	if (IRC_IsOwner(botid, channel, user))
	IRC_GroupNotice(gGroupID, user, "7[4~7]10 !rcon 5IRC: !identify|raw(2)");
	return 1;
}

IRCCMD:msg(botid, channel[], user[], host[], params[])
{
	if (IRC_IsVoice(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(user) + strlen(params) > 119)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");
		
			new
				msg[135],
				pos = -1;
			while (params[++pos]) // Search for an illegal character
			{
				if (params[pos] == '%')
				{
					params[pos] = ' ';
				}
			}
			format(msg, sizeof(msg), "3 %s on 7IRC3: %s", user, params);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
			format(msg, sizeof(msg), "%s on IRC: %s", user, params);
			SendClientMessageToAll(COLOR_LIGHTNAVY, msg);
			printlog("IRC", msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MSG <message>");
	}
	return 1;
}

IRCCMD:players(botid, channel[], user[], host[], params[])
{
	if (IRC_IsVoice(botid, channel, user))
	{
		new pStr[425],
			name[24],
			Players = 0;

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && !IsPlayerNPC(i)) Players++;

		if (!Players)
		{
			IRC_GroupSay(gGroupID, channel, "3Players Online [0]: None");
			goto npcpart;
		}

		format(pStr, sizeof(pStr), "3Players Online [%d]: ", Players);
		Players = 0;
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && !IsPlayerNPC(i))
			{
			    GetPlayerName(i, name, sizeof(name));
				strcat(pStr, name);
				strcat(pStr, " ");
				Players++;

				if (Players == MAX_PLAYERS_ON_LINE)
				{
				    if (i == MAX_PLAYERS-1)
				    {
  						IRC_GroupSay(gGroupID, channel, pStr);
  						goto npcpart;
				    } else {
						IRC_GroupSay(gGroupID, channel, pStr);
					    pStr = "3";
					    Players = 0;
				    }
				}
			}
		}
		IRC_GroupSay(gGroupID, channel, pStr);
	}

	npcpart:
	if (IRC_IsOp(botid, channel, user))
	{
		new pStr[250],
			name[24],
			NPCs = 0;

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && IsPlayerNPC(i)) NPCs++;

		if (!NPCs)
		{
			IRC_GroupSayEx(gGroupID, "%", channel, "10N1P5C6's 3Online [0]: None");
			return 1;
		}

		format(pStr, sizeof(pStr), "10N1P5C6's 3Online [%d]: ", NPCs);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && IsPlayerNPC(i))
			{
			    GetPlayerName(i, name, sizeof(name));
				strcat(pStr, name);
				strcat(pStr, " ");
			}
		}
		IRC_GroupSayEx(gGroupID, "%", channel, pStr);
	}
	return 1;
}

IRCCMD:listeners(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new pStr[500],
			name[24],
			Listeners = 0;

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && Audio_IsClientConnected(i)) Listeners++;

		if (!Listeners)
		{
			IRC_GroupSay(gGroupID, channel, "3Listeners Online [0]: None");
			return 1;
		}

		format(pStr, sizeof(pStr), "3Listeners Online [%d]: ", Listeners);
		Listeners = 1;
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && Audio_IsClientConnected(i))
			{
			    GetPlayerName(i, name, sizeof(name));
				strcat(pStr, name);
				strcat(pStr, " ");
			    Listeners++;
			}
		}
		IRC_GroupSay(gGroupID, channel, pStr);
	}
	return 1;
}

IRCCMD:server(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
	    new upStr[210],
			hostname[50],
			mapname[24],
			version[10],
			maxnpc;

		GetServerVarAsString("hostname", hostname, sizeof(hostname));
		GetServerVarAsString("mapname", mapname, sizeof(mapname));
		GetServerVarAsString("version", version, sizeof(version));
		maxnpc = GetServerVarAsInt("maxnpc");

		format(upStr, sizeof(upStr), "[INFO] %s 11|1 Map: %s 11|1 Version: %s 11|1 Max Players: %d 11|1 Max NPC's: %d", hostname, mapname, version, GetMaxPlayers(), maxnpc);
		IRC_GroupSay(gGroupID, channel, upStr);
	}
	return 1;
}

IRCCMD:uptime(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
	    new upStr[128],
			h,
			m,
			s;

	    UpTime(h, m, s);
	    format(upStr, sizeof(upStr), "7Uptime:5 %d day(s) %d hrs %d min %d sec (%d seconds) [Started: %s]", h/24, h-(floatround(h/24)*24), m, s, UpTime(), serverstarted);
		IRC_GroupSay(gGroupID, channel, upStr);
	}
	return 1;
}

IRCCMD:va(botid, channel[], user[], host[], params[])
{
	if (IRC_IsVoice(botid, channel, user))
	{
		new vStr[300],
			name[24],
			VIPs = 0;

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && IsVIP(i) && !IsAdmin(i)) VIPs++;

		if (!VIPs)
		{
			IRC_GroupSay(gGroupID, channel, "3VIPs Online [0]: None");
			goto adminpart;
		}

		format(vStr, sizeof(vStr), "3VIPs Online [%d]: ", VIPs);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && IsVIP(i) && !IsAdmin(i))
			{
			    GetPlayerName(i, name, sizeof(name));
				strcat(vStr, name);
				strcat(vStr, " ");
			}
		}
		IRC_GroupSay(gGroupID, channel, vStr);
	}

	adminpart:
	if (IRC_IsOp(botid, channel, user))
	{
		new aStr[300],
			name[24],
			Admins = 0;

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && IsAdmin(i)) Admins++;

		if (!Admins)
		{
			IRC_GroupSayEx(gGroupID, "@", channel, "4Admins Online [0]: None");
			return 1;
		}

		format(aStr, sizeof(aStr), "4Admins Online [%d]: ", Admins);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && IsAdmin(i))
			{
			    GetPlayerName(i, name, sizeof(name));
			    format(aStr, sizeof(aStr), "%s%s (%d) ", aStr, name, GetPlayerAdminLevel(i));
			}
		}
		IRC_GroupSayEx(gGroupID, "@", channel, aStr);
	}
	return 1;
}

IRCCMD:say(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(user) + strlen(params) > 113)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");

			new msg[137],
				pos = -1;
			while (params[++pos]) // Search for an illegal character
			{
				if (params[pos] == '%')
				{
					params[pos] = ' ';
				}
			}
			format(msg, sizeof(msg), "12Admin %s on 7IRC12: %s", user, params);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
			format(msg, sizeof(msg), "Admin %s on IRC: %s", user, params);
			SendClientMessageToAll(COLOR_ORANGE, msg);
			printlog("IRC", msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !SAY <message>");
	}
	return 1;
}

IRCCMD:announce(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(params) > 100)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");

		    new msg[123],
				pos = -1;
			while (params[++pos]) // Search for an illegal character
			{
				if (params[pos] == '%' || params[pos] == ',' || params[pos] == ''')
				{
					params[pos] = ' ';
				}
			}

			if (!issafefortextdraw(params))
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: There seems to be an incorrect input of a tilde tag (~ symbol)!");
			
			format(msg, sizeof(msg), "~w~%s", params);
			GameTextForAll(msg, 5000, 3);
		    format(msg, sizeof(msg), "3*** Announcement: '%s'",params);
      		IRC_GroupSayEx(gGroupID, "@", channel, msg);
			printlog("IRC", msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !ANNOUNCE <message>");
	}
	return 1;
}

IRCCMD:slap(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new ID;
		if (sscanf(params, "u", ID))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !SLAP <name/id>");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new Float:rX,
				Float:rY,
				Float:rZ,
				name[24],
				msg[100];

			GetPlayerPos(ID, rX, rY, rZ);
			SetPlayerPos(ID, rX, rY, rZ+10);
			GetPlayerName(ID, name, sizeof(name));
			format(msg, sizeof(msg), "%s has been slapped by God.", name);
			SendClientMessageToAll(COLOR_YELLOW, msg);
		    format(msg, sizeof(msg), "6 %s has been slapped by God.", name);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
			
			for (new i = 0; i < MAX_PLAYERS; i++)
			{
			    if (IsPlayerConnected(i))
				PlayerPlaySound(i, 1190, 0.0, 0.0, 0.0);
			}
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:kill(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new ID;
		if (sscanf(params, "u", ID))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !KILL <name/id>");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new name[24],
				msg[100];

			SetPlayerHealth(ID, 0.0);
			GetPlayerName(ID, name, sizeof(name));
			format(msg, sizeof(msg), "[ADMIN-3]: %s has been killed by an IRC Administrator.", name);
			SendMessageToAdmins(COLOR_YELLOW, msg, 3);
		    format(msg, sizeof(msg), "6 %s has been killed by an IRC Administrator.", name);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:explode(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new ID;
		if (sscanf(params, "u", ID))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !EXPLODE <name/id>");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new Float:X,
		        Float:Y,
		        Float:Z,
				name[24],
				msg[100];

		    SetPlayerHealth(ID, 0.0);
			SetPlayerArmour(ID, 0.0);
		    GetPlayerPos(ID, X, Y, Z);
		    CreateExplosion(X, Y, Z, 10, 0);
		    CreateExplosion(X, Y, Z, 10, 0);
		    CreateExplosion(X, Y, Z, 10, 0);
		    GetPlayerName(ID, name, sizeof(name));
			format(msg, sizeof(msg), "[AMDIN-3]: %s has been exploded by an IRC Administrator.", name);
			SendMessageToAdmins(COLOR_YELLOW, msg, 3);
		    format(msg, sizeof(msg), "6 %s has been exploded by an IRC Administrator.", name);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:v(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(user) + strlen(params) > 116)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");

		    new string[132];
			format(string, sizeof(string), "[VIP-IRC] %s: %s", user, params);
			SendMessageToVIPs(COLOR_GREENYELLOW, string);

		    format(string, sizeof(string), "10[VIP-IRC] %s: %s", user, params);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, string);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !V <message>");
	}
	return 1;
}

IRCCMD:pm(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new ID,
			fmsg[100];

		if (sscanf(params, "us[100]", ID, fmsg))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !PM <name/id> <message>");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
			new name[24],
				PMmsg[128];

			GetPlayerName(ID, name, sizeof(name));
			
		    if (strlen(user) + strlen(name) + strlen(fmsg) > 110)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message is too long.");
			
   			format(PMmsg, sizeof(PMmsg), "<- [PM] %s on IRC: %s", user, fmsg);
	    	SendClientMessage(ID, 0xFFCC2299, PMmsg);

	   		format(PMmsg, sizeof(PMmsg), "[PM] %s (IRC) -> %s: %s", user, name, fmsg);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, PMmsg);

			SendMessageToAdmins(COLOR_BROWN, PMmsg, 3);
			printlog("ADM-MSG", PMmsg);

		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:memo(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
	    new command[5],
	        parameters[250];
	
		if (sscanf(params, "s[5] ", command))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO <send|read|list|del>");

		new mysqlStr[116];
			
		if (!strcmp(command, "send", true))
		{
			if (sscanf(params, "{s[5]}s[250]", parameters))
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO send <irc_user> <message>");

			new memo_target[24],
				memo_message[200];

			if (sscanf(parameters, "s[24]s[200]", memo_target, memo_message))
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO send <irc_user> <message>");

		    mysql_real_escape_string(memo_target, memo_target);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_MEMOS" WHERE `memo_target` = '%s' ORDER BY `memo_id` ASC", memo_target);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_SaveUserMemo", "isss", botid, user, memo_target, memo_message);
		} else if (!strcmp(command, "read", true))
		{
			new memo_id;

			if (sscanf(params, "{s[5]}d", memo_id))
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO read <memo_id>");

		    mysql_real_escape_string(user, user);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_MEMOS" WHERE `memo_target` = '%s' AND `memo_id` = %d LIMIT 1", user, memo_id-1);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_ReadUserMemo", "isi", botid, user, memo_id-1);
		} else if (!strcmp(command, "list", true))
		{
		    mysql_real_escape_string(user, user);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_MEMOS" WHERE `memo_target` = '%s' ORDER BY `memo_date` DESC", user);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_ListUserMemos", "is", botid, user);
		} else if (!strcmp(command, "del", true))
		{
			new memo_id;
				
			if (sscanf(params, "{s[5]}d", memo_id))
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO del <memo_id>");

		    mysql_real_escape_string(user, user);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_MEMOS" WHERE `memo_target` = '%s' AND `memo_id` = %d LIMIT 1", user, memo_id-1);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_RemoveUserMemo", "isi", botid, user, memo_id-1);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !MEMO <send|read|list|del>");
	}
	return 1;
}

IRCCMD:vehicles(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new fmsg[128];

	   	format(fmsg, sizeof(fmsg), "3There are currently %d vehicles.", CallRemoteFunction("GetVehicleAmount", ""));
		IRC_GroupSay(gGroupID, IRC_CHANNEL, fmsg);
	}
	return 1;
}

IRCCMD:vclear(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new fmsg[128];

		SendClientMessageToAll(COLOR_GREEN, "iVehicles cleared.");
	   	format(fmsg, sizeof(fmsg), "3 %d Vehicles cleared.", CallRemoteFunction("CallVCLEAR", ""));
		IRC_GroupSay(gGroupID, IRC_CHANNEL, fmsg);
	}
	return 1;
}

IRCCMD:veclear(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new fmsg[128];

		SendClientMessageToAll(COLOR_GREEN, "iEmpty Vehicles cleared.");
	   	format(fmsg, sizeof(fmsg), "3 %d Empty Vehicles cleared.", CallRemoteFunction("CallVECLEAR", ""));
		IRC_GroupSay(gGroupID, IRC_CHANNEL, fmsg);
	}
	return 1;
}

IRCCMD:jclear(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new fmsg[128];

	   	format(fmsg, sizeof(fmsg), "3 %d jetpacks cleared.", CallRemoteFunction("CallJCLEAR", ""));
		SendClientMessageToAll(COLOR_GREEN, "iJetpacks cleared.");
		IRC_GroupSay(gGroupID, IRC_CHANNEL, fmsg);
	}
	return 1;
}

IRCCMD:oclear(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		CallRemoteFunction("AllClearObjects2", "");
		SendClientMessageToAll(COLOR_GREEN, "iMaps cleared.");
		IRC_GroupSay(gGroupID, IRC_CHANNEL, "3 iMaps cleared.");
	}
	return 1;
}

IRCCMD:aclear(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new fmsg[128];

		CallRemoteFunction("AllClearObjects2", "");
	   	format(fmsg, sizeof(fmsg), "[INFO] %d Vehicles, %d Jetpacks and Maps cleared.", CallRemoteFunction("CallVCLEAR", ""), CallRemoteFunction("CallJCLEAR", ""));
		SendClientMessageToAll(COLOR_WHITE, fmsg);
		IRC_GroupSay(gGroupID, IRC_CHANNEL, fmsg);
	}
	return 1;
}

/*IRCCMD:countries(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new pStr[750],
			Countries = 0,
			pIP[16],
			pCountry[35];

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && !IsPlayerNPC(i)) Countries++; // not counting countries but players actually, just a pre-check

		if (!Countries)
		{
			IRC_GroupSay(gGroupID, channel, "6Connected countries [0]: None");
			return 1;
		}

		format(pStr, sizeof(pStr), "6Connected countries [%d]: 3", Countries);
		Countries = 0;
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && !IsPlayerNPC(i))
			{
				GetPlayerIp(i, pIP, sizeof(pIP));
				GetCountryName(pIP, pCountry, sizeof(pCountry));

				if (strfind(pStr, pCountry,true) !=-1 )
				{
					Countries++;
					continue;
				}

				strcat(pStr, pCountry);
				strcat(pStr, "4;3 ");
			}
		}
		IRC_GroupSay(gGroupID, channel, pStr);
	}
	return 1;
}*/

IRCCMD:countries(botid, channel[], user[], host[], params[])
{
	if (IRC_IsHalfop(botid, channel, user))
	{
		new pStr[750],
			Countries = 0,
			pIP[16],
			pCountry[35];

		for(new i = 0; i < MAX_PLAYERS; i++)
		if (IsPlayerConnected(i) && !IsPlayerNPC(i)) Countries++; // not counting countries but players actually, just a pre-check

		if (!Countries)
		{
			IRC_GroupSay(gGroupID, channel, "6Connected countries [0]: 3None");
			return 1;
		}

		pStr = "6Connected countries []:3";
		Countries = 0;
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && !IsPlayerNPC(i))
			{
				GetPlayerIp(i, pIP, sizeof(pIP));
				GetCountryName(pIP, pCountry, sizeof(pCountry));

				if (strfind(pStr, pCountry,true) !=-1)
				continue;
				
				Countries++;
				format(pStr, sizeof(pStr), "%s %s4;3", pStr, pCountry);
			}
		}
		new strCountries[3];
		valstr(strCountries, Countries);
		strins(pStr, strCountries, 23);
		IRC_GroupSay(gGroupID, channel, pStr);
	}
	return 1;
}

IRCCMD:a(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(user) + strlen(params) > 113)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");

		    new string[131];
			format(string, sizeof(string), "[ADMIN-IRC] %s: %s", user, params);
			SendMessageToAdmins(COLOR_RED, string, 1);

		    format(string, sizeof(string), "4[ADMIN-IRC] %s: %s", user, params);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, string);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !A <message>");
	}
	return 1;
}

IRCCMD:asay(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
		    if (strlen(params) > 128)
			return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message length is too long.");

		    new string[131];
			SendClientMessageToAll(COLOR_WHITE, params);
		    format(string, sizeof(string), "5 %s", params);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, string);
		} else IRC_GroupNotice(gGroupID, user, "4>> SYNTAX: !ASAY <MESSAGE>");
	}
	return 1;
}

IRCCMD:echo(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user)) // Check if the user has at least op in the channel
	{
		new onoff[5];

		if (sscanf(params, "s[5] ", onoff))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !ECHO <on/off>");

		if (!strcmp(onoff, "on", true))
		{
			IRC_Say(botid, channel, "Echo enabled in echo channel.");
			IRC_SendRaw(botid, "mode "IRC_CHANNEL" -c");
		} else if (!strcmp(onoff, "off", true))
		{
			IRC_Say(botid, channel, "Echo disabled in echo channel.");
			IRC_SendRaw(botid, "mode "IRC_CHANNEL" +c");
		}
	}
	return 1;
}

IRCCMD:fakemsg(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new ID,
			fmsg[128];

		if (sscanf(params, "us[128]", ID, fmsg))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !FAKEMSG <name/id> <message>");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new name[24];
			GetPlayerName(ID, name, sizeof(name));

			SendPlayerMessageToAll(ID, fmsg);
   			CallRemoteFunction("OnPlayerText", "is", ID, fmsg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:fakeirc(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new fname[24],
			fmsg[100];

		if (sscanf(params, "s[24]s[100]", fname, fmsg))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !FAKEIRC <name/id> <message>");

   		if (strlen(fname) > 24)
   		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Name is too long. [MAX. 24]");

   		if (strlen(fmsg) > 100)
   		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Message is too long. [MAX. 100]");

		new msg[128];
		format(msg, sizeof(msg), "3 %s on 4f7IRC3: %s", fname, fmsg);
		IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
		printlog("IRC", msg);

		format(msg, sizeof(msg), " %s on IRC: %s", fname, fmsg);
		SendClientMessageToAll(COLOR_LIGHTNAVY, msg);
	}
	return 1;
}

IRCCMD:banip(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new	ip[16],
			reason[64];

		if (sscanf(params, "s[16]s[64]", ip, reason) || params[0] == '*')
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !BANIP IP REASON");

		if (!IsValidIP(ip))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: You must enter a valid IP address.");

		new mysqlStr[78];
		
	    mysql_real_escape_string(ip, ip);
	 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_BANS" WHERE `ban_ip` = '%s' LIMIT 1", ip);
		mysql_run_query(mysqlConnection, mysqlStr, true, "QS_BanPlayerIP", "sss", user, ip, reason);
	}
	return 1;
}

IRCCMD:unbanip(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new	ip[16];

		if (sscanf(params, "s[16] ", ip) || params[0] == '*')
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !UNBANIP <ip>");

		if (!IsValidIP(ip))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: You must enter a valid IP address.");

		new mysqlStr[78];
		
	    mysql_real_escape_string(ip, ip);
	 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_BANS" WHERE `ban_ip` = '%s' LIMIT 1", ip);
		mysql_run_query(mysqlConnection, mysqlStr, true, "QS_UnbanPlayerIP", "ss", user, ip);
	}
	return 1;
}

IRCCMD:banhost(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new	hostname[50],
			description[50];

		if (sscanf(params, "s[50]s[50]", hostname, description))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !BANHOST <host> <description>");

	    if (strlen(params) > 100)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message is too long.");

	    if (strlen(hostname) < 5 || strlen(description) < 5)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message is too short.");

		if (mysqloffline)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: MySQL is currently offline.");

		new mysqlStr[119];

	    mysql_real_escape_string(hostname, hostname);
	 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_HOSTBANS" WHERE `host_name` = '%s' LIMIT 1", hostname);
		mysql_run_query(mysqlConnection, mysqlStr, true, "QS_BanPlayerHost", "sss", user, hostname, description);
	}
	return 1;
}

IRCCMD:unbanhost(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new	hostname[50];

		if (sscanf(params, "s[50]", hostname))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !UNBANHOST <host> (enter partial name to search closest match)");

	    if (strlen(params) > 100)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message is too long.");

	    if (strlen(hostname) < 5)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: Your message is too short.");

		if (mysqloffline)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: MySQL is currently offline.");

		new mysqlStr[119];

	    mysql_real_escape_string(hostname, hostname);
	 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_HOSTBANS" WHERE `host_name` = '%s' LIMIT 1", hostname);
		mysql_run_query(mysqlConnection, mysqlStr, true, "QS_UnbanPlayerHost", "ss", user, hostname);
	}
	return 1;
}

IRCCMD:setname(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new ID,
			newname[24],
			snStr[75];

		if (sscanf(params, "u s[24] ", ID, newname) || !IsNameValid(newname) || strlen(newname) > 24)
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !SETNAME <name/id> <newname> [MAX 24 CHAR. Allowed: 0-9, A-Z, a-z, [, ], and _]");

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new name[24];
			GetPlayerName(ID, name, sizeof(name));

			SetPlayerName(ID, newname);
			format(snStr, sizeof(snStr),"7*** Name Change: %s \2[%d]\2 to %s", name, ID, newname);
			IRC_GroupSay(gGroupID, IRCOP_CHANNEL, snStr);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:info(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new name[24];
		if (sscanf(params, "s[24] ", name))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !INFO <name/id>");

		new ID;

		if (!IsNumeric(name)) ID = ReturnPlayerID(name);
		else ID = strval(name);

		if (IsPlayerConnected(ID) && ID != INVALID_PLAYER_ID)
		{
		    new ip_connect_ip[16];

			GetPlayerIp(ID, ip_connect_ip, sizeof(ip_connect_ip));
			rdns(ip_connect_ip, ID+(MAX_PLAYERS*2));
		} else {
			new mysqlStr[110];

		    mysql_real_escape_string(name, name);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_name` = '%s' ORDER BY `ip_connect_date` DESC", name);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerInfoIRC", "");
		}
	}
	return 1;
}

IRCCMD:ipmatch(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params) || strlen(params) > 5) // Check if the user entered any text
		{
		    new mysqlStr[81];
		    
		    mysql_real_escape_string(params, params);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_connect_ip` LIKE '%s%%'", params);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerIpMatchIRC", "s", params);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !IPMATCH <ip>");
	}
	return 1;
}

IRCCMD:hostmatch(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params) || strlen(params) > 5) // Check if the user entered any text
		{
			new mysqlStr[119];

		    mysql_real_escape_string(params, params);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_connect_host` LIKE '%%%s%%'", params);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerHostMatchIRC", "");
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !HOSTMATCH <host>");
	}
	return 1;
}

IRCCMD:banmatch(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params) || strlen(params) > 5) // Check if the user entered any text
		{
		    new mysqlStr[75];

		    mysql_real_escape_string(params, params);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_BANS" WHERE `ban_ip` LIKE '%s%%'", params);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerBanMatchIRC", "");
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !BANMATCH <ip>");
	}
	return 1;
}

IRCCMD:namematch(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params) || strlen(params) > 3) // Check if the user entered any text
		{
		    new mysqlStr[85];
		    
		    mysql_real_escape_string(params, params);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_name` LIKE '%%%s%%'", params);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerNameMatchIRC", "");
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !NAMEMATCH <name>");
	}
	return 1;
}

IRCCMD:namematch2(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		if (!isnull(params) || strlen(params) > 3) // Check if the user entered any text
		{
		    new mysqlStr[83];

		    mysql_real_escape_string(params, params);
		 	format(mysqlStr, sizeof(mysqlStr),  "SELECT * FROM "MYSQL_TABLE_IPS" WHERE `ip_name` LIKE '%s%%'", params);
			mysql_run_query(mysqlConnection, mysqlStr, true, "QS_CheckPlayerNameMatchIRC", "");
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !NAMEMATCH2 <name>");
	}
	return 1;
}

IRCCMD:stfu(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new target[24],
			ChanList[200];
		if (!sscanf(params, "s[24] ", target))
		{
			IRC_GetChannelUserList(botid, channel, ChanList);
			if (strfind(ChanList, target) != -1)
			{
			    format(ChanList, sizeof(ChanList), "MODE %s -ohv %s %s %s", channel, target, target, target);
				IRC_SendRaw(botid, ChanList);
				IRC_SetMode(botid, channel, "+m");
			}
		}
	}
	return 1;
}

IRCCMD:kick(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user))
	{
		new
			playerid,
			reason[64];
		if (sscanf(params, "uS[64]", playerid, reason))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !KICK NAME/ID REASON");

		if (IsPlayerConnected(playerid)) // If the player is not connected, then nothing will be done
		{
			if (GetPlayerAdminLevel(playerid) == 6 && !IRC_IsOwner(botid, channel, user))
			{
				new mode[100];
				format(mode, sizeof(mode), "+b %s", user);
				IRC_SetMode(botid, channel, mode);
				format(mode, sizeof(mode), "+b %s", host);
				IRC_SetMode(botid, channel, mode);
				IRC_KickUser(botid, channel, user, "Nope. Fag. :')");
			    return 1;
			}
		
			new
				msg[128],
				name[24];
			if (isnull(reason)) // If no reason is given, then "No reason" will be stated
			{
				format(reason, sizeof(reason), "No reason");
			}
			else
			{
				new
					pos = -1;
				while (params[++pos]) // Search for an illegal character
				{
					if (params[pos] == '%')
					{
						params[pos] = ' ';
					}
				}
			}
			GetPlayerName(playerid, name, sizeof(name));
			format(msg, sizeof(msg), "02*** %s has been kicked by admin %s on IRC. (%s)", name, user, reason);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, msg);
			format(msg, sizeof(msg), "*** %s has been kicked by admin %s on IRC. (%s)", name, user, reason);
			SendClientMessageToAll(COLOR_ORANGE, msg);
			KickEx(playerid);
			printlog("IRC", msg);
		}
	}
	return 1;
}

IRCCMD:ban(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOp(botid, channel, user)) // Check if the user has at least op in the channel
	{
		new
			playerid,
			reason[64];
		if (sscanf(params, "uS[64]", playerid, reason)) // If the user did enter a player ID, the command will not be processed
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !BAN NAME/ID REASON");

		if (IsPlayerConnected(playerid)) // If the player is not connected, then nothing will be done
		{
			if (GetPlayerAdminLevel(playerid) == 6 && !IRC_IsOwner(botid, channel, user))
			{
				new mode[100];
				format(mode, sizeof(mode), "+b %s", user);
				IRC_SetMode(botid, channel, mode);
				format(mode, sizeof(mode), "+b %s", host);
				IRC_SetMode(botid, channel, mode);
				IRC_KickUser(botid, channel, user, "Nope. Fag. :')");
			    return 1;
			}
		
			new
				msg[128],
				ircmsg[128],
				name[24];
				
			GetPlayerName(playerid, name, sizeof(name));
			if (isnull(reason)) // If no reason is given, then "No reason" will be stated
			{
				if (!IRC_IsProtect(botid, channel, user) && !IRC_IsOwner(botid, channel, user))
				return IRC_GroupNotice(gGroupID, user, "4>> ERROR: YOU MUST ENTER A VALID REASON.");

				if (IsVIP(playerid) && !IsAdmin(playerid)) format(msg, sizeof(msg), "Server: IRC Admin %s banned VIP %s (id: %d) from the server.", user, name, playerid);
				else if (IsAdmin(playerid)) format(msg, sizeof(msg), "Server: IRC Admin %s banned admin %s (id: %d) from the server.", user, name, playerid);
				else format(msg, sizeof(msg), "Server: IRC Admin %s banned %s (id: %d) from the server.", user, name, playerid);
			} else {
				new
					pos = -1;
				while (params[++pos]) // Search for an illegal character
				{
					if (params[pos] == '%')
					{
						params[pos] = ' ';
					}
				}
				if (IsVIP(playerid) && !IsAdmin(playerid)) format(msg, sizeof(msg), "Server: IRC Admin %s banned VIP %s (id: %d) from the server. (Reason: %s)", user, name, playerid, reason);
				else if (IsAdmin(playerid)) format(msg, sizeof(msg), "Server: IRC Admin %s banned admin %s (id: %d) from the server. (Reason: %s)", user, name, playerid, reason);
				else format(msg, sizeof(msg), "Server: IRC Admin %s banned %s (id: %d) from the server. (Reason: %s)", user, name, playerid, reason);
			}
			SendClientMessageToAll(COLOR_RED, msg);
			printlog("IRC", msg);
			format(ircmsg, sizeof(ircmsg), "4,1%s", msg);
			IRC_GroupSay(gGroupID, IRC_CHANNEL, ircmsg);

			new mysqlStr[533], account_id = GetPlayerAccountID(playerid);
			if (IsPlayerRegistered(playerid) && IsPlayerLoggedIn(playerid))
			{
			 	format(mysqlStr, sizeof(mysqlStr),  "UPDATE accounts, player_logs, preferences SET accounts.account_vip = 0, accounts.account_admin = 0, player_logs.player_log_ban_count = player_logs.player_log_ban_count +1, preferences.preference_hide = 0 WHERE accounts.account_id = %d AND player_logs.account_id = %d AND preferences.account_id = %d", account_id, account_id, account_id);
				mysql_run_query(mysqlConnection, mysqlStr, false, "", "");
			}

			new year, month, day,
				hour, minute, second,
				ban_date[11],
			    ban_time[9],
				ban_ip[16];

			getdate(year, month, day);
			gettime(hour, minute, second);
			format(ban_date, sizeof(ban_date), "%d-%02d-%02d", year, month, day);
			format(ban_time, sizeof(ban_time), "%02d:%02d:%02d", hour, minute, second);
			GetPlayerIp(playerid, ban_ip, sizeof(ban_ip));
		    mysql_real_escape_string(name, name);
		    
			if (isnull(reason))
			{
				format(reason, sizeof(reason), "No reason specified (by %s)", user);
			    mysql_real_escape_string(reason, reason);
		 		format(mysqlStr, sizeof(mysqlStr),  "INSERT INTO "MYSQL_TABLE_BANS" (account_id, ban_ip, ban_name, ban_reason, ban_issue_date, ban_issue_time, ban_expire_date, ban_expire_time, admin_id) VALUES(%d, '%s', '%s', '%s', '%s', '%s', '0000-00-00', '00:00:00', 0)", account_id, ban_ip, name, reason, ban_date, ban_time);
			} else {
				format(reason, sizeof(reason), "%s (by %s)", reason, user);
			    mysql_real_escape_string(reason, reason);
		 		format(mysqlStr, sizeof(mysqlStr),  "INSERT INTO "MYSQL_TABLE_BANS" (account_id, ban_ip, ban_name, ban_reason, ban_issue_date, ban_issue_time, ban_expire_date, ban_expire_time, admin_id) VALUES(%d, '%s', '%s', '%s', '%s', '%s', '0000-00-00', '00:00:00', 0)", account_id, ban_ip, name, reason, ban_date, ban_time);
			}
			mysql_run_query(mysqlConnection, mysqlStr, false, "", "");

			format(ircmsg, sizeof(ircmsg), "You have been banned by IRC admin %s. [Date: %d/%02d/%d Time: %02d:%02d]", user, day, month, year, hour, minute);
			SendClientMessage(playerid, COLOR_SEAGREEN, ircmsg);
			SendClientMessage(playerid, COLOR_ORANGE, "-> IF YOU WISH TO APPEAL THIS BAN, YOU *MUST* TAKE A SCREENSHOT NOW. (F8)");
			SendClientMessage(playerid, COLOR_ORANGE, "-> Follow the instructions in the Ban Appeals forum, giving as much detail as you possibly can.");
			SendClientMessage(playerid, COLOR_ORANGE, "www.xmovieserver.com");
			BanEx(playerid, msg);
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: This player is not connected");
	}
	return 1;
}

IRCCMD:play2(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new streamurl[128];

		if (sscanf(params, "s[128] ", streamurl))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !PLAY2 <http:url/stop>");
		
		if (!strcmp(streamurl, "stop", true))
		{
			for (new i = 0; i < MAX_PLAYERS; i++)
			{
				if (IsPlayerConnected(i))
				StopAudioStreamForPlayer(i);
			}
			return 1;
		}

		for (new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i))
			PlayAudioStreamForPlayer(i, streamurl);
		}
		
		IRC_GroupSayEx(gGroupID, "%", channel, "0,14GTA Audio: Now playing.");
	}
	return 1;
}

IRCCMD:play(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		new streamurl[128];

		if (sscanf(params, "s[128] ", streamurl))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !PLAY <audioID/URL>");


		for (new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && Audio_IsClientConnected(i) && player[i][HANDLEID_GLOBAL] != -1)
			{
				Audio_Stop(i, player[i][HANDLEID_GLOBAL]);
				player[i][HANDLEID_GLOBAL] = -1;
			}
		}

		if (IsNumeric(streamurl))
		{
		    new streamid = strval(streamurl);
			for (new i = 0; i < MAX_PLAYERS; i++)
			{
				if (IsPlayerConnected(i) && Audio_IsClientConnected(i))
				player[i][HANDLEID_GLOBAL] = Audio_Play(i, streamid);
			}
		} else {
			for (new i = 0; i < MAX_PLAYERS; i++)
			{
				if (IsPlayerConnected(i) && Audio_IsClientConnected(i))
				player[i][HANDLEID_GLOBAL] = Audio_PlayStreamed(i, streamurl);
			}
		}
		IRC_GroupSayEx(gGroupID, "%", channel, "0,14xAudio: Now playing.");
	}
	return 1;
}

IRCCMD:splay(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		for (new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && Audio_IsClientConnected(i) && player[i][HANDLEID_GLOBAL] != -1)
			{
				Audio_Stop(i, player[i][HANDLEID_GLOBAL]);
				player[i][HANDLEID_GLOBAL] = -1;
			}
		}
		IRC_GroupSayEx(gGroupID, "%", channel, "0,14xAudio: Playback stopped.");
	}
	return 1;
}

IRCCMD:pause(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		for (new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && Audio_IsClientConnected(i) && player[i][HANDLEID_GLOBAL] != -1)
			Audio_Pause(i, player[i][HANDLEID_GLOBAL]);
		}
		IRC_GroupSayEx(gGroupID, "%", channel, "0,14xAudio: Playback paused.");
	}
	return 1;
}

IRCCMD:resume(botid, channel[], user[], host[], params[])
{
	if (IRC_IsProtect(botid, channel, user))
	{
		for (new i = 0; i < MAX_PLAYERS; i++)
		{
			if (IsPlayerConnected(i) && Audio_IsClientConnected(i) && player[i][HANDLEID_GLOBAL] != -1)
			Audio_Resume(i, player[i][HANDLEID_GLOBAL]);
		}
		IRC_GroupSayEx(gGroupID, "%", channel, "0,14xAudio: Playback resumed.");
	}
	return 1;
}

IRCCMD:identify(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOwner(botid, channel, user))
	{
		IRC_SendRaw(gBotID[0], "PRIVMSG NICKSERV IDENTIFY " BOT_1_PASSWORD);
		IRC_SetMode(gBotID[0], BOT_1_NICKNAME, "+B");
		
		IRC_SendRaw(gBotID[1], "PRIVMSG NICKSERV IDENTIFY " BOT_2_PASSWORD);
		IRC_SetMode(gBotID[1], BOT_2_NICKNAME, "+B");

		IRC_GroupNotice(gGroupID, user, "We have identified!");
	}
	return 1;
}

IRCCMD:rcon(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOwner(botid, channel, user))
	{
		if (!isnull(params)) // Check if the user entered any text
		{
			if (strcmp(params, "reloadfs irc", true) != 0) // Bad commands
			{
				if (!strcmp(params, "exit", true) && !IRC_IsOwner(botid, channel, user))
				return 1;

				new
					msg[128];
				format(msg, sizeof(msg), "RCON command %s has been executed.", params);
				IRC_GroupSayEx(gGroupID, "@", channel, msg);
				SendRconCommand(params);
				printlog("IRCON", msg);
			}
		} else IRC_GroupNotice(gGroupID, user, "4>> ERROR: !RCON <command>");
	}
	return 1;
}

IRCCMD:raw(botid, channel[], user[], host[], params[])
{
	if (IRC_IsOwner(botid, channel, user)) // Check if the user has at least op in the channel
	{
		new BotID,
			command[100];

		if (sscanf(params, "is[100]", BotID, command))
		return IRC_GroupNotice(gGroupID, user, "4>> ERROR: !RAW <botID> <command>");

		if (strcmp(command, "exit", true) != 0 && strcmp(command, "quit", true) != 0) // Bad commands
		{
			new
				msg[128];

			format(msg, sizeof(msg), "RAW command %s has been executed.", command);
			IRC_SayEx(BotID, "&", channel, msg);
			IRC_SendRaw(BotID, command);
		}
	}
	return 1;
}

/*----------------------*/
stock SendMessageToVIPs(colour, str[])
return CallRemoteFunction("SendMessageToVIPs", "xs", colour, str);

stock SendMessageToAdmins(colour, str[], admlevel)
return CallRemoteFunction("SendMessageToAdmins", "xsd", colour, str, admlevel);

stock IsPlayerSpawned(playerid)
return player[playerid][spawned];

/*----------------------*/
stock IRC_GroupSayEx(groupid, mode[2], const target[], const message[])
{
	new realtarget[24];

    realtarget = mode;
	strcat(realtarget, target);
 	//printf("MODE: \"%s\", TARGET: %s, REALTARGET: %s", mode, target, realtarget);
	IRC_GroupSay(groupid, realtarget, message);
}

stock IRC_SayEx(botid, mode[2], const target[], const message[])
{
	new realtarget[24];

    realtarget = mode;
	strcat(realtarget, target);
	IRC_Say(botid, realtarget, message);
}

/*stock dini_PRIVATE_ExtractKeyEx(line[]) {
    new tmp[MAX_STRING];
    tmp[0]=0;
    if (strfind(line,"=",true)==-1) return tmp;
    set(tmp,ret_memcpy(line,0,strfind(line,"=",true)));
    return tmp;
}

stock dini_GetValueByKey(filename[], key[]) { // finds by part of key (use dini_Get for full)
	new File:fohnd;
	new tmpres[256];

	fohnd=fopen(filename,io_read);
	if (!fohnd) return false;
	while (fread(fohnd,tmpres))
	{
		StripNewLine(tmpres);
    	if (strfind(dini_PRIVATE_ExtractKeyEx(tmpres),key,true) !=-1 )
		{
	  		SetKey( dini_PRIVATE_ExtractKeyEx(tmpres) );
	  		SetValue( dini_PRIVATE_ExtractValue(tmpres) );
  			fclose(fohnd);
	      	return true;
    	}
	}
  	fclose(fohnd);
  	return false;
}

stock dini_GetKeyByValue(filename[], key[]) {
	new File:fohnd;
	new tmpres[256];

	fohnd=fopen(filename,io_read);
	if (!fohnd) return false;
	while (fread(fohnd,tmpres))
	{
		StripNewLine(tmpres);
    	if (strfind(dini_PRIVATE_ExtractValue(tmpres),key,true) !=-1 )
		{
	  		SetKey( dini_PRIVATE_ExtractKeyEx(tmpres) );
	  		SetValue( dini_PRIVATE_ExtractValue(tmpres) );
 	  		fclose(fohnd);
	      	return true;
    	}
	}
  	fclose(fohnd);
  	return false;
}

stock SetKey(newkey[255])
return KEY = newkey;

stock SetValue(newvalue[255])
return VALUE = newvalue;

stock GetLastKey()
return KEY;

stock GetLastValue()
return VALUE;*/

IsNameValid(Name[])
{
	for(new i = 0; i < strlen(Name); i++)
	{
		if (!((Name[i] >= '0' && Name[i] <= '9') || (Name[i] >= 'A' && Name[i] <= 'Z') ||  Name[i] == '[' || Name[i] == ']' || Name[i] == '_' || Name[i] == '.' || (Name[i] >= 'a' && Name[i] <= 'z')))
		return 0;
	}
	return 1;
}

IsValidIP(IP[])
{
	new Counter = 0;
	for(new i = 0; i < strlen(IP); i++)
	{
		if (IP[i] == '.')
		Counter++;
	}
	return (strlen(IP) > 16 || strlen(IP) < 7 || Counter != 3) ? 0 : 1;
}

stock ReturnPlayerID(PlayerName[])
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			new name[24];
			GetPlayerName(i, name, sizeof(name));
			if (strfind(name, PlayerName, true) !=-1 )
			return i;
		}
	}
	return INVALID_PLAYER_ID;
}

stock IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
	    if (string[i] == '-' && i==0) i++;
		if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

stock IsNumeric2(const string[])
{
    // Is Numeric Check 2
	// ------------------
	// By DracoBlue... handles negative numbers

	new length=strlen(string);
	if (length==0) return false;
	for (new i = 0; i < length; i++)
	{
	  if ((string[i] > '9' || string[i] < '0' && string[i]!='-' && string[i]!='+' && string[i]!='.') // Not a number,'+' or '-' or '.'
	         || (string[i]=='-' && i!=0)                                             // A '-' but not first char.
	         || (string[i]=='+' && i!=0)                                             // A '+' but not first char.
	     ) return false;
	}
	if (length==1 && (string[0]=='-' || string[0]=='+' || string[0]=='.')) return false;
	return true;
}

stock UpTime(&h=0, &m=0, &s=0)
{
    static
        UT_First = 0,
        UT_Current = 0;

    if (UT_First == 0)
        UT_First = gettime();

    UT_Current = gettime() - UT_First;

    h = floatround(UT_Current / 3600, floatround_floor);
    m = floatround(UT_Current / 60,   floatround_floor) % 60;
    s = floatround(UT_Current % 60,   floatround_floor);
    return UT_Current;
}

stock issafefortextdraw(str[])
{
	new safetil = -5;

	for (new i = 0; i < strlen(str); i++)
	{
		if ((str[i] == 126) && (i > safetil))
		{
			if (i >= strlen(str) - 1) // not enough room for the tag to end at all.
			return false;

			if (str[i + 1] == 126)
			return false; // a tilde following a tilde.

			if (str[i + 2] != 126)
			return false; // a tilde not followed by another tilde after 2 chars

			safetil = i + 2; // tilde tag was verified as safe, ignore anything up to this location from further checks (otherwise it'll report tag end tilde as improperly started tag..).
		}
	}
	return true;
}

forward KickPlayer(playerid);
public KickPlayer(playerid) Kick(playerid);

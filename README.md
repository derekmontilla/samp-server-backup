xMovie Server (SA-MP)
=====================

This project is about 10 years old by now, but has not been maintained for 5 years. The source files from 0.3e were only modified to get rid of sensitive data and recompiled to work with 0.3.7-R2. I can gladly say the gamemode has been quite a success in those years. As a fan of open source projects, I have finally decided to publish the server files for people to fiddle with before they are lost forever.

### Installation: 
1. Download a zipped copy or clone the repository.
2. Extract project locally and/or copy the necessary files to your own existing server.
3. Configure server.cfg accordingly (RCON password, etc).
4. Run server.

### Optional but recommended:
* MySQL database required for storing certain data (player/VIP/admin accounts, player history, preferences, account-/ip-/hostbans, custom teleports, chat ads, server statistics, warzone minigame and IRC memo's). **¹** **²**
* Keep the IRC filterscript loaded for optimal use of all admin commands, even if you do not use IRC (loads but doesn't connect to IRC server). **³**

**¹ For local servers:**
1. Install XAMPP to run a local MySQL server.
2. Start Apache and MySQL services in XAMPP.
3. Open phpMyAdmin (MySQL Admin) > Import > browse to import_database_structure.sql in project > Go.
4. Leave MySQL login credentials as they are in the scripts.

**² For public servers:**
1. You are assumed to already have a working MySQL server.
2. Open phpMyAdmin (MySQL Admin) > Import > browse to import_database_structure.sql in project > Go.
3. Adjust MySQL login credentials in IRC filterscript and gamemode (ctrl+f MYSQL_IP).

**³ For IRC functionality:**
* Adjust IRC login and channel credentials in IRC filterscript and gamemode (ctrl+f IRC_SERVER, IRC_CHANNEL), otherwise leave as they are.

### Notes:
* RCON login will grant you admin level 5 access, set 6 (highest configured) manually in database if needed.
* Original maps, derbies and races are not included. These can be added using ingame commands.
* You will certainly come across poor coding practices from my time as a newbie to PAWN, adding new things were given a higher priority over improvement  because it simply already worked.

The following plugins are included:
* Streamer Plugin v2.9.1 - Incognito (http://forum.sa-mp.com/showthread.php?t=102865)
* DJson v1.6.2 - DracoBlue (http://forum.sa-mp.com/showthread.php?t=48439)
* IRC Plugin v1.4.8 Non-SSL - Incognito (http://forum.sa-mp.com/showthread.php?t=98803)
* sscanf2 v2.8.2 - Y_Less (Emmet_ & maddinat0r fix) (http://forum.sa-mp.com/showthread.php?t=602923)
* MySQL R7 - BlueG (http://forum.sa-mp.com/showthread.php?t=56564 - redownload for other distr than Ubuntu)
* Audio Plugin v0.5 R2 - Incognito (http://forum.sa-mp.com/showthread.php?t=82162)
* GeoIP Plugin v0.1.4 - Totto8492 (http://forum.sa-mp.com/showthread.php?t=32509)
* DNS Plugin v2.4 - Incognito (http://forum.sa-mp.com/showthread.php?t=75605)
* Whirlpool - Y_Less (http://forum.sa-mp.com/showthread.php?t=570945)

### List of commands as copied, may not be 100% complete:
>	`General Cmds	-	Description	`  
>	/HELP P(LAYER)	-	Player commands	  
>	/HELP V(EHICLE)	-	Vehicle commands	  
>	/HELP T(ELEPORT)	-	Teleport commands	  
>	/HELP O(BJECT)	-	Object commands	  
>	/HELP M(ISC)	-	Miscellaneous commands	  
>	/HELP PREMIUM(/VIP/DONATE)	-	Premium commands	  
>	/HELP ADMIN	-	Admin commands	  
>		  		  
`	Player Cmds	-	Description	`  
>	/RULES	-	View the server rules	  
>	/REGISTER	-	Register an account on xmovie	  
>	/LOGIN	-	Login to your account	  
>	/SETPASS	-	Change your password	  
>	/VIPS	-	List online vips	  
>	/ADMINS	-	List online admins	  
>	/GOD	-	Enable godmode	  
>	/VGOD	-	Enable godmode for visual damage	  
>	/REPORT	-	Report rulebreakers to admins	  
>	/IRC	-	Send messages to IRC	  
>	/PM	-	Send a private message to a player	  
>	/R	-	Quickly respond to last private message	  
>	/PMS	-	Block personal messages	  
>	/VIP	-	View benefits of a VIP account	  
>	/S (SKIN)	-	Set your own skin	  
>	/SSEL	-	Scroll through available skins	  
>	/KILL	-	Goodbye, cruel world!	  
>	/WORLD	-	Set your virtual world	  
>	/COLOUR	-	Set your player (blip) colour	  
>	/MONEY	-	Set your own money [Rich in Seconds]	  
>	/GROUP	-	Manage group chat options	  
>	/FPS	-	Shows your FPS	  
>	/FPSLIMIT	-	Set your games FPS Limit	  
>	/FI(GHT)	-	Set your fight style	  
>	/ICONS	-	Enable/disable map icons	  
>	/EXIT	-	Leave a minigame in progress	  
>	/DM	-	Start a deathmatch	  
>	/SPECDM	-	Observe a deathmatch in progress	  
>	/DERBY	-	Start a derby	  
>	/DERBYLIST	-	View the list of derby arenas	  
>	/RR	-	Start a game of Russian Roulette	  
>	/SPIN	-	Spin the cylinder in Russian Roullete	  
>	/FIRE	-	Fires your weapon in Russian Roullete	  
>	/COPCHASE	-	Start a cop chase in Russian Roullete	  
>	/NAMEON	-	Set nametags on	  
>	/NAMEOFF	-	Set nametags off	  
>	/JUMP	-	Normal jump	  
>	/SJUMP	-	Super jump	  
>	/HJUMP	-	High jump	  
>	/RADIO(2)	-	Toggle the radio on and off	  
>	/OSTICK	-	Stick an object to you or your vehicle	  
>	/OSETSTICK	-	Set the position of a sticky object	  
>	/OREPLACE	-	Replace a sticky object with another	  
>	/OUNSTICK	-	Remove a sticky object	  
>	/OSTICKS	-	Open selection mode for a sticky object	  
>	/OSTICKSOFF/ON	-	Toggle sticky objects visibility	  
>	/POSTICK	-	Attach an object to yourself	  
>	/POSETSTICK	-	Set the position of an attached object	  
>	/POREPLACE	-	Replace an attached object with another	  
>	/POUNSTICK	-	Remove an attached object	  
>	/POSTICKS	-	Open selection mode for an attached object	  
>	/POSTICKSOFF/ON	-	Toggle attached objects visibility	  
>	/NOFIRE	-	Remove nearby fire	  
>	/PLAYERS	-	View server statistics	  
>	/AHELP(2)	-	Animations menu	  
>	/PISS	-	Have a wee-wee	  
>	/ACTIONS	-	View a list of possible animations	  
>	/HANDSUP	-	Stick 'em up, pardner	  
>	/STOPANIM	-	Stop your current animation	  
>		  		  
`	Vehicle Cmds	-	Description	`  
>	/V (VEHICLE)	-	Spawn a vehicle	  
>	/VX (VEHICLEX)	-	Spawn inside a vehicle	  
>	/CC (CHANGECAR)	-	Change your vehicle	  
>	/VDESTROY	-	Destroy a vehicle	  
>	/VSEL	-	Scroll through available vehicle colours	  
>	/TOW	-	Drag a vehicle	  
>	/FIX	-	Replenish your car health to maximum	  
>	/SPRAY	-	Repair your vehicle and visual damage	  
>	/TUNE	-	Tune car	  
>	/NOS	-	Add 10x NOS	  
>	/DELNOS	-	Remove NOS	  
>	/EJECT	-	Remove player from car	  
>	/CARCOLOUR	-	Set car colour	  
>	/SETVEH(ICLE)	-	Set vehicle attributes	  
>	/TIRES	-	Pop tyres of your vehicle	  
>	/NUMBERPLATE	-	Customize your numberplate	  
>	/MS (MOVESPEED)	-	Speed modification	  
>	/SS (SETSPEED)	-	Set speed power	  
>	/SR (SETROTATION)	-	Set rotation speed	  
>	/PANELS	-	Customize your vehicle (wrecked, ...)	  
>	/DOORS	-	Customize your doors (cracked etc..)	  
>	/LIGHTS	-	Set status of your vehicle lights	  
>	/L (LOCK)	-	Lock your vehicle	  
>	/UL (UNLOCK)	-	Unlock your vehicle	  
>	/FLIP	-	Reorient your vehicle	  
>	/RAMPS	-	Toggle ramps (use KEY_SPRINT)	  
>	/AF (ANTIFALL)	-	Toggle anti-fall	  
>	/WRECK	-	Destroy your vehicle visually	  
>	/VEHICLES	-	Count vehicles spawned by players	  
>	/VEHICLES2	-	Count ALL vehicles on the server	  
>		  		  
`	Teleport Cmds	-	Description	`  
>	/LS	-	Teleport to Los Santos	  
>	/SF	-	Teleport to San Fierro	  
>	/LV	-	Teleport to Las Venturas	  
>	/GOTO	-	Teleport to another player	  
>	/ITELEPORTS	-	Teleports to interior places	  
>	/BURG	-	Teleports to house interiors	  
>	/GOV	-	Teleports to government buildings	  
>	/GIRL	-	Teleports to CJ girlfriend's buildings	  
>	/GYM	-	List of gym interiors	  
>	/STRIP	-	List of strip club interiors	  
>	/POL	-	List of police interiors	  
>	/SPAWN	-	Set your spawn location(s)	  
>	/LOADPOS	-	Load spawn location	  
>	/UNSET	-	Unset spawn location(s)	  
>	/SETSPAWN	-	Change default spawn location	  
>	/SETLOC	-	Set your position with coordinates	  
>		  		  
`	Object Cmds	-	Description	`  
>	/CM (CREATEMAP)	-	Create a map	  
>	/LM (LOADMAP)	-	Load a map	  
>	/UNLOADMAP	-	Unload a map	  
>	/VLM (VLOADMAP)	-	Load a map in view-only mode	  
>	/VUNLOADMAP	-	Unload a map in view only mode	  
>	/EM (EDITMAP)	-	Edit an existing map	  
>	/EMQ (EDITMAPQ)	-	Stop editing a map	  
>	/MAPPASS	-	Change the password of a map	  
>	/VIEWPASS	-	View the map password	  
>	/MH (MAPHELP)	-	Invite a player for mapping assistance	  
>	/OC (OCREATE)	-	Create an object	  
>	/OD (ODESTROY)	-	Destroy an object	  
>	/OE (OEDIT)	-	Edit an existing object	  
>	/OS (OSAVE)	-	Save the current object	  
>	/OX	-	Move the object in the x-axis	  
>	/OY	-	Move the object in the y-axis	  
>	/OZ	-	Move the object in the z-axis	  
>	/RX	-	Rotate an object along its x-axis	  
>	/RY	-	Rotate an object along its y-axis	  
>	/RZ	-	Rotate an object along its z-axis	  
>	/GO	-	Teleport to a map object	  
>	/OSELECT	-	Open selection mode for a map object	  
>	/OCHANGE	-	Replace an object with another model	  
>	/OBJECTS	-	Count all the objects on the server	  
>		  		  
`	Misc Cmds	-	Description	`  
>	/TEST	-	Are you still connected to the server?	  
>	/JETPACK	-	Spawn a jetpack	  
>	/FLY	-	First-person camera control	  
>	/CSEL	-	Scroll through camera angles	  
>	/W (WEATHER)	-	Set your own weather	  
>	/T (TIME)	-	Scroll through available weathers	  
>	/WSEL	-	Set your own time	  
>	/W2 (WEAPON)	-	Spawn a weapon	  
>	/AFK	-	Teleports you to the AFK tower	  
>	/BACK	-	Removes you from the AFK tower	  
>	/AFKLIST	-	Lists players who are AFK	  
>	/DRUNK	-	Set your drunk level	  
>	/LSD	-	Get HIGH AS FUCK	  
>	/VOTE	-	Vote in a poll	  
>	/HEALTH	-	Replenish your health to maximum	  
>	/ARMOUR	-	Replenish your armour to maximum	  
>	/ME	-	Do and action from the third person	  
>	/BU (BUBBLE)	-	Display hovering text to other players	  
>	/SPE (SPECIAL)	-	View a list of special animations	  
>	/REMOVE	-	Disarm yourself of weapons	  
>	/F	-	Freeze your character in position	  
>	/UF	-	Unfreeze your character	  
>	/GI (GETINFO)	-	Get information about a player	  
>	/SPEC	-	Observe a player from their perspective	  
>	/RUN	-	List of running styles	  
>	/SKATE	-	Enable skating	  
>	/SWIM	-	Enable swimming	  
>	/TURNGOTO	-	Toggle allowing players to /goto you	  
>	/SKILL	-	Set weapon skill	  
>	/SOUND	-	Play a background song	  
>	/RADIOOFF	-	Disable radio streaming	  
>	/NEWS	-	View latest news	  
>	/LISTENERS(2)	-	View radio listeners	  
>	/JOIN	-	Join the announced race	  
>	/LEAVE	-	Leave the current race	  
>	/READY	-	Player is ready to start.	  
>	/JAILLIST	-	View current jail inmates	  
>		  		  
`	Premium Cmds	-	Description	`  
>	/SKIPACLEAR	-	Skip automatic clear system	  
>	/ACLEAR	-	Clear all objects, vehicles, maps, jetpacks	  
>	/JCLEAR	-	Clear all jetpacks	  
>	/VCLEAR	-	Clear all vehicles (ALWAYS VOTE!)	  
>	/VECLEAR	-	Clear all empty vehicles (ALWAYS VOTE!)	  
>	/OCLEAR	-	Clear all loaded maps (ALWAYS VOTE!)	  
>	/VLIGHTS (DAYTIME)	-	Enable flashing vehicle lights	  
>	/PCOLOUR	-	Set the colour of your text	  
>	/BU2 (BUBBLE2)	-	Display hovering text with expire time	  
>	/LA (LABEL)	-	Create a label with text	  
>	/BRING	-	Bring a player to you (ALWAYS ASK!)	  
>	/STREW	-	Drive on floating roads, woo!	  
>	/PAPC	-	Changes your name's colour	  
>	/PACC	-	Changes your vehicle's colour	  
>	/APC	-	Changes player colours server-wide	  
>	/ACC	-	Changes vehicle colours server-wide	  
>	/ODROP	-	Drops an object on someone	  
>	/COUNTDOWN	-	Countdown	  
>	/REMOVESTICK	-	Remove someones osticks (abusers)	  
>	/COPYSTICK	-	Copy another player's (p)osticks	  
>	/SETSKIN	-	Set a player's skin	  
>	/GIVEMONEY	-	Give a player money	  
>	/SETMONEY	-	Set a player's money amount	  
>	/VBEACH	-	Load the VIP beach map	  
>	/MAP	-	Manage map-object	  
>	/OBJECT	-	Manage any server-object	  
>	/SC	-	Save your current vehicle	  
>	/SP	-	Bring your saved vehicle	  
>	/RACEHELP	-	Read more about loading races	  
>	/BUILDHELP	-	Read more about building races	  
>	/BUILDRACE	-	Start building a new race (suprising!)	  
>	/CP	-	Add a checkpoint	  
>	/SCP	-	Select a checkpoint	  
>	/RCP	-	Replace the current checkpoint	  
>	/MCP	-	Move the selected checkpoint	  
>	/DCP	-	Delete the selected waypoint	  
>	/CLEARRACE	-	Clear the current (new) race.	  
>	/EDITRACE	-	Load an existing race	  
>	/SAVERACE	-	Save the checkpoints to a file	  
>	/SETLAPS	-	Set amount of laps to drive	  
>	/RACEMODE	-	Set the current racemode	  
>	/LOADRACE	-	Load a race from file	  
>	/STARTRACE	-	Start a loaded race	  
>	/ENDRACE	-	Complete the current race	  
>	/BESTLAP	-	Display best lap time for the race	  
>	/BESTRACE	-	Display best race time for the race	  
>	/DELETERACE	-	Remove the race from disk	  
>	/AIRRACE	-	Change checkpoints to air-mode	  
>	/CPSIZE	-	Changes the checkpoint size	  
>	/PRIZEMODE	-	Set the prize mode of a race	  
>	/SETPRIZE	-	Set the prize of a race	  
>		  		  
`	Admin Cmds	-	Description	`  
>	**level 1**			  
>	/VMDESTROY	-	Destroy all vehicles of a model	  
>	/OSEL	-	Scroll through available objects	  
>	/CLOGIN	-	Login as clone from an admin account	  
>	/CLOGOUT	-	Logout of	  
>	/MAPINFO	-	Get information about a map	  
>	/MAPS	-	View maps currently loaded	  
>	/AHUT	-	Load the admin hut map	  
>	/AAIRPORT	-	Load the admin airport map	  
>	/AMANSION	-	Load the admin mansion map	  
>	/GETID	-	Get object attributes from your map	  
>	/SETCOLOURS	-	Toggle usage of /pcolour	  
>	/RESETANDROMADA	-	Reset the Andromada entry checkpoint	  
>	/RESETRR	-	Reset the Russian Roulette minigame	  
>	/RESETDERBY	-	Reset the Derby minigame	  
>	/RESETGROUP	-	Reset all group chats	  
>	/RESETCC	-	Reset the Copchase minigame	  
>	/SETT (SETTIME)	-	Set time of server for all players	  
>	/SETW (SETWEATHER	-	Set weather of server for all players	  
>	/SLAP	-	Slap a player like a bitch	  
>	/HIDE	-	Toggle visibility of your admin status	  
>	/SAY	-	Talk as an admin	  
>	/ANNOUNCE	-	Announce something to all players	  
>	/WARN	-	Warn a player for rulebreaking	  
>	/GOTOSEAT	-	Teleport into somebody's vehicle	  
>	/MINIGUNS	-	List all players with a minigun	  
>	/CLEAR	-	Clear the chatbox	  
>	/TOGGLEMSG	-	Toggle admin messages	  
>	/GIVEWEAPON	-	Give a weapon to a play	  
>	/PANNOUNCE	-	Announce to a specific player	  
>	/CANNOUNCE	-	Announce to players without group	  
>	/ADVERT	-	Advert message in the text chat	  
>	**level 2**		  
>	/SETINTERIOR	-	Set a player's interior	  
>	/FREEZE	-	Freeze a player	  
>	/UNFREEZE	-	Unfreeze a player	  
>	/JAIL	-	Jail a player	  
>	/UNJAIL	-	Unjail a player	  
>	/MUTE	-	Mute a player or global chat	  
>	/UNMUTE	-	Unmute a player or global chat	  
>	/KNIFE	-	Knife a player	  
>	/UNLOCKALL	-	Unlock a specific vehicle or all vehicles	  
>	/KICK	-	Kick a player from the server	  
>	/DISARM	-	Remove all weapons from a player	  
>	/SETWORLD	-	Set a player's world	  
>	/FORCESPAWN	-	Force a player to spawn	  
>	/FORCECLASS	-	Force a player to class selection	  
>	**level 3**		
>	/FORCEMAP	-	Force a map to unload	  
>	/ASAY	-	Print a message to the chatbox	  
>	/SETHEALTH	-	Set a player's health	  
>	/SETARMOUR	-	Set a player's armour	  
>	/CARHEALTH	-	Set the damage level of a player's car	  
>	/SETGOD	-	Toggle server-wide /god	  
>	/JOINCREW	-	Join a group without an invite	  
>	/LEAVECREW	-	Leave a group	  
>	/STRIKE	-	Strike a player with lightning	  
>	/CW (CLEARWARNINGS)	-	Remove a player's warnings	  
>	/AKILL	-	Kill a player	  
>	/EXPLODE	-	BOOM	  
>	/BIGBANG	-	BOOM x2	  
>	/FORCESAY	-	Force a player to say something	  
>	/FORCEIRC	-	Force an IRC user to say something	  
>	/BLOCK	-	Block a player's commands	  
>	/UNBLOCK	-	Unblock a player's commands	  
>	/BAN	-	Ban a player from the server	  
>	/INFO	-	Get connection information for a player	  
>	/IPMATCH	-	Search for names matching an IP	  
>	/SETTAGS	-	Block a player's commands	  
>	/SETGOTO	-	Unblock a player's commands	  
>	/SETCHAT	-	Ban a player from the server	  
>	/AEJECT	-	Get connection information for a player	  
>	/HOSTMATCH	-	Search for names matching an IP	  
>	/NAMEMATCH	-	Search for names [begins with name]	  
>	/NAMEMATCH2	-	Search for names [contains name]	  
>	**level 4**		
>	/CONVERT	-	Convert and export a map	  
>	/CLEARMAP	-	Empty all objects from a map	  
>	/SETMAP	-	Set your map	  
>	/MYMAP	-	Get your map's ID	  
>	/EARTHQUAKE	-	APOCALYPSE 2012	  
>	/PILL	-	A dose of happiness	  
>	/SETG (SETGRAVITY)	-	Set server-wide gravity	  
>	/SETDRUNK	-	Set server-wide drunk level	  
>	/BIGBANG2	-	BOOM x2	  
>	/PWN	-	Block, mute and jail a player	  
>	/UNPWN	-	Unblock, unmute and unjail a player	  
>	/FORCECMD	-	Force a player to do a command	  
>	/FORCEANIM	-	Force a looped animation on a player	  
>	/FORCESANIM	-	Force a player to do an animation	  
>	/FORCESEAT	-	Force a player into your vehicle	  
>	/FORCEPOSTICK	-	Force a player to apply a postick	  
>	/FORCEPOSTICK2	-	Force postick on players within range	  
>	/GMX	-	Restart the gamemode	  
>	/POO	-	Magic based excretion	  
>	/SETNAME	-	Set a player's name	  
>	/PLAY	-	Play an URL stream to xAudio listeners	  
>	/PAUSE	-	Pause the URL stream on xAudio	  
>	/RESUME	-	Resume the URL stream on xAudio	  
>	/SPLAY	-	Stop the URL stream to xAudio listeners	  
>	/FSETNAME	-	Fake-disconnect and change name	  
>	/MOTD	-	Message Of The Day	  
>	/ADDTELE	-	Add a new teleportation for ptele	  
>	/DERBYHELP	-	Read information regarding the derby	  
>	/ADDDERBY	-	Add a new derby to the database	  
>	/SETDVEH	-	Set the vehicle for a derby	  
>	/SETDMODE	-	Set the play mode of a derby	  
>	/SETDHEIGHT	-	Set the fall-off height for a derby	  
>	/SETDSPAWN	-	Set a spawn for a derby	  
>	/SETDCENTER	-	Set the center of a map for a derby	  
>	/SETDMAP	-	Set a map for a derby	  
>	/DELDSPAWN	-	Delete a spawn in derby	  
>	/SETEVENTS	-	Disable server-wide events	  
>	/LOCKEVENT	-	Lock server-wide events for non-vips	  
>	/FORCECMDB	-	Force a bot to perform a command	  
>	/FORCEANIMB	-	Force a looped animation on bots	  
>	/FORCESANIMB	-	Force a bot to perform an animation	  
>	/FORCEDEATH	-	Force a player to "die"	  
>	/PLAY2	-	Stream audio over SA-MP	  
>	**level 5**		
>	/FLASH	-	WTF IS HAPPENING	  
>	/SETVIP	-	Promote a player to VIP	  
>	/REMOVEVIP	-	Demote a VIP to player	  
>	/SETADMIN	-	Promote a player or VIP to admin	  
>	/REMOVEADMIN	-	Demote an admin to player	  
>	/SETLEVEL	-	Set an admin's admin level	  
>	/CONNECT	-	Connect a bot to the server	  
>	/ANN	-	Announce a message below screen	  
>	/ANNSTOP	-	Stop the announcement	  
>	/CRX	-	Crash a player	  
>	/DELTELE	-	Delete a teleportation	  
>	/DELDERBY	-	Delete a derby	  
>	/SGOTO	-	Silently teleport to a player	  
>	/MYSQL	-	Reconnect database	  
`	IRC Cmds			`  
>	!MSG			  
>	!PLAYERS			  
>	!VA			  
>	!SERVER			  
>	!UPTIME			  
>	!V			  
>	!PM			  
>	!MEMO			  
>	!COUNTRIES			  
>	!GAY			  
>	!MATCH			  
>	!GREASY			  
>	!OWNED			  
>	!FAIL			  
>	!SAY			  
>	!A			  
>	!ANNOUNCE			  
>	!SLAP			  
>	!KILL			  
>	!EXPLODE			  
>	!FAKEMSG			  
>	!FAKEIRC			  
>	!INFO			  
>	!IPMATCH			  
>	!HOSTMATCH			  
>	!NAMEMATCH			  
>	!NAMEMATCH2			  
>	!KICK			  
>	!BAN			  
>	!STFU			  
>	!BANIP			  
>	!UNBANIP			  
>	!BANHOST			  
>	!UNBANHOST			  
>	!SETNAME			  
>	!ASAY			  
>	!ECHO			  
>	!PLAY			  
>	!SPLAY			  
>	!PAUSE			  
>	!RESUME			  
>	!RCON			  
>	!IDENTIFY			  
>	!RAW			  

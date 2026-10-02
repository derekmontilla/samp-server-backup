#include <a_samp>
#include <irc>
#include <streamer>
#include <dutils>

#undef MAX_PLAYERS
#define MAX_PLAYERS 50

enum playerdata {
	spawned,
	delay,
	mapviewer,
	maphelping,
	maphelpinviter
}

// Variables
new player[MAX_PLAYERS][playerdata];

// Defines
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
#define printlog(%1,%2) printf("[%s] %s", %1, %2)
//#define printlog(%1,%2) CallRemoteFunction("printflog", "ss", %1, %2)
#define MapDirectory "Maps"

#include <MapFileCore>
#include <FunctionCore>

#define IsPlayerBlocked(%1) CallRemoteFunction("IsPlayerBlocked", "i", %1)
#define IsVIP(%1) CallRemoteFunction("IsVIP", "i", %1)
#define IsAdmin(%1) CallRemoteFunction("IsAdmin", "i", %1)
#define GetPlayerAdminLevel(%1) CallRemoteFunction("GetPlayerAdminLevel", "i", %1)
#define IsPlayerInDMSPJA(%1) CallRemoteFunction("IsPlayerInDMSPJA", "i", %1)

// Enumerations
/*enum ObjectData {
	ObjectIDC,
	MapID,
	Float:XC,
	Float:YC,
	Float:ZC,
	Float:XR,
	Float:YR,
	Float:ZR
}*/

new	playername[64],
	giveplayername[64],
	strings[256],
	mapname[256],
	password[256],

	PermanentMode = 0,
	PermanentMode2 = 0,
	PermMapsTimer = -1;

new bool:vbeach = false,
	bool:ahut = false,
	bool:aairport = false,
	bool:amansion = false;

// Forwards
forward AllClearObjects();
forward AllClearObjects2();
forward GetClosestMapObject(playerid);
forward MoveMapObject(playerid, mapobjectid, Float:oX, Float:oY, Float:oZ, Float:speed, Float:orX, Float:orY, Float:orZ);
forward SetObjectPos2(objectid, Float:X, Float:Y, Float:Z);
forward SetObjectRot2(objectid, Float:RotX, Float:RotY, Float:RotZ);
forward MoveObject2(objectid, Float:X, Float:Y, Float:Z, Float:Speed);

forward LoadPermanentMaps(mapid, timerdelay);
//==============================================================================
public OnFilterScriptInit()
{
    for(new i = 0; i < MAX_LOADED_MAPS; i++) MapNames[i] = "NA";
    for(new a = 0; a < MAX_PLAYERS; a++)
    {
        if (IsPlayerConnected(a))
        player[a][spawned] = 1;
        MapEditorStatus[a] = -1;
		ObjectEditorStatus[a] = -1;
		player[a][delay] = 0;
		player[a][mapviewer] = -1;
    	player[a][maphelping] = 0;
		player[a][maphelpinviter] = -1;
    }
    //PermMapsTimer = SetTimerEx("LoadPermanentMaps", 10000, 0, "ii", 0, 5000);
    return print(">> The FingeX Map Editor has been LOADED.");
}
//==============================================================================
public OnFilterScriptExit()
{
	DestroyAllDynamicObjects();
    return print(">> The FingeX Map Editor has been UNLOADED.");
}
//==============================================================================
public OnPlayerSpawn(playerid)
{
	player[playerid][spawned] = 1;
	return 1;
}
//==============================================================================
public OnPlayerConnect(playerid)
{
	player[playerid][spawned] = 0;
    MapEditorStatus[playerid] = -1;
	ObjectEditorStatus[playerid] = -1;
	player[playerid][delay] = 0;
	player[playerid][mapviewer] = -1;
    player[playerid][maphelping] = 0;
	player[playerid][maphelpinviter] = -1;
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (response == EDIT_RESPONSE_FINAL)
    {
     	if (x <= -845.1447 && x >= -1319.4437 && y <= -823.1377 && y >= -1133.5485 || x <= -1337.3257 && x >= -1484.2833 && y <= -1420.2683 && y >= -1610.2789)
		{
			new MapID = MapEditorStatus[playerid],
	  			ObjectID = ObjectEditorStatus[playerid];

			SetDynamicObjectPos(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord]);
			SetDynamicObjectRot(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation]);

			new eString[256];
			format(eString, sizeof(eString),"[MAP] The selected Object %d in map \'%s\' was not saved because you are inside the FULL SPAWN area.", ObjectID, ReturnMapNameFromFile(GetLoadedMapName( MapID )));
			SendClientMessage(playerid, yellow, eString);
			return 1;
		}
    
	    new MapID = MapEditorStatus[playerid],
	        ObjectID = ObjectEditorStatus[playerid],
			MapName[256];

		Map[MapID][ObjectID-1][XCoord]    = x;
		Map[MapID][ObjectID-1][YCoord]    = y;
		Map[MapID][ObjectID-1][ZCoord]    = z;
		Map[MapID][ObjectID-1][XRotation] = rx;
		Map[MapID][ObjectID-1][YRotation] = ry;
		Map[MapID][ObjectID-1][ZRotation] = rz;

		SetDynamicObjectPos(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord]);
		SetDynamicObjectRot(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation]);
		
		new Key[4],
			eString[256];

		MapName = GetLoadedMapName(MapID);
		valstr(Key, ObjectID);
		format(eString, sizeof(eString),"%d %f %f %f %f %f %f", Map[MapID][ObjectID-1][ObjectId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation]);
		dini_Set(MapName, Key, eString);
		
		format(eString, sizeof(eString),"[MAP] The selected Object %d in map \'%s\' has been updated.", ObjectID, ReturnMapNameFromFile(GetLoadedMapName( MapID )));
		SendClientMessage(playerid, yellow, eString);
    } else if (response == EDIT_RESPONSE_CANCEL) // cancelled - do not save
	{
		new MapID = MapEditorStatus[playerid],
  			ObjectID = ObjectEditorStatus[playerid];
		        
		SetDynamicObjectPos(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord]);
		SetDynamicObjectRot(Map[MapID][ObjectID-1][StreamId], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation]);
		
		new eString[256];
		format(eString, sizeof(eString),"[MAP] The selected Object %d in map \'%s\' was not saved.", ObjectID, ReturnMapNameFromFile(GetLoadedMapName( MapID )));
		SendClientMessage(playerid, yellow, eString);
	}
	return 1;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	return 1;
}

public OnDynamicObjectMoved(objectid)
{
	return 1;
}
//==============================================================================
public OnPlayerCommandText(playerid,cmdtext[])
{
	//printf("[DEBUG-MAPEDITOR] OnPlayerCommandText(%d, %s)", playerid, cmdtext);
	if (!IsPlayerSpawned(playerid))
	{
	    new cmdstr[20], idx;
		cmdstr = strtok(cmdtext, idx);

		if (!strcmp(cmdstr, "/login", true) || !strcmp(cmdstr, "/kill", true) || !strcmp(cmdstr, "/help", true) || !strcmp(cmdstr, "/oclear", true)) { }
		else return SendClientMessage(playerid, green, "You must spawn first! 2");
	}

	if (IsPlayerBlocked(playerid))
	return SendClientMessage(playerid, white , "Your commands have been blocked.");

	if (IsPlayerInDMSPJA(playerid) && GetPlayerAdminLevel(playerid) < 3)
	{
	    new cmdstr[20], idx;
		cmdstr = strtok(cmdtext, idx);

		if (!strcmp(cmdstr, "/exit", true) || !strcmp(cmdstr, "/spin", true) || !strcmp(cmdstr, "/fire", true) || !strcmp(cmdstr, "/report", true) || !strcmp(cmdstr, "/l", true) || !strcmp(cmdstr, "/ul", true) || !strcmp(cmdstr, "/lock", true) || !strcmp(cmdstr, "/unlock", true) || !strcmp(cmdstr, "/handsup", true) || !strcmp(cmdstr, "/specdm", true) || !strcmp(cmdstr, "/spec", true) || !strcmp(cmdstr, "/jaillist", true) || !strcmp(cmdstr, "/back", true) || !strcmp(cmdstr, "/afk", true)) { }
		else return SendClientMessage(playerid, green, "Commands disabled when in deathmatch/spectating/jail!");
	}
	
	dcmd(objects,7,cmdtext);

	// Map Commands
	dcmd(ocommands,9,cmdtext);
	dcmd(cm,2,cmdtext);
	dcmd(lm,2,cmdtext);
	dcmd(ulm,3,cmdtext);
	dcmd(vlm,3,cmdtext);
	dcmd(vulm,4,cmdtext);
	dcmd(em,2,cmdtext);
	dcmd(emq,3,cmdtext);

	dcmd(createmap,9,cmdtext);
	dcmd(loadmap,7,cmdtext);
	dcmd(unloadmap,9,cmdtext);
	dcmd(vloadmap,8,cmdtext);
	dcmd(vunloadmap,10,cmdtext);
	dcmd(editmap,7,cmdtext);
	dcmd(editmapq,8,cmdtext);

	dcmd(maphelp,7,cmdtext);
	dcmd(mappass,7,cmdtext);
	dcmd(viewpass,8,cmdtext);
	
	// Object Commands
	dcmd(oc,2,cmdtext);
	dcmd(od,2,cmdtext);
	dcmd(oe,2,cmdtext);
	dcmd(mh,2,cmdtext);
	dcmd(os,2,cmdtext);

	dcmd(ocreate,7,cmdtext);
	dcmd(odestroy,8,cmdtext);
	dcmd(oedit,5,cmdtext);
	dcmd(osave,5,cmdtext);
	dcmd(oselect,7,cmdtext);
	dcmd(ochange,7,cmdtext);

	dcmd(ox,2,cmdtext);
	dcmd(oy,2,cmdtext);
	dcmd(oz,2,cmdtext);
	dcmd(rx,2,cmdtext);
	dcmd(ry,2,cmdtext);
	dcmd(rz,2,cmdtext);
	dcmd(go,2,cmdtext);

	if (IsVIP(playerid))
	{
		dcmd(vbeach,6,cmdtext);
		dcmd(oclear,6,cmdtext);
	}

	if (GetPlayerAdminLevel(playerid) > 0)
	{
		dcmd(mapinfo,7,cmdtext);
		dcmd(maps,4,cmdtext);
		dcmd(ahut,4,cmdtext);
		dcmd(aairport,8,cmdtext);
		dcmd(amansion,8,cmdtext);
		dcmd(getid,5,cmdtext);
		if (GetPlayerAdminLevel(playerid) > 2)
		{
			dcmd(forcemap,8,cmdtext);
		}
		if (GetPlayerAdminLevel(playerid) > 3)
		{
			dcmd(convert,7,cmdtext);
			dcmd(clearmap,8,cmdtext);
			dcmd(setmap,6,cmdtext);
			dcmd(mymap,5,cmdtext);
			//dcmd(forceload,9,cmdtetx);
		}
	}
	return 0;
}
//==============================================================================
dcmd_ocommands(playerid,params[]) {
	if (!strlen(params) || strlen(params) < 1 || strlen(params) > 3)
	return SendClientMessage(playerid,red,">> SYNTAX: /OCOMMANDS <1-3>");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ocommands %s", playername, params);
	printlog("CMD-F", logstring);

	switch(strval(params)) {
 	case 1: {
			SendClientMessage(playerid, green,"* Object commands: *");
			SendClientMessage(playerid, yellow,"* /createmap <mapname> <password> - Create a map *");
			SendClientMessage(playerid, yellow,"* /loadmap <mapname> <password> - Load given map *");
			SendClientMessage(playerid, yellow,"* /unloadmap <mapname> - Unload given map*");
			SendClientMessage(playerid, yellow,"* /ocreate <MODEL ID> - Create an object with given valid model *");
			SendClientMessage(playerid, yellow,"* /odestroy <ITEM ID> - Destroy an object with given selection ID *");
			SendClientMessage(playerid, yellow,"* /oedit <ITEM ID> - Select an object to edit with given selection ID *");
			SendClientMessage(playerid, yellow,"* /osave - Exit editing an object *");
			if (GetPlayerAdminLevel(playerid) >= 3) SendClientMessage(playerid, yellow,"* /clearmap <mapname> - Clear the given map *");
			SendClientMessage(playerid, green,"* Use /ocommands 2 for more. *");
			return 1;
	        }
    case 2: {
			SendClientMessage(playerid, green,"* Object commands: *");
			SendClientMessage(playerid, yellow,"* /editmap <mapname> <password> - Edit given map *");
			SendClientMessage(playerid, yellow,"* /editmapq - Exit editing a map *");
			SendClientMessage(playerid, yellow,"* /oX <VALUE> - Changes an object's X Position *");
			SendClientMessage(playerid, yellow,"* /oY <VALUE> - Changes an object's Y Position *");
			SendClientMessage(playerid, yellow,"* /oZ <VALUE> - Changes an object's Z Position *");
			SendClientMessage(playerid, yellow,"* /Rx <VALUE> - Changes an object's X Rotation *");
			SendClientMessage(playerid, yellow,"* /Ry <VALUE> - Changes an object's Y Rotation *");
			SendClientMessage(playerid, yellow,"* /Rz <VALUE> - Changes an object's Z Rotation *");
			SendClientMessage(playerid, green,"* Use /ocommands 3 for more. *");
			return 1;
	        }
    case 3: {
			SendClientMessage(playerid, green,"* Object commands: *");
			SendClientMessage(playerid, yellow,"* /go <ITEM ID> - Teleport to one of your map objects *");
			SendClientMessage(playerid, yellow,"* /oselect <ITEM ID> <MODEL ID> - Open selection mode for a mapped object *");
			SendClientMessage(playerid, yellow,"* /ochange <ITEM ID> <MODEL ID> - Replace an object with a another model *");
			SendClientMessage(playerid, yellow,"* /mappass <mapname> OLDPASSWORD NEWPASSWORD - Change map password *");
			SendClientMessage(playerid, yellow,"* /maphelp <invite> - Make maps with more persons *");
			SendClientMessage(playerid, yellow,"* /vloadmap <mapname> <view_password> - View a map *");
			SendClientMessage(playerid, yellow,"* /vunloadmap <mapname> <view_password> - Stop viewing a map*");
			SendClientMessage(playerid, yellow,"* /viewpass <mapname> <mappassword> <viewpassword> - Change map view_password *");
			return 1;
	        }
  	}
	return 1;
}
//==============================================================================
dcmd_objects(playerid,params[])
{
	#pragma unused params

	new str[100];
	format(str, sizeof(str), "There are currently %d objects being streamed to the server.", CountDynamicObjects());
	SendClientMessage(playerid, green, str);
	return 1;
}
//==============================================================================
dcmd_cm(playerid,params[])
return dcmd_createmap(playerid,params);

dcmd_createmap(playerid,params[])
{
	new idx;

	if (MapEditorStatus[playerid] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You have already loaded a map");

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /CREATEMAP <MAP NAME> <PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 30) return SendClientMessage(playerid,red,">> ERROR: Your map NAME must be between 3 and 30 characters.");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /CREATEMAP <MAP NAME> <PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 20) return SendClientMessage(playerid,red,">> ERROR: Your map PASSWORD must be between 3 and 20 characters.");
	password = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /createmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return CreateMapFile(playerid, MapName, mapname, password);
}
//==============================================================================
dcmd_lm(playerid,params[])
return dcmd_loadmap(playerid,params);

dcmd_loadmap(playerid,params[])
{
    //if (IsPlayerInArea(playerid, -103.00, -1040.65, -908.00, -950.85))
    if (IsPlayerInArea(playerid, -845.1447, -1319.4437, -823.1377, -1133.5485) | IsPlayerInArea(playerid, -1337.3257, -1484.2833, -1420.2683, -1610.2789))
    return SendClientMessage(playerid,white, "This command is disabled in the FULL SPAWN area.");

	new idx;

	if (MapEditorStatus[playerid] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You have already loaded a map");

	if (player[playerid][mapviewer] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You are currently VIEWING a map, unload it first with /VUNLOADMAP.");

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /LOADMAP <MAP NAME> <PASSWORD>");

	if (!IsValidMapname(strings) || strlen(strings) > 50) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9 [MAX. 50 CHAR.]");
	mapname = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /LOADMAP <MAP NAME> <PASSWORD>");
	password = strings;

	if (!AntiSpam(playerid, 2)) return 1;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /loadmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return LoadMap(playerid,MapName,mapname, password);
}
//==============================================================================
dcmd_ulm(playerid,params[])
return dcmd_unloadmap(playerid,params);

dcmd_unloadmap(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /UNLOADMAP <MAP NAME> <PASSWORD>");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	if (player[playerid][mapviewer] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You are currently VIEWING a map, unload it first with /VUNLOADMAP.");

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /UNLOADMAP <MAP NAME> <PASSWORD>");
	password = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /unloadmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return UnloadMap(playerid, MapName, mapname, password);
}
//==============================================================================
dcmd_vlm(playerid,params[])
return dcmd_vloadmap(playerid,params);

dcmd_vloadmap(playerid,params[])
{
    //if (IsPlayerInArea(playerid, -103.00, -1040.65, -908.00, -950.85))
    if ((IsPlayerInArea(playerid, -845.1447, -1319.4437, -823.1377, -1133.5485) | IsPlayerInArea(playerid, -1337.3257, -1484.2833, -1420.2683, -1610.2789)) && GetPlayerVirtualWorld(playerid) == 0)
    return SendClientMessage(playerid,white, "This command is disabled in the FULL SPAWN area. (only world 0)");

	new idx;

	if (MapEditorStatus[playerid] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You have already loaded a map");

	if (player[playerid][mapviewer] != -1)
	return SendClientMessage(playerid,red,">> ERROR: You are currently VIEWING a map, unload it first with /VUNLOADMAP.");

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VLOADMAP <MAP NAME> <PASSWORD>");

	if (!IsValidMapname(strings) || strlen(strings) > 50) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9 [MAX. 50 CHAR.]");
	mapname = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VLOADMAP <MAP NAME> <PASSWORD>");
	password = strings;

	if (!AntiSpam(playerid, 2)) return 1;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /vloadmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return VLoadMap(playerid,MapName,mapname, password);
}
//==============================================================================
dcmd_vulm(playerid,params[])
return dcmd_vunloadmap(playerid,params);

dcmd_vunloadmap(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VUNLOADMAP <MAP NAME> <PASSWORD>");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VUNLOADMAP <MAP NAME> <PASSWORD>");
	password = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /vunloadmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return VUnloadMap(playerid, MapName, mapname, password);
}
//==============================================================================
dcmd_clearmap(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings))
	return SendClientMessage(playerid,red,">> SYNTAX: /CLEARMAP <MAP NAME>");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /clearmap %s", playername, params);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return ClearMap(playerid,MapName,params);
}

dcmd_forcemap(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings))
	return SendClientMessage(playerid,red,">> SYNTAX: /FORCEMAP <MAP NAME>");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /forcemap %s", playername, params);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return UnloadMap(playerid, MapName, params, "UnloadAllMapsxMovie321");
}


//==============================================================================
dcmd_mappass(playerid,params[])
{
	new idx,
		map[256],
		oldpassword[256],
		newpassword[256];

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /MAPPASS <MAP> <OLD PASSWORD> <NEW PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 20) return SendClientMessage(playerid,red,">> ERROR: Your map NAME must be between 3 and 20 characters.");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	map = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /MAPPASS <MAP> <OLD PASSWORD> <NEW PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 30) return SendClientMessage(playerid,red,">> ERROR: Your OLD_PASSWORD must be between 3 and 30 characters.");
	oldpassword = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /MAPPASS <MAP> <OLD PASSWORD> <NEW PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 30) return SendClientMessage(playerid,red,">> ERROR: Your NEW_PASSWORD must be between 3 and 30 characters.");
	newpassword = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /mappass %s *oldpass* *newpass*", playername, map);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return ChangeMapPassword(playerid, MapName, map, oldpassword, newpassword);
}
//==============================================================================
dcmd_viewpass(playerid,params[])
{
	new idx,
		map[256],
		mappassword[256],
		vpassword[256];

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VIEWPASS <MAP> <MAP_PASSWORD> <NEW_VIEW_PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 20) return SendClientMessage(playerid,red,">> ERROR: Your map NAME must be between 3 and 20 characters.");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	map = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VIEWPASS <MAP> <MAP_PASSWORD> <NEW_VIEW_PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 30) return SendClientMessage(playerid,red,">> ERROR: Your MAP_PASSWORD must be between 3 and 30 characters.");
	mappassword = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /VIEWPASS <MAP> <MAP_PASSWORD> <NEW_VIEW_PASSWORD>");
	if (strlen(strings) < 3 || strlen(strings) > 30) return SendClientMessage(playerid,red,">> ERROR: Your NEW_VIEW_PASSWORD must be between 3 and 30 characters.");
	vpassword = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /viewpass %s *mappassword* *viewpass*", playername, map);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return ChangeVMapPassword(playerid, MapName, map, mappassword, vpassword);
}
//==============================================================================
dcmd_em(playerid,params[])
return dcmd_editmap(playerid,params);

dcmd_editmap(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /EDITMAP <MAP NAME> <PASSWORD>");

 	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /EDITMAP <MAP NAME> <PASSWORD>");
	password = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /editmap %s ***", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return SelectMapToEdit(playerid, MapName, mapname, password);
}
//==============================================================================
dcmd_emq(playerid,params[])
return dcmd_editmapq(playerid,params);

dcmd_editmapq(playerid,params[]) {
	#pragma unused params
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You are already not editing a map.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /editmapq", playername);
	printlog("CMD-F", logstring);

	MapEditorStatus[playerid] = ObjectEditorStatus[playerid] = -1;
 	player[playerid][maphelping] = 0;
	return SendClientMessage(playerid,yellow,"[MAP] You are now editing no maps. To edit a map again, type /EDITMAP <MAP NAME>.");
}
//==============================================================================
dcmd_oc(playerid,params[])
return dcmd_ocreate(playerid,params);

dcmd_ocreate(playerid,params[])
{
    //if (IsPlayerInArea(playerid, -103.00, -1040.65, -908.00, -950.85))
    if (IsPlayerInArea(playerid, -845.1447, -1319.4437, -823.1377, -1133.5485) || IsPlayerInArea(playerid, -1337.3257, -1484.2833, -1420.2683, -1610.2789))
    return SendClientMessage(playerid,white, "This command is disabled in the FULL SPAWN area.");

	if (!strlen(params) || !IsNumeric(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OCREATE <MODEL ID>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to create an object.");
	//if (!IsValidModel(strval(params)) || strval(params) == 9683) return SendClientMessage(playerid,red,">> ERROR: The model ID you have entered is invalid.");
	if (!IsValidModel(strval(params)) || strval(params) == 9683) return SendClientMessage(playerid,red,">> ERROR: The model ID you have entered is invalid.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ocreate %s", playername, params);
	printlog("CMD-F", logstring);

	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid,X,Y,Z); GetXYInFrontOfPlayer(playerid,X,Y,3.0);
	return AddObject(playerid,MapEditorStatus[playerid],strval(params),X,Y,Z+1.5,0.0,0.0,0.0);
}
//==============================================================================
dcmd_od(playerid,params[])
return dcmd_odestroy(playerid,params);

dcmd_odestroy(playerid,params[]) {
    if (!strlen(params) || !IsNumeric(params)) return SendClientMessage(playerid,red,">> SYNTAX: /ODESTROY <MAP ITEM ID>");
    if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to destroy an object.");

    GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /odestroy %s", playername, params);
	printlog("CMD-F", logstring);

	return DeleteObject(playerid,MapEditorStatus[playerid],strval(params));
}
//==============================================================================
dcmd_oe(playerid,params[])
return dcmd_oedit(playerid,params);

dcmd_oedit(playerid,params[]) {
    if (!strlen(params) || !IsNumeric(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OEDIT <MAP ITEM ID>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to edit an object.");
	if (ObjectEditorStatus[playerid] == strval(params)) return SendClientMessage(playerid,red,">> ERROR: You are already editing this object.");
	if (strval(params) < 1 || strval(params) > MAX_MAP_OBJECTS) return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /oedit %s", playername, params);
	printlog("CMD-F", logstring);

	return SelectObjectToEdit(playerid,strval(params));
}

dcmd_go(playerid, params[])
{
	new mapid;

	if (MapEditorStatus[playerid] != -1) mapid = MapEditorStatus[playerid];
    else if (player[playerid][mapviewer] != -1) mapid = player[playerid][mapviewer];
	else return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to teleport to an object.");

	if (IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	return SendClientMessage(playerid,red,">> ERROR: You must be the driver of a vehicle.");

	new idx,
	    itemid;

	strings = strtok(params, idx);
	if (!strlen(strings) || !IsNumeric(strings))
	return SendClientMessage(playerid, white, "[USAGE]: /GO <MAP ITEM ID> (X_OFFSET Y_OFFSET Z_OFFSET[max 25.0])");
	itemid = strval(strings);

	if (strval(params) < 1 || strval(params) > MAX_MAP_OBJECTS) return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");
   	if (Map[ mapid ][itemid-1][ObjectId] == 0) return SendClientMessage(playerid,red,">> ERROR: This map item ID is empty (no object)");

	new Float:X = 0.0,
		Float:Y = 0.0,
		Float:Z = 0.0,
		vID = GetPlayerVehicleID(playerid);

	strings = strtok(params, idx);
	if (!strlen(strings))
	{
		if (!vID)
		{
			SetPlayerPos(playerid, Map[ mapid ][itemid-1][XCoord], Map[ mapid ][itemid-1][YCoord], Map[ mapid ][itemid-1][ZCoord] +1);
		} else {
			SetVehiclePos(vID, Map[ mapid ][itemid-1][XCoord], Map[ mapid ][itemid-1][YCoord], Map[ mapid ][itemid-1][ZCoord] +1);
		}
		format(strings, sizeof(strings), "[SUCCES]: You have teleported to MAP ITEM: %d (modelID: %d).", itemid, Map[ mapid ][itemid-1][ObjectId]);
		SendClientMessage(playerid, green, strings);
	    return 1;
	}

	X = floatstr(strings);
	strings = strtok(params, idx);

	if (!strlen(strings)) {
	    goto fwarpto;
	}

	Y = floatstr(strings);
	strings = strtok(params, idx);

	if (!strlen(strings)) {
	    goto fwarpto;
	}

	Z = floatstr(strings);

	fwarpto:

	new Float:obX, Float:obY, Float:obZ;
	GetDynamicObjectPos(Map[ mapid ][itemid-1][StreamId], obX, obY, obZ);
	if (!vID)
	{
		SetPlayerPos(playerid, obX +X, obY +Y, obZ +Z +1);
	} else {
		SetVehiclePos(vID, obX +X, obY +Y, obZ +Z +1);
	}
	//SetPlayerPos(playerid, Map[ MapEditorStatus[playerid] ][itemid-1][XCoord] +X, Map[ MapEditorStatus[playerid] ][itemid-1][YCoord] +Y, Map[ MapEditorStatus[playerid] ][itemid-1][ZCoord] +Z +1);
	//SetCameraBehindPlayer(playerid);
	format(strings, sizeof(strings), "[SUCCES]: You have teleported to MAP ITEM: %d (modelID: %d).", itemid, Map[ mapid ][itemid-1][ObjectId]);
	SendClientMessage(playerid, green, strings);
	return 1;
}
//==============================================================================
dcmd_mh(playerid,params[])
return dcmd_maphelp(playerid,params);

dcmd_maphelp(playerid,params[]) {
	new idx,
		giveplayerid;

	strings = strtok(params, idx);
	if (!strlen(strings) || IsNumeric(strings))
	return SendClientMessage(playerid, white, "[USAGE]: /maphelp <invite/ accept|deny /stop>");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /maphelp %s", playername, params);
	printlog("CMD-F", logstring);

	if (!strcmp(strings,"invite",true))
	{
		if (!strlen(params[strlen(strings)+1]))
		{
			SendClientMessage(playerid, white, "[USAGE]: /maphelp invite <name|id>");
			SendClientMessage(playerid, red, "[MAPHELP-WARNING] The player you invite can perform ANY object command on this map");
			return 1;
		}

		if (!IsNumeric(params[strlen(strings)+1])) giveplayerid = ReturnPlayerID(params[strlen(strings)+1]);
		else giveplayerid = strval(params[strlen(strings)+1]);

		if (giveplayerid == playerid)
		return SendClientMessage(playerid, white, "You cannot invite yourself");

	    if (IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
	    {
	    	if (player[playerid][maphelping] == 1)
		    return SendClientMessage(playerid, white, "Only the map author can invite players.");

	    	if (MapEditorStatus[giveplayerid] != -1)
		    return SendClientMessage(playerid, white, "This player is busy with his/her own map.");

		    if (player[giveplayerid][maphelping] == 1)
		    return SendClientMessage(playerid, white, "This player is already helping someone with mapeditor");

 			if (player[giveplayerid][maphelpinviter] != -1)
 			return SendClientMessage(playerid, white, "This player has another invitation pending, wait for him to deny.");

			player[giveplayerid][maphelpinviter] = playerid;
			format(strings, sizeof(strings), "[MAPHELP] You have been invited by %s for helping with mapping (/maphelp accept|deny).", playername);
			SendClientMessage(giveplayerid, green, strings);
			SendClientMessage(playerid, red, "[MAPHELP-WARNING] This player can now perform ANY object command on this map");
			GetPlayerName(giveplayerid, giveplayername, sizeof(giveplayername));
 			format(strings, sizeof(strings), "[MAPHELP] You have invited %s to help with mapping.", giveplayername);
  			SendClientMessage(playerid, green, strings);
		} else SendClientMessage(playerid, white, "This player is not connected");
		return 1;
	}

	if (!strcmp(strings,"accept",true))
	{
		if (player[playerid][maphelping] == 1)
		return SendClientMessage(playerid, white, "You are already helping someone with the mapeditor");

 		if (player[playerid][maphelpinviter] == -1)
 		return SendClientMessage(playerid, white, "You have no maphelp invitations pending");

		format(strings, sizeof(strings), "[MAPHELP] %s has accepted and is willing to help.", playername);
  		SendClientMessage(player[playerid][maphelpinviter], green, strings);
		SendClientMessage(playerid, green, "[MAPHELP] You have chosen to help and can now access the map.");

		MapEditorStatus[playerid] = MapEditorStatus[ player[playerid][maphelpinviter] ];
		player[playerid][maphelping] = 1;
		player[playerid][maphelpinviter] = -1;
		SetPlayerColor(playerid, GetPlayerColor(playerid) );
		return 1;
	}

	if (!strcmp(strings,"deny",true))
	{
		if (player[playerid][maphelping] == 1)
		return SendClientMessage(playerid, white, "You are already helping someone with the mapeditor");

 		if (player[playerid][maphelpinviter] == -1)
 		return SendClientMessage(playerid, white, "You have no maphelp invitations pending");

		format(strings, sizeof(strings), "[MAPHELP] %s has denied your invitation.", playername);
  		SendClientMessage(player[playerid][maphelpinviter], green, strings);
		SendClientMessage(playerid, green, "[MAPHELP] You have denied the invitation.");

  		player[playerid][maphelping] = 0;
		player[playerid][maphelpinviter] = -1;
		return 1;
	}
	if (!strcmp(strings,"stop",true))
	{
		if (player[playerid][maphelping] == 0)
		return SendClientMessage(playerid, white, "You are not helping someone with the mapeditor");

		format(strings, sizeof(strings), "[MAPHELP] %s has stopped maphelping.", playername);
  		SendClientMessage(player[playerid][maphelpinviter], green, strings);
		SendClientMessage(playerid, green, "[MAPHELP] You have stopped maphelping.");

		MapEditorStatus[playerid] = ObjectEditorStatus[playerid] = -1;
  		player[playerid][maphelping] = 0;
		player[playerid][maphelpinviter] = -1;
		return 1;
	}
	return SendClientMessage(playerid, white, "[USAGE]: /maphelp <invite/ accept|deny /stop>");
}
//==============================================================================
dcmd_os(playerid,params[])
return dcmd_osave(playerid,params);

dcmd_osave(playerid,params[]) {
	#pragma unused params
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to save an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to save it.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /osave", playername);
	printlog("CMD-F", logstring);

    ObjectEditorStatus[playerid] = -1;
	return SendClientMessage(playerid,yellow,"[MAP] You are now editing no objects. To edit an object on this map, type /OEDIT <MAP ITEM ID>.");
}
//==============================================================================
dcmd_oselect(playerid,params[])
{
	new objectID = strval(params);
    if (!strlen(params) || !IsNumeric(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OSELECT <MAP ITEM ID>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to select an object.");
	if (objectID < 1 || objectID > MAX_MAP_OBJECTS) return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /oselect %s", playername, params);
	printlog("CMD-F", logstring);

	SelectObjectToEdit(playerid, objectID);
	EditDynamicObject(playerid, Map[ MapEditorStatus[playerid] ][objectID-1][StreamId]);
	return SendClientMessage(playerid,yellow,"[MAP] You are now editing the selected object. Use {10F441}~k~~PED_SPRINT~{FFFF00} to look around and ESC to cancel selection.");
}
//==============================================================================
dcmd_ochange(playerid,params[])
{
    //if (IsPlayerInArea(playerid, -103.00, -1040.65, -908.00, -950.85))
    if (IsPlayerInArea(playerid, -845.1447, -1319.4437, -823.1377, -1133.5485) || IsPlayerInArea(playerid, -1337.3257, -1484.2833, -1420.2683, -1610.2789))
    return SendClientMessage(playerid,white, "This command is disabled in the FULL SPAWN area.");

	new idx,
		ObjectID,
		NewModelID;
	
	strings = strtok(params, idx);
	ObjectID = strval(strings);
	if (!strlen(strings) || !IsNumeric(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /OCHANGE <MAP ITEM ID> <NEW MODEL ID>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectID < 1 || ObjectID > MAX_MAP_OBJECTS) return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");
	
	strings = strtok(params, idx);
	NewModelID = strval(strings);
	if (!IsValidModel(NewModelID) || NewModelID == 9683) return SendClientMessage(playerid,red,">> ERROR: The model ID you have entered is invalid.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ochange %s", playername, params);
	printlog("CMD-F", logstring);

    new MapID = MapEditorStatus[playerid],
		MapName[256];

	MapName = GetLoadedMapName(MapID);
	if(!strcmp(MapName,"...",true))
	return SendClientMessage(playerid,red,">> ERROR: Your map does not appear to be loaded, the selected object was not saved.");

	new Key[4],
		Value[256];

	valstr(Key, ObjectID);
	Value = dini_Get(MapName, Key);
	if(!strcmp(Value,"-1",true) || ObjectID < 1 || ObjectID > MAX_MAP_OBJECTS)
	return SendClientMessage(playerid,red,">> ERROR: This object has not been set to be updated.");

	Map[MapID][ObjectID-1][ObjectId] = NewModelID;

	DestroyDynamicObject(Map[MapID][ObjectID-1][StreamId]);
	Map[MapID][ObjectID-1][StreamId] = CreateDynamicObject(Map[MapID][ObjectID-1][ObjectId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation], GetPlayerVirtualWorld(playerid));
	Streamer_Update(playerid);

	new string[256];
	format(string, sizeof(string),"%d %f %f %f %f %f %f", Map[MapID][ObjectID-1][ObjectId], Map[MapID][ObjectID-1][XCoord], Map[MapID][ObjectID-1][YCoord], Map[MapID][ObjectID-1][ZCoord], Map[MapID][ObjectID-1][XRotation], Map[MapID][ObjectID-1][YRotation], Map[MapID][ObjectID-1][ZRotation]);
	dini_Set(MapName, Key, string);

	format(string, sizeof(string),"[MAP] Map item %d was replaced with model %d in map \'%s\'.", ObjectEditorStatus[playerid], NewModelID, ReturnMapNameFromFile(GetLoadedMapName( MapEditorStatus[playerid] )));
	return SendClientMessage(playerid, yellow, string);
}
//==============================================================================
dcmd_ox(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OX <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's position.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ox %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"X",floatstr(params));
}
//==============================================================================
dcmd_oy(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OY <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's position.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /oy %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"Y",floatstr(params));
}
//==============================================================================
dcmd_oz(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /OZ <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's position.");

	if (!AntiSpam(playerid, 1)) return 1;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /oz %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"Z",floatstr(params));
}
//==============================================================================
dcmd_rx(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /RX <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's rotation.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /rx %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"XRot",floatstr(params));
}
//==============================================================================
dcmd_ry(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /RY <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's rotation.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ry %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"YRot",floatstr(params));
}
//==============================================================================
dcmd_rz(playerid,params[]) {
	if (!strlen(params)) return SendClientMessage(playerid,red,">> SYNTAX: /RZ <VALUE>");
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to change an object.");
	if (ObjectEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must be editing an object to alter it's rotation.");

	if (!AntiSpam(playerid, 1)) return 1;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /rz %s", playername, params);
	printlog("CMD-F", logstring);

	return UpdateObject(playerid,MapEditorStatus[playerid],ObjectEditorStatus[playerid],"ZRot",floatstr(params));
}
//==============================================================================
dcmd_oclear(playerid,params[]) {
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /oclear %s", playername, params);
	printlog("CMD-F", logstring);

	new str[256],
		Name[24];

	GetPlayerName(playerid, Name, sizeof(Name));
    format(str, sizeof(str), "Maps Cleared by %s", Name);
    SendClientMessageToAll(red, str);
	format(str, sizeof(str), "7,12>> Maps Cleared by %s", Name);
	IRC_GroupSay(1, "#xmovie", str);
	//AllClearObjects();
	AllClearObjects2();
	return 1;
}
//==============================================================================
dcmd_mapinfo(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /MAPINFO <MAP NAME>");

	if (!IsValidMapname(strings) || strlen(strings) > 50) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9 [MAX. 50 CHAR.]");
	mapname = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /mapinfo %s", playername, params);
	printlog("CMD-F", logstring);

    new MapName[256];
	format(MapName,256,"%s/%s.ini",MapDirectory,mapname);

	if (!dini_Exists(MapName))
	return (playerid == INVALID_PLAYER_ID ? 1 : SendClientMessage(playerid,red,">> ERROR: The map name specified does not exist."));

	new creator[256],
	    mpassword[256],
		viewpassword[256] = "None";

	creator = dini_Get(MapName,"Creator");
	if (GetPlayerAdminLevel(playerid) < 5) mpassword[0] = '*';
	else mpassword = dini_Get(MapName,"Password");
	viewpassword = dini_Get(MapName,"ViewPassword");


	new objects = 0;
	for(new i = 1; i <= MAX_MAP_OBJECTS; i++)
	{
	    new Key[4],
			Value[256];

		valstr(Key,i);
		Value = dini_Get(MapName,Key);
	    if (!strcmp(Value,"-1",true)) continue;
	    else objects++;
	}

	new mapstr[25], infostr[128];
	format(mapstr, sizeof(mapstr), "Map info: %s", mapname);
	format(infostr, sizeof(infostr), "Creator: %s\nPassword: %s\nObjects: %d\nViewPass: %s", creator, mpassword, objects, viewpassword);
    ShowPlayerDialog(playerid, 1337, DIALOG_STYLE_MSGBOX, mapstr, infostr, "OK", "");
    return 1;
}

dcmd_maps(playerid,params[])
{
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /maps", playername);
	printlog("CMD-F", logstring);

 	new mapusers;

  	for (new i = 0; i < MAX_PLAYERS; i++)
  	{
  	    if (IsPlayerConnected(i))
  	    {
			if (MapEditorStatus[i] != -1 || player[i][mapviewer] != -1)
			{
			    if (mapusers == 0)
				{
		      		SendClientMessage(playerid, yellow, "* List of players with a loaded map:");
					mapusers = 1;
				}
				GetPlayerName(i, playername, sizeof(playername));
				if (player[i][mapviewer] == -1) format(strings, sizeof(strings), "* %s (id: %d) - \'%s\' (mapid: %d)", playername, i, ReturnMapNameFromFile(GetLoadedMapName(MapEditorStatus[i])), MapEditorStatus[i]);
				else format(strings, sizeof(strings), "* %s (id: %d) - \'%s\' (mapid: %d - view-mode)", playername, i, ReturnMapNameFromFile(GetLoadedMapName(player[i][mapviewer])), player[i][mapviewer]);
				SendClientMessage(playerid, yellow, strings);
			}
		}
	}
	if (mapusers == 0)
	SendClientMessage(playerid, yellow, "* Nobody is mapeditting at the moment.");
	return 1;
}

dcmd_convert(playerid,params[])
{
	new idx;

	strings = strtok(params, idx);
	if (!strlen(strings)) return SendClientMessage(playerid,red,">> SYNTAX: /CONVERT <MAP NAME>");

	if (!IsValidMapname(strings)) return SendClientMessage(playerid,red,">> ERROR: Your map NAME may only contain A-Z, a-z and 0-9");
	mapname = strings;

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /convert %s", playername, mapname);
	printlog("CMD-F", logstring);

	new MapName[256]; format(MapName, sizeof(MapName), "%s/%s.ini", MapDirectory, mapname);
	return ConvertMap(playerid, MapName, mapname);
}

dcmd_getid(playerid,params[])
{
	if (MapEditorStatus[playerid] == -1)
	return SendClientMessage(playerid,red,">> ERROR: You must be editing a map to search an object.");

    if (!strlen(params) || !IsNumeric(params))
	return SendClientMessage(playerid,red,">> SYNTAX: /GETID <MAP_ITEM_ID>");

	if (strval(params) < 1 || strval(params) > MAX_MAP_OBJECTS)
	return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");
	new itemid = strval(params);

   	if (Map[ MapEditorStatus[playerid] ][itemid-1][ObjectId] == 0)
	return SendClientMessage(playerid,red,">> ERROR: This map item ID is empty (no object)");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /getid %s", playername, params);
	printlog("CMD-F", logstring);

	format(strings, sizeof(strings), ">> INFO: MapObjectID: %d | ObjectID: %d | ModelID: %d", itemid,  Map[ MapEditorStatus[playerid] ][itemid-1][StreamId], Map[ MapEditorStatus[playerid] ][itemid-1][ObjectId]);
	SendClientMessage(playerid, green, strings);
	return 1;
}

dcmd_setmap(playerid,params[])
{
    if (!strlen(params) || !IsNumeric(params))
	return SendClientMessage(playerid,red,">> SYNTAX: /SETMAP <MAP_ID>");

	if (strval(params) < 0 || strval(params) > MAX_LOADED_MAPS )
	return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid MAP-ID.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /setmap %s", playername, params);
	printlog("CMD-F", logstring);

	MapEditorStatus[playerid] = strval(params);

	format(strings, sizeof(strings), ">> INFO: You are now editting the map \'%s\'", ReturnMapNameFromFile(GetLoadedMapName(MapEditorStatus[playerid])));
	SendClientMessage(playerid, green, strings);
	return 1;
}

dcmd_mymap(playerid,params[])
{
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /mymap", playername);
	printlog("CMD-F", logstring);

	if (MapEditorStatus[playerid] == -1)
	return SendClientMessage(playerid,red,">> ERROR: You are currently not editting any map.");

	format(strings, sizeof(strings), ">> INFO: You are currently editting the map \'%s\' (MapID: %d)", ReturnMapNameFromFile(GetLoadedMapName(MapEditorStatus[playerid])), MapEditorStatus[playerid]);
	SendClientMessage(playerid, green, strings);
	return 1;
}

/*dcmd_forceload(playerid,params[])
{
    if (!strlen(params) || !IsNumeric(params))
	return SendClientMessage(playerid,red,">> SYNTAX: /FORCELOAD <DELAY_TIME>");

	new setdelay = strval(params);
	if (strval(params) < 3 || strval(params) > 60)
	return SendClientMessage(playerid,red,">> ERROR: Loading time must be between 3 and 60 seconds.");

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /forceload %s", playername, params);
	printlog("CMD-F", logstring);

	LoadPermanentMaps(0, setdelay*1000);

	format(strings, sizeof(strings), ">> INFO: Permanent maps are now being loaded with a delay of %d seconds.", setdelay);
	SendClientMessage(playerid, green, strings);
	return 1;
}*/

//==============================================================================
dcmd_vbeach(playerid,params[]) {
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /vbeach", playername);
	printlog("CMD-F", logstring);

	if (vbeach == false)
	{
	    vbeach = true;
		LoadMap(playerid, "Maps/vipbeach.ini", "vipbeach", "VIPS");
		MapEditorStatus[playerid] = -1;
	} else {
	    vbeach = false;
		UnloadMap(playerid, "Maps/vipbeach.ini", "vipbeach", "VIPS");
	}
	return 1;
}
//==============================================================================
dcmd_ahut(playerid,params[])
{
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /ahut", playername);
	printlog("CMD-F", logstring);

	if (ahut == false)
	{
	    ahut = true;
		LoadMap(playerid,"Maps/adminhut.ini","adminhut", "pass");
		MapEditorStatus[playerid] = -1;
	} else {
	    ahut = false;
		UnloadMap(playerid,"Maps/adminhut.ini","adminhut", "pass");
	}
	return 1;
}
//==============================================================================
dcmd_aairport(playerid,params[])
{
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /aairport", playername);
	printlog("CMD-F", logstring);

	if (aairport == false)
	{
	    aairport = true;
		LoadMap(playerid, "Maps/newadminisland.ini", "newadminisland", "pass");
		MapEditorStatus[playerid] = -1;
	} else {
	    aairport = false;
		UnloadMap(playerid, "Maps/newadminisland.ini", "newadminisland", "pass");
	}
	return 1;
}
//==============================================================================
dcmd_amansion(playerid,params[])
{
	#pragma unused params

	GetPlayerName(playerid, playername, sizeof(playername));
	format(logstring, sizeof(logstring),"%s issues command /amansion", playername);
	printlog("CMD-F", logstring);

	if (amansion == false)
	{
	    amansion = true;
		LoadMap(playerid, "Maps/sexyPool.ini", "sexyPool", "moghza");
		LoadMap(playerid, "Maps/sexyPool2.ini", "sexyPool2", "moghza");
		MapEditorStatus[playerid] = -1;
	} else {
	    amansion = false;
		UnloadMap(playerid, "Maps/sexyPool.ini", "sexyPool", "moghza");
		UnloadMap(playerid, "Maps/sexyPool2.ini", "sexyPool2", "moghza");
	}
	return 1;
}
//==============================================================================
public AllClearObjects()
{
	for(new j = 0; j < MAX_PLAYERS; j++)
	{
		if (IsPlayerConnected(j))
		{
		   	MapEditorStatus[j] = -1;
  			ObjectEditorStatus[j] = -1;
			player[j][mapviewer] = -1;
			player[j][maphelping] = 0;
			player[j][maphelpinviter] = -1;
		}
	}
	if (PermMapsTimer != -1) KillTimer(PermMapsTimer), PermMapsTimer = -1;

	UnloadAllMaps();

    PermMapsTimer = SetTimerEx("LoadPermanentMaps", 10000, 0, "ii", 0, 5000);
	return 1;
}

public AllClearObjects2()
{
	for(new j = 0; j < MAX_PLAYERS; j++)
	{
		if (IsPlayerConnected(j))
		{
		   	MapEditorStatus[j] = -1;
  			ObjectEditorStatus[j] = -1;
			player[j][mapviewer] = -1;
			player[j][maphelping] = 0;
			player[j][maphelpinviter] = -1;
		}
	}
 	for(new m = 0; m < MAX_LOADED_MAPS; m++)
	{
		IsMapLoaded[m] = false;
		MapNames[m] = "NA";
	}
	if (PermMapsTimer != -1) KillTimer(PermMapsTimer), PermMapsTimer = -1;

	DestroyAllDynamicObjects();

    PermMapsTimer = SetTimerEx("LoadPermanentMaps", 10000, 0, "ii", 0, 5000);
	return 1;
}

public LoadPermanentMaps(mapid, timerdelay)
{
	switch (mapid)
	{
	    // CHRISTMAS 2010
	   	/*case 0: LoadMapMode("Maps/2010Xmastree.ini", "2010Xmastree", 0);
	   	case 1: LoadMapMode("Maps/Xmasdecoration.ini", "Xmasdecoration", 0);*/

		// CHRISTMAS 2011
	   	//case 0: LoadMapMode("Maps/Xmasdecoration.ini", "Xmasdecoration", 0);
	   	//case 1: LoadMapMode("Maps/xmas2011.ini", "xmas2011", 0);

		// HALLOWEEN 2011
	   	//case 0: LoadMapMode("Maps/sawscene.ini", "sawscene", 0);

		// LOGO
	   	//case 0: LoadMapMode("Maps/XMS.ini", "XMS", 0);
	   	// STUNT MAPS
	   	/*case 1: LoadMapMode("Maps/slide.ini", "slide", 1);
	  	case 2: LoadMapMode("Maps/slide2.ini", "slide2", 1);
	  	case 3: LoadMapMode("Maps/slide3.ini", "slide3", 1);
	  	case 4: LoadMapMode("Maps/kart.ini", "kart", 1);
	  	case 5: LoadMapMode("Maps/dmdm.ini", "dmdm", 1);
	  	case 6: LoadMapMode("Maps/LVStunt.ini", "LVStunt", 1);
	   	case 7: LoadMapMode("Maps/stormstunt.ini", "stormstunt", 1);*/
	   	// B'S MAPS
		/*case 8: LoadMapMode("Maps/LSX.ini", "LSX", 0);
		case 9: LoadMapMode("Maps/IF1.ini", "IF1", 0);
		case 10: LoadMapMode("Maps/IF2.ini", "IF2", 0);
		case 11: LoadMapMode("Maps/EWB.ini", "EWB", 0);
		case 12: LoadMapMode("Maps/SSC.ini", "SSC", 0);
		case 13: LoadMapMode("Maps/rtrack.ini", "rtrack", 0);
		case 14: LoadMapMode("Maps/FBI.ini", "FBI", 0);
		case 15: LoadMapMode("Maps/FBI2.ini", "FBI2", 0);
		case 16: LoadMapMode("Maps/IGH.ini", "IGH", 0);
		case 17: LoadMapMode("Maps/IGH2.ini", "IGH2", 0);
		case 18: LoadMapMode("Maps/IGH3.ini", "IGH3", 0);
		case 19: LoadMapMode("Maps/Hos2.ini", "Hos2", 0);
		case 20: LoadMapMode("Maps/GSH.ini", "GSH", 0);
		case 21: LoadMapMode("Maps/GSNH.ini", "GSNH", 0);
		case 22: LoadMapMode("Maps/VGH.ini", "VGH", 0);
		case 23: LoadMapMode("Maps/VGC.ini", "VGC", 0);
		case 24: LoadMapMode("Maps/XEO.ini", "XEO", 0);
		case 25: LoadMapMode("Maps/XEO2.ini", "XEO2", 0);
		case 26: LoadMapMode("Maps/XEO3.ini", "XEO3", 0);
		case 27: LoadMapMode("Maps/SHO.ini", "SHO", 0);
		case 28: LoadMapMode("Maps/LSLE2.ini", "LSLE2", 0);
		case 29: LoadMapMode("Maps/LSLE3.ini", "LSLE3", 0);
		case 30: LoadMapMode("Maps/ELS.ini", "ELS", 0);
		case 31: LoadMapMode("Maps/SOPR.ini", "SOPR", 0);
		case 32: LoadMapMode("Maps/LSL.ini", "LSL", 0);
		case 33: LoadMapMode("Maps/Gunnerz.ini", "Gunnerz", 0);
		case 34: LoadMapMode("Maps/OLS.ini", "OLS", 0);
		case 35: LoadMapMode("Maps/Aquad.ini", "Aquad", 0);
		case 36: LoadMapMode("Maps/LMT.ini", "LMT", 0);
		case 37: LoadMapMode("Maps/EP1.ini", "EP1", 0);
		case 38: LoadMapMode("Maps/EP2.ini", "EP2", 0);
		case 39: LoadMapMode("Maps/CityHall.ini", "CityHall", 0);
		case 40: LoadMapMode("Maps/BOCC.ini", "BOCC", 0);
		case 41: LoadMapMode("Maps/EAT.ini", "EAT", 0);
		case 42: LoadMapMode("Maps/ISL.ini", "ISL", 0);
		case 43: LoadMapMode("Maps/ISL2.ini", "ISL2", 0);
		case 44: LoadMapMode("Maps/ISL3.ini", "ISL3", 0);
		case 45: LoadMapMode("Maps/Hout.ini", "Hout", 0);
		case 46: LoadMapMode("Maps/Hout2.ini", "Hout2", 0);
		case 47: LoadMapMode("Maps/SNH.ini", "SNH", 0);
		case 48: LoadMapMode("Maps/SNH1.ini", "SNH1", 0);
		case 49: LoadMapMode("Maps/SNH2.ini", "SNH2", 0);
		case 50: LoadMapMode("Maps/SNH3.ini", "SNH3", 0);
		case 51: LoadMapMode("Maps/SNH4.ini", "SNH4", 0);
		case 52: LoadMapMode("Maps/UIS.ini", "UIS", 0);
		case 53: LoadMapMode("Maps/UIS2.ini", "UIS2", 0);
		case 54: LoadMapMode("Maps/UIS3.ini", "UIS3", 0);
		case 55: LoadMapMode("Maps/BUS.ini", "BUS", 0);
		case 56: LoadMapMode("Maps/MOH.ini", "MOH", 0);
		case 57: LoadMapMode("Maps/MOH2.ini", "MOH2", 0);
		case 58: LoadMapMode("Maps/MOH3.ini", "MOH3", 0);
		case 59: LoadMapMode("Maps/MOH6.ini", "MOH6", 0);
		case 60: LoadMapMode("Maps/MOH7.ini", "MOH7", 0);
		case 61: LoadMapMode("Maps/TVS.ini", "TVS", 0);
		case 62: LoadMapMode("Maps/TVS2.ini", "TVS2", 0);
		case 63: LoadMapMode("Maps/BAB.ini", "BAB", 0);
		case 64: LoadMapMode("Maps/BAB2.ini", "BAB2", 0);
		case 65: LoadMapMode("Maps/GPAB.ini", "GPAB", 0);
		case 66: LoadMapMode("Maps/GPAB2.ini", "GPAB2", 0);
		case 67: LoadMapMode("Maps/GPAB4.ini", "GPAB4", 0);
		case 68: LoadMapMode("Maps/DCB.ini", "DCB", 0);
		case 69: LoadMapMode("Maps/DCB2.ini", "DCB2", 0);
		case 70: LoadMapMode("Maps/DCB3.ini", "DCB3", 0);
		case 71: LoadMapMode("Maps/DCB4.ini", "DCB4", 0);
		case 72: LoadMapMode("Maps/FWH.ini", "FWH", 0);
		case 73: LoadMapMode("Maps/FWH2.ini", "FWH2", 0);
		case 74: LoadMapMode("Maps/FWH3.ini", "FWH3", 0);
		case 75: LoadMapMode("Maps/FWH4.ini", "FWH4", 0);
		case 76: LoadMapMode("Maps/GWH.ini", "GWH", 0);
		case 77: LoadMapMode("Maps/GWH2.ini", "GWH2", 0);
		case 78: LoadMapMode("Maps/SPH.ini", "SPH", 0);
		case 79: LoadMapMode("Maps/SPH2.ini", "SPH2", 0);
		case 80: LoadMapMode("Maps/MCH.ini", "MCH", 0);
		case 81: LoadMapMode("Maps/MCH2.ini", "MCH2", 0);
		case 82: LoadMapMode("Maps/RBR4.ini", "RBR4", 0);
		case 83: LoadMapMode("Maps/RBR5.ini", "RBR5", 0);
		case 84: LoadMapMode("Maps/RBRlights.ini", "RBRlights", 0);
		case 85: LoadMapMode("Maps/ECH.ini", "ECH", 0);
		case 86: LoadMapMode("Maps/ECH2.ini", "ECH2", 0);
		case 87: LoadMapMode("Maps/PPI2.ini", "PPI2", 0);
		case 88: LoadMapMode("Maps/PPI3.ini", "PPI3", 0);
		case 89: LoadMapMode("Maps/LFM.ini", "LFM", 0);
		case 90: LoadMapMode("Maps/LFM2.ini", "LFM2", 0);
		case 91: LoadMapMode("Maps/DPS.ini", "DPS", 0);
		case 92: LoadMapMode("Maps/DPS2.ini", "DPS2", 0);
		case 93: LoadMapMode("Maps/DPS3.ini", "DPS3", 0);
		case 94: LoadMapMode("Maps/BGS.ini", "BGS", 0);
		case 95: LoadMapMode("Maps/BGS2.ini", "BGS2", 0);
		case 96: LoadMapMode("Maps/BGS3.ini", "BGS3", 0);
		case 97: LoadMapMode("Maps/LSI.ini", "LSI", 0);
		case 98: LoadMapMode("Maps/LSI2.ini", "LSI2", 0);
		case 99: LoadMapMode("Maps/SFS.ini", "SFS", 0);
		case 100: LoadMapMode("Maps/SFS2.ini", "SFS2", 0);
		case 101: LoadMapMode("Maps/SFS3.ini", "SFS3", 0);
		case 102: LoadMapMode("Maps/SFS4.ini", "SFS4", 0);
		case 103: LoadMapMode("Maps/SFS5.ini", "SFS5", 0);
		case 104: LoadMapMode("Maps/TMM.ini", "TMM", 0);
		case 105: LoadMapMode("Maps/TMM2.ini", "TMM2", 0);
		case 106: LoadMapMode("Maps/TMM3.ini", "TMM3", 0);
		case 107:
		{
			if (!PermanentMode)
			{
				LoadMapMode("Maps/MLS.ini", "MLS", 0);
			} else {
			    if (!PermanentMode2)
			    {
					LoadMapMode("Maps/DTH.ini", "DTH", 0);
				} else {
					LoadMapMode("Maps/DTH2.ini", "DTH2", 0);
					LoadMapMode("Maps/DTH22.ini", "DTH22", 0);
				}
			}
		}
		case 108:
		{
			if (!PermanentMode)
			{
				LoadMapMode("Maps/BIS.ini", "BIS", 0);
			} else {
				LoadMapMode("Maps/eroom.ini", "eroom", 0);
				LoadMapMode("Maps/eroom2.ini", "eroom2", 0);
			}
		}
		case 109:
		{
			if (!PermanentMode)
			{
				LoadMapMode("Maps/fair.ini", "fair", 0);
				LoadMapMode("Maps/fair2.ini", "fair2", 0);
				LoadMapMode("Maps/fair3.ini", "fair3", 0);
				LoadMapMode("Maps/fair4.ini", "fair4", 0);
			} else {
				LoadMapMode("Maps/STG.ini", "STG", 0);
				LoadMapMode("Maps/STG2.ini", "STG2", 0);
			}
		}
		case 110:
		{
			//LoadMapMode("Maps/FCB.ini", "FCB", 0); // logo for FCB clan?
			LoadMapMode("Maps/FBB1.ini", "FBB1", 0);
			LoadMapMode("Maps/FBB2.ini", "FBB2", 0);
			LoadMapMode("Maps/FBB3.ini", "FBB3", 0);
		}
		case 111:
		{
			LoadMapMode("Maps/FBB4.ini", "FBB4", 0);
			LoadMapMode("Maps/FBB5.ini", "FBB5", 0);
			LoadMapMode("Maps/FBB6.ini", "FBB6", 0);
		}
		case 112:
		{
			if (!PermanentMode)
			{
				LoadMapMode("Maps/ADCR.ini", "ADCR", 0);
				LoadMapMode("Maps/ADJR.ini", "ADJR", 0);
				LoadMapMode("Maps/ADFR.ini", "ADFR", 0);
				
				PermanentMode = 1; // all PermanentMode maps loaded, reset for next timer
			} else {
   				if (!PermanentMode2)
			    {
					LoadMapMode("Maps/ADCY.ini", "ADCY", 0);
					LoadMapMode("Maps/ADJY.ini", "ADJY", 0);
					LoadMapMode("Maps/ADFY.ini", "ADFY", 0);
					
					PermanentMode2 = 1; // all PermanentMode2 maps loaded, reset for next timer
				} else {
					LoadMapMode("Maps/ADCG.ini", "ADCG", 0);
					LoadMapMode("Maps/ADJG.ini", "ADJG", 0);
					LoadMapMode("Maps/ADFG.ini", "ADFG", 0);
					
					PermanentMode2 = 0; // all PermanentMode2 maps loaded, reset for next timer
				}
				
				PermanentMode = 0; // all PermanentMode maps loaded, reset for next timer
			}
		}*/
	   	default: { PermMapsTimer = -1; return 1; }
	}
	PermMapsTimer = SetTimerEx("LoadPermanentMaps", timerdelay, 0, "ii", mapid+1, timerdelay);
	return 1;
}
//==============================================================================
stock SendMessageToAdmins(colour, str[], admlevel)
return CallRemoteFunction("SendMessageToAdmins", "xsd", colour, str, admlevel);

stock IsPlayerSpawned(playerid)
return player[playerid][spawned];
//==============================================================================
public GetClosestMapObject(playerid)
{
	if (MapEditorStatus[playerid] == -1)
	return SendClientMessage(playerid,red,">> ERROR: You must have a map loaded to get closest object");

	new closestobjectID = -1,
		Float:objectdistance,
		Float:closestobjectdistance = 2000,
		Float:pX,
		Float:pY,
		Float:pZ;

	GetPlayerPos(playerid, pX, pY, pZ);
	for (new objectid = 1; objectid <= MAX_MAP_OBJECTS; objectid++)
	{
   		objectdistance = floatround(floatsqroot(floatpower(floatabs(floatsub(pX, Map[MapEditorStatus[playerid]][objectid-1][XCoord])),2)+floatpower(floatabs(floatsub(pY,Map[MapEditorStatus[playerid]][objectid-1][YCoord])),2)+floatpower(floatabs(floatsub(pZ,Map[MapEditorStatus[playerid]][objectid-1][ZCoord])),2)));
		if (objectdistance < closestobjectdistance)
		{
			closestobjectdistance = objectdistance;
			closestobjectID = objectid;
		}
	}
	if (closestobjectID == -1) return SendClientMessage(playerid, red, "[ERROR]: Could not find closest map object");
	else {
		format(strings, sizeof(strings), "Closest map objectID: %d [ModelID: %d] (X: %f Y: %f Z: %f)", closestobjectID, Map[MapEditorStatus[playerid]][closestobjectID-1][ObjectId], Map[MapEditorStatus[playerid]][closestobjectID-1][XCoord], Map[MapEditorStatus[playerid]][closestobjectID-1][YCoord], Map[MapEditorStatus[playerid]][closestobjectID-1][ZCoord]);
		SendClientMessage(playerid, yellow, strings);
	}
	return 1;
}

public MoveMapObject(playerid, mapobjectid, Float:oX, Float:oY, Float:oZ, Float:speed, Float:orX, Float:orY, Float:orZ)
{
	if (MapEditorStatus[playerid] == -1) return SendClientMessage(playerid,red,">> ERROR: You must have a map loaded to move an object.");
	if (mapobjectid < 1 || mapobjectid > MAX_MAP_OBJECTS || Map[ MapEditorStatus[playerid] ][mapobjectid-1][StreamId] == -1) return SendClientMessage(playerid,red,">> ERROR: You have entered an invalid map item ID.");

	new Float:X,
	    Float:Y,
	    Float:Z,
	    Float:rX,
	    Float:rY,
	    Float:rZ;

	GetDynamicObjectPos(Map[ MapEditorStatus[playerid] ][mapobjectid-1][StreamId], X, Y, Z);
	GetDynamicObjectRot(Map[ MapEditorStatus[playerid] ][mapobjectid-1][StreamId], rX, rY, rZ);
	MoveDynamicObject(Map[ MapEditorStatus[playerid] ][mapobjectid-1][StreamId], X + oX, Y + oY, Z + oZ, speed, rX + orX, rY + orY, rZ + orZ);
	return 1;
}

stock AntiSpam(playerid, time_delay, bool:message = true)
{
	new String[64];
 	new player_delay = gettime() - player[playerid][delay];
	if (player_delay < time_delay)
	{
	    if (message)
		{
			format(String, sizeof(String), "You need to wait %d seconds for this command!", time_delay - player_delay);
			SendClientMessage(playerid, 0xFF0000FF, String);
		}
		return 0;
  	}else{
		player[playerid][delay] = gettime();
		return 1;
	}
}

IsValidMapname(xstr[])
{
	new	i,
		ch;

	while ((ch = xstr[i++]) && (('0' <= ch <= '9') || ((ch |= 0x20) && ('a' <= ch <= 'z')))) {}
	return !ch;
}

stock IsPlayerInArea(playerid,Float:max_x,Float:min_x,Float:max_y,Float:min_y)
{
	new Float:X,
       	Float:Y,
       	Float:Z;

 	GetPlayerPos(playerid, X, Y, Z);
 	if (X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) {
 		return 1;
 	}
 	return 0;
}

stock ReturnPlayerID(PlayerName[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	if (IsPlayerConnected(i))
	{
		new name[24]; GetPlayerName(i, name, sizeof(name));
		if (strfind(name, PlayerName, true) != -1)
		return i;
	}
	return INVALID_PLAYER_ID;
}

stock IsNumeric(const string[])
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
//==============================================================================
#pragma unused strtok

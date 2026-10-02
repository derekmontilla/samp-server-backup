#include <a_samp>
#define COLOR_SYSTEM 0xEFEFF7AA
#define COLOR_VIOLET 0x9955DEEE
#define COLOR_LIGHTRED 0xFF99AADD
#define COLOR_SEAGREEN 0x00EEADDF
#define COLOR_GRAYWHITE 0xEEEEFFC4
#define COLOR_LIGHTNEUTRALBLUE 0xabcdef66
#define COLOR_GREENISHGOLD 0xDEAD4370
#define COLOR_LIGHTBLUEGREEN 0x0FFDD349
#define COLOR_NEUTRALBLUE 0xABCDEF01
#define COLOR_LIGHTCYAN 0xAAFFCC33
#define COLOR_LEMON 0xDDDD2357
#define COLOR_MEDIUMBLUE 0x63AFF00A
#define COLOR_NEUTRAL 0xABCDEF97
#define COLOR_BLACK 0x00000000
#define COLOR_NEUTRALGREEN 0x81CFAB00
#define COLOR_DARKGREEN 0x12900BBF
#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_DARKBLUE 0x300FFAAB
#define COLOR_BLUEGREEN 0x46BBAA00
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_PURPLE 0x800080AA
#define COLOR_CYAN 0x40FFFFFF

forward ApplyAnimationForPlayer(playerid, animcommand[]);

public OnPlayerCommandText(playerid, cmdtext[])
{
new aationplayed;
new tmp[256];
new cmd[256];
new idx;
cmd = strtok(cmdtext, idx);

if(strcmp(cmdtext, "/ahelp", true) == 0) {
SendClientMessage(playerid, COLOR_GREEN,">/aped /dance /handsup /aclothes /acoach /acolt /acopa /acod /acrack");
SendClientMessage(playerid, COLOR_GREEN,">/aairport /aat /abar /aball /afire /abeach");
SendClientMessage(playerid, COLOR_GREEN,">/abp /ainf /abiked /abh /afood /abikelp /ams /ams2 /abikes /acar");
SendClientMessage(playerid, COLOR_GREEN,">/abikev /abmx /abikedbz /achase /abox /abomber /absp /acamera ");
SendClientMessage(playerid, COLOR_GREEN,">/agym /apara /agangs /alookers /acarchat /acasino /abuddy /abus");
SendClientMessage(playerid, COLOR_GREEN,">/acarry /aintshop /ajst /akart /akissing /aknife /alapdan /adend");
SendClientMessage(playerid, COLOR_GREEN,">/amedic /amtb /amusc /aotb /anevada /apark /asaw /achoppa");
SendClientMessage(playerid, COLOR_GREEN,">/ahelp2 - next aation list. [Stop animation with /stopani]");
return 1;
}
if(strcmp(cmdtext, "/ahelp2", true) == 0) {
SendClientMessage(playerid, COLOR_GREEN,">/acrib /ajump /adealer /adildo /adodge /adozer  /adrivebys /afat");
SendClientMessage(playerid, COLOR_GREEN,">/afightb /afightc /afightd /afighte /afinale /afinale2 /aflamef");
SendClientMessage(playerid, COLOR_GREEN,">/aflowers /aghands /afw /aghetto /agog /agraffity /agreya /agren");
SendClientMessage(playerid, COLOR_GREEN,">/ahaircut /aheist  /ainthouse /aintoffice /aplayerdbf /aplayidles /apolice");
SendClientMessage(playerid, COLOR_GREEN,">/apool /apoor /apython /aquad /aquadbz /arapping  /arifle /ariot /arobbank ");
SendClientMessage(playerid, COLOR_GREEN,">/arocket /arustler /aryder /ascrat /ashamal /ashop /askate /ashotgun");
SendClientMessage(playerid, COLOR_GREEN,">/avortex /atec /atrain /asil /atattoo  /asmoking /asniper /aspray /astrip");
SendClientMessage(playerid, COLOR_GREEN,">/abath /aswat /asweet /aswim /asword /atank /atruck /auzi /avan /avending");
SendClientMessage(playerid, COLOR_GREEN,">/away /aweap /asex /apaul");
return 1;
}

if(strcmp(cmd, "/asex", true) == 0)
{
	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp))
	return SendClientMessage(playerid,0xFF0000FF,">Write /asex [1-26]");
	
	aationplayed = strval(tmp);
	if(aationplayed < 1 || aationplayed > 26)
	return SendClientMessage(playerid,0xFF0000FF,">Write /asex [1-26]");

	switch (aationplayed)
	{
	    case 1: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_End_P",4.1,1,1,1,1,1,1);
	    case 2: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_End_W",4.1,1,1,1,1,1,1);
	    case 3: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_Loop_P",4.1,1,1,1,1,1,1);
	    case 4: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_Loop_W",4.1,1,1,1,1,1,1);
	    case 5: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_Start_P",4.1,1,1,1,1,1,1);
	    case 6: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Car_Start_W",4.1,1,1,1,1,1,1);
	    case 7: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_End_P",4.1,1,1,1,1,1,1);
	    case 8: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_End_W",4.1,1,1,1,1,1,1);
	    case 9: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_Loop_P",4.1,1,1,1,1,1,1);
	    case 10: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_Loop_W",4.1,1,1,1,1,1,1);
	    case 11: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_Start_P",4.1,1,1,1,1,1,1);
	    case 12: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Couch_Start_W",4.1,1,1,1,1,1,1);
	    case 13: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_End_P",4.1,1,1,1,1,1,1);
	    case 14: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_End_W",4.1,1,1,1,1,1,1);
	    case 15: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_Loop_P",4.1,1,1,1,1,1,1);
	    case 16: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_Loop_W",4.1,1,1,1,1,1,1);
	    case 17: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_Start_P",4.1,1,1,1,1,1,1);
	    case 18: return ApplyAnimation(playerid, "BLOWJOBZ", "BJ_Stand_Start_W",4.1,1,1,1,1,1,1);
		case 19: return ApplyAnimation(playerid, "SNM", "SPANKING_IDLEW",4.1,1,1,1,1,1,1);
		case 20: return ApplyAnimation(playerid, "SNM", "SPANKING_IDLEP",4.1,1,1,1,1,1,1);
		case 21: return ApplyAnimation(playerid, "SNM", "SPANKINGW",4.1,1,1,1,1,1,1);
		case 22: return ApplyAnimation(playerid, "SNM", "SPANKINGP",4.1,1,1,1,1,1,1);
		case 23: return ApplyAnimation(playerid, "SNM", "SPANKEDW",4.1,1,1,1,1,1,1);
		case 24: return ApplyAnimation(playerid, "SNM", "SPANKEDP",4.1,1,1,1,1,1,1);
		case 25: return ApplyAnimation(playerid, "SNM", "SPANKING_ENDW",4.1,1,1,1,1,1,1);
		case 26: return ApplyAnimation(playerid, "SNM", "SPANKING_ENDP",4.1,1,1,1,1,1,1);
	}
	return 1;
}

if(strcmp(cmd, "/abar", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abar [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /abar [1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BAR","Barcustom_get",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"BAR","Barcustom_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"BAR","Barcustom_order",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"BAR","Barserve_bottle",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"BAR","Barserve_give",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"BAR","Barserve_glass",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"BAR","Barserve_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"BAR","Barserve_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"BAR","Barserve_order",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"BAR","dnk_stndF_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"BAR","dnk_stndM_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"BAR","BARman_idle",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aball", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aball [1-11]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Write /aball [1-11]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BASEBALL","Bat_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"BASEBALL","Bat_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"BASEBALL","Bat_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"BASEBALL","Bat_4",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"BASEBALL","Bat_block",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"BASEBALL","Bat_Hit_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"BASEBALL","Bat_Hit_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"BASEBALL","Bat_Hit_3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"BASEBALL","Bat_IDLE",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"BASEBALL","Bat_M",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"BASEBALL","BAT_PART",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afire", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afire [1-13]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Write /afire [1-13]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BD_FIRE","BD_Fire1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"BD_FIRE","BD_Fire2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"BD_FIRE","BD_Fire3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"BD_FIRE","BD_GF_Wave",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"BD_FIRE","BD_Panic_01",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"BD_FIRE","BD_Panic_02",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"BD_FIRE","BD_Panic_03",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"BD_FIRE","BD_Panic_04",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"BD_FIRE","BD_Panic_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"BD_FIRE","M_smklean_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"BD_FIRE","M_smklean_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"BD_FIRE","Playa_Kiss_03",4.1,1,1,1,1,1,1);
} else if(aationplayed == 13) {
ApplyAnimation(playerid,"BD_FIRE","wash_up",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abeach", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abeach [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /abeach [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BEACH","bather",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"BEACH","BD_Fire3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"BEACH","ParkSit_W_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ainf", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ainf [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /ainf [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BF_injection","BF_getin_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"BF_injection","BF_getin_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"BF_injection","BF_getout_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"BF_injection","BF_getout_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abiked", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abiked [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abiked [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKED","BIKEd_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKED","BIKEd_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKED","BIKEd_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKED","BIKEd_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BIKED","BIKEd_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BIKED","BIKEd_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BIKED","BIKEd_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BIKED","BIKEd_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BIKED","BIKEd_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BIKED","BIKEd_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BIKED","BIKEd_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BIKED","BIKEd_shuffle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BIKED","BIKEd_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abp [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /abp [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"benchpress","gym_bp_celebrate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"benchpress","gym_bp_down",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"benchpress","gym_bp_getoff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"benchpress","gym_bp_geton",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"benchpress","gym_bp_up_A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"benchpress","gym_bp_up_smooth",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abh", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abh [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abh [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKEH","BIKEh_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BIKEH","BIKEh_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BIKEH","BIKEh_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BIKEH","BIKEh_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BIKEH","BIKEh_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BIKEH","BIKEh_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ams", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ams [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /ams [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKEH","BIKEh_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKEH","BIKEh_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKEH","BIKEh_getoffRHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afood", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afood [1-33]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 33) {
SendClientMessage(playerid,0xFF0000FF,">Write /afood [1-33]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FOOD","EAT_Burger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FOOD","EAT_Chicken",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FOOD","EAT_Pizza",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FOOD","EAT_Vomit_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FOOD","EAT_Vomit_SK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FOOD","FF_Dam_Bkw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FOOD","FF_Dam_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FOOD","FF_Dam_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"FOOD","FF_Dam_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"FOOD","FF_Die_Bkw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"FOOD","FF_Die_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"FOOD","FF_Die_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"FOOD","FF_Die_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Eat1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Eat2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Eat3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"FOOD","FF_Sit_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"FOOD","FF_Sit_In_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"FOOD","FF_Sit_In_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Look",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Out_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Out_L_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"FOOD","FF_Sit_Out_R_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"FOOD","SHP_Thank",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Lift",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Lift_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Lift_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Lift_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Pose",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"FOOD","SHP_Tray_Return",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ams2", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ams2 [1-41]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 41) {
SendClientMessage(playerid,0xFF0000FF,">Write /ams2 [1-41]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MISC","bitchslap",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"MISC","BMX_celebrate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"MISC","BMX_comeon",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"MISC","bmx_idleloop_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"MISC","bmx_idleloop_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"MISC","bmx_talkleft_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"MISC","bmx_talkleft_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"MISC","bmx_talkleft_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"MISC","bmx_talkright_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"MISC","bmx_talkright_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"MISC","bmx_talkright_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"MISC","bng_wndw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"MISC","bng_wndw_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"MISC","Case_pickup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"MISC","door_jet",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"MISC","GRAB_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"MISC","GRAB_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"MISC","Hiker_Pose",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"MISC","Hiker_Pose_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"MISC","Idle_Chat_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"MISC","KAT_Throw_K",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"MISC","KAT_Throw_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"MISC","KAT_Throw_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"MISC","PASS_Rifle_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"MISC","PASS_Rifle_Ped",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"MISC","PASS_Rifle_Ply",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"MISC","pickup_box",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"MISC","Plane_door",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"MISC","Plane_exit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"MISC","Plane_hijack",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"MISC","Plunger_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"MISC","Plyrlean_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"MISC","plyr_shkhead",4.1,1,1,1,1,1,1);
}else if(aationplayed == 34) {
ApplyAnimation(playerid,"MISC","Run_Dive",4.1,1,1,1,1,1,1);
}else if(aationplayed == 35) {
ApplyAnimation(playerid,"MISC","Scratchballs_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 36) {
ApplyAnimation(playerid,"MISC","SEAT_LR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 37) {
ApplyAnimation(playerid,"MISC","Seat_talk_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 38) {
ApplyAnimation(playerid,"MISC","Seat_talk_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 39) {
ApplyAnimation(playerid,"MISC","SEAT_watch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 40) {
ApplyAnimation(playerid,"MISC","smalplane_door",4.1,1,1,1,1,1,1);
}else if(aationplayed == 41) {
ApplyAnimation(playerid,"MISC","smlplane_door",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abikelp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikelp [1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikelp [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKELEAP","bk_blnce_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKELEAP","bk_blnce_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKELEAP","bk_jmp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKELEAP","bk_rdy_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKELEAP","bk_rdy_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKELEAP","struggle_cesar",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKELEAP","struggle_driver",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKELEAP","truck_driver",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKELEAP","truck_getin",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abikes", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikes [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikes [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKES","BIKEs_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKES","BIKEs_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKES","BIKEs_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKES","BIKEs_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKES","BIKEs_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKES","BIKEs_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKES","BIKEs_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKES","BIKEs_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKES","BIKEs_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BIKES","BIKEs_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BIKES","BIKEs_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BIKES","BIKEs_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BIKES","BIKEs_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BIKES","BIKEs_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BIKES","BIKEs_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BIKES","BIKEs_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BIKES","BIKEs_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BIKES","BIKEs_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abikev", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikev [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikev [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKEV","BIKEv_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKEV","BIKEv_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKEV","BIKEv_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKEV","BIKEv_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKEV","BIKEv_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKEV","BIKEv_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKEV","BIKEv_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BIKEV","BIKEv_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BIKEV","BIKEv_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BIKEV","BIKEv_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BIKEV","BIKEv_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BIKEV","BIKEv_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BIKEV","BIKEv_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abmx", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abmx [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abmx [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BMX","BMX_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BMX","BMX_bunnyhop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BMX","BMX_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BMX","BMX_driveby_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BMX","BMX_driveby_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BMX","BMX_fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BMX","BMX_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BMX","BMX_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BMX","BMX_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BMX","BMX_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BMX","BMX_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BMX","BMX_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BMX","BMX_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BMX","BMX_pedal",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BMX","BMX_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BMX","BMX_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BMX","BMX_sprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BMX","BMX_still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abikedbz", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikedbz [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /abikedbz [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKE_DBZ","Pass_Driveby_BWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKE_DBZ","Pass_Driveby_FWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKE_DBZ","Pass_Driveby_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKE_DBZ","Pass_Driveby_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/achase", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /achase [1-25]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 25) {
SendClientMessage(playerid,0xFF0000FF,">Write /achase [1-25]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MD_CHASE","Carhit_Hangon",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"MD_CHASE","Carhit_Tumble",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"MD_CHASE","donutdrop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_L1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_L2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_L3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_R1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_R2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"MD_CHASE","Fen_Choppa_R3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"MD_CHASE","Hangon_Stun_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"MD_CHASE","Hangon_Stun_Turn",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_2_HANG",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Jmp_BL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Jmp_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_BL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_Die_BL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_Die_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_Roll",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Lnd_Roll_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Punch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Punch_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"MD_CHASE","MD_BIKE_Shot_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"MD_CHASE","MD_HANG_Lnd_Roll",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"MD_CHASE","MD_HANG_Loop",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abox", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abox [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /abox [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BOX","boxhipin",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BOX","boxhipup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BOX","boxshdwn",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BOX","boxshup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BOX","bxhipwlk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BOX","bxhwlki",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BOX","bxshwlk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BOX","bxshwlki",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BOX","bxwlko",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BOX","catch_box",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abomber", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abomber [1-6]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Write /abomber [1-6]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant_2Idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BOMBER","BOM_Plant_Loop",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/absp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /absp [1-41]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 41) {
SendClientMessage(playerid,0xFF0000FF,">Write /absp [1-41]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_def_jump_shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_def_stepL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_def_stepR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_Gli",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_Gli_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_Lnch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_Lnch_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_Lnd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idle2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idle2_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_idle_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Cancel",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Cancel_0",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_End",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_Net_Dnk_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_react_miss",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_react_score",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_run_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_SkidStop_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_SkidStop_L_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_SkidStop_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_SkidStop_R_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 34) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_walk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 35) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_WalkStop_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 36) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_WalkStop_L_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 37) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_WalkStop_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 38) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_WalkStop_R_O",4.1,1,1,1,1,1,1);

}else if(aationplayed == 39) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_walk_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 40) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_walk_start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 41) {
ApplyAnimation(playerid,"BSKTBALL","BBALL_walk_start_O",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acamera", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acamera [1-14]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Write /acamera [1-14]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CAMERA","camcrch_cmon",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CAMERA","camcrch_idleloop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CAMERA","camcrch_stay",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CAMERA","camcrch_to_camstnd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CAMERA","camstnd_cmon",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CAMERA","camstnd_idleloop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CAMERA","camstnd_lkabt",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CAMERA","camstnd_to_camcrch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CAMERA","piccrch_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"CAMERA","piccrch_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"CAMERA","piccrch_take",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"CAMERA","picstnd_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"CAMERA","picstnd_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"CAMERA","picstnd_take",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/agym", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agym [1-24]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Write /agym [1-24]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GYMNASIUM","GYMshadowbox",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_celebrate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_fast",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_faster",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_getoff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_geton",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_pedal",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"GYMNASIUM","gym_bike_still",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"GYMNASIUM","gym_jog_falloff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"GYMNASIUM","gym_shadowbox",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_celebrate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_falloff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_getoff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_geton",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_jog",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_sprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_tired",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"GYMNASIUM","gym_tread_walk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"GYMNASIUM","gym_walk_falloff",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"GYMNASIUM","Pedals_fast",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"GYMNASIUM","Pedals_med",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"GYMNASIUM","Pedals_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"GYMNASIUM","Pedals_still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/apara", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apara [1-22]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 22) {
SendClientMessage(playerid,0xFF0000FF,">Write /apara [1-22]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PARACHUTE","FALL_skyDive",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_Accel",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"PARACHUTE","FALL_skyDive_DIE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"PARACHUTE","PARA_decel",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"PARACHUTE","PARA_decel_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"PARACHUTE","PARA_float",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"PARACHUTE","PARA_float_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Land",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Land_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Land_Water",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Land_Water_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"PARACHUTE","PARA_open",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"PARACHUTE","PARA_open_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Rip_Land_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Rip_Loop_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"PARACHUTE","PARA_Rip_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"PARACHUTE","PARA_steerL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"PARACHUTE","PARA_steerL_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"PARACHUTE","PARA_steerR_O",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/agangs", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agangs [1-22]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 22) {
SendClientMessage(playerid,0xFF0000FF,">Write /agangs [1-22]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GANGS","DEALER_DEAL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"GANGS","DEALER_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"GANGS","drnkbr_prtl",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"GANGS","drnkbr_prtl_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"GANGS","DRUGS_BUY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"GANGS","hndshkaa",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"GANGS","hndshkba",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"GANGS","hndshkca",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"GANGS","hndshkcb",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"GANGS","hndshkda",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"GANGS","hndshkea",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"GANGS","hndshkfa",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"GANGS","hndshkfa_swt",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"GANGS","Invite_No",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"GANGS","leanIDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"GANGS","leanIN",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"GANGS","leanOUT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkCt",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkF",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkG",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"GANGS","prtial_gngtlkH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"GANGS","prtial_hndshk_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"GANGS","prtial_hndshk_biz_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"GANGS","shake_cara",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"GANGS","shake_carK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"GANGS","shake_carSH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"GANGS","smkcig_prtl_F",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/alowrider", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /alowrider [1-39]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 39) {
SendClientMessage(playerid,0xFF0000FF,">Write /alowrider [1-39]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"LOWRIDER","F_smklean_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_bdbnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_hair",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_hurry",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_idleloop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_idle_to_l0",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l0_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l0_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l0_to_l1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l12_to_l0",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l1_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l1_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l1_to_l2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l2_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l2_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l2_to_l3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l345_to_l1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l3_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l3_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l3_to_l4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l4_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l4_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l4_to_l5",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l5_bnce",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"LOWRIDER","lrgirl_l5_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"LOWRIDER","M_smklean_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"LOWRIDER","M_smkstnd_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkC",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkF",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkG",4.1,1,1,1,1,1,1);
}else if(aationplayed == 34) {
ApplyAnimation(playerid,"LOWRIDER","prtial_gngtlkH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 35) {
ApplyAnimation(playerid,"LOWRIDER","RAP_A_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 36) {
ApplyAnimation(playerid,"LOWRIDER","RAP_B_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 37) {
ApplyAnimation(playerid,"LOWRIDER","RAP_C_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 38) {
ApplyAnimation(playerid,"LOWRIDER","Sit_relaxed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 39) {
ApplyAnimation(playerid,"LOWRIDER","Tap_hand",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/alookers", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /alookers [1-25]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 25) {
SendClientMessage(playerid,0xFF0000FF,">Write /alookers [1-25]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"ON_LOOKERS","lkaround_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"ON_LOOKERS","lkaround_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"ON_LOOKERS","lkaround_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"ON_LOOKERS","lkup_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"ON_LOOKERS","lkup_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"ON_LOOKERS","lkup_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"ON_LOOKERS","lkup_point",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_cower",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_hide",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_point",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"ON_LOOKERS","panic_shout",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"ON_LOOKERS","Pointup_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"ON_LOOKERS","Pointup_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"ON_LOOKERS","Pointup_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"ON_LOOKERS","Pointup_shout",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"ON_LOOKERS","point_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"ON_LOOKERS","point_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"ON_LOOKERS","point_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"ON_LOOKERS","shout_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"ON_LOOKERS","shout_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"ON_LOOKERS","shout_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"ON_LOOKERS","shout_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"ON_LOOKERS","shout_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"ON_LOOKERS","wave_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"ON_LOOKERS","wave_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"ON_LOOKERS","wave_out",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acarchat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acarchat [1-20]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Write /acarchat [1-20]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_loopA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_loopA_to_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_loopB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_loopB_to_A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CAR_CHAT","carfone_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc1_BR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc1_FL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc1_FR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc2_FL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc3_BR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc3_FL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc3_FR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_BR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_FL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"CAR_CHAT","CAR_Sc4_FR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"CAR_CHAT","car_talkm_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"CAR_CHAT","car_talkm_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"CAR_CHAT","car_talkm_out",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acasino", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acasino [1-23]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 23) {
SendClientMessage(playerid,0xFF0000FF,">Write /acasino [1-23]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CASINO","cards_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CASINO","cards_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CASINO","cards_lose",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CASINO","cards_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CASINO","cards_pick_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CASINO","cards_pick_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CASINO","cards_raise",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CASINO","cards_win",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CASINO","manwinb",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"CASINO","manwind",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"CASINO","Roulette_bet",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"CASINO","Roulette_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"CASINO","Roulette_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"CASINO","Roulette_lose",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"CASINO","Roulette_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"CASINO","Roulette_win",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"CASINO","Slot_bet_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"CASINO","Slot_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"CASINO","Slot_lose_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"CASINO","Slot_Plyr",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"CASINO","Slot_wait",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"CASINO","Slot_win_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"CASINO","wof",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abuddy", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abuddy [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /abuddy [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BUDDY","buddy_crouchfire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BUDDY","buddy_crouchreload",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BUDDY","buddy_fire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BUDDY","buddy_fire_poor",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BUDDY","buddy_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abus", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abus [1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /abus [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BUS","BUS_close",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BUS","BUS_getin_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BUS","BUS_getin_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BUS","BUS_getout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BUS","BUS_getout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BUS","BUS_jacked_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BUS","BUS_open",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BUS","BUS_open_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BUS","BUS_pullout_LHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acar", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acar [1-11]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Write /acar [1-11]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CAR","Fixn_Car_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CAR","Fixn_Car_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CAR","flag_drop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CAR","Sit_relaxed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CAR","Tap_hand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CAR","Tyd2car_bump",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CAR","Tyd2car_high",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CAR","Tyd2car_low",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CAR","Tyd2car_med",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"CAR","Tyd2car_TurnL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"CAR","Tyd2car_TurnR",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acarry", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acarry [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /acarry [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CARRY","liftup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CARRY","liftup05",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CARRY","liftup105",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CARRY","putdwn",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CARRY","putdwn05",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CARRY","putdwn105",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aintshop", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aintshop [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /aintshop [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"INT_SHOP","shop_cashier",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"INT_SHOP","shop_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"INT_SHOP","shop_lookA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"INT_SHOP","shop_lookB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"INT_SHOP","shop_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"INT_SHOP","shop_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"INT_SHOP","shop_pay",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"INT_SHOP","shop_shelf",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ajst", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ajst [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /ajst [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"JST_BUISNESS","girl_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"JST_BUISNESS","girl_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"JST_BUISNESS","player_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"JST_BUISNESS","smoke_01",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/akart", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /akart [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /akart [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"KART","KART_getin_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"KART","KART_getin_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"KART","KART_getout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"KART","KART_getout_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/akissing", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /akissing [1-14]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Write /akissing [1-14]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"KISSING","BD_GF_Wave",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"KISSING","gfwave2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"KISSING","GF_CarArgue_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"KISSING","GF_CarArgue_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"KISSING","GF_CarSpot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"KISSING","GF_StreetArgue_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"KISSING","GF_StreetArgue_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"KISSING","gift_give",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"KISSING","Grlfrd_Kiss_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"KISSING","Grlfrd_Kiss_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"KISSING","Grlfrd_Kiss_03",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"KISSING","Playa_Kiss_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"KISSING","Playa_Kiss_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"KISSING","Playa_Kiss_03",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aknife", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aknife [1-14]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Write /aknife [1-14]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"KNIFE","KILL_Knife_Player",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"KNIFE","KILL_Partial",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"KNIFE","knife_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"KNIFE","knife_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"KNIFE","knife_4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"KNIFE","Knife_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"KNIFE","knife_hit_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"KNIFE","knife_hit_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"KNIFE","knife_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"KNIFE","knife_hit_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"KNIFE","knife_part",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"KNIFE","WEAPON_knifeidle",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/alapdan", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /alapdan [1-6]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Write /alapdan [1-6]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"LAPDAN1","LAPDAN_D",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"LAPDAN1","LAPDAN_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"LAPDAN2","LAPDAN_D",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"LAPDAN2","LAPDAN_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"LAPDAN3","LAPDAN_D",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"LAPDAN3","LAPDAN_P",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adend", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adend [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /adend [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MD_END","END_SC1_PLY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"MD_END","END_SC1_RYD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"MD_END","END_SC1_SMO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"MD_END","END_SC1_SWE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"MD_END","END_SC2_PLY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"MD_END","END_SC2_RYD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"MD_END","END_SC2_SMO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"MD_END","END_SC2_SWE",4.1,1,1,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/amedic", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /amedic [1]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Write /amedic [1]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MEDIC","CPR",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/amtb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /amtb [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /amtb [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MTB","MTB_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"MTB","MTB_bunnyhop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"MTB","MTB_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"MTB","MTB_driveby_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"MTB","MTB_driveby_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"MTB","MTB_fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"MTB","MTB_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"MTB","MTB_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"MTB","MTB_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"MTB","MTB_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"MTB","MTB_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"MTB","MTB_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"MTB","MTB_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"MTB","MTB_pedal",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"MTB","MTB_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"MTB","MTB_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"MTB","MTB_sprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"MTB","MTB_still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/amusc", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /amusc [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /amusc [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"MUSCULAR","MscleWalkst_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"MUSCULAR","MscleWalkst_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"MUSCULAR","Mscle_rckt_run",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"MUSCULAR","Mscle_rckt_walkst",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"MUSCULAR","Mscle_run_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"MUSCULAR","MuscleIdle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"MUSCULAR","MuscleIdle_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"MUSCULAR","MuscleIdle_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"MUSCULAR","MuscleIdle_rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"MUSCULAR","MuscleRun",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"MUSCULAR","MuscleRun_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"MUSCULAR","MuscleSprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"MUSCULAR","MuscleWalk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"MUSCULAR","MuscleWalkstart",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"MUSCULAR","MuscleWalk_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"MUSCULAR","Musclewalk_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"MUSCULAR","Musclewalk_rocket",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aotb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aotb [1-11]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Write /aotb [1-11]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"OTB","betslp_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"OTB","betslp_lkabt",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"OTB","betslp_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"OTB","betslp_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"OTB","betslp_tnk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"OTB","wtchrace_cmon",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"OTB","wtchrace_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"OTB","wtchrace_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"OTB","wtchrace_lose",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"OTB","wtchrace_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"OTB","wtchrace_win",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/anevada", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /anevada [1-2]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Write /anevada [1-2]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"NEVADA","NEVADA_getin",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"NEVADA","NEVADA_getout",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/apark", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apark [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /apark [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PARK","Tai_Chi_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PARK","Tai_Chi_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PARK","Tai_Chi_Out",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/apaul", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apaul [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /apaul [1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PAULNMAC","Piss_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PAULNMAC","Piss_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PAULNMAC","Piss_out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Argue1_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Argue1_B",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Argue2_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Argue2_B",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Loop_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"PAULNMAC","PnM_Loop_B",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"PAULNMAC","wank_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"PAULNMAC","wank_out",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asaw", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asaw [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /asaw [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_Hit_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_Hit_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"CHAINSAW","CSAW_Hit_3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"CHAINSAW","IDLE_csaw",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"CHAINSAW","WEAPON_csaw",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"CHAINSAW","WEAPON_csawlo",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/achoppa", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /achoppa [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /achoppa [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_bunnyhop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_driveby_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_driveby_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_pedal",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_Pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_sprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"CHOPPA","CHOPPA_Still",4.1,1,1,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/aclothes", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aclothes [1-13]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Write /aclothes [1-13]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CLOTHES","CLO_Buy",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"CLOTHES","CLO_In",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"CLOTHES","CLO_Out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Hat",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_In",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_In_O",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Legs",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Out_O",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Shoes",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Torso",4.1,1,1,1,1,1,1);
} else if(aationplayed == 13) {
ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Watch",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acoach", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acoach [1-6]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Write /acoach [1-6]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"COACH","COACH_inL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"COACH","COACH_inR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"COACH","COACH_opnL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"COACH","COACH_opnR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"COACH","COACH_outL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"COACH","COACH_outR",4.1,1,1,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/acolt", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acolt [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /acolt [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"COLT45","2guns_crouchfire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"COLT45","colt45_crouchfire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"COLT45","colt45_crouchreload",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"COLT45","colt45_fire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"COLT45","colt45_fire_2hands",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"COLT45","colt45_reload",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"COLT45","sawnoff_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acopa", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acopa [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /acopa[1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_nod",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"COP_AMBIENT","Copbrowse_shake",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_nod",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_shake",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_think",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"COP_AMBIENT","Coplook_watch",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acod", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acod [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /acod [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"COP_DVBYZ","COP_Dvby_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"COP_DVBYZ","COP_Dvby_FT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"COP_DVBYZ","COP_Dvby_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"COP_DVBYZ","COP_Dvby_R",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acrack", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acrack[1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /acrack [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"CRACK","Bbalbat_Idle_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"CRACK","crckdeth1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"CRACK","crckdeth3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"CRACK","crckdeth4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"CRACK","crckidle1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"CRACK","crckidle2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"CRACK","crckidle3",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/acrib", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /acrib [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /acrib [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"CRIB","CRIB_Console_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"CRIB","CRIB_Use_Switch",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"CRIB","PED_Console_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"CRIB","PED_Console_Loose",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"CRIB","PED_Console_Win",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ajump", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ajump [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /ajump [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DAM_JUMP","DAM_Dive_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"DAM_JUMP","DAM_Land",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"DAM_JUMP","DAM_Launch",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"DAM_JUMP","Jump_Roll",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"DAM_JUMP","SF_JumpWall",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adance", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adance [1-13]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Write /adance [1-13]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DANCING","bd_clap",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"DANCING","bd_clap1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"DANCING","dance_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"DANCING","dnce_M_d",4.1,1,1,1,1,1,1);
} else if(aationplayed == 13) {
ApplyAnimation(playerid,"DANCING","dnce_M_e",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adealer", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adealer [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /adealer [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DEALER","DEALER_DEAL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"DEALER","DEALER_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"DEALER","DEALER_IDLE_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"DEALER","DEALER_IDLE_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"DEALER","DEALER_IDLE_03",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"DEALER","DRUGS_BUY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"DEALER","shop_pay",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adildo", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adildo [1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /adildo [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DILDO","DILDO_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"DILDO","DILDO_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"DILDO","DILDO_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"DILDO","DILDO_block",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"DILDO","DILDO_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"DILDO","DILDO_Hit_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"DILDO","DILDO_Hit_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"DILDO","DILDO_Hit_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"DILDO","DILDO_IDLE",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adodge", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adodge [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /adodge [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DODGE","Cover_Dive_01",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"DODGE","Cover_Dive_02",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"DODGE","Crushed",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"DODGE","Crush_Jump",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adozer", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adozer [1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /adozer [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DOZER","DOZER_Align_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"DOZER","DOZER_Align_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"DOZER","DOZER_getin_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"DOZER","DOZER_getin_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"DOZER","DOZER_getout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"DOZER","DOZER_getout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"DOZER","DOZER_Jacked_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"DOZER","DOZER_Jacked_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"DOZER","DOZER_pullout_LHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/adrivebys", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /adrivebys [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /adrivebys [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyLHS_Bwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyLHS_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyRHS_Bwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyRHS_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyTop_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"DRIVEBYS","Gang_DrivebyTop_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afat [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /afat [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FAT","FatIdle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"FAT","FatIdle_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FAT","FatIdle_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FAT","FatIdle_Rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FAT","FatRun",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FAT","FatRun_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FAT","FatRun_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FAT","FatRun_Rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FAT","FatSprint",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"FAT","FatWalk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"FAT","FatWalkstart",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"FAT","FatWalkstart_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"FAT","FatWalkSt_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"FAT","FatWalkSt_Rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"FAT","FatWalk_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"FAT","FatWalk_Csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"FAT","FatWalk_Rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"FAT","IDLE_tired",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afightb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightb [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightb [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FIGHT_B","FightB_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FIGHT_B","FightB_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FIGHT_B","FightB_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FIGHT_B","FightB_block",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FIGHT_B","FightB_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FIGHT_B","FightB_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FIGHT_B","FightB_M",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FIGHT_B","HitB_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"FIGHT_B","HitB_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"FIGHT_B","HitB_3",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afightc", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightc [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightc [1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FIGHT_C","FightC_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"FIGHT_C","FightC_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"FIGHT_C","FightC_3",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"FIGHT_C","FightC_block",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"FIGHT_C","FightC_blocking",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"FIGHT_C","FightC_G",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"FIGHT_C","FightC_IDLE",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"FIGHT_C","FightC_M",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"FIGHT_C","FightC_Spar",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"FIGHT_C","HitC_1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"FIGHT_C","HitC_2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"FIGHT_C","HitC_3",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afightd", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightd [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /afightd [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FIGHT_D","FightD_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FIGHT_D","FightD_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FIGHT_D","FightD_block",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FIGHT_D","FightD_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FIGHT_D","FightD_M",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FIGHT_D","HitD_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"FIGHT_D","HitD_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"FIGHT_D","HitD_3",4.1,1,1,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/afighte", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afighte [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /afighte [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FIGHT_E","FightKick",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"FIGHT_E","FightKick_B",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"FIGHT_E","Hit_fightkick",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"FIGHT_E","Hit_fightkick_B",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afinale", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afinale [1-15]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 15) {
SendClientMessage(playerid,0xFF0000FF,">Write /afinale [1-15]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FINALE","FIN_Climb_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"FINALE","FIN_Cop1_ClimbOut2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FINALE","FIN_Cop1_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FINALE","FIN_Cop1_Stomp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FINALE","FIN_Hang_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FINALE","FIN_Hang_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FINALE","FIN_Hang_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FINALE","FIN_Hang_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FINALE","FIN_Jump_On",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"FINALE","FIN_Land_Car",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"FINALE","FIN_Land_Die",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"FINALE","FIN_LegsUp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"FINALE","FIN_LegsUp_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"FINALE","FIN_LegsUp_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"FINALE","FIN_LegsUp_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"FINALE","FIN_Let_Go",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afinale2", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afinale2 [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /afinale2 [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop1_ClimbOut",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop1_Fall",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop1_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop1_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop1_Swing",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"FINALE2","FIN_Cop2_ClimbOut",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"FINALE2","FIN_Switch_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"FINALE2","FIN_Switch_S",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aflamef", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aflamef [1-1]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Write /aflamef [1-1]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"FLAME","FLAME_fire",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aflowers", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aflowers [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /aflowers [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"Flowers","Flower_attack",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"Flowers","Flower_attack_M",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"Flowers","Flower_Hit",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/aghands", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aghands [1-20]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Write /aghands [1-20]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GHANDS","gsign1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"GHANDS","gsign2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"GHANDS","gsign3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"GHANDS","gsign3LH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"GHANDS","gsign4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"GHANDS","gsign4LH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"GHANDS","gsign5",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"GHANDS","gsign5LH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"GHANDS","LHGsign1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"GHANDS","LHGsign2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"GHANDS","LHGsign3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"GHANDS","LHGsign4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"GHANDS","LHGsign5",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"GHANDS","RHGsign1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"GHANDS","RHGsign2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"GHANDS","RHGsign3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"GHANDS","RHGsign4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"GHANDS","RHGsign5",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/afw", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /afw [1-9]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Write /afw [1-9]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"Freeweights","gym_barbell",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"Freeweights","gym_free_A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"Freeweights","gym_free_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"Freeweights","gym_free_celebrate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"Freeweights","gym_free_down",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"Freeweights","gym_free_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"Freeweights","gym_free_pickup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"Freeweights","gym_free_putdown",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"Freeweights","gym_free_up_smooth",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aghetto", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aghetto [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /aghetto [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car2_PLY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car2_SMO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car2_SWE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car_PLY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car_RYD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car_SMO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"GHETTO_DB","GDB_Car_SWE",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/agog", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agog [1-1]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Write /agog [1-1]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"goggles","goggles_put_on",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/agraffity", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agraffity [1-2]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Write /agraffity [1-2]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GRAFFITI","graffiti_Chkout",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"GRAFFITI","spraycan_fire",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/agreya", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agreya [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /agreya [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"GRAVEYARD","prst_loopa",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/agren", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /agren [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /agren [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"GRENADE","WEAPON_start_throw",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/ahaircut", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ahaircut [1-13]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Write /ahaircut [1-13]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Beard_01",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Buy",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Cut",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Cut_In",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Cut_Out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Hair_01",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Hair_02",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_In",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Out",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Sit_In",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Sit_Loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 13) {
ApplyAnimation(playerid,"HAIRCUTS","BRB_Sit_Out",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aheist", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aheist [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /aheist [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"HEIST9","CAS_G2_GasKO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"HEIST9","swt_wllpk_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"HEIST9","swt_wllpk_L_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"HEIST9","swt_wllpk_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"HEIST9","swt_wllpk_R_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"HEIST9","swt_wllshoot_in_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"HEIST9","swt_wllshoot_in_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"HEIST9","swt_wllshoot_out_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"HEIST9","swt_wllshoot_out_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"HEIST9","Use_SwipeCard",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ainthouse", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ainthouse [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /ainthouse [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"INT_HOUSE","BED_In_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"INT_HOUSE","BED_In_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"INT_HOUSE","BED_Out_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"INT_HOUSE","BED_Out_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"INT_HOUSE","LOU_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"INT_HOUSE","LOU_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"INT_HOUSE","LOU_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aintoffice", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aintoffice [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /aintoffice [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"INT_OFFICE","FF_Dam_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_2Idle_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Bored_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Crash",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Drink",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Idle_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Read",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Type_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Watch",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aplayerdbf", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aplayerdbf [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /aplayerdbf [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PLAYER_DVBYS","Plyr_DrivebyBwd",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PLAYER_DVBYS","Plyr_DrivebyFwd",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PLAYER_DVBYS","Plyr_DrivebyLHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"PLAYER_DVBYS","Plyr_DrivebyRHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aplayidles", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aplayidles [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /aplayidles [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PLAYIDLES","shift",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PLAYIDLES","shldr",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PLAYIDLES","stretch",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"PLAYIDLES","strleg",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"PLAYIDLES","time",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/apolice", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apolice [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /apolice [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"POLICE","CopTraf_Away",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"POLICE","CopTraf_Come",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"POLICE","CopTraf_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"POLICE","CopTraf_Stop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"POLICE","COP_getoutcar_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"POLICE","Cop_move_FWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"POLICE","crm_drgbst_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"POLICE","Door_Kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"POLICE","plc_drgbst_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"POLICE","plc_drgbst_02",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/apool", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apool [1-21]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 21) {
SendClientMessage(playerid,0xFF0000FF,">Write /apool [1-21]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"POOL","POOL_ChalkCue",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"POOL","POOL_Idle_Stance",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"POOL","POOL_Long_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"POOL","POOL_Long_Shot_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"POOL","POOL_Long_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"POOL","POOL_Long_Start_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"POOL","POOL_Med_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"POOL","POOL_Med_Shot_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"POOL","POOL_Med_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"POOL","POOL_Med_Start_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"POOL","POOL_Place_White",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"POOL","POOL_Short_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"POOL","POOL_Short_Shot_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"POOL","POOL_Short_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"POOL","POOL_Short_Start_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"POOL","POOL_Walk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"POOL","POOL_Walk_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"POOL","POOL_XLong_Shot",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"POOL","POOL_XLong_Shot_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"POOL","POOL_XLong_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"POOL","POOL_XLong_Start_O",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/apoor", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apoor [1-2]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Write /apoor [1-2]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"POOR","WINWASH_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"POOR","WINWASH_Wash2Beg",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/apython", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /apython [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /apython [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PYTHON","python_crouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PYTHON","python_crouchreload",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PYTHON","python_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"PYTHON","python_fire_poor",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"PYTHON","python_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aquad", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aquad [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /aquad [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"QUAD","QUAD_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"QUAD","QUAD_driveby_FT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"QUAD","QUAD_driveby_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"QUAD","QUAD_driveby_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"QUAD","QUAD_FWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"QUAD","QUAD_getoff_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"QUAD","QUAD_getoff_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"QUAD","QUAD_getoff_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"QUAD","QUAD_geton_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"QUAD","QUAD_geton_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"QUAD","QUAD_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"QUAD","QUAD_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"QUAD","QUAD_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"QUAD","QUAD_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"QUAD","QUAD_reverse",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"QUAD","QUAD_ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"QUAD","QUAD_Right",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aquadbz", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aquadbz [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /aquadbz [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"QUAD_DBZ","Pass_Driveby_BWD",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"QUAD_DBZ","Pass_Driveby_FWD",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"QUAD_DBZ","Pass_Driveby_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"QUAD_DBZ","Pass_Driveby_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/arapping", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /arapping [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /arapping [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"RAPPING","Laugh_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"RAPPING","RAP_A_IN",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"RAPPING","RAP_A_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"RAPPING","RAP_A_OUT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"RAPPING","RAP_B_IN",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"RAPPING","RAP_B_OUT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"RAPPING","RAP_C_Loop",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/arifle", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /arifle [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /arifle [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"RIFLE","RIFLE_crouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"RIFLE","RIFLE_crouchload",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"RIFLE","RIFLE_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"RIFLE","RIFLE_fire_poor",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"RIFLE","RIFLE_load",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ariot", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ariot [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /ariot [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"RIOT","RIOT_ANGRY",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"RIOT","RIOT_ANGRY_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"RIOT","RIOT_challenge",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"RIOT","RIOT_PUNCHES",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"RIOT","RIOT_shout",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/arobbank", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /arobbank [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /arobbank [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"ROB_BANK","CAT_Safe_End",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"ROB_BANK","CAT_Safe_Open",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"ROB_BANK","CAT_Safe_Open_O",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"ROB_BANK","CAT_Safe_Rob",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"ROB_BANK","SHP_HandsUp_Scr",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/arocket", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /arocket [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /arocket [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"ROCKET","idle_rocket",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"ROCKET","RocketFire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"ROCKET","run_rocket",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"ROCKET","walk_rocket",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"ROCKET","WALK_start_rocket",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/arustler", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /arustler [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /arustler [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"RUSTLER","Plane_align_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"RUSTLER","Plane_close",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"RUSTLER","Plane_getin",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"RUSTLER","Plane_getout",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"RUSTLER","Plane_open",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abiked", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abiked [1-18]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abiked [1-18]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKED","BIKEd_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"BIKED","BIKEd_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"BIKED","BIKEd_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"BIKED","BIKEd_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"BIKED","BIKEd_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"BIKED","BIKEd_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"BIKED","BIKEd_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"BIKED","BIKEd_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"BIKED","BIKEd_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"BIKED","BIKEd_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"BIKED","BIKEd_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"BIKED","BIKEd_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"BIKED","BIKEd_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"BIKED","BIKEd_shuffle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"BIKED","BIKEd_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aryder", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aryder [1-14]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Write /aryder [1-14]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"RYDER","RYD_Beckon_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"RYDER","RYD_Beckon_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"RYDER","RYD_Beckon_03",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"RYDER","RYD_Die_PT1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"RYDER","RYD_Die_PT2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"RYDER","Van_Crate_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"RYDER","Van_Crate_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"RYDER","Van_Fall_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"RYDER","Van_Fall_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"RYDER","Van_Lean_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"RYDER","Van_Lean_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"RYDER","VAN_PickUp_S",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"RYDER","Van_Stand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"RYDER","Van_Stand_Crate",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"RYDER","Van_Throw",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ascrat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ascrat [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /ascrat [1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SCRATCHING","scdldlp",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SCRATCHING","scdlulp",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"SCRATCHING","scdrdlp",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"SCRATCHING","scdrulp",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"SCRATCHING","sclng_l",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"SCRATCHING","sclng_r",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"SCRATCHING","scmid_l",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"SCRATCHING","scmid_r",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"SCRATCHING","scshrtl",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"SCRATCHING","scshrtr",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"SCRATCHING","sc_ltor",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"SCRATCHING","sc_rtol",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ashamal", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashamal [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashamal [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SHAMAL","SHAMAL_align",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SHAMAL","SHAMAL_getin_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"SHAMAL","SHAMAL_getout_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"SHAMAL","SHAMAL_open",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ashop", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashop [1-24]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashop [1-24]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SHOP","ROB_2Idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SHOP","ROB_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SHOP","donutdrop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SHOP","ROB_Loop_Threat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SHOP","ROB_Shifty",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SHOP","ROB_StickUp_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SHOP","SHP_Duck_Fire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"SHOP","SHP_Gun_Aim",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"SHOP","SHP_Gun_Duck",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"SHOP","SHP_Gun_Fire",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"SHOP","SHP_Gun_Grab",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"SHOP","SHP_Gun_Threat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"SHOP","SHP_HandsUp_Scr",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"SHOP","SHP_Jump_Glide",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"SHOP","SHP_Jump_Land",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"SHOP","SHP_Jump_Launch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"SHOP","SHP_Rob_GiveCash",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"SHOP","SHP_Rob_HandsUp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"SHOP","SHP_Rob_React",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"SHOP","SHP_Serve_End",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"SHOP","SHP_Serve_Idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"SHOP","SHP_Serve_Loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"SHOP","SHP_Serve_Start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"SHOP","Smoke_RYD",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/ashotgun", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashotgun [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /ashotgun [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SHOTGUN","shotgun_crouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SHOTGUN","shotgun_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"SHOTGUN","shotgun_fire_poor",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/askate", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /askate [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /askate [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SKATE","skate_idle",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SKATE","skate_run",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"SKATE","skate_sprint",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/avortex", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /avortex [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /avortex [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"VORTEX","CAR_jumpin_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"VORTEX","CAR_jumpin_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"VORTEX","vortex_getout_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"VORTEX","vortex_getout_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/atec", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /atec [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /atec [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"TEC","TEC_crouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"TEC","TEC_crouchreload",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"TEC","TEC_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"TEC","TEC_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/atrain", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /atrain [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /atrain [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"TRAIN","tran_gtup",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"TRAIN","tran_hng",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"TRAIN","tran_ouch",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"TRAIN","tran_stmb",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asil", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asil [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /asil [1-4]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SILENCED","CrouchReload",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SILENCED","SilenceCrouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"SILENCED","Silence_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"SILENCED","Silence_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/atattoo", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /atattoo [1-56]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 56) {
SendClientMessage(playerid,0xFF0000FF,">Write /atattoo [1-56]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"TATTOOS","TA_ArmL_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_Out_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_Pose_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_Pose_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmL_Pose_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Out_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Pose_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Pose_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"TATTOOS","TAT_ArmR_Pose_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Out_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 25) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Pose_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 26) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Pose_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 27) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Pose_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 28) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Sit_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 29) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Sit_Loop_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 30) {
ApplyAnimation(playerid,"TATTOOS","TAT_Back_Sit_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 31) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 32) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 33) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 34) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_Out_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 35) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_Pose_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 36) {
ApplyAnimation(playerid,"TATTOOS","TAT_Bel_Pose_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 37) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 38) {
ApplyAnimation(playerid,"TATTOOS","Sit_relaxed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 39) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 40) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 41) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 41) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 42) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Out_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 43) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Pose_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 44) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Pose_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 45) {
ApplyAnimation(playerid,"TATTOOS","TAT_Che_Pose_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 46) {
ApplyAnimation(playerid,"TATTOOS","TAT_Idle_Loop_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 47) {
ApplyAnimation(playerid,"TATTOOS","TAT_Idle_Loop_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 48) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_In_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 49) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_In_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 50) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_In_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 51) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Loop_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 52) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Loop_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 53) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Loop_T",4.1,1,1,1,1,1,1);
}else if(aationplayed == 54) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Out_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 55) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Out_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 56) {
ApplyAnimation(playerid,"TATTOOS","TAT_Sit_Out_T",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asmoking", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asmoking [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /asmoking [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SMOKING","F_smklean_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SMOKING","M_smklean_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SMOKING","M_smk_drag",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SMOKING","M_smk_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SMOKING","M_smk_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"SMOKING","M_smk_tap",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asniper", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asniper [1-1]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Write /asniper [1-1]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SNIPER","WEAPON_sniper",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aspray", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aspray [1-2]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Write /aspray [1-2]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SPRAYCAN","spraycan_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/astrip", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /astrip [1-20]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Write /astrip [1-20]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"STRIP","PLY_CASH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"STRIP","PUN_CASH",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"STRIP","PUN_HOLLER",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"STRIP","PUN_LOOP",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"STRIP","strip_A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"STRIP","strip_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"STRIP","strip_C",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"STRIP","strip_D",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"STRIP","strip_E",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"STRIP","strip_F",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"STRIP","strip_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"STRIP","STR_A2B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"STRIP","STR_B2A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"STRIP","STR_B2C",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"STRIP","STR_C1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"STRIP","STR_C2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"STRIP","STR_C2B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"STRIP","STR_Loop_A",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"STRIP","STR_Loop_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"STRIP","STR_Loop_C",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/abath", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /abath [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Write /abath [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SUNBATHE","batherdown",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"SUNBATHE","batherup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SUNBATHE","Lay_Bac_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SUNBATHE","Lay_Bac_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_M_IdleA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_M_IdleB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_M_IdleC",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_M_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_M_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_W_idleA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_W_idleB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_W_idleC",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_W_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"SUNBATHE","ParkSit_W_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"SUNBATHE","SBATHE_F_LieB2Sit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"SUNBATHE","SBATHE_F_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"SUNBATHE","SitnWait_in_W",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"SUNBATHE","SitnWait_out_W",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aswat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aswat [1-24]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Write /aswat [1-24]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SWAT","gnstwall_injurd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SWAT","JMP_Wall1m_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SWAT","Rail_fall",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SWAT","Rail_fall_crawl",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SWAT","swt_breach_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SWAT","cards_pick_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SWAT","swt_breach_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"SWAT","swt_breach_03",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"SWAT","swt_go",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"SWAT","swt_lkt",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"SWAT","swt_sty",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"SWAT","swt_vent_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"SWAT","swt_vent_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"SWAT","swt_vnt_sht_die",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"SWAT","swt_vnt_sht_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"SWAT","swt_vnt_sht_loop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"SWAT","swt_wllpk_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 18) {
ApplyAnimation(playerid,"SWAT","swt_wllpk_L_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 19) {
ApplyAnimation(playerid,"SWAT","swt_wllpk_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 20) {
ApplyAnimation(playerid,"SWAT","swt_wllpk_R_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 21) {
ApplyAnimation(playerid,"SWAT","swt_wllshoot_in_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 22) {
ApplyAnimation(playerid,"SWAT","swt_wllshoot_in_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 23) {
ApplyAnimation(playerid,"SWAT","swt_wllshoot_out_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 24) {
ApplyAnimation(playerid,"SWAT","swt_wllshoot_out_R",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asweet", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asweet [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /asweet [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SWEET","ho_ass_slapped",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SWEET","LaFin_Player",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SWEET","LaFin_Sweet",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SWEET","plyr_hndshldr_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SWEET","sweet_ass_slap",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SWEET","sweet_hndshldr_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SWEET","Sweet_injuredloop",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aswim", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aswim [1-7]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Write /aswim [1-7]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SWIM","Swim_Breast",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SWIM","SWIM_crawl",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SWIM","Swim_Dive_Under",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SWIM","Swim_Glide",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SWIM","Swim_jumpout",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SWIM","Swim_Tread",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SWIM","Swim_Under",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/asword", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /asword [1-10]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Write /asword [1-10]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"SWORD","sword_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"SWORD","sword_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"SWORD","sword_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"SWORD","sword_4",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"SWORD","sword_block",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"SWORD","Sword_Hit_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"SWORD","Sword_Hit_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"SWORD","Sword_Hit_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"SWORD","sword_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"SWORD","sword_part",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/atank", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /atank [1-6]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Write /atank [1-6]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"TANK","TANK_align_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"TANK","TANK_close_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"TANK","TANK_doorlocked",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"TANK","TANK_getin_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"TANK","TANK_getout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"TANK","TANK_open_LHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/atruck", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /atruck [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /atruck [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"TRUCK","TRUCK_ALIGN_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"TRUCK","TRUCK_ALIGN_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"TRUCK","TRUCK_closedoor_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"TRUCK","TRUCK_closedoor_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"TRUCK","TRUCK_close_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"TRUCK","TRUCK_close_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"TRUCK","TRUCK_getin_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"TRUCK","TRUCK_getin_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"TRUCK","TRUCK_getout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"TRUCK","TRUCK_getout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"TRUCK","TRUCK_jackedLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"TRUCK","TRUCK_jackedRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"TRUCK","TRUCK_open_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"TRUCK","TRUCK_open_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"TRUCK","TRUCK_pullout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"TRUCK","TRUCK_pullout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"TRUCK","TRUCK_Shuffle",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/auzi", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /auzi [1-5]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Write /auzi [1-5]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"UZI","UZI_crouchfire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"UZI","UZI_crouchreload",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"UZI","UZI_fire",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"UZI","UZI_fire_poor",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"UZI","UZI_reload",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/avan", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /avan [1-8]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Write /avan [1-8]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"VAN","VAN_close_back_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"VAN","VAN_close_back_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"VAN","VAN_getin_Back_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"VAN","VAN_getin_Back_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"VAN","VAN_getout_back_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"VAN","VAN_getout_back_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"VAN","VAN_open_back_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"VAN","VAN_open_back_RHS",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/avending", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /avending [1-6]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Write /avending [1-6]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"VENDING","VEND_Drink2_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"VENDING","VEND_Drink_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"VENDING","vend_eat1_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"VENDING","VEND_Eat_P",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"VENDING","VEND_Use",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"VENDING","VEND_Use_pt2",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/away", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /away [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /away [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"WAYFARER","WF_Back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 1) {
ApplyAnimation(playerid,"WAYFARER","WF_drivebyFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"WAYFARER","WF_drivebyLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"WAYFARER","WF_drivebyRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"WAYFARER","WF_Fwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"WAYFARER","WF_getoffBACK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"WAYFARER","WF_getoffLHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"WAYFARER","WF_getoffRHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"WAYFARER","WF_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"WAYFARER","WF_jumponL",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"WAYFARER","WF_jumponR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"WAYFARER","WF_kick",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"WAYFARER","WF_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"WAYFARER","WF_passenger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"WAYFARER","WF_pushes",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"WAYFARER","WF_Ride",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"WAYFARER","WF_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"WAYFARER","WF_Still",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aweap", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aweap [1-17]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Write /aweap [1-17]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"WEAPONS","SHP_1H_Lift",4.1,1,1,1,1,1,1);
}else if(aationplayed == 2) {
ApplyAnimation(playerid,"WEAPONS","SHP_1H_Lift_End",4.1,1,1,1,1,1,1);
}else if(aationplayed == 3) {
ApplyAnimation(playerid,"WEAPONS","SHP_1H_Ret",4.1,1,1,1,1,1,1);
}else if(aationplayed == 4) {
ApplyAnimation(playerid,"WEAPONS","SHP_1H_Ret_S",4.1,1,1,1,1,1,1);
}else if(aationplayed == 5) {
ApplyAnimation(playerid,"WEAPONS","SHP_2H_Lift",4.1,1,1,1,1,1,1);
}else if(aationplayed == 6) {
ApplyAnimation(playerid,"WEAPONS","SHP_2H_Lift_End",4.1,1,1,1,1,1,1);
}else if(aationplayed == 7) {
ApplyAnimation(playerid,"WEAPONS","SHP_2H_Ret",4.1,1,1,1,1,1,1);
}else if(aationplayed == 8) {
ApplyAnimation(playerid,"WEAPONS","SHP_2H_Ret_S",4.1,1,1,1,1,1,1);
}else if(aationplayed == 9) {
ApplyAnimation(playerid,"WEAPONS","SHP_Ar_Lift",4.1,1,1,1,1,1,1);
}else if(aationplayed == 10) {
ApplyAnimation(playerid,"WEAPONS","SHP_Ar_Lift_End",4.1,1,1,1,1,1,1);
}else if(aationplayed == 11) {
ApplyAnimation(playerid,"WEAPONS","SHP_Ar_Ret",4.1,1,1,1,1,1,1);
}else if(aationplayed == 12) {
ApplyAnimation(playerid,"WEAPONS","SHP_Ar_Ret_S",4.1,1,1,1,1,1,1);
}else if(aationplayed == 13) {
ApplyAnimation(playerid,"WEAPONS","SHP_G_Lift_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 14) {
ApplyAnimation(playerid,"WEAPONS","SHP_G_Lift_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 15) {
ApplyAnimation(playerid,"WEAPONS","SHP_Tray_In",4.1,1,1,1,1,1,1);
}else if(aationplayed == 16) {
ApplyAnimation(playerid,"WEAPONS","SHP_Tray_Out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 17) {
ApplyAnimation(playerid,"WEAPONS","SHP_Tray_Pose",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/awuzi", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /awuzi [1-12]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Write /awuzi [1-12]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"WUZI","CS_Dead_Guy",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"WUZI","CS_Plyr_pt1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"WUZI","CS_Plyr_pt2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"WUZI","CS_Wuzi_pt1",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"WUZI","CS_Wuzi_pt2",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"WUZI","Walkstart_Idle_01",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"WUZI","Wuzi_Greet_Plyr",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"WUZI","Wuzi_Greet_Wuzi",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"WUZI","Wuzi_grnd_chk",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"WUZI","Wuzi_Walk",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/aat", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aat [1-3]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Write /aat [1-3]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"Attractors","Stepsit_in",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"Attractors","Stepsit_loop",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"Attractors","Stepsit_out",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/aairport", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aairport [1]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Write /aairport [1]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"AIRPORT","thrw_barl_thrw",4.1,1,1,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/aped", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /aped [1-295]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 295) {
SendClientMessage(playerid,0xFF0000FF,">Write /aped [1-295]");
return 1;
}
if(aationplayed == 1) {
ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1,1);
} else if(aationplayed == 2) {
ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1,1);
} else if(aationplayed == 3) {
ApplyAnimation(playerid,"PED","abseil",4.1,1,1,1,1,1,1);
} else if(aationplayed == 4) {
ApplyAnimation(playerid,"PED","ARRESTgun",4.1,1,1,1,1,1,1);
} else if(aationplayed == 5) {
ApplyAnimation(playerid,"PED","ATM",4.1,1,1,1,1,1,1);
} else if(aationplayed == 6) {
ApplyAnimation(playerid,"PED","BIKE_elbowL",4.1,1,1,1,1,1,1);
} else if(aationplayed == 7) {
ApplyAnimation(playerid,"PED","BIKE_fallR",4.1,1,1,1,1,1,1);
} else if(aationplayed == 8) {
ApplyAnimation(playerid,"PED","BIKE_fall_off",4.1,1,1,1,1,1,1);
} else if(aationplayed == 9) {
ApplyAnimation(playerid,"PED","BIKE_pickupL",4.1,1,1,1,1,1,1);
} else if(aationplayed == 10) {
ApplyAnimation(playerid,"PED","BIKE_pickupR",4.1,1,1,1,1,1,1);
} else if(aationplayed == 11) {
ApplyAnimation(playerid,"PED","BIKE_pullupL",4.1,1,1,1,1,1,1);
} else if(aationplayed == 12) {
ApplyAnimation(playerid,"PED","BIKE_pullupR",4.1,1,1,1,1,1,1);
} else if(aationplayed == 13) {
ApplyAnimation(playerid,"PED","bomber",4.1,1,1,1,1,1,1);
} else if(aationplayed == 14) {
ApplyAnimation(playerid,"PED","CAR_alignHI_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 15) {
ApplyAnimation(playerid,"PED","CAR_alignHI_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 16) {
ApplyAnimation(playerid,"PED","CAR_align_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 17) {
ApplyAnimation(playerid,"PED","CAR_align_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 18) {
ApplyAnimation(playerid,"PED","CAR_closedoorL_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 19) {
ApplyAnimation(playerid,"PED","CAR_closedoorL_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 20) {
ApplyAnimation(playerid,"PED","CAR_closedoor_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 21) {
ApplyAnimation(playerid,"PED","CAR_closedoor_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 22) {
ApplyAnimation(playerid,"PED","CAR_close_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 23) {
ApplyAnimation(playerid,"PED","CAR_crawloutRHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 24) {
ApplyAnimation(playerid,"PED","CAR_dead_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 25) {
ApplyAnimation(playerid,"PED","CAR_dead_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 26) {
ApplyAnimation(playerid,"PED","CAR_doorlocked_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 27) {
ApplyAnimation(playerid,"PED","CAR_fallout_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 28) {
ApplyAnimation(playerid,"PED","CAR_fallout_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 29) {
ApplyAnimation(playerid,"PED","CAR_getinL_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 30) {
ApplyAnimation(playerid,"PED","CAR_getinL_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 31) {
ApplyAnimation(playerid,"PED","CAR_getin_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 32) {
ApplyAnimation(playerid,"PED","CAR_getin_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 33) {
ApplyAnimation(playerid,"PED","CAR_getoutL_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 34) {
ApplyAnimation(playerid,"PED","CAR_getout_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 35) {
ApplyAnimation(playerid,"PED","CAR_getout_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 36) {
ApplyAnimation(playerid,"PED","car_hookertalk",4.1,1,1,1,1,1,1);
} else if(aationplayed == 37) {
ApplyAnimation(playerid,"PED","CAR_jackedLHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 38) {
ApplyAnimation(playerid,"PED","CAR_jackedRHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 39) {
ApplyAnimation(playerid,"PED","CAR_jumpin_LHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 40) {
ApplyAnimation(playerid,"PED","CAR_LB",4.1,1,1,1,1,1,1);
} else if(aationplayed == 41) {
ApplyAnimation(playerid,"PED","CAR_LB_pro",4.1,1,1,1,1,1,1);
} else if(aationplayed == 42) {
ApplyAnimation(playerid,"PED","CAR_LB_weak",4.1,1,1,1,1,1,1);
} else if(aationplayed == 43) {
ApplyAnimation(playerid,"PED","CAR_LjackedLHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 44) {
ApplyAnimation(playerid,"PED","CAR_Lshuffle_RHS",4.1,1,1,1,1,1,1);
} else if(aationplayed == 45) {
ApplyAnimation(playerid,"PED","CAR_Lsit",4.1,1,1,1,1,1,1);
} else if(aationplayed == 46) {
ApplyAnimation(playerid,"PED","CAR_open_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 47) {
ApplyAnimation(playerid,"PED","CAR_open_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 49) {
ApplyAnimation(playerid,"PED","CAR_pulloutL_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 50) {
ApplyAnimation(playerid,"PED","CAR_pulloutL_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 51) {
ApplyAnimation(playerid,"PED","CAR_pullout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 52) {
ApplyAnimation(playerid,"PED","CAR_pullout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 53) {
ApplyAnimation(playerid,"PED","CAR_Qjacked",4.1,1,1,1,1,1,1);
}else if(aationplayed == 54) {
ApplyAnimation(playerid,"PED","CAR_rolldoor",4.1,1,1,1,1,1,1);
}else if(aationplayed == 55) {
ApplyAnimation(playerid,"PED","CAR_rolldoorLO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 56) {
ApplyAnimation(playerid,"PED","CAR_rollout_LHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 57) {
ApplyAnimation(playerid,"PED","CAR_rollout_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 58) {
ApplyAnimation(playerid,"PED","CAR_shuffle_RHS",4.1,1,1,1,1,1,1);
}else if(aationplayed == 59) {
ApplyAnimation(playerid,"PED","CAR_sit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 60) {
ApplyAnimation(playerid,"PED","CAR_sitp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 61) {
ApplyAnimation(playerid,"PED","CAR_sitpLO",4.1,1,1,1,1,1,1);
}else if(aationplayed == 62) {
ApplyAnimation(playerid,"PED","CAR_sit_pro",4.1,1,1,1,1,1,1);
}else if(aationplayed == 63) {
ApplyAnimation(playerid,"PED","CAR_sit_weak",4.1,1,1,1,1,1,1);
}else if(aationplayed == 64) {
ApplyAnimation(playerid,"PED","CAR_tune_radio",4.1,1,1,1,1,1,1);
}else if(aationplayed == 65) {
ApplyAnimation(playerid,"PED","CLIMB_idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 66) {
ApplyAnimation(playerid,"PED","CLIMB_jump",4.1,1,1,1,1,1,1);
}else if(aationplayed == 67) {
ApplyAnimation(playerid,"PED","CLIMB_jump2fall",4.1,1,1,1,1,1,1);
}else if(aationplayed == 68) {
ApplyAnimation(playerid,"PED","CLIMB_jump_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 69) {
ApplyAnimation(playerid,"PED","CLIMB_Pull",4.1,1,1,1,1,1,1);
}else if(aationplayed == 70) {
ApplyAnimation(playerid,"PED","CLIMB_Stand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 71) {
ApplyAnimation(playerid,"PED","CLIMB_Stand_finish",4.1,1,1,1,1,1,1);
}else if(aationplayed == 72) {
ApplyAnimation(playerid,"PED","cower",4.1,1,1,1,1,1,1);
}else if(aationplayed == 73) {
ApplyAnimation(playerid,"PED","Crouch_Roll_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 74) {
ApplyAnimation(playerid,"PED","Crouch_Roll_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 75) {
ApplyAnimation(playerid,"PED","DAM_armL_frmBK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 76) {
ApplyAnimation(playerid,"PED","DAM_armL_frmFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 77) {
ApplyAnimation(playerid,"PED","DAM_armL_frmLT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 78) {
ApplyAnimation(playerid,"PED","DAM_armR_frmBK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 79) {
ApplyAnimation(playerid,"PED","DAM_armR_frmFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 80) {
ApplyAnimation(playerid,"PED","DAM_armR_frmRT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 81) {
ApplyAnimation(playerid,"PED","DAM_LegL_frmBK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 82) {
ApplyAnimation(playerid,"PED","DAM_LegL_frmFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 83) {
ApplyAnimation(playerid,"PED","DAM_LegL_frmLT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 84) {
ApplyAnimation(playerid,"PED","DAM_LegR_frmBK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 85) {
ApplyAnimation(playerid,"PED","DAM_LegR_frmFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 86) {
ApplyAnimation(playerid,"PED","DAM_LegR_frmRT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 87) {
ApplyAnimation(playerid,"PED","DAM_stomach_frmBK",4.1,1,1,1,1,1,1);
}else if(aationplayed == 88) {
ApplyAnimation(playerid,"PED","DAM_stomach_frmFT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 89) {
ApplyAnimation(playerid,"PED","DAM_stomach_frmLT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 90) {
ApplyAnimation(playerid,"PED","DAM_stomach_frmRT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 91) {
ApplyAnimation(playerid,"PED","DOOR_LHinge_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 92) {
ApplyAnimation(playerid,"PED","DOOR_RHinge_O",4.1,1,1,1,1,1,1);
}else if(aationplayed == 93) {
ApplyAnimation(playerid,"PED","DrivebyL_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 94) {
ApplyAnimation(playerid,"PED","DrivebyL_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 95) {
ApplyAnimation(playerid,"PED","Driveby_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 96) {
ApplyAnimation(playerid,"PED","Driveby_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 97) {
ApplyAnimation(playerid,"PED","DRIVE_BOAT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 98) {
ApplyAnimation(playerid,"PED","DRIVE_BOAT_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 99) {
ApplyAnimation(playerid,"PED","DRIVE_BOAT_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 100) {
ApplyAnimation(playerid,"PED","DRIVE_BOAT_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 101) {
ApplyAnimation(playerid,"PED","Drive_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 102) {
ApplyAnimation(playerid,"PED","Drive_LO_l",4.1,1,1,1,1,1,1);
}else if(aationplayed == 103) {
ApplyAnimation(playerid,"PED","Drive_LO_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 104) {
ApplyAnimation(playerid,"PED","Drive_L_pro",4.1,1,1,1,1,1,1);
}else if(aationplayed == 105) {
ApplyAnimation(playerid,"PED","Drive_L_pro_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 106) {
ApplyAnimation(playerid,"PED","Drive_L_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 107) {
ApplyAnimation(playerid,"PED","Drive_L_weak",4.1,1,1,1,1,1,1);
}else if(aationplayed == 108) {
ApplyAnimation(playerid,"PED","Drive_L_weak_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 109) {
ApplyAnimation(playerid,"PED","Drive_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 110) {
ApplyAnimation(playerid,"PED","Drive_R_pro",4.1,1,1,1,1,1,1);
}else if(aationplayed == 111) {
ApplyAnimation(playerid,"PED","Drive_R_pro_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 112) {
ApplyAnimation(playerid,"PED","Drive_R_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 113) {
ApplyAnimation(playerid,"PED","Drive_R_weak",4.1,1,1,1,1,1,1);
}else if(aationplayed == 114) {
ApplyAnimation(playerid,"PED","Drive_R_weak_slow",4.1,1,1,1,1,1,1);
}else if(aationplayed == 115) {
ApplyAnimation(playerid,"PED","Drive_truck",4.1,1,1,1,1,1,1);
}else if(aationplayed == 116) {
ApplyAnimation(playerid,"PED","DRIVE_truck_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 117) {
ApplyAnimation(playerid,"PED","DRIVE_truck_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 118) {
ApplyAnimation(playerid,"PED","DRIVE_truck_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 119) {
ApplyAnimation(playerid,"PED","Drown",4.1,1,1,1,1,1,1);
}else if(aationplayed == 120) {
ApplyAnimation(playerid,"PED","DUCK_cower",4.1,1,1,1,1,1,1);
}else if(aationplayed == 121) {
ApplyAnimation(playerid,"PED","endchat_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 122) {
ApplyAnimation(playerid,"PED","endchat_02",4.1,1,1,1,1,1,1);
}else if(aationplayed == 123) {
ApplyAnimation(playerid,"PED","endchat_03",4.1,1,1,1,1,1,1);
}else if(aationplayed == 124) {
ApplyAnimation(playerid,"PED","DRIVE_truck_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 125) {
ApplyAnimation(playerid,"PED","DRIVE_truck_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 126) {
ApplyAnimation(playerid,"PED","EV_dive",4.1,1,1,1,1,1,1);
}else if(aationplayed == 127) {
ApplyAnimation(playerid,"PED","EV_step",4.1,1,1,1,1,1,1);
}else if(aationplayed == 128) {
ApplyAnimation(playerid,"PED","facanger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 129) {
ApplyAnimation(playerid,"PED","facanger",4.1,1,1,1,1,1,1);
}else if(aationplayed == 130) {
ApplyAnimation(playerid,"PED","facgum",4.1,1,1,1,1,1,1);
}else if(aationplayed == 131) {
ApplyAnimation(playerid,"PED","facsurp",4.1,1,1,1,1,1,1);
}else if(aationplayed == 132) {
ApplyAnimation(playerid,"PED","facsurpm",4.1,1,1,1,1,1,1);
}else if(aationplayed == 133) {
ApplyAnimation(playerid,"PED","factalk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 134) {
ApplyAnimation(playerid,"PED","facurios",4.1,1,1,1,1,1,1);
}else if(aationplayed == 135) {
ApplyAnimation(playerid,"PED","FALL_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 136) {
ApplyAnimation(playerid,"PED","FALL_collapse",4.1,1,1,1,1,1,1);
}else if(aationplayed == 137) {
ApplyAnimation(playerid,"PED","FALL_fall",4.1,1,1,1,1,1,1);
}else if(aationplayed == 138) {
ApplyAnimation(playerid,"PED","FALL_front",4.1,1,1,1,1,1,1);
}else if(aationplayed == 139) {
ApplyAnimation(playerid,"PED","FALL_glide",4.1,1,1,1,1,1,1);
}else if(aationplayed == 140) {
ApplyAnimation(playerid,"PED","FALL_land",4.1,1,1,1,1,1,1);
}else if(aationplayed == 141) {
ApplyAnimation(playerid,"PED","FALL_skyDive",4.1,1,1,1,1,1,1);
}else if(aationplayed == 142) {
ApplyAnimation(playerid,"PED","Fight2Idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 143) {
ApplyAnimation(playerid,"PED","FightA_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 144) {
ApplyAnimation(playerid,"PED","FightA_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 145) {
ApplyAnimation(playerid,"PED","FightA_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 146) {
ApplyAnimation(playerid,"PED","FightA_block",4.1,1,1,1,1,1,1);
}else if(aationplayed == 147) {
ApplyAnimation(playerid,"PED","FightA_G",4.1,1,1,1,1,1,1);
}else if(aationplayed == 148) {
ApplyAnimation(playerid,"PED","FightA_M",4.1,1,1,1,1,1,1);
}else if(aationplayed == 149) {
ApplyAnimation(playerid,"PED","FIGHTIDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 150) {
ApplyAnimation(playerid,"PED","FightShB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 151) {
ApplyAnimation(playerid,"PED","FightShF",4.1,1,1,1,1,1,1);
}else if(aationplayed == 152) {
ApplyAnimation(playerid,"PED","FightSh_BWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 153) {
ApplyAnimation(playerid,"PED","FightSh_FWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 154) {
ApplyAnimation(playerid,"PED","FightSh_Left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 155) {
ApplyAnimation(playerid,"PED","FightSh_Right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 156) {
ApplyAnimation(playerid,"PED","flee_lkaround_01",4.1,1,1,1,1,1,1);
}else if(aationplayed == 157) {
ApplyAnimation(playerid,"PED","FLOOR_hit",4.1,1,1,1,1,1,1);
}else if(aationplayed == 158) {
ApplyAnimation(playerid,"PED","FLOOR_hit_f",4.1,1,1,1,1,1,1);
}else if(aationplayed == 159) {
ApplyAnimation(playerid,"PED","fucku",4.1,1,1,1,1,1,1);
}else if(aationplayed == 160) {
ApplyAnimation(playerid,"PED","gang_gunstand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 161) {
ApplyAnimation(playerid,"PED","gas_cwr",4.1,1,1,1,1,1,1);
}else if(aationplayed == 162) {
ApplyAnimation(playerid,"PED","getup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 163) {
ApplyAnimation(playerid,"PED","getup_front",4.1,1,1,1,1,1,1);
}else if(aationplayed == 164) {
ApplyAnimation(playerid,"PED","gum_eat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 165) {
ApplyAnimation(playerid,"PED","GunCrouchBwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 166) {
ApplyAnimation(playerid,"PED","GunCrouchFwd",4.1,1,1,1,1,1,1);
}else if(aationplayed == 167) {
ApplyAnimation(playerid,"PED","GunMove_BWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 168) {
ApplyAnimation(playerid,"PED","GunMove_FWD",4.1,1,1,1,1,1,1);
}else if(aationplayed == 169) {
ApplyAnimation(playerid,"PED","GunMove_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 170) {
ApplyAnimation(playerid,"PED","GunMove_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 171) {
ApplyAnimation(playerid,"PED","Gun_2_IDLE",4.1,1,1,1,1,1,1);
}else if(aationplayed == 172) {
ApplyAnimation(playerid,"PED","GUN_BUTT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 173) {
ApplyAnimation(playerid,"PED","GUN_BUTT_crouch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 174) {
ApplyAnimation(playerid,"PED","Gun_stand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 175) {
ApplyAnimation(playerid,"PED","handscower",4.1,1,1,1,1,1,1);
}else if(aationplayed == 176) {
ApplyAnimation(playerid,"PED","handsup",4.1,1,1,1,1,1,1);
}else if(aationplayed == 177) {
ApplyAnimation(playerid,"PED","HitA_1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 178) {
ApplyAnimation(playerid,"PED","HitA_2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 179) {
ApplyAnimation(playerid,"PED","HitA_3",4.1,1,1,1,1,1,1);
}else if(aationplayed == 180) {
ApplyAnimation(playerid,"PED","HIT_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 181) {
ApplyAnimation(playerid,"PED","HIT_behind",4.1,1,1,1,1,1,1);
}else if(aationplayed == 182) {
ApplyAnimation(playerid,"PED","HIT_front",4.1,1,1,1,1,1,1);
}else if(aationplayed == 183) {
ApplyAnimation(playerid,"PED","HIT_GUN_BUTT",4.1,1,1,1,1,1,1);
}else if(aationplayed == 184) {
ApplyAnimation(playerid,"PED","HIT_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 185) {
ApplyAnimation(playerid,"PED","HIT_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 186) {
ApplyAnimation(playerid,"PED","HIT_walk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 187) {
ApplyAnimation(playerid,"PED","HIT_wall",4.1,1,1,1,1,1,1);
}else if(aationplayed == 188) {
ApplyAnimation(playerid,"PED","Idlestance_fat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 189) {
ApplyAnimation(playerid,"PED","idlestance_old",4.1,1,1,1,1,1,1);
}else if(aationplayed == 190) {
ApplyAnimation(playerid,"PED","IDLE_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 191) {
ApplyAnimation(playerid,"PED","IDLE_chat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 192) {
ApplyAnimation(playerid,"PED","IDLE_csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 193) {
ApplyAnimation(playerid,"PED","Idle_Gang1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 194) {
ApplyAnimation(playerid,"PED","IDLE_HBHB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 195) {
ApplyAnimation(playerid,"PED","IDLE_ROCKET",4.1,1,1,1,1,1,1);
}else if(aationplayed == 196) {
ApplyAnimation(playerid,"PED","IDLE_stance",4.1,1,1,1,1,1,1);
}else if(aationplayed == 197) {
ApplyAnimation(playerid,"PED","IDLE_taxi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 198) {
ApplyAnimation(playerid,"PED","IDLE_tired",4.1,1,1,1,1,1,1);
}else if(aationplayed == 199) {
ApplyAnimation(playerid,"PED","Jetpack_Idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 200) {
ApplyAnimation(playerid,"PED","JOG_femaleA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 201) {
ApplyAnimation(playerid,"PED","JOG_maleA",4.1,1,1,1,1,1,1);
}else if(aationplayed == 202) {
ApplyAnimation(playerid,"PED","JUMP_glide",4.1,1,1,1,1,1,1);
}else if(aationplayed == 203) {
ApplyAnimation(playerid,"PED","JUMP_land",4.1,1,1,1,1,1,1);
}else if(aationplayed == 204) {
ApplyAnimation(playerid,"PED","JUMP_launch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 205) {
ApplyAnimation(playerid,"PED","JUMP_launch_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 206) {
ApplyAnimation(playerid,"PED","KART_drive",4.1,1,1,1,1,1,1);
}else if(aationplayed == 207) {
ApplyAnimation(playerid,"PED","KART_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 208) {
ApplyAnimation(playerid,"PED","KART_LB",4.1,1,1,1,1,1,1);
}else if(aationplayed == 209) {
ApplyAnimation(playerid,"PED","KART_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 210) {
ApplyAnimation(playerid,"PED","KD_left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 211) {
ApplyAnimation(playerid,"PED","KD_right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 212) {
ApplyAnimation(playerid,"PED","KO_shot_face",4.1,1,1,1,1,1,1);
}else if(aationplayed == 213) {
ApplyAnimation(playerid,"PED","KO_shot_front",4.1,1,1,1,1,1,1);
}else if(aationplayed == 214) {
ApplyAnimation(playerid,"PED","KO_shot_stom",4.1,1,1,1,1,1,1);
}else if(aationplayed == 215) {
ApplyAnimation(playerid,"PED","KO_skid_back",4.1,1,1,1,1,1,1);
}else if(aationplayed == 216) {
ApplyAnimation(playerid,"PED","KO_skid_front",4.1,1,1,1,1,1,1);
}else if(aationplayed == 217) {
ApplyAnimation(playerid,"PED","KO_spin_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 218) {
ApplyAnimation(playerid,"PED","KO_spin_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 219) {
ApplyAnimation(playerid,"PED","pass_Smoke_in_car",4.1,1,1,1,1,1,1);
}else if(aationplayed == 220) {
ApplyAnimation(playerid,"PED","phone_in",4.1,1,1,1,1,1,1);
}else if(aationplayed == 221) {
ApplyAnimation(playerid,"PED","phone_out",4.1,1,1,1,1,1,1);
}else if(aationplayed == 222) {
ApplyAnimation(playerid,"PED","phone_talk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 223) {
ApplyAnimation(playerid,"PED","Player_Sneak",4.1,1,1,1,1,1,1);
}else if(aationplayed == 224) {
ApplyAnimation(playerid,"PED","Player_Sneak_walkstart",4.1,1,1,1,1,1,1);
}else if(aationplayed == 225) {
ApplyAnimation(playerid,"PED","roadcross",4.1,1,1,1,1,1,1);
}else if(aationplayed == 226) {
ApplyAnimation(playerid,"PED","roadcross_female",4.1,1,1,1,1,1,1);
}else if(aationplayed == 227) {
ApplyAnimation(playerid,"PED","roadcross_gang",4.1,1,1,1,1,1,1);
}else if(aationplayed == 228) {
ApplyAnimation(playerid,"PED","roadcross_old",4.1,1,1,1,1,1,1);
}else if(aationplayed == 229) {
ApplyAnimation(playerid,"PED","run_1armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 230) {
ApplyAnimation(playerid,"PED","run_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 231) {
ApplyAnimation(playerid,"PED","run_civi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 232) {
ApplyAnimation(playerid,"PED","run_csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 233) {
ApplyAnimation(playerid,"PED","run_fat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 234) {
ApplyAnimation(playerid,"PED","run_fatold",4.1,1,1,1,1,1,1);
}else if(aationplayed == 235) {
ApplyAnimation(playerid,"PED","run_gang1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 236) {
ApplyAnimation(playerid,"PED","run_left",4.1,1,1,1,1,1,1);
}else if(aationplayed == 237) {
ApplyAnimation(playerid,"PED","run_old",4.1,1,1,1,1,1,1);
}else if(aationplayed == 238) {
ApplyAnimation(playerid,"PED","run_player",4.1,1,1,1,1,1,1);
}else if(aationplayed == 239) {
ApplyAnimation(playerid,"PED","run_right",4.1,1,1,1,1,1,1);
}else if(aationplayed == 240) {
ApplyAnimation(playerid,"PED","run_rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 241) {
ApplyAnimation(playerid,"PED","Run_stop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 242) {
ApplyAnimation(playerid,"PED","Run_stopR",4.1,1,1,1,1,1,1);
}else if(aationplayed == 243) {
ApplyAnimation(playerid,"PED","Run_Wuzi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 244) {
ApplyAnimation(playerid,"PED","SEAT_down",4.1,1,1,1,1,1,1);
}else if(aationplayed == 245) {
ApplyAnimation(playerid,"PED","SEAT_idle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 246) {
ApplyAnimation(playerid,"PED","SEAT_up",4.1,1,1,1,1,1,1);
}else if(aationplayed == 247) {
ApplyAnimation(playerid,"PED","SHOT_leftP",4.1,1,1,1,1,1,1);
}else if(aationplayed == 248) {
ApplyAnimation(playerid,"PED","SHOT_partial",4.1,1,1,1,1,1,1);
}else if(aationplayed == 249) {
ApplyAnimation(playerid,"PED","SHOT_partial_B",4.1,1,1,1,1,1,1);
}else if(aationplayed == 250) {
ApplyAnimation(playerid,"PED","SHOT_rightP",4.1,1,1,1,1,1,1);
}else if(aationplayed == 251) {
ApplyAnimation(playerid,"PED","Shove_Partial",4.1,1,1,1,1,1,1);
}else if(aationplayed == 252) {
ApplyAnimation(playerid,"PED","Smoke_in_car",4.1,1,1,1,1,1,1);
}else if(aationplayed == 253) {
ApplyAnimation(playerid,"PED","sprint_civi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 254) {
ApplyAnimation(playerid,"PED","sprint_panic",4.1,1,1,1,1,1,1);
}else if(aationplayed == 255) {
ApplyAnimation(playerid,"PED","Sprint_Wuzi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 256) {
ApplyAnimation(playerid,"PED","swat_run",4.1,1,1,1,1,1,1);
}else if(aationplayed == 257) {
ApplyAnimation(playerid,"PED","Swim_Tread",4.1,1,1,1,1,1,1);
}else if(aationplayed == 258) {
ApplyAnimation(playerid,"PED","Tap_hand",4.1,1,1,1,1,1,1);
}else if(aationplayed == 259) {
ApplyAnimation(playerid,"PED","Tap_handP",4.1,1,1,1,1,1,1);
}else if(aationplayed == 260) {
ApplyAnimation(playerid,"PED","turn_180",4.1,1,1,1,1,1,1);
}else if(aationplayed == 261) {
ApplyAnimation(playerid,"PED","Turn_L",4.1,1,1,1,1,1,1);
}else if(aationplayed == 262) {
ApplyAnimation(playerid,"PED","Turn_R",4.1,1,1,1,1,1,1);
}else if(aationplayed == 263) {
ApplyAnimation(playerid,"PED","WALK_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 264) {
ApplyAnimation(playerid,"PED","WALK_civi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 265) {
ApplyAnimation(playerid,"PED","WALK_csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 266) {
ApplyAnimation(playerid,"PED","Walk_DoorPartial",4.1,1,1,1,1,1,1);
}else if(aationplayed == 267) {
ApplyAnimation(playerid,"PED","WALK_drunk",4.1,1,1,1,1,1,1);
}else if(aationplayed == 268) {
ApplyAnimation(playerid,"PED","WALK_fat",4.1,1,1,1,1,1,1);
}else if(aationplayed == 269) {
ApplyAnimation(playerid,"PED","WALK_fatold",4.1,1,1,1,1,1,1);
}else if(aationplayed == 270) {
ApplyAnimation(playerid,"PED","WALK_gang1",4.1,1,1,1,1,1,1);
}else if(aationplayed == 271) {
ApplyAnimation(playerid,"PED","WALK_gang2",4.1,1,1,1,1,1,1);
}else if(aationplayed == 272) {
ApplyAnimation(playerid,"PED","WALK_old",4.1,1,1,1,1,1,1);
}else if(aationplayed == 273) {
ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,1,1);
}else if(aationplayed == 274) {
ApplyAnimation(playerid,"PED","WALK_rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 275) {
ApplyAnimation(playerid,"PED","WALK_shuffle",4.1,1,1,1,1,1,1);
}else if(aationplayed == 276) {
ApplyAnimation(playerid,"PED","WALK_start",4.1,1,1,1,1,1,1);
}else if(aationplayed == 277) {
ApplyAnimation(playerid,"PED","WALK_start_armed",4.1,1,1,1,1,1,1);
}else if(aationplayed == 278) {
ApplyAnimation(playerid,"PED","WALK_start_csaw",4.1,1,1,1,1,1,1);
}else if(aationplayed == 279) {
ApplyAnimation(playerid,"PED","WALK_start_rocket",4.1,1,1,1,1,1,1);
}else if(aationplayed == 280) {
ApplyAnimation(playerid,"PED","Walk_Wuzi",4.1,1,1,1,1,1,1);
}else if(aationplayed == 281) {
ApplyAnimation(playerid,"PED","WEAPON_crouch",4.1,1,1,1,1,1,1);
}else if(aationplayed == 282) {
ApplyAnimation(playerid,"PED","woman_idlestance",4.1,1,1,1,1,1,1);
}else if(aationplayed == 283) {
ApplyAnimation(playerid,"PED","woman_run",4.1,1,1,1,1,1,1);
}else if(aationplayed == 284) {
ApplyAnimation(playerid,"PED","WOMAN_runbusy",4.1,1,1,1,1,1,1);
}else if(aationplayed == 285) {
ApplyAnimation(playerid,"PED","WOMAN_runfatold",4.1,1,1,1,1,1,1);
}else if(aationplayed == 286) {
ApplyAnimation(playerid,"PED","woman_runpanic",4.1,1,1,1,1,1,1);
}else if(aationplayed == 287) {
ApplyAnimation(playerid,"PED","WOMAN_runsexy",4.1,1,1,1,1,1,1);
}else if(aationplayed == 288) {
ApplyAnimation(playerid,"PED","WOMAN_walkbusy",4.1,1,1,1,1,1,1);
}else if(aationplayed == 289) {
ApplyAnimation(playerid,"PED","WOMAN_walkfatold",4.1,1,1,1,1,1,1);
}else if(aationplayed == 290) {
ApplyAnimation(playerid,"PED","WOMAN_walknorm",4.1,1,1,1,1,1,1);
}else if(aationplayed == 291) {
ApplyAnimation(playerid,"PED","WOMAN_walkold",4.1,1,1,1,1,1,1);
}else if(aationplayed == 292) {
ApplyAnimation(playerid,"PED","WOMAN_walkpro",4.1,1,1,1,1,1,1);
}else if(aationplayed == 293) {
ApplyAnimation(playerid,"PED","WOMAN_walksexy",4.1,1,1,1,1,1,1);
}else if(aationplayed == 294) {
ApplyAnimation(playerid,"PED","WOMAN_walkshop",4.1,1,1,1,1,1,1);
}else if(aationplayed == 295) {
ApplyAnimation(playerid,"PED","XPRESSscratch",4.1,1,1,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/dance", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Write /dance [1-4]");
return 1;
}
aationplayed = strval(tmp);
if(aationplayed < 1 || aationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Write /dance [1-4]");
return 1;
}
if(aationplayed == 1) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
} else if(aationplayed == 2) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
} else if(aationplayed == 3) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
} else if(aationplayed == 4) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
}
return 1;
}
}
return 0;
}

public ApplyAnimationForPlayer(playerid, animcommand[])
return OnPlayerCommandText(playerid, animcommand);

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

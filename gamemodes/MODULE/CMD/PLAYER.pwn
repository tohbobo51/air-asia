//-------------[ Player Commands ]-------------//
CMD:jenter(playerid, params[])
{
	new vidxn = GetPlayerVehicleID(playerid);
	if(vidxn == 0)
	{
		new cVehex = GetClosestVehicle(playerid);
		new Float:Pos[3];
		GetVehiclePos(cVehex, Pos[0], Pos[1], Pos[2]);

		if(GetVehicleModel(cVehex) == 508 && IsPlayerInRangeOfPoint(playerid, 10.0, Pos[0], Pos[1], Pos[2]))
		{
		//	if(Locked{cVehex}) return SysMsg(playerid, "This Journey is locked.");
		//	SetPlayerPos(playerid, 2216.6523, -465.2169, 1023.7059, 0.0, 1, cVehex);
			SetPlayerPos(playerid, 2216.6523, -465.2169, 1023.7059);
			SetPlayerVirtualWorld(playerid, cVehex);
			JourneyInterior[playerid] = cVehex;
			return true;
		}
	}
	return true;
}

CMD:panel(playerid, params[])
{
	TextDrawShowForPlayer(playerid, PublicTD[0]);
	TextDrawShowForPlayer(playerid, PublicTD[1]);
	TextDrawShowForPlayer(playerid, PublicTD[2]);
	TextDrawShowForPlayer(playerid, PublicTD[3]);
	TextDrawShowForPlayer(playerid, PublicTD[4]);
	TextDrawShowForPlayer(playerid, PublicTD[5]);
	TextDrawShowForPlayer(playerid, PublicTD[6]);
	TextDrawShowForPlayer(playerid, PublicTD[7]);
	TextDrawShowForPlayer(playerid, PublicTD[8]);
	TextDrawShowForPlayer(playerid, PublicTD[9]);
	TextDrawShowForPlayer(playerid, PublicTD[10]);
	TextDrawShowForPlayer(playerid, PublicTD[11]);
	TextDrawShowForPlayer(playerid, PublicTD[12]);
	TextDrawShowForPlayer(playerid, PublicTD[13]);
	SelectTextDraw(playerid, 0xFF0000FF);
}

CMD:vmenu(playerid, params[])
{
	TextDrawShowForPlayer(playerid, PanelV[0]);
	TextDrawShowForPlayer(playerid, PanelV[1]);
	TextDrawShowForPlayer(playerid, PanelV[2]);
	TextDrawShowForPlayer(playerid, Mesin);
	TextDrawShowForPlayer(playerid, Kunci);
	TextDrawShowForPlayer(playerid, BEnsin);
	TextDrawShowForPlayer(playerid, Lampu);
	TextDrawShowForPlayer(playerid, Kap);
	TextDrawShowForPlayer(playerid, Bagasi);
	TextDrawShowForPlayer(playerid, Tutup);
	TextDrawShowForPlayer(playerid, PanelV[3]);
	TextDrawShowForPlayer(playerid, PanelV[4]);
	TextDrawShowForPlayer(playerid, PanelV[5]);
	TextDrawShowForPlayer(playerid, PanelV[6]);
	TextDrawShowForPlayer(playerid, PanelV[7]);
	TextDrawShowForPlayer(playerid, PanelV[8]);
	TextDrawShowForPlayer(playerid, PanelV[9]);
	SelectTextDraw(playerid, 0xFF0000FF);
}

CMD:small(playerid, params[])
{
	SetPlayerPosition(playerid, -19.521842, -460.525390, -31.564277);
	return 1;
}
CMD:high(playerid, params[])
{
	SetPlayerPosition(playerid, 1020.812683, -1507.484008, -18.35042);
	return 1;
}
CMD:medium(playerid, params[])
{
	SetPlayerPosition(playerid, 1315.175537, 743.258789, 1057.793212);
	return 1;
}

CMD:i(playerid, params[])
{
	Inventory_Show(playerid);
	return 1;
}

CMD:testprog(playerid, params[])
{
	ShowProgressbar(playerid, "Subscribe..", 10);
	return 1;
}

CMD:fixvisu(playerid, params[])
{
   SetPlayerInterior(playerid, 0);
   SetPlayerVirtualWorld(playerid, 0);
   InfoMsg(playerid, "Visual Anda Telah Kembali Normal Cihuyyy");
   return 1;
}

CMD:v(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_VOICE, DIALOG_STYLE_LIST, "{878787}Asia Pride Roleplay{ffffff} | Voice Settings", "Berbisik\nNormal\nTeriak", "Pilih", "Kembali");
	return 1;
}
//CMD:voice(playerid, params[])
//{
//	ShowPlayerDialog(playerid, DIALOG_VOICE, DIALOG_STYLE_LIST, "{878787}Voice Settings {ffffff}/{878787}/ {ffffff}Astera", "Berbisik\t(5 Meter)\nNormal\t(15 meter)\nTeriak\t(35 Meter)", "Pilih", "Kembali");
//	return 1;
//}

CMD:ph(playerid, params[])
{
    for(new i = 0; i < 21; i++)
	{
		TextDrawShowForPlayer(playerid, PhoneTD[i]);
	}
	for(new i = 0; i < 13; i++)
	{
		TextDrawShowForPlayer(playerid, APKNAME[i]);
	}
	for(new i = 0; i < 13; i++)
	{
		TextDrawShowForPlayer(playerid, SpawnTD[i]);
	}
	TextDrawShowForPlayer(playerid, GPS);
	TextDrawShowForPlayer(playerid, KONTAKTD);
	TextDrawShowForPlayer(playerid, AIRDROP);
	TextDrawShowForPlayer(playerid, GOJEK);
	TextDrawShowForPlayer(playerid, MBANKING);
	TextDrawShowForPlayer(playerid, TWITTER);
	TextDrawShowForPlayer(playerid, DARKWEB);
	TextDrawShowForPlayer(playerid, PLAYSTORE);
	TextDrawShowForPlayer(playerid, WHATSAPP);
	TextDrawShowForPlayer(playerid, CALL);
	TextDrawShowForPlayer(playerid, MUSIC);
	TextDrawShowForPlayer(playerid, SETTINGS);
	TextDrawShowForPlayer(playerid, KAMERA);
	TextDrawShowForPlayer(playerid, TUTUPHP);
	TextDrawShowForPlayer(playerid, JAMTD);
    SelectTextDraw(playerid, 0xFF0000FF);
    return 1;
}

CMD:cursor(playerid, params[])
{
	SelectTextDraw(playerid, COLOR_LBLUE);
	return 1;
}

CMD:getmodal(playerid, params[])
{
 	if(pData[playerid][pStarterpack] == 1) return Error(playerid, "Anda sudah pernah mengambil sebelumnya");
	GivePlayerMoneyEx(playerid, 500000);
	pData[playerid][pSnack] += 10;
	pData[playerid][pSprunk] += 10;
	InfoTD_MSG(playerid, 7000, "~g~Money +500,000, Snack +10, Sprunk +10");
	pData[playerid][pStarterpack] = 1;
	return 1;
}

CMD:reviveme(playerid, params[])
{

	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/revive [playerid/PartOfName]");

    if(!IsPlayerConnected(otherid))
        return Error(playerid, "Player belum masuk!");

    if(!pData[otherid][pInjured])
        return Error(playerid, "Tidak bisa revive karena tidak injured.");

	if(otherid == playerid)
        return Error(playerid, "Tidak bisa revive kedirimu sendiri.");

    if(!IsPlayerConnected(otherid) || !NearPlayer(playerid, otherid, 4.0))
        return Error(playerid, "Player disconnect atau tidak berada didekat anda.");

    if(pData[playerid][pMedicine] < 1)
    	return Error(playerid, "Tidak dapat Revive karena anda tidak memiliki Obat");

    TogglePlayerControllable(playerid, 0);
    pData[playerid][pMedicine] -= 1;
    pData[otherid][pInjured] = 0;
    pData[otherid][pHospital] = 0;
    pData[otherid][pSick] = 0;
    pData[otherid][pHead] = 100;
    pData[otherid][pPerut] = 100;
    pData[otherid][pRHand] = 100;
    pData[otherid][pLHand] = 100;
    pData[otherid][pRFoot] = 100;
    pData[otherid][pLFoot] = 100;
    SetPlayerSpecialAction(otherid, SPECIAL_ACTION_NONE);
    ClearAnimations(otherid);
	DestroyDynamic3DTextLabel(pData[otherid][pInjuredLabel]);
    TogglePlayerControllable(otherid, 1);
    SetPVarInt(playerid, "gcPlayer", otherid);
    SetPlayerHealthEx(otherid, 100.0);
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s menyembuhkan segala luka %s.", ReturnName(playerid), ReturnName(otherid));
    Info(otherid, "%s has revived you.", pData[playerid][pAdminname]);
    return TogglePlayerControllable(playerid, 1);
}

CMD:getcord(playerid)
{
	new Float: pX,
		Float: pY,
		Float: pZ,
		Float: pA;

	new cord[100];
	GetPlayerPos(playerid, pX, pY, pZ);
	GetPlayerFacingAngle(playerid, pA);
	format(cord, sizeof cord, "Koordinat : X : %f Y : %f Z : %f A : %f", pX, pY, pZ, pA);
	SendClientMessage(playerid, -1, cord);
	printf(cord);
	return 1;
}

CMD:jexit(playerid)
{
	
	if(JourneyInterior[playerid] > 0)
	{
		new seatavailable = 1;
		foreach(new pl: Player)
		{
			if(GetPlayerVehicleID(pl) == JourneyInterior[playerid] && GetPlayerState(pl) == PLAYER_STATE_PASSENGER)
			{
				seatavailable = 0;
			}
		}

		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(JourneyInterior[playerid]));

		if(seatavailable == 0)
		{
			new Float:sPos[3];
			GetVehiclePos(JourneyInterior[playerid], sPos[0], sPos[1], sPos[2]);
			SetPlayerPos(playerid, sPos[0]+2.0, sPos[1]+2.0, sPos[2]);
		}
		else PutPlayerInVehicle(playerid, JourneyInterior[playerid], 1);

		JourneyInterior[playerid] = 0;
		return true;
	}
	return true;
}



forward Float:GetXYInFrontOfPlayer(playerid, &Float:X, &Float:Y, Float:distance);
CMD:campfire(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) return Servers(playerid, "{FFFFFF}You cannot use this command in a vehicle.");
	if(CampfirePlaced[playerid] == INVALID_OBJECT_ID)
	{
		if(GetPlayerInterior(playerid) != 0 && GetPlayerVirtualWorld(playerid) != 0) return Servers(playerid, "{FFFFFF}You can only create campfires outdoors.");

		new Float:x, Float:y, Float:z;
		foreach(new i: Player)
		{
			if(CampfirePlaced[i] != INVALID_OBJECT_ID)
			{
				GetDynamicObjectPos(CampfirePlaced[i], x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z)) return Servers(playerid, "{FFFFFF}You are too close to a separate campfire.");
			}
		}

		new Float:a;
		GetPlayerPos(playerid, x, y, z);
		a = GetXYInFrontOfPlayer(playerid, x, y, 1.0);

		CampfirePlaced[playerid] = CreateDynamicObject(19632, x, y, z - 1.0, 0, 0, a);

		ApplyAnimation(playerid, "CARRY", "putdwn", 4,0,0,0,0,0);
		return true;
	}
	else
	{
		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(CampfirePlaced[playerid], x, y, z);
		if(!IsPlayerInRangeOfPoint(playerid, 10.0, x, y, z)) return Servers(playerid, "{FFFFFF}You are not near your campfire.");

		DestroyDynamicObject(CampfirePlaced[playerid]);
		CampfirePlaced[playerid] = INVALID_OBJECT_ID;

		ApplyAnimation(playerid, "CARRY", "liftup", 4,0,0,0,0,0);
		return true;
	}
}
CMD:camp(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) return Servers(playerid, "{FFFFFF}You cannot use this command in a vehicle.");
	if(CampPlaced[playerid] == INVALID_OBJECT_ID)
	{
		if(GetPlayerInterior(playerid) != 0 && GetPlayerVirtualWorld(playerid) != 0) return Servers(playerid, "{FFFFFF}You can only create camp outdoors.");

		new Float:x, Float:y, Float:z, Float:POS[3];
		foreach(new i: Player)
		{
			if(CampPlaced[i] != INVALID_OBJECT_ID)
			{
				GetDynamicObjectPos(CampPlaced[i], x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z)) return Servers(playerid, "{FFFFFF}You are too close to a separate camp.");
			}
		}

		new Float:a;
		GetPlayerPos(playerid, x, y, z);
		a = GetXYInFrontOfPlayer(playerid, x, y, 1.0);

		CampPlaced[playerid] = CreateDynamicObject(3243, x, y, z - 1.0, 0, 0, a);

		ApplyAnimation(playerid, "CARRY", "putdwn", 4,0,0,0,0,0);
		GetPlayerPos(playerid, POS[0], POS[1], POS[2]);
		SetPlayerPos(playerid, POS[0], POS[1], POS[2] + 10.0);
		return true;
	}
	else
	{
		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(CampPlaced[playerid], x, y, z);
		if(!IsPlayerInRangeOfPoint(playerid, 10.0, x, y, z)) return Servers(playerid, "{FFFFFF}You are not near your camp.");

		DestroyDynamicObject(CampPlaced[playerid]);
		CampPlaced[playerid] = INVALID_OBJECT_ID;

		ApplyAnimation(playerid, "CARRY", "liftup", 4,0,0,0,0,0);
		return true;
	}

}
public Float:GetXYInFrontOfPlayer(playerid, &Float:X, &Float:Y, Float:distance)
{
	new Float:A;
	GetPlayerPos(playerid, X, Y, A);

	if(IsPlayerInAnyVehicle(playerid)) GetVehicleZAngle(GetPlayerVehicleID(playerid), A);
	else GetPlayerFacingAngle(playerid, A);

	X += (distance * floatsin(-A, degrees));
	Y += (distance * floatcos(-A, degrees));

	return A;
}
CMD:maxobject(playerid)
{
    new str[155];
    strcat(str, "Setting\tObject Limit\tMultiplier\n");
    strcat(str, GREEN_E"Potato\t400\t0.6\n");
    strcat(str, GREY_E"Low\t500\t0.8\n");
    strcat(str, WHITE_E"Normal\t700\t1.0\n");
    strcat(str, ORANGE_E"High\t800\t1.5\n");
    strcat(str, RED_E"Stonks\t950\t2.0");
    ShowPlayerDialog(playerid, DIALOG_STREAMER, DIALOG_STYLE_TABLIST_HEADERS, "Object Streamer Settings", str, "Set", "Cancel");
    return 1;
}
CMD:help(playerid, params[])
{
	new str[512], info[512];
	format(str, sizeof(str), "Account Commands\nGeneral Commands\nVehicle Commands\nJob Commands\nFaction Commands\nBusiness Commands\nHouse Commands\nWorkshop Commands\nVending Commands\nAuto RP\nDonate\nServer Credits\n");
	strcat(info, str);
	if(pData[playerid][pRobLeader] > 1 || pData[playerid][pMemberRob] > 1)
	{
		format(str, sizeof(str), "Robbery Help");
		strcat(info, str);	
	}
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help Menu", info, "Select", "Close");
	return 1;
}
/*CMD:destroycp(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(pData[playerid][pSideJob] > 1 || pData[playerid][pCP] > 1)
		return Error(playerid, "Harap selesaikan Pekerjaan mu terlebih dahulu");

	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	Servers(playerid, "Menghapus Checkpoint Sukses");
	return 1;
}*/
CMD:setbpjs(playerid, params[])
{

    if(pData[playerid][pFaction] != 3)
        return ErrorMsg(playerid, "You must be part of a medical faction.");
	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/givebpjs [playerid/PartOfName]");

    if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pBpjs] != 0) return Error(playerid, "Orang ini sudah mempunyai BPJS");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat BPJS %s", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 15 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda mendapatkan surat	BPJS dari departemen rumah sakit");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan Surat BPJS Kepada %s", ReturnName(playerid), ReturnName(to_player));
	pData[to_player][pBpjs] = 1;
	pData[to_player][pBpjsTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan Surat BPJS kepada %s", ReturnName(to_player));

    return 1;
}

CMD:fixme(playerid)
{
    ShowPlayerDialog(playerid, 1588, DIALOG_STYLE_LIST, "Perbaikan Karakter", "Perbaikan Visual\nPerbaikan Visual Abu-Abu\nPerbaikan Visual Exterior\nPerbaikan Slot", "Pilih", "Tutup");
    return 1;
}

CMD:togph(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Setting", "Phone On\nPhone Off", "Select", "Back");
	return 1;
}

CMD:setskck(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return ErrorMsg(playerid, "You not police officer.");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/giveskck [playerid/PartOfName]");
	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pSkck] != 0) return Error(playerid, "Orang ini sudah mempunyai SKCK");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat SKCK", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 15 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda mendapatkan surat SKCK dari departemen kepolisian");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan Surat SKCK Kepada %s", ReturnName(playerid), ReturnName(to_player));
	pData[to_player][pSkck] = 1;
	pData[to_player][pSkckTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan Surat SKCK kepada %s", ReturnName(to_player));
	//GivePlayerMoneyEx(playerid, -50);
	//Server_AddMoney(25);
	return 1;
}

CMD:setpenebang(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return ErrorMsg(playerid, "Kamu bukan anggota sapd.");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/givepenebang [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pPenebangs] != 0) return Error(playerid, "Orang ini sudah mempunyai Lic Penebang");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat Penebang %s", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 30 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda Mendapatkan License Penebang dari Departemen kepolisian");
	pData[to_player][pPenebangs] = 1;
	pData[to_player][pPenebangsTime] = gettime() +  (30 * 86400);
	Info(playerid, "Anda Telah Memberikan License Penebang Kepada %s", ReturnName(to_player));
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan License Penebang Kepada %s", ReturnName(playerid), ReturnName(to_player));
	//GivePlayerMoneyEx(playerid, -50);
	//Server_AddMoney(25);
	return 1;
}

CMD:licbiz(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return ErrorMsg(playerid, "Anda tidak memiliki Business Lic!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Business-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pLicBizTime]));
	return 1;
}

CMD:showskck(playerid, params[])
{
    if(!pData[playerid][pSkck])
	 	return ErrorMsg(playerid, "Anda Tidak Memiliki SKCK");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showskck [playerid/PartOfName]");
	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "Surat SKCK %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pSkckTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan Surat SKCK Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}

CMD:showpenebang(playerid, params[])
{
    if(!pData[playerid][pPenebangs])
	 	return ErrorMsg(playerid, "Anda Tidak Memiliki License Penebang");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showpenebang [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "License Penebang Milik %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pPenebangsTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan License Penebang Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}

CMD:showbpjs(playerid, params[])
{
    if(!pData[playerid][pBpjs])
	 	return ErrorMsg(playerid, "Anda Tidak Memiliki License Penebang");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showbpjs [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat BPJS %s %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pBpjsTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan BPJS Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}


CMD:dcp(playerid)
{
    if(pData[playerid][pSideJob] > 1 || pData[playerid][pCP] > 1)
		return ErrorMsg(playerid, "Harap selesaikan Pekerjaan mu terlebih dahulu");
		
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	Servers(playerid, "Menghapus Checkpoint Sukses");
	return 1;
}
CMD:credits(playerid)
{
	new line1[1200], line2[300], line3[500];
	strcat(line3, ""LB_E"Owner: "WHITE_E"Seo Cherly\n");
	strcat(line3, ""LB_E"Support Developer: "WHITE_E"Seo\n");
	strcat(line3, ""LB_E"Support Website: "WHITE_E"All Administrator / Helper\n");
	format(line2, sizeof(line2), ""LB_E"Server Support: "WHITE_E"%s & All SA-MP Team\n\n\
	"GREEN_E"Terima kasih telah bergabung dengan kami! Copyright © 2024 | Asia Pride Roleplay.", pData[playerid][pName]);
	format(line1, sizeof(line1), "%s%s", line3, line2);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"GL:RP: "WHITE_E"Server Credits", line1, "OK", "");
	return 1;
}

CMD:email(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return ErrorMsg(playerid, "Kamu harus login!");

	ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""WHITE_E"Set Email", ""WHITE_E"Masukkan Email.\nIni akan digunakan sebagai ganti kata sandi.\n\n"RED_E"* "WHITE_E"Email mu tidak akan termunculkan untuk Publik\n"RED_E"* "WHITE_E"Email hanya berguna untuk verifikasi Password yang terlupakan dan berita lainnya\n\
	"RED_E"* "WHITE_E"Be sure to double-check and enter a valid email address!", "Enter", "Exit");
	return 1;
}

CMD:changepass(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
	return ErrorMsg(playerid, "Fitur ini telah dinonaktifkan oleh server!");
	return 1;
}

CMD:savestats(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return ErrorMsg(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(pData[playerid][IsLoggedIn] == false)
		return ErrorMsg(playerid, "Kamu belum login!");
		
	UpdatePlayerData(playerid);
	Servers(playerid, "Statistik Anda sukses disimpan kedalam Database!");
	return 1;
}

CMD:gshop(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return ErrorMsg(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Gold Shop\tPrice\n\
	Instant Change Name\t1000 Gold\n");
	format(Dstring, sizeof(Dstring), "%sClear Warning\t1000 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 1(7 Days)\t150 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 2(7 Days)\t250 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 3(7 Days)\t500 Gold\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_GOLDSHOP, DIALOG_STYLE_TABLIST_HEADERS, "Gold Shop", Dstring, "Buy", "Cancel");
	return 1;
}

CMD:mypos(playerid, params[])
{
	new int, Float:px,Float:py,Float:pz, Float:a;
	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, a);
	int = GetPlayerInterior(playerid);
	new zone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, zone, sizeof(zone));
	SendClientMessageEx(playerid, COLOR_WHITE, "Lokasi Anda Saat Ini: %s (%0.2f, %0.2f, %0.2f, %0.2f) Int = %d", zone, px, py, pz, a, int);
	return 1;
}

CMD:gps(playerid, params[])
{
	//if(pData[playerid][pGPS] < 0);
	ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS Menu", "Disable GPS\nLokasi Umum\nLokasi Publik\nPekerjaan\nProperti Saya\nMisi Saya", "Select", "Close");
	return 1;
}

CMD:belirokok(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Tempat Pembelian");
    pData[playerid][pRokok] += 1;
    ShowItemBox(playerid, "Rokok", "ADD_1x", 19897, 3);
    
    
    GivePlayerMoneyEx(playerid, -5000);
    InfoMsg(playerid, "Anda Membeli Rokok Dengan Harga Rp.5.000");
    return 1;
}

CMD:beliperban(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Pembelian Rokok");
    pData[playerid][pBandage] += 1;
    ShowItemBox(playerid, "Perban", "ADD_1x", 11738, 1);
    
    
    GivePlayerMoneyEx(playerid, -50000);
    InfoMsg(playerid, "Anda Membeli Perban Dengan Harga Rp.50.000");
    return 1;
}

CMD:belibensin(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Pembelian Rokok");
    pData[playerid][pGas] += 1;
    ShowItemBox(playerid, "Bensin", "ADD_1x", 1650, 1);
    
    
    GivePlayerMoneyEx(playerid, -25000);
    InfoMsg(playerid, "Anda Membeli Perban Dengan Harga Rp.25.000");
    return 1;
}

CMD:belitiket(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Pembelian Rokok");
    pData[playerid][pTikettol] += 1;
    ShowItemBox(playerid, "Tikettol", "ADD_1x", 1581, 1);
    
    
    GivePlayerMoneyEx(playerid, -5000);
    InfoMsg(playerid, "Anda Membeli Perban Dengan Harga Rp.5.000");
    return 1;
}

CMD:belisusu(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Tempat Pembelian");
    pData[playerid][pSusu] += 1;
    ShowItemBox(playerid, "Susu", "ADD_1x", 19570, 1);
    
    
    GivePlayerMoneyEx(playerid, -10000);
    InfoMsg(playerid, "Anda Membeli Susu Dengan Harga Rp.10.000");
    return 1;
}

CMD:belimedicine(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.5, -614.179,-546.02,25.7234)) return ErrorMsg(playerid, "Kamu Tidak Berada Di Pembelian Rokok");
    pData[playerid][pMedicine] += 1;
    ShowItemBox(playerid, "Medicine", "ADD_1x", 11736, 1);
    
    
    GivePlayerMoneyEx(playerid, -500000);
    InfoMsg(playerid, "Anda Membeli Medicine Dengan Harga Rp.500.000");
    return 1;
}

CMD:death(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return ErrorMsg(playerid, "Kamu belum injured.");
		
	if(pData[playerid][pJail] > 0)
		return ErrorMsg(playerid, "Kamu tidak bisa menggunakan ini saat diJail!");
		
	if(pData[playerid][pArrest] > 0)
		return ErrorMsg(playerid, "Kamu tidak bisa melakukan ini saat tertangkap polisi!");

    if((gettime()-GetPVarInt(playerid, "GiveUptime")) < 100)
        return ErrorMsg(playerid, "Kamu harus menunggu 3 menit untuk kembali kerumah sakit");
        
	/*if(pMatiPukul[playerid] == 1)
	{
	    SetPlayerHealthEx(playerid, 50.0);
	    ClearAnimations(playerid);
	    pData[playerid][pInjured] = 0;
	    pMatiPukul[playerid] = 0;
    	Servers(playerid, "You have wake up and accepted death in your position.");
    	return 1;
	}*/
    Servers(playerid, "Kamu telah terbangun dari pingsan.");
	pData[playerid][pHospitalTime] = 0;
	pData[playerid][pHospital] = 1;
    return 1;
}

/*CMD:piss(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

    if(pData[playerid][pInjured] == 1)
        return Error(playerid, "Kamu tidak bisa melakukan ini disaat yang tidak tepat!");
        
	new time = (100 - pData[playerid][pBladder]) * (300);
    SetTimerEx("UnfreezePee", time, 0, "i", playerid);
    SetPlayerSpecialAction(playerid, 68);
    return 1;
}*/

CMD:health(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return ErrorMsg(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new hstring[512], info[512];
	new hh = pData[playerid][pHead];
	new hp = pData[playerid][pPerut];
	new htk = pData[playerid][pRHand];
	new htka = pData[playerid][pLHand];
	new hkk = pData[playerid][pRFoot];
	new hkka = pData[playerid][pLFoot];
	format(hstring, sizeof(hstring),"Bagian Tubuh\tKondisi\n{ffffff}Kepala\t{7fffd4}%d.0%\n{ffffff}Perut\t{7fffd4}%d.0%\n{ffffff}Tangan Kanan\t{7fffd4}%d.0%\n{ffffff}Tangan Kiri\t{7fffd4}%d.0%\n",hh,hp,htk,htka);
	strcat(info, hstring);
    format(hstring, sizeof(hstring),"{ffffff}Kaki Kanan\t{7fffd4}%d.0%\n{ffffff}Kaki Kiri\t{7fffd4}%d.0%\n",hkk,hkka);
    strcat(info, hstring);
    ShowPlayerDialog(playerid, DIALOG_HEALTH, DIALOG_STYLE_TABLIST_HEADERS,"Health Condition",info,"Oke","");
    return 1;
}

CMD:sleep(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(pData[playerid][pInjured] == 1)
        return Error(playerid, "Kamu tidak bisa melakukan ini disaat yang tidak tepat!");
	
	if(pData[playerid][pInHouse] == -1)
		return ErrorMsg(playerid, "Kamu tidak berada didalam rumah.");
	
	InfoTD_MSG(playerid, 10000, "Sleeping... Harap Tunggu");
	TogglePlayerControllable(playerid, 0);
	new time = (100 - pData[playerid][pEnergy]) * (400);
    SetTimerEx("UnfreezeSleep", time, 0, "i", playerid);
	switch(random(6))
	{
		case 0: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_L",4.1,0,0,0,1,1);
		case 1: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R",4.1,0,0,0,1,1);
		case 2: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_L",4.1,1,0,0,1,1);
		case 3: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_R",4.1,1,0,0,1,1);
		case 4: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_L",4.1,0,1,1,0,0);
		case 5: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_R",4.1,0,1,1,0,0);
	}
	return 1;
}

/*CMD:salary(playerid, params[])
{
	new query[256], count;
	format(query, sizeof(query), "SELECT * FROM salary WHERE owner='%d'", pData[playerid][pID]);
	new Cache:result = mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new str[2048];
		for(new i; i < rows; i++)
		{
			new info[64];
			cache_get_value_int(i, "id", pSalary[playerid][i][salaryId]);
			cache_get_value_int(i, "money", pSalary[playerid][i][salaryMoney]);
			cache_get_value(i, "info", info);
			format(pSalary[playerid][i][salaryInfo], 64, "%s", info);
			cache_get_value_int(i, "date", pSalary[playerid][i][salaryDate]);
			
			format(str, sizeof(str), "%s%s\t%s\t%s\n", str, ReturnDate(pSalary[playerid][i][salaryDate]), pSalary[playerid][i][salaryInfo], FormatMoney(pSalary[playerid][i][salaryMoney]));
			count++;
			if(count >= 10) break;
		}
		format(str, sizeof(str), "Date\tInfo\tCash\n", str);
		if(count >= 10)
		{
			format(str, sizeof(str), "%s\nNext >>>", str);
		}
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Salary Details", str, "Close", "");
	}
	else 
	{
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Notice", "Kamu tidak memiliki salary saat ini!", "Ok", "");
	}
	cache_delete(result);
	return 1;
}*/

CMD:en(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{	
		if(!IsEngineVehicle(vehicleid))
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");
		
		if(GetEngineStatus(vehicleid))
		{
			EngineStatus(playerid, vehicleid);
		}
		else
		{
			//Info(playerid, "Anda mencoba menyalakan mesin kendaraan..");
			//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencoba menghidupkan mesin kendaraan %s.", ReturnName(playerid, 0), GetVehicleNameByVehicle(GetPlayerVehicleID(playerid)));
			InfoTD_MSG(playerid, 4000, "Start Engine...");
			SetTimerEx("EngineStatus", 3000, false, "id", playerid, vehicleid);
		}
	}
	else return Error(playerid, "Anda harus mengendarai kendaraan!");
	return 1;
}

CMD:light(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{	
		if(!IsEngineVehicle(vehicleid))
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");
		
		switch(GetLightStatus(vehicleid))
		{
			case false:
			{
				SwitchVehicleLight(vehicleid, true);
			}
			case true:
			{
				SwitchVehicleLight(vehicleid, false);
			}
		}
	}
	else return Error(playerid, "Anda harus mengendarai kendaraan!");
	return 1;
}

CMD:hood(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid)) 
		return Error(playerid, "Kamu harus keluar dari kendaraan.");

    new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);

    if(vehicleid == INVALID_VEHICLE_ID)
       	return Error(playerid, "Kamu tidak berada didekat Kendaraan apapun.");

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    switch (GetHoodStatus(vehicleid))
    {
     	case false:
      	{
      		SwitchVehicleBonnet(vehicleid, true);
       		InfoTD_MSG(playerid, 4000, "Vehicle Hood ~g~OPEN");
       	}
       	case true:
       	{
       		SwitchVehicleBonnet(vehicleid, false);
       		InfoTD_MSG(playerid, 4000, "Vehicle Hood ~r~CLOSED");
       	}
    }
	return 1;
}
CMD:trunk(playerid, params[])
{
   	if(IsPlayerInAnyVehicle(playerid)) return Error(playerid, "Kamu harus keluar dari kendaraan.");

   	new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);

   	if(vehicleid == INVALID_VEHICLE_ID)
   		return Error(playerid, "Kamu tidak berada didekat Kendaraan apapun.");

   	switch (GetTrunkStatus(vehicleid))
   	{
   		case false:
   		{
   			SwitchVehicleBoot(vehicleid, true);
   			InfoTD_MSG(playerid, 4000, "Vehicle Bagasi ~g~OPEN");
   		}
   		case true:
   		{
   			SwitchVehicleBoot(vehicleid, false);
   			InfoTD_MSG(playerid, 4000, "Vehicle Bagasi ~g~OPEN");
   		}
   	}
	return 1;
}
CMD:lock(playerid, params[])
{
	static
		carid = -1;

	if((carid = Vehicle_Nearest(playerid)) != -1)
	{
		if(Vehicle_IsOwner(playerid, carid))
		{
    		if(!pvData[carid][cLocked])
    		{
    			pvData[carid][cLocked] = 1;

				new Float:X, Float:Y, Float:Z;
				GameTextForPlayer(playerid, "~r~TERKUNCI", 3000, 3);
				GetPlayerPos(playerid, X, Y, Z);

				SwitchVehicleDoors(pvData[carid][cVeh], true);
			}
			else
			{
				pvData[carid][cLocked] = 0;
				new Float:X, Float:Y, Float:Z;
				GameTextForPlayer(playerid, "~g~TERBUKA", 3000, 3);
				GetPlayerPos(playerid, X, Y, Z);

				SwitchVehicleDoors(pvData[carid][cVeh], false);
			}
		}
			//else SendErrorMessage(playerid, "You are not in range of anything you can lock.");
	}
	else Error(playerid, "Kamu tidak berada didekat Kendaraan apapun yang ingin anda kunci.");
	return 1;
}

CMD:drivelic(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return Error(playerid, "Anda tidak memiliki Driving License/SIM!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Drive-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
	return 1;
}

CMD:newidcard(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1083.47, -1771.3, 13.9284)) return Error(playerid, "Anda harus berada di Balai Kota!");
	if(pData[playerid][pIDCard] != 0) return Error(playerid, "Anda sudah memiliki ID Card!");
	if(GetPlayerMoney(playerid) < 0) return Error(playerid, "Anda butuh RP.1 untuk membuat ID Card");
	new sext[40], mstr[128];
	if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 30 hari!", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "ID-Card", mstr, "Tutup", "");
	pData[playerid][pIDCard] = 1;
	pData[playerid][pIDCardTime] = gettime() + (30 * 86400);
	GivePlayerMoneyEx(playerid, -0);
	ShowItemBox(playerid, "Ktp", "Received_1x", 1581, 4);
	Server_AddMoney(25);
	return 1;
}

CMD:s(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return Error(playerid, "You are not injured.");

    if(GetPVarInt(playerid, "makes") > gettime())
        return Error(playerid, "Mohon Tunggu 15 menit Untuk Menggunakan kembali.");
        
	new lokasi[MAX_ZONE_NAME];
	GetPlayer2DZone(playerid, lokasi, MAX_ZONE_NAME);
    SendFactionMessage(3, COLOR_PINK2, "[SAMD EMERGENCY KILL] {ffffff}Player %s[%d] ask for help to cure it, location %s", GetRPName(playerid), playerid, lokasi);
    SendFactionMessage(3, COLOR_PINK2, "[INFO] {ffffff}/finddown for search player down");
	InfoMsg(playerid, "Pesan telah terkirim harap bersabar paramedic akan mencari lokasimu!");
   	SetPVarInt(playerid, "makes", gettime() + 900);
    return 1;
}

CMD:payticket(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 85.0160, 1070.5106, -48.9141) && !IsPlayerInRangeOfPoint(playerid, 3.0, -1469.6188, 2600.2039, 19.6310)) return Error(playerid, "Anda harus berada di kantor SAPD!");
	
	new vehid;
	if(sscanf(params, "d", vehid))
		return Usage(playerid, "/payticket [vehid] | /mypv - for find vehid");
		
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");
		
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				new ticket = pvData[i][cTicket];
				
				if(ticket > GetPlayerMoney(playerid))
					return Error(playerid, "Not enough money! check your ticket in /v insu.");
					
				if(ticket > 0)
				{
					GivePlayerMoneyEx(playerid, -ticket);
					pvData[i][cTicket] = 0;
					Info(playerid, "Anda telah berhasil membayar ticket tilang kendaraan %s(id: %d) sebesar "RED_E"%s", GetVehicleName(vehid), vehid, FormatMoney(ticket));
					return 1;
				}
			}
			else return Error(playerid, "Kendaraan ini bukan milik anda! /mypv - for find vehid");
		}
	}
	return 1;
}

CMD:buytikettol(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 4.0, 40.771163, -1529.770751, 5.116502)) return Error(playerid, "Anda harus berada di Tempat pembelian Tiket TOL!");
	
	ShowPlayerDialog(playerid, DIALOG_BUY_TOL, DIALOG_STYLE_LIST, "BUY TIKET TOL", "10 Tiket (Rp.10,000)\n20 Tiket (Rp.20,000)\n50 Tiket (Rp.50,000)", "Buy", "Cancel");
	return 1;
}

CMD:buyinsu(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1324.78, -885.75, 39.57)) return Error(playerid, "Kamu harus berada di Kantor Insurance!");
		
	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/buyinsu [vehid] | /mypv - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID] && pvData[i][cClaim] == 0)
			{
				if(GetPlayerMoney(playerid) < 500000) return Error(playerid, "Anda butuh Rp.500,000 untuk membeli Insurance.");
				GivePlayerMoneyEx(playerid, -500000);
				pvData[i][cInsu]++;
				Info(playerid, "Model: %s || Total Insurance: %d || Insurance Price: Rp.500,000", GetVehicleModelName(pvData[i][cModel]), pvData[i][cInsu]);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /myv untuk mencari ID.");
		}
	}
	return 1;
}

CMD:claimpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1324.78, -885.75, 39.57)) return Error(playerid, "Kamu harus berada di Kantor Insurance!");
	new found = 0;
	foreach(new i : PVehicles)
	{
		if(pvData[i][cClaim] == 1 && pvData[i][cClaimTime] == 0)
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				pvData[i][cClaim] = 0;
				
				OnPlayerVehicleRespawn(i);
				pvData[i][cPosX] = 1320.603515;
				pvData[i][cPosY] = -865.152038;
				pvData[i][cPosZ] = 39.478111;
				pvData[i][cPosA] = 2.5077;
				SetValidVehicleHealth(pvData[i][cVeh], 1500);
				SetVehiclePos(pvData[i][cVeh], 1320.603515, -865.152038, 39.478111);
				SetVehicleZAngle(pvData[i][cVeh], 2.5077);
				SetVehicleFuel(pvData[i][cVeh], 1000);
				ValidRepairVehicle(pvData[i][cVeh]);
				found++;
				InfoMsg(playerid, "Anda telah mengclaim kendaraan anda.", GetVehicleModelName(pvData[i][cModel]));
			}
			//else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /mypv untuk mencari ID.");
		}
	}
	if(found == 0)
	{
		Info(playerid, "Sekarang belum saatnya anda mengclaim kendaraan anda!");
	}
	else
	{
		Info(playerid, "Anda berhasil mengclaim %d kendaraan anda!", found);
	}
	return 1;
}

CMD:sellpv(playerid, params[])
{
	
	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/sellpv [id]");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(!IsValidVehicle(pvData[i][cVeh])) return Error(playerid, "Your vehicle is not spanwed!");
				if(pvData[i][cRent] != 0) return ErrorMsg(playerid, "You can't sell rental vehicle!");
				new pay = pvData[i][cPrice] / 50000;
				GivePlayerMoneyEx(playerid, pay);
				
				Info(playerid, "Anda menjual kendaraan model %s(%d) dengan seharga "LG_E"%s", GetVehicleName(vehid), GetVehicleModel(vehid), FormatMoney(pay));
				new str[150];
				format(str,sizeof(str),"[VEH]: %s menjual kendaraan %s seharga %s!", GetRPName(playerid), GetVehicleName(vehid), FormatMoney(pay));
				LogServer("Property", str);
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[i][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[i][cVeh])) DestroyVehicle(pvData[i][cVeh]);
				pvData[i][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, i, i);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /myv untuk mencari ID.");
		}
	}
	return 1;
}

CMD:newrek(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -36.972934, -1124.334350, 1.078125)) return ErrorMsg(playerid, "Anda harus berada di Bank!");
	if(GetPlayerMoney(playerid) < 500000) return ErrorMsg(playerid, "Not enough money!");
	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	InfoMsg(playerid, "New rekening bank!");
	GivePlayerMoneyEx(playerid, -500000);
	Server_AddMoney(500000);
	return 1;
}

CMD:bank(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -43.692825, -1139.563964, 1.178125)) return Error(playerid, "Anda harus berada di bank point!");
	new tstr[128];
	format(tstr, sizeof(tstr), ""ORANGE_E"No Rek: "LB_E"%d", pData[playerid][pBankRek]);
	ShowPlayerDialog(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, tstr, "Deposit Money\nWithdraw Money\nCheck Balance\nTransfer Money\nSign Paycheck", "Select", "Cancel");
	return 1;
}
/*CMD:bank(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, -43.692825, -1139.563964, 1.178125)) return Error(playerid, "Anda harus berada di bank point!");
    {
		if(pData[playerid][pToggleAtm] == 0)
		{
			pData[playerid][pToggleAtm] = 1;
			new name[32];
			format(name, sizeof(name), "%s", GetRPName(playerid));
			PlayerTextDrawSetString(playerid, BankTD18[playerid], name);
			new cash[3200];
			format(cash, sizeof(cash), "Rp.%s",  FormatMoney(pData[playerid][pBankMoney]));
			PlayerTextDrawSetString(playerid,  BankTD14[playerid], cash);
			PlayerTextDrawShow(playerid, BankTD0[playerid]);
			PlayerTextDrawShow(playerid, BankTD1[playerid]);
			PlayerTextDrawShow(playerid, BankTD2[playerid]);
			PlayerTextDrawShow(playerid, BankTD3[playerid]);
			PlayerTextDrawShow(playerid, BankTD4[playerid]);
			PlayerTextDrawShow(playerid, BankTD5[playerid]);
			PlayerTextDrawShow(playerid, BankTD6[playerid]);
			PlayerTextDrawShow(playerid, BankTD7[playerid]);
			PlayerTextDrawShow(playerid, BankTD8[playerid]);
			PlayerTextDrawShow(playerid, BankTD9[playerid]);
			PlayerTextDrawShow(playerid, BankTD10[playerid]);
			PlayerTextDrawShow(playerid, BankTD11[playerid]);
	        PlayerTextDrawShow(playerid, BankTD12[playerid]);
	        PlayerTextDrawShow(playerid, BankTD13[playerid]);
	        PlayerTextDrawShow(playerid, BankTD14[playerid]);
	        PlayerTextDrawShow(playerid, BankTD15[playerid]);
	        PlayerTextDrawShow(playerid, BankTD16[playerid]);
	        PlayerTextDrawShow(playerid, BankTD17[playerid]);
	        PlayerTextDrawShow(playerid, BankTD18[playerid]);
	        PlayerTextDrawShow(playerid, BankTD19[playerid]);
	        PlayerTextDrawShow(playerid, BankTD20[playerid]);
	        PlayerTextDrawShow(playerid, BankTD21[playerid]);
	        PlayerTextDrawShow(playerid, BankTD22[playerid]);
	        PlayerTextDrawShow(playerid, BankTD23[playerid]);
			SelectTextDraw(playerid, 0xFFA500FF);
			return 1;
		}
		else
		{
			pData[playerid][pToggleAtm] = 0;
			PlayerTextDrawHide(playerid, BankTD0[playerid]);
			PlayerTextDrawHide(playerid, BankTD1[playerid]);
			PlayerTextDrawHide(playerid, BankTD2[playerid]);
			PlayerTextDrawHide(playerid, BankTD3[playerid]);
			PlayerTextDrawHide(playerid, BankTD4[playerid]);
			PlayerTextDrawHide(playerid, BankTD5[playerid]);
			PlayerTextDrawHide(playerid, BankTD6[playerid]);
			PlayerTextDrawHide(playerid, BankTD7[playerid]);
			PlayerTextDrawHide(playerid, BankTD8[playerid]);
			PlayerTextDrawHide(playerid, BankTD9[playerid]);
			PlayerTextDrawHide(playerid, BankTD10[playerid]);
			PlayerTextDrawHide(playerid, BankTD11[playerid]);
			PlayerTextDrawHide(playerid, BankTD12[playerid]);
			PlayerTextDrawHide(playerid, BankTD13[playerid]);
			PlayerTextDrawHide(playerid, BankTD14[playerid]);
			PlayerTextDrawHide(playerid, BankTD15[playerid]);
			PlayerTextDrawHide(playerid, BankTD16[playerid]);
			PlayerTextDrawHide(playerid, BankTD17[playerid]);
			PlayerTextDrawHide(playerid, BankTD18[playerid]);
			PlayerTextDrawHide(playerid, BankTD19[playerid]);
			PlayerTextDrawHide(playerid, BankTD20[playerid]);
			PlayerTextDrawHide(playerid, BankTD21[playerid]);
			PlayerTextDrawHide(playerid, BankTD22[playerid]);
			PlayerTextDrawHide(playerid, BankTD23[playerid]);
			CancelSelectTextDraw(playerid);
		}
	}
	return 1;
}*/
CMD:pay(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new money, otherid, mstr[128];
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/pay <ID/Name> <amount>");
	    return true;
	}
	
	if(!IsPlayerConnected(otherid) || !NearPlayer(playerid, otherid, 4.0))
        return ErrorMsg(playerid, "Player disconnect atau tidak berada didekat anda.");

 	if(otherid == playerid)
		return ErrorMsg(playerid, "You can't send yourself money!");
	if(pData[playerid][pMoney] < money)
		return ErrorMsg(playerid, "You don't have enough money to send!");
	if(money > 1000000 && pData[playerid][pAdmin] == 0)
		return Error(playerid, "You can't send more than Rp.1,000,000 at once!");
	if(money < 1)
		return Error(playerid, "You can't send anyone less than Rp.1!");
		
	/*GivePlayerMoneyEx(otherid, money);
	GivePlayerMoneyEx(playerid, -money);

	format(mstr, sizeof(mstr), "Server: "YELLOW_E"You have sent %s(%i) "GREEN_E"%s", pName[otherid], otherid, FormatMoney(money));
	SendClientMessage(playerid, COLOR_GREY, mstr);
	format(mstr, sizeof(mstr), "Server: "YELLOW_E"%s(%i) has sent you "GREEN_E"%s", pName[playerid], playerid, FormatMoney(money));
	SendClientMessage(otherid, COLOR_GREY, mstr);
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
	ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
	
	new OtherIP[16];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	GetPlayerIp(otherid, OtherIP, sizeof(OtherIP));
	SendStaffMessage(COLOR_RED, "[PAYINFO] "WHITE_E"%s(%d)[IP: %d] pay to %s(%d)[IP: %d] ammount "GREEN_E"%s", pName[playerid], playerid, PlayerIP, pName[otherid], otherid, OtherIP, FormatMoney(money));*/
	format(mstr, sizeof(mstr), ""WHITEP_E"Are you sure you want to send %s(%d) "GREEN_E"%s?", ReturnName(otherid), otherid, FormatMoney(money));
	ShowPlayerDialog(playerid, DIALOG_PAY, DIALOG_STYLE_MSGBOX, ""GREEN_E"Send Money", mstr, "Send", "Cancel");

	SetPVarInt(playerid, "gcAmount", money);
	SetPVarInt(playerid, "gcPlayer", otherid);
	return 1;
}

CMD:stats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    ErrorMsg(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	DisplayStats(playerid, playerid);
	return 1;
}

CMD:settings(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	new str[1024], togpm[64], toglog[64], togads[64], togwt[64];
	
	if(pData[playerid][pTogPM] == 0)
	{
		togpm = ""RED_E"Disable";
	}
	else
	{
		togpm = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogLog] == 0)
	{
		toglog = ""RED_E"Disable";
	}
	else
	{
		toglog = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogAds] == 0)
	{
		togads = ""RED_E"Disable";
	}
	else
	{
		togads = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogWT] == 0)
	{
		togwt = ""RED_E"Disable";
	}
	else
	{
		togwt = ""LG_E"Enable";
	}
	
	format(str, sizeof(str), "Settings\tStatus\n"WHITEP_E"Email:\t"GREY3_E"%s\n"WHITEP_E"Change Password\n"WHITEP_E"Toggle PM:\t%s\n"WHITEP_E"Toggle Log Server:\t%s\n"WHITEP_E"Toggle Ads:\t%s\n"WHITEP_E"Toggle WT:\t%s",
	pData[playerid][pEmail], 
	togpm,
	toglog,
	togads,
	togwt
	);
	
	ShowPlayerDialog(playerid, DIALOG_SETTINGS, DIALOG_STYLE_TABLIST_HEADERS, "Settings", str, "Set", "Close");
	return 1;
}

CMD:items(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    ErrorMsg(playerid, "You must be logged in to check items!");
	    return true;
	}
	DisplayItems(playerid, playerid);
	return 1;
}

CMD:wehdcweydshddf(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5, -2063.5922,2663.7612,1498.7764))
	{
		ShowPlayerDialog(playerid, DIALOG_DISNAKER, DIALOG_STYLE_LIST, "Job", "1. Taxi\n2. Mechanic\n3. Lumber Jack\n4. Trucker\n5. Miner\n6. Production\n7. Farmer\n8. Baggage Airport\n9. Pemotong Ayam\n10. Penambang\n{ff0000}Keluar Pekerjaan (1)\n{ff0000}Keluar Pekerjaan (2)", "Pilih", "Batal");
	}
	return 1;
}

CMD:getjob(playerid, params[])
{
	if(pData[playerid][pIDCard] <= 0)
		return Error(playerid, "Anda tidak memiliki ID-Card.");
		
	if(pData[playerid][pVip] > 0)
	{
		if(pData[playerid][pJob] == 0 || pData[playerid][pJob2] == 0)
		{
			if(pData[playerid][pJob] == 0)
			{
				if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
				{
					pData[playerid][pGetJob] = 1;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Taxi. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1867.0510, -1815.1311, 14.2783))
				{
					pData[playerid][pGetJob] = 2;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Mechanic. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
				{
					pData[playerid][pGetJob] = 3;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Lumber jack. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
				{
					pData[playerid][pGetJob] = 4;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Trucker. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
				{
					pData[playerid][pGetJob] = 5;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Miner. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
				{
					pData[playerid][pGetJob] = 6;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Production. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
				{
					pData[playerid][pGetJob] = 7;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Farmer. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 988.890563, -1349.136962, 13.545228))
				{
					pData[playerid][pGetJob] = 8;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Kurir. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 5.0, 977.34, -771.49, 112.20))
				{
					if(pData[playerid][pLevel] < 5) return Error(playerid, "Anda harus menjadi lv5 untuk memasuki job ini");
					pData[playerid][pGetJob] = 9;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Smuggler. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2060.2942, -2220.8250, 13.5469))
				{
					pData[playerid][pGetJob] = 10;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Baggage. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 921.77, -1287.54, 14.40))
				{
					pData[playerid][pGetJob] = 11;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Pemotong Ayam. /accept job untuk konfirmasi.");
				}
				else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
			}
			else if(pData[playerid][pJob2] == 0)
			{
				if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
				{
					pData[playerid][pGetJob2] = 1;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Taxi. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1867.0510, -1815.1311, 14.2783))
				{
					pData[playerid][pGetJob2] = 2;
					Info(playerid, "Anda telah berhasil mendaftarkan Job mechanic. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
				{
					pData[playerid][pGetJob2] = 3;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Lumber jack. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
				{
					pData[playerid][pGetJob2] = 4;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Trucker. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
				{
					pData[playerid][pGetJob2] = 5;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Miner. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
				{
					pData[playerid][pGetJob2] = 6;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Production. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
				{
					pData[playerid][pGetJob2] = 7;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Farmer. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 988.890563, -1349.136962, 13.545228))
				{
					pData[playerid][pGetJob2] = 8;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Kurir. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 5.0, 977.34, -771.49, 112.20))
				{
					if(pData[playerid][pLevel] < 5) return Error(playerid, "Anda harus menjadi lv5 untuk memasuki job ini");
					pData[playerid][pGetJob2] = 9;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Smuggler. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2060.2942, -2220.8250, 13.5469))
				{
					pData[playerid][pGetJob2] = 10;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Baggage. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 921.77, -1287.54, 14.40))
				{
					pData[playerid][pGetJob2] = 11;
					Info(playerid, "Anda telah berhasil mendaftarkan Job Pemotong Ayam. /accept job untuk konfirmasi.");
				}
				else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
			}
			else return Error(playerid, "Anda sudah memiliki 2 pekerjaan!");
		}
		else return Error(playerid, "Anda sudah memiliki 2 pekerjaan!");
	}
	else
	{
		if(pData[playerid][pJob] > 0)
			return Error(playerid, "Anda hanya bisa memiliki 1 pekerjaan!");
			
		if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
		{
			pData[playerid][pGetJob] = 1;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Taxi. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1867.0510, -1815.1311, 14.2783))
		{
			pData[playerid][pGetJob] = 2;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Mechanic. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
		{
			pData[playerid][pGetJob] = 3;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Lumber jack. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
		{
			pData[playerid][pGetJob] = 4;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Trucker. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
		{
			pData[playerid][pGetJob] = 5;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Miner. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
		{
			pData[playerid][pGetJob] = 6;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Production. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
		{
			pData[playerid][pGetJob] = 7;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Farmer. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 988.890563, -1349.136962, 13.545228))
		{
			pData[playerid][pGetJob] = 8;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Kurir. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 5.0, 977.34, -771.49, 112.20))
		{
			if(pData[playerid][pLevel] < 5) return Error(playerid, "Anda harus menjadi lv5 untuk memasuki job ini");
			pData[playerid][pGetJob] = 9;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Smuggler. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2060.2942, -2220.8250, 13.5469))
		{
			pData[playerid][pGetJob] = 10;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Baggage. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 921.77, -1287.54, 14.40))
		{
			pData[playerid][pGetJob] = 11;
			Info(playerid, "Anda telah berhasil mendaftarkan Job Pemotong Ayam. /accept job untuk konfirmasi.");
		}
		else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
	}
	return 1;
}

CMD:frisk(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/frisk [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return ErrorMsg(playerid, "Player tidak berada didekat mu.");

    if(otherid == playerid)
        return ErrorMsg(playerid, "Kamu tidak bisa memeriksa dirimu sendiri.");

    pData[otherid][pFriskOffer] = playerid;

    Info(otherid, "%s has offered to frisk you (type \"/accept frisk or /deny frisk\").", ReturnName(playerid));
    Info(playerid, "You have offered to frisk %s.", ReturnName(otherid));
	return 1;
}

CMD:menikah(playerid, params[])//menikah
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/menikah[playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return ErrorMsg(playerid, "Player tidak berada didekat mu.");

    if(otherid == playerid)
        return ErrorMsg(playerid, "Kamu tidak bisa melamar diri sendiri.");
	
	if(pData[playerid][pGender] == 1) return Error(playerid, "Hanya Laki-laki yang bisa mengguakan CMD ini.");

    pData[otherid][pMelamar] = playerid;

    Info(otherid, "%s mengajak kamu untuk Menikah, (/accept menikah atau /deny menikah).", ReturnName(playerid));
    Info(playerid, "Kamu mencoba melamar %s.", ReturnName(otherid));
	return 1;
}

CMD:inspect(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/inspect [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return ErrorMsg(playerid, "Player tidak berada didekat mu.");

    if(otherid == playerid)
        return ErrorMsg(playerid, "Kamu tidak bisa memeriksa dirimu sendiri.");

    pData[otherid][pInsOffer] = playerid;

    Info(otherid, "%s has offered to inspect you (type \"/accept inspect or /deny inspect\").", ReturnName(playerid));
    Info(playerid, "You have offered to inspect %s.", ReturnName(otherid));
	return 1;
}

CMD:reqloc(playerid, params[])
{
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/reqloc [playerid/PartOfName]");

    if(pData[playerid][pPhone] < 1)
    	return ErrorMsg(playerid, "Anda tidak memiliki Handphone");

    if(pData[playerid][pPhoneStatus] == 0)
    	return ErrorMsg(playerid, "Ponsel anda masih offline");

    if(pData[otherid][pPhone] < 1)
    	return ErrorMsg(playerid, "Tujuan tidak memiliki Handphone");

    if(pData[otherid][pPhoneStatus] == 0)
    	return ErrorMsg(playerid, "Ponsel yang anda tuju masih offline");

    if(otherid == playerid)
        return ErrorMsg(playerid, "Kamu tidak bisa meminta lokasi kepada anda sendiri.");

    pData[otherid][pLocOffer] = playerid;

    Info(otherid, "%s has offered to request share his location (type \"/accept reqloc or /deny reqloc\").", ReturnName(playerid));
    Info(playerid, "You have offered to share your location %s.", ReturnName(otherid));
	return 1;
}

CMD:accept(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "USAGE: /accept [name]");
            Info(playerid, "Names: faction, family, drag, frisk, inspect, job, reqloc, rob");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFacOffer])) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
                    pData[playerid][pFaction] = pData[playerid][pFacInvite];
					pData[playerid][pFactionRank] = 1;
					Info(playerid, "Anda telah menerima invite faction dari %s", pData[pData[playerid][pFacOffer]][pName]);
					Info(pData[playerid][pFacOffer], "%s telah menerima invite faction yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		if(strcmp(params,"family",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFamOffer])) 
			{
                if(pData[playerid][pFamInvite] > -1) 
				{
                    pData[playerid][pFamily] = pData[playerid][pFamInvite];
					pData[playerid][pFamilyRank] = 1;
					Info(playerid, "Anda telah menerima invite family dari %s", pData[pData[playerid][pFamOffer]][pName]);
					Info(pData[playerid][pFamOffer], "%s telah menerima invite family yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFamInvite] = 0;
					pData[playerid][pFamOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid family id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "Player itu Disconnect.");
        
			if(!NearPlayer(playerid, dragby, 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
        
			pData[playerid][pDragged] = 1;
			pData[playerid][pDraggedBy] = dragby;

			pData[playerid][pDragTimer] = SetTimerEx("DragUpdate", 1000, true, "ii", dragby, playerid);
			SendNearbyMessage(dragby, 30.0, COLOR_WHITE, "* %s grabs %s and starts dragging them, (/undrag).", ReturnName(dragby), ReturnName(playerid));
			return true;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			if(!NearPlayer(playerid, pData[playerid][pFriskOffer], 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
				
			DisplayItems(pData[playerid][pFriskOffer], playerid);
			Servers(playerid, "Anda telah berhasil menaccept tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"menikah",true) == 0) //MENIKAH
		{
			if(pData[playerid][pMelamar] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pMelamar]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			if(!NearPlayer(playerid, pData[playerid][pMelamar], 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
				
			Servers(playerid, "Anda menerima lamaran Menikah dengan %s.", ReturnName(pData[playerid][pMelamar]));
			Servers(pData[playerid][pMelamar], "Selamatt!! Kini %s sudah menjadi istrimu.", ReturnName(pData[playerid][pMelamar]));
			new query[512];
			format(query, sizeof(query), "UPDATE players SET menikah='%e' WHERE reg_id=%d", ReturnName(pData[playerid][pMelamar]), pData[playerid][pID]);
			mysql_tquery(g_SQL, query);
			format(pData[playerid][pMenikah], MAX_PLAYER_NAME, "%s", ReturnName(pData[playerid][pMelamar]));
			//cowo
			format(query, sizeof(query), "UPDATE players SET menikah='%e' WHERE reg_id=%d", ReturnName(playerid), pData[pData[playerid][pMelamar]][pID]);
			mysql_tquery(g_SQL, query);
			format(pData[pData[playerid][pMelamar]][pMenikah], MAX_PLAYER_NAME, "%s", ReturnName(playerid));
			
			pData[playerid][pMelamar] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"inspect",true) == 0)
		{
			if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			if(!NearPlayer(playerid, pData[playerid][pInsOffer], 5.0))
				return Error(playerid, "Kamu harus didekat Player.");
				
			new hstring[512], info[512];
			new hh = pData[playerid][pHead];
			new hp = pData[playerid][pPerut];
			new htk = pData[playerid][pRHand];
			new htka = pData[playerid][pLHand];
			new hkk = pData[playerid][pRFoot];
			new hkka = pData[playerid][pLFoot];
			format(hstring, sizeof(hstring),"Bagian Tubuh\tKondisi\n{ffffff}Kepala\t{7fffd4}%d.0%\n{ffffff}Perut\t{7fffd4}%d.0%\n{ffffff}Tangan Kanan\t{7fffd4}%d.0%\n{ffffff}Tangan Kiri\t{7fffd4}%d.0%\n",hh,hp,htk,htka);
			strcat(info, hstring);
			format(hstring, sizeof(hstring),"{ffffff}Kaki Kanan\t{7fffd4}%d.0%\n{ffffff}Kaki Kiri\t{7fffd4}%d.0%\n",hkk,hkka);
			strcat(info, hstring);
			ShowPlayerDialog(pData[playerid][pInsOffer],DIALOG_HEALTH,DIALOG_STYLE_TABLIST_HEADERS,"Health Condition",info,"Oke","");
			Servers(playerid, "Anda telah berhasil menaccept tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
			pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"job",true) == 0) 
		{
			if(pData[playerid][pGetJob] > 0)
			{
				pData[playerid][pJob] = pData[playerid][pGetJob];
				InfoMsg(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 21600);
			}
			else if(pData[playerid][pGetJob2] > 0)
			{
				pData[playerid][pJob2] = pData[playerid][pGetJob2];
				InfoMsg(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob2] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 21600);
			}
		}
		else if(strcmp(params,"reqloc",true) == 0)
		{
			if(pData[playerid][pLocOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pLocOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
				
			new Float:sX, Float:sY, Float:sZ;
			GetPlayerPos(playerid, sX, sY, sZ);
			SetPlayerCheckpoint(pData[playerid][pLocOffer], sX, sY, sZ, 5.0);
			Servers(playerid, "Anda telah berhasil menaccept tawaran Share Lokasi kepada %s.", ReturnName(pData[playerid][pLocOffer]));
			Servers(pData[playerid][pLocOffer], "Lokasi %s telah tertandai.", ReturnName(playerid));
			pData[playerid][pLocOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"rob",true) == 0)
		{
			if(pData[playerid][pRobOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pRobOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Servers(playerid, "Anda telah berhasil menaccept tawaran bergabung kedalam Robbery %s.", ReturnName(pData[playerid][pRobOffer]));
			Servers(pData[playerid][pRobOffer], "%s Menerima ajakan Robbing anda.", ReturnName(playerid));
			pData[playerid][pRobOffer] = INVALID_PLAYER_ID;
			pData[playerid][pMemberRob] = 1;
			pData[pData[playerid][pRobOffer]][pRobMember] += 1;
			RobMember += 1;
		}
	}
	return 1;
}

CMD:deny(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "USAGE: /deny [name]");
            Info(playerid, "Names: faction, drag, frisk, inspect, job1, job2, reqloc, rob");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(pData[playerid][pFacOffer] > -1) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
					Info(playerid, "Anda telah menolak faction dari %s", ReturnName(pData[playerid][pFacOffer]));
					Info(pData[playerid][pFacOffer], "%s telah menolak invite faction yang anda tawari", ReturnName(playerid));
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "Player itu Disconnect.");

			Info(playerid, "Anda telah menolak drag.");
			Info(dragby, "Player telah menolak drag yang anda tawari.");
			
			DeletePVar(playerid, "DragBy");
			pData[playerid][pDragged] = 0;
			pData[playerid][pDraggedBy] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"menikah",true) == 0)
		{
			if(pData[playerid][pMelamar] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pMelamar]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Kamu telah monolak lamaran %s.", ReturnName(pData[playerid][pMelamar]));
			Info(pData[playerid][pMelamar], "Kasiannn... Kamu ditolak oleh %s.", ReturnName(playerid));
			pData[playerid][pMelamar] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"inspect",true) == 0)
		{
			if(pData[playerid][pInsOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pInsOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Inspect kepada %s.", ReturnName(pData[playerid][pInsOffer]));
			pData[playerid][pInsOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"job1",true) == 0) 
		{
			if(pData[playerid][pJob] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pJob] != 0)
			{
				pData[playerid][pJob] = 0;
				InfoMsg(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
		else if(strcmp(params,"job2",true) == 0) 
		{
			if(pData[playerid][pJob2] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pJob2] != 0)
			{
				pData[playerid][pJob2] = 0;
				InfoMsg(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
		else if(strcmp(params,"reqloc",true) == 0) 
		{
			if(pData[playerid][pLocOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pLocOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Share Lokasi kepada %s.", ReturnName(pData[playerid][pLocOffer]));
			pData[playerid][pLocOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"rob",true) == 0) 
		{
			if(pData[playerid][pRobOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pRobOffer]))
				return Error(playerid, "Player tersebut belum masuk!");
			
			Info(playerid, "Anda telah menolak tawaran Rob kepada %s.", ReturnName(pData[playerid][pRobOffer]));
			pData[playerid][pRobOffer] = INVALID_PLAYER_ID;
		}
	}
	return 1;
}

/*CMD:give(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid)) 
	{
		new name[24], ammount, otherid;
        if(sscanf(params, "us[24]d", otherid, name, ammount))
		{
			Usage(playerid, "/give [playerid] [name] [ammount]");
			Info(playerid, "Names: bandage, nasbung, kebab, ultramilk, burger, redmoney, medicine, snack, sprunk, material, component, marijuana, obat, gps");
			return 1;
		}
		if(otherid == INVALID_PLAYER_ID || otherid == playerid || !NearPlayer(playerid, otherid, 3.0))
			return Error(playerid, "Invalid playerid!");
			
		if(strcmp(name,"bandage",true) == 0) 
		{
			if(pData[playerid][pBandage] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pBandage] -= ammount;
			pData[otherid][pBandage] += ammount;
			Info(playerid, "Anda telah berhasil memberikan perban kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan perban kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"medicine",true) == 0) 
		{
			if(pData[playerid][pMedicine] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMedicine] -= ammount;
			pData[otherid][pMedicine] += ammount;
			Info(playerid, "Anda telah berhasil memberikan medicine kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan medicine kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"snack",true) == 0) 
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pSnack] -= ammount;
			pData[otherid][pSnack] += ammount;
			Info(playerid, "Anda telah berhasil memberikan snack kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan snack kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"nasbung",true) == 0)
		{
			if(pData[playerid][pNasi] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pNasi] -= ammount;
			pData[otherid][pNasi] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Nasi Bungku kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Nasi Bungkus kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"ikangoreng",true) == 0)
		{
			if(pData[playerid][pAGoreng] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pAGoreng] -= ammount;
			pData[otherid][pAGoreng] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Ikan Goreng kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Ikan Goreng kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"burger",true) == 0)
		{
			if(pData[playerid][pBurger] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pBurger] -= ammount;
			pData[otherid][pBurger] += ammount;
			Info(playerid, "Anda telah berhasil memberikan burger kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan burger kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"ultramilk",true) == 0)
		{
			if(pData[playerid][pSusu] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pSusu] -= ammount;
			pData[otherid][pSusu] += ammount;
			Info(playerid, "Anda telah berhasil memberikan ultra milk kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan ultra milk kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"kebab",true) == 0)
		{
			if(pData[playerid][pKebab] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");

			pData[playerid][pKebab] -= ammount;
			pData[otherid][pKebab] += ammount;
			Info(playerid, "Anda telah berhasil memberikan kebab kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan kebab kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"redmoney",true) == 0) 
		{
			if(pData[playerid][pRedMoney] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pRedMoney] -= ammount;
			pData[otherid][pRedMoney] += ammount;
			Info(playerid, "Anda telah berhasil memberikan redmoney kepada %s sejumlah %s.", ReturnName(otherid), FormatMoney(ammount));
			Info(otherid, "%s telah berhasil memberikan redmoney kepada anda sejumlah %s.", ReturnName(playerid), FormatMoney(ammount));
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pSprunk] -= ammount;
			pData[otherid][pSprunk] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Sprunk kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Sprunk kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"material",true) == 0) 
		{
			if(pData[playerid][pMaterial] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxmat = pData[otherid][pMaterial] + ammount;
			
			if(maxmat > 500)
				return Error(playerid, "That player already have maximum material!");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMaterial] -= ammount;
			pData[otherid][pMaterial] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Material kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Material kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"component",true) == 0) 
		{
			if(pData[playerid][pComponent] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxcomp = pData[otherid][pComponent] + ammount;
			
			if(maxcomp > 500)
				return Error(playerid, "That player already have maximum component!");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pComponent] -= ammount;
			pData[otherid][pComponent] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Component kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Component kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"marijuana",true) == 0) 
		{
			if(pData[playerid][pMarijuana] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pMarijuana] -= ammount;
			pData[otherid][pMarijuana] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Marijuana kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Marijuana kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"obat",true) == 0) 
		{
			if(pData[playerid][pObat] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pObat] -= ammount;
			pData[otherid][pObat] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Obat kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Obat kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ShowItemBox(playerid, "Obat", "ammount", 1241, 4);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"gps",true) == 0) 
		{
			if(pData[playerid][pGPS] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount < 1) return Error(playerid, "Can't Give below 1");
			
			pData[playerid][pGPS] -= ammount;
			pData[otherid][pGPS] += ammount;
			Info(playerid, "Anda telah berhasil memberikan GPS kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan GPS kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

CMD:use(playerid, params[])
{
	if(IsAtEvent[playerid] == 1)
		return Error(playerid, "Anda sedang mengikuti event & tidak bisa melakukan ini");

	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "USAGE: /use [name]");
            Info(playerid, "Names: bandage, snack, sprunk, gas, medicine, marijuana, obat, crack, ultramilk, burger, nasbung, kebab");
            return 1;
        }
		if(strcmp(params,"bandage",true) == 0)
		{
			if(pData[playerid][pBandage] < 1)
				return Error(playerid, "Anda tidak memiliki perban.");

			new Float:darah;
			GetPlayerHealth(playerid, darah);
			pData[playerid][pBandage]--;
			SetPlayerHealthEx(playerid, darah+15);
			Info(playerid, "Anda telah berhasil menggunakan perban.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Health");
			SetPlayerChatBubble(playerid,"Menggunakan perban",COLOR_PURPLE,30.0,10000);
		}
		else if(strcmp(params,"snack",true) == 0)
		{
			if(pData[playerid][pSnack] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			pData[playerid][pSnack]--;
			pData[playerid][pHunger] += 15;
			Info(playerid, "Anda telah berhasil menggunakan snack.");
			ShowItemBox(playerid, "Snack", "Removed_1x", 2821, 2);
			InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			SetPlayerChatBubble(playerid,"Memakan Snack",COLOR_PURPLE,30.0,10000);
			ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		}
		else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki sprunk.");

			pData[playerid][pSprunk]--;
			pData[playerid][pEnergy] += 15;
			Info(playerid, "Anda telah berhasil meminum sprunk.");
			ShowItemBox(playerid, "Water", "Removed_1x", 2958, 2);
			InfoTD_MSG(playerid, 3000, "Restore +15 Energy");
			SetPlayerChatBubble(playerid,"Minum Sprunk",COLOR_PURPLE,30.0,10000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"ultramilk",true) == 0)
		{
			if(pData[playerid][pSusu] < 1)
				return Error(playerid, "Anda tidak memiliki sprunk.");

			pData[playerid][pSusu]--;
			pData[playerid][pEnergy] += 25;
			Info(playerid, "Anda telah berhasil meminum ultra milk.");
			ShowItemBox(playerid, "Milk_Max", "Removed_1x", 19570, 2);
			InfoTD_MSG(playerid, 3000, "Restore +25 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			//SendNearbyMessage(playerid, 10.0, COLOR_WHITE,"* %s opens a can of sprunk.", ReturnName(playerid));
			SetPVarInt(playerid, "UsingSprunk", 1);
			pData[playerid][pSprunk]--;
		}
		else if(strcmp(params,"gas",true) == 0)
		{
			if(pData[playerid][pGas] < 1)
				return Error(playerid, "Anda tidak memiliki gas.");

			if(IsPlayerInAnyVehicle(playerid))
				return Error(playerid, "Anda harus berada diluar kendaraan!");

			if(pData[playerid][pActivityTime] > 5) return Error(playerid, "Anda masih memiliki activity progress!");

			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			if(IsValidVehicle(vehicleid))
			{
				new fuel = GetVehicleFuel(vehicleid);

				if(GetEngineStatus(vehicleid))
					return Error(playerid, "Turn off vehicle engine.");

				if(fuel >= 999.0)
					return Error(playerid, "This vehicle gas is full.");

				if(!IsEngineVehicle(vehicleid))
					return Error(playerid, "This vehicle can't be refull.");

				if(!GetHoodStatus(vehicleid))
					return Error(playerid, "The hood must be opened before refull the vehicle.");

				pData[playerid][pGas]--;
				Info(playerid, "Don't move from your position or you will failed to refulling this vehicle.");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pActivityStatus] = 1;
				pData[playerid][pActivity] = SetTimerEx("RefullCar", 1000, true, "id", playerid, vehicleid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Refulling...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				InfoTD_MSG(playerid, 10000, "Refulling...");
				//SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "** %s starts to refulling the vehicle.", ReturnName(playerid));
				return 1;
			}
		}
		else if(strcmp(params,"kebab",true) == 0)
		{
			if(pData[playerid][pKebab] < 1)
				return Error(playerid, "Anda tidak memiliki Kebab.");

			pData[playerid][pKebab]--;
			pData[playerid][pHunger] += 30;
		//	pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil memakan kebab dan terdapat sampah di inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +30 Hunger");
			ShowItemBox(playerid, "Kebab", "Removed_1x", 2769, 2);
			SetPlayerChatBubble(playerid,"Memakan Kebab",COLOR_PURPLE,30.0,10000);
			ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		}
		else if(strcmp(params,"ikangoreng",true) == 0)
		{
			if(pData[playerid][pAGoreng] < 1)
				return Error(playerid, "Anda tidak memiliki Ikan Goreng.");

			pData[playerid][pAGoreng]--;
			pData[playerid][pHunger] += 30;
		//	pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil memakan Ikan Goreng dan terdapat sampah di inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +30 Hunger");
			ApplyAnimation(playerid,"FOOD", "EAT_Burger", 4.0, 1, 0, 0, 0, 0, 1);
		}
		else if(strcmp(params,"burger",true) == 0)
		{
			if(pData[playerid][pBurger] < 1)
				return Error(playerid, "Anda tidak memiliki Burger.");

			pData[playerid][pBurger]--;
			pData[playerid][pHunger] += 30;
			//pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil menggunakan snack dan terdapat sampah di inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +30 Hunger");
			SetPlayerChatBubble(playerid,"Memakan Burger",COLOR_PURPLE,30.0,10000);
			ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		}
		else if(strcmp(params,"nasbung",true) == 0)
		{
			if(pData[playerid][pNasi] < 1)
				return Error(playerid, "Anda tidak memiliki Nasi Bungkus.");

			pData[playerid][pNasi]--;
			pData[playerid][pHunger] += 20;
			//pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil menggunakan snack dan terdapat sampah di inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +20 Hunger");
			SetPlayerChatBubble(playerid,"Makan Nasgor",COLOR_PURPLE,30.0,10000);
			ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0,1);
		}
		else if(strcmp(params,"medicine",true) == 0)
		{
			if(pData[playerid][pMedicine] < 1)
				return Error(playerid, "Anda tidak memiliki medicine.");

			pData[playerid][pMedicine]--;
			pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			SetPlayerDrunkLevel(playerid, 0);
			Info(playerid, "Anda menggunakan medicine.");

			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"obat",true) == 0)
		{
			if(pData[playerid][pObat] < 1)
				return Error(playerid, "Anda tidak memiliki Obat Myricous.");

			pData[playerid][pObat]--;
			pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			pData[playerid][pHead] = 100;
			pData[playerid][pPerut] = 100;
			pData[playerid][pRHand] = 100;
			pData[playerid][pLHand] = 100;
			pData[playerid][pRFoot] = 100;
			pData[playerid][pLFoot] = 100;
			SetPlayerDrunkLevel(playerid, 0);
			Info(playerid, "Anda menggunakan Obat Myricous.");

			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			SetPlayerChatBubble(playerid,"Menggunakan obat",COLOR_PURPLE,30.0,10000);
			ShowItemBox(playerid, "Obat", "Received_1x", 1241, 4);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"crack",true) == 0)
		{
			if(pData[playerid][pCrack] < 1)
				return Error(playerid, "You dont have crack.");

			new Float:armor;
			GetPlayerArmour(playerid, armor);
			if(armor+20 > 90) return Error(playerid, "Over dosis!");

			pData[playerid][pCrack]--;
			SetPlayerArmourEx(playerid, armor+20);
			SetPlayerDrunkLevel(playerid, 4000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"marijuana",true) == 0)
		{
			if(pData[playerid][pMarijuana] < 1)
				return Error(playerid, "You dont have marijuana.");

			new Float:armor;
			GetPlayerArmour(playerid, armor);
			if(armor+10 > 60) return Error(playerid, "Over dosis!");

			pData[playerid][pMarijuana]--;
			SetPlayerArmourEx(playerid, armor+10);
			SetPlayerDrunkLevel(playerid, 4000);
			SetPlayerChatBubble(playerid, "Menggunakan Marijuana", COLOR_PURPLE, 30.0, 10000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
	}
	return 1;
}*/


CMD:enter(playerid, params[])
{
	if(pData[playerid][pInjured] == 0)
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "Bangunan ini di Kunci untuk sementara.");
						
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "Pintu ini hanya untuk fraksi.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "Pintu ini hanya untuk Family.");
					}
					
					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "VIP Level mu tidak cukup.");
					
					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Admin level mu tidak cukup.");
						
					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Password Salah.");
						
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
				else
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "Pintu ini ditutup sementara");
						
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "Pintu ini hanya untuk faction.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "Pintu ini hanya untuk family.");
					}
					
					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "Your VIP level not enough to enter this door.");
					
					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Your admin level not enough to enter this door.");

					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
						
						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "Pintu ini hanya untuk faction.");
					}
				
					if(dData[did][dCustom])
					{
						SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					else
					{
						SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, WorldWeather);
				}
				else
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "Pintu ini hanya untuk faction.");
					}
					
					if(dData[did][dCustom])
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);

					else
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					
					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, WorldWeather);
				}
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "Rumah ini terkunci!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);

			pData[playerid][pInHouse] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "Bisnis ini Terkunci!");
					
				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);
				
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);
			
			pData[playerid][pInBiz] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				pData[playerid][pInFamily] = fid;		
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			new difamily = pData[playerid][pInFamily];
			if(pData[playerid][pInFamily] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, fData[difamily][fIntposX], fData[difamily][fIntposY], fData[difamily][fIntposZ]))
			{
				pData[playerid][pInFamily] = -1;	
				SetPlayerPositionEx(playerid, fData[difamily][fExtposX], fData[difamily][fExtposY], fData[difamily][fExtposZ], fData[difamily][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
	}
	return 1;
}

CMD:drag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/drag [playerid/PartOfName] || /undrag [playerid]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player itu Disconnect.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa menarik diri mu sendiri.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Kamu harus didekat Player.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "kamu tidak bisa drag orang yang tidak mati.");

    SetPVarInt(otherid, "DragBy", playerid);
    Info(otherid, "%s Telah menawari drag kepada anda, /accept drag untuk menerimanya /deny drag untuk membatalkannya.", ReturnName(playerid));
	Info(playerid, "Anda berhasil menawari drag kepada player %s", ReturnName(otherid));
    return 1;
}

CMD:undrag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid)) return Usage(playerid, "/undrag [playerid]");
	if(pData[otherid][pDragged])
    {
        DeletePVar(playerid, "DragBy");
        DeletePVar(otherid, "DragBy");
        pData[otherid][pDragged] = 0;
        pData[otherid][pDraggedBy] = INVALID_PLAYER_ID;

        KillTimer(pData[otherid][pDragTimer]);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s releases %s from their grip.", ReturnName(playerid), ReturnName(otherid));
    }
    return 1;
}

CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");

	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "%s Mengeluarkan topeng dan memakainya.", ReturnName(playerid));
            pData[playerid][pMaskOn] = 1;
            new string[35];
            GetPlayerName(playerid, string, sizeof(string));
            format(string,sizeof(string), "Mask_%d", pData[playerid][pMaskID]);
      	 	SetPlayerName(playerid, string);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
			}
			//SetPlayerAttachedObject(playerid, 9, 18911, 2,0.078534, 0.041857, -0.001727, 268.970458, 1.533374, 269.223754);
        }
        case 1:
        {
            pData[playerid][pMaskOn] = 0;
            SetPlayerName(playerid, pData[playerid][pName]);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "%s Melepaskan topeng dan menyimpannya.", ReturnName(playerid));
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 1);
			}
			//RemovePlayerAttachedObject(playerid, 9);
        }
    }
	return 1;
}
/*
CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");
		
	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				new sstring[64];
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "%s Mengeluarkan topeng dan memakainya.", ReturnName(playerid));
				pData[playerid][pMaskOn] = 1;
				format(sstring, sizeof(sstring), "%s", ReturnName(playerid));
				pData[playerid][pMaskLabel] = CreateDynamic3DTextLabel(sstring, -1, 0, 0, -10, 10.0, playerid);
				Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, pData[playerid][pMaskLabel] , E_STREAMER_ATTACH_OFFSET_Z, 0.30);
				SendClientMessage(playerid, COLOR_ORANGE, "[MASKINFO]: {FFFFFF}Mask {00D900}ON!");
				ShowPlayerNameTagForPlayer(i, playerid, 0);
				return 1;
			}	
        }
        case 1:
        {
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				DestroyDynamic3DTextLabel(pData[playerid][pMaskLabel]);
				pData[playerid][pMaskOn] = 0;
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "%s Melepaskan topeng dan menyimpannya.", ReturnName(playerid));
				SendClientMessage(playerid, COLOR_ORANGE, "[MASKINFO]: {FFFFFF}Mask {FF0000}OFF!");
				ShowPlayerNameTagForPlayer(i, playerid, 1);
				return 1;
			}	
        }
    }
	return 1;
}
*/

CMD:stuck(playerid)
{
	if(pData[playerid][pFreeze] == 1)
		return Error(playerid, "Anda sedang di Freeze oleh staff, tidak dapat menggunakan ini");

	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	ShowPlayerDialog(playerid, DIALOG_STUCK, DIALOG_STYLE_LIST,"Stuck Options","Tersangkut DiGedung\nTersangkut setelah masuk/keluar Interior\nTersangkut diKendaraan","Pilih","Batal");
	return 1;
}
//Text and Chat Commands
CMD:try(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return Usage(playerid, "/try [action]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, ".. %s, %s", params[64], (random(2) == 0) ? ("and success") : ("but fail"));
    }
    else {
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %s %s, %s", ReturnName(playerid), params, (random(2) == 0) ? ("and success") : ("but fail"));
    }
	printf("[TRY] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ado(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        Usage(playerid, "/ado [text]");
		Info(playerid, "Use /ado off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pAdoActive])
            return Error(playerid, "You're not actived your 'ado' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

        Servers(playerid, "You're removed your ado text.");
        pData[playerid][pAdoActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pAdoActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pAdoTag], COLOR_PURPLE, flyingtext);
        else
            pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pAdoActive] = true;
        pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[ADO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ab(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        Usage(playerid, "/ab [text]");
		Info(playerid, "Use /ab off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pBActive])
            return Error(playerid, "You're not actived your 'ab' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);

        Servers(playerid, "You're removed your ab text.");
        pData[playerid][pBActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( OOC : %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AB]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AB]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pBActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pBTag], COLOR_PURPLE, flyingtext);
        else
            pData[playerid][pBTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pBActive] = true;
        pData[playerid][pBTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[AB] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ame(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    new flyingtext[164];

    if(isnull(params))
        return Usage(playerid, "/ame [action]");

    if(strlen(params) > 128)
        return Error(playerid, "Max action can only maximmum 128 characters.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    format(flyingtext, sizeof(flyingtext), "* %s %s*", ReturnName(playerid), params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_LBLUE, 10.0, 10000);
	printf("[AME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:me(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return Usage(playerid, "/me [action]");
	
	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %s %s", ReturnName(playerid), params);
    }
	printf("[ME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:do(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return Usage(playerid, "/do [description]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, ".. %s (( %s ))", params[64], ReturnName(playerid));
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_LBLUE, "* %s (( %s ))", params, ReturnName(playerid));
    }
	printf("[DO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:toglog(playerid)
{
	if(!pData[playerid][pTogLog])
	{
		pData[playerid][pTogLog] = 1;
		Info(playerid, "Anda telah menonaktifkan log server.");
	}
	else
	{
		pData[playerid][pTogLog] = 0;
		Info(playerid, "Anda telah mengaktifkan log server.");
	}
	return 1;
}

CMD:togpm(playerid)
{
	if(!pData[playerid][pTogPM])
	{
		pData[playerid][pTogPM] = 1;
		Info(playerid, "Anda telah menonaktifkan PM");
	}
	else
	{
		pData[playerid][pTogPM] = 0;
		Info(playerid, "Anda telah mengaktifkan PM");
	}
	return 1;
}

CMD:togads(playerid)
{
	if(!pData[playerid][pTogAds])
	{
		pData[playerid][pTogAds] = 1;
		Info(playerid, "Anda telah menonaktifkan Ads/Iklan.");
	}
	else
	{
		pData[playerid][pTogAds] = 0;
		Info(playerid, "Anda telah mengaktifkan Ads/Iklan.");
	}
	return 1;
}

CMD:togwt(playerid)
{
	if(!pData[playerid][pTogWT])
	{
		pData[playerid][pTogWT] = 1;
		Info(playerid, "Anda telah menonaktifkan Walkie Talkie.");
	}
	else
	{
		pData[playerid][pTogWT] = 0;
		Info(playerid, "Anda telah mengaktifkan Walkie Talkie.");
	}
	return 1;
}

CMD:pm(playerid, params[])
{
    static text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/pm [playerid/PartOfName] [message]");

    /*if(pData[playerid][pTogPM])
        return Error(playerid, "You must enable private messaging first.");*/

    /*if(pData[otherid][pAdminDuty])
        return Error(playerid, "You can't pm'ing admin duty now!");*/
		
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player yang anda tuju tidak valid.");

    if(otherid == playerid)
        return Error(playerid, "Tidak dapan PM diri sendiri.");

    if(pData[otherid][pTogPM] && pData[playerid][pAdmin] < 1)
        return Error(playerid, "Player tersebut menonaktifkan pm.");

    if(IsPlayerInRangeOfPoint(otherid, 50, 2184.32, -1023.32, 1018.68))
				return Error(playerid, "Anda tidak dapat melakukan ini, orang yang dituju sedang berada di OOC Zone");

    //GameTextForPlayer(otherid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~New message!", 3000, 3);
    PlayerPlaySound(otherid, 1085, 0.0, 0.0, 0.0);

    SendClientMessageEx(otherid, COLOR_YELLOW, "(( PM from %s (%d): %s ))", pData[playerid][pName], playerid, text);
    SendClientMessageEx(playerid, COLOR_YELLOW, "(( PM to %s (%d): %s ))", pData[otherid][pName], otherid, text);
	//Info(otherid, "/togpm for tog enable/disable PM");

    foreach(new i : Player) if((pData[i][pAdmin]) && pData[playerid][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_LIGHTGREEN, "[SPY PM] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

CMD:whisper(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/(w)hisper [playerid/PartOfName] [text]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player itu Disconnect or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You can't whisper yourself.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(text) > 64) 
	{
        SendClientMessageEx(otherid, COLOR_LBLUE, "** Whisper from %s (%d): %.64s", ReturnName(playerid), playerid, text);
        SendClientMessageEx(otherid, COLOR_LBLUE, "...%s **", text[64]);

        SendClientMessageEx(playerid, COLOR_LBLUE, "** Whisper to %s (%d): %.64s", ReturnName(otherid), otherid, text);
        SendClientMessageEx(playerid, COLOR_LBLUE, "...%s **", text[64]);
    }
    else 
	{
        SendClientMessageEx(otherid, COLOR_LBLUE, "** Whisper from %s (%d): %s **", ReturnName(playerid), playerid, text);
        SendClientMessageEx(playerid, COLOR_LBLUE, "** Whisper to %s (%d): %s **", ReturnName(otherid), otherid, text);
    }
    SendNearbyMessage(playerid, 10.0, COLOR_LBLUE, "* %s mutters something in %s's ear.", ReturnName(playerid), ReturnName(otherid));
	
	foreach(new i : Player) if((pData[i][pAdmin]) && pData[i][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_YELLOW2, "[SPY Whisper] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

/*CMD:l(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return Usage(playerid, "/(l)ow [low text]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
	if(IsPlayerInAnyVehicle(playerid))
	{
		foreach(new i : Player)
		{
			if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
			{
				if(strlen(params) > 64) 
				{
					SendClientMessageEx(i, COLOR_LBLUE, "[car] %s says: %.64s ..", ReturnName(playerid), params);
					SendClientMessageEx(i, COLOR_LBLUE, "...%s", params[64]);
				}
				else 
				{
					SendClientMessageEx(i, COLOR_LBLUE, "[car] %s says: %s", ReturnName(playerid), params);
				}
				printf("[CAR] %s(%d) : %s", pData[playerid][pName], playerid, params);
			}
		}
	}
	else
	{
		if(strlen(params) > 64) 
		{
			SendNearbyMessage(playerid, 5.0, COLOR_LBLUE, "[low] %s says: %.64s ..", ReturnName(playerid), params);
			SendNearbyMessage(playerid, 5.0, COLOR_LBLUE, "...%s", params[64]);
		}
		else 
		{
			SendNearbyMessage(playerid, 5.0, COLOR_LBLUE, "[low] %s says: %s", ReturnName(playerid), params);
		}
		printf("[LOW] %s(%d) : %s", pData[playerid][pName], playerid, params);
	}
    return 1;
}

CMD:s(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    if(isnull(params))
        return Usage(playerid, "/(s)hout [shout text] /ds for in the door");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 40.0, COLOR_LBLUE, "%s shouts: %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 40.0, COLOR_LBLUE, "...%s!", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 30.0, COLOR_LBLUE, "%s shouts: %s!", ReturnName(playerid), params);
    }
	new flyingtext[128];
	format(flyingtext, sizeof(flyingtext), "%s!", params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_WHITE, 10.0, 10000);
	printf("[SHOUTS] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}*/

CMD:b(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "OOC Zone, Ketik biasa saja");

    if(isnull(params))
        return Usage(playerid, "/b [local OOC]");
		
	if(pData[playerid][pAdminDuty] == 1)
    {
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {ff0000}Administrator {ffffff}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
		return 1;
	}
	else if(pData[playerid][pLevel] == 1)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] Warga baru || %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 2)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] Warga baru I || %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 3)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] Warga baru II || %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 4)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] Warga baru III || %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 5)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFE4C4}Trainee IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 6)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFE4C4}Trainee III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 7)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFE4C4}Trainee II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 8)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFE4C4}Trainee I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 9)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFE4C4}Trainee {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 10)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {DB881A}Novice IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 11)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {DB881A}Novice III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 12)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {DB881A}Novice II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 13)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {DB881A}Novice I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 14)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {DB881A}Novice {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 15)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFFF82}Elite IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 16)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFFF82}Elite III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 17)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFFF82}Elite II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 18)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFFF82}Elite I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 19)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFFF82}Elite {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 20)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D2D2AB}Honor IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 21)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D2D2AB}Honor III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 22)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D2D2AB}Honor II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 23)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D2D2AB}Honor I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 24)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D2D2AB}Honor {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 25)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {004BFF}Epical IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 26)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {004BFF}Epical III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 27)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {004BFF}Epical II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 28)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {004BFF}Epical I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 29)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {004BFF}Epical {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 30)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D0AEEB}Vanguard IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 31)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D0AEEB}Vanguard III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 32)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D0AEEB}Vanguard II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 33)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D0AEEB}Vanguard I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 34)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {D0AEEB}Vanguard {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 35)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {F5DEB3}Master IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 36)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {F5DEB3}Master III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 37)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {F5DEB3}Master II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 38)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {F5DEB3}Master I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 39)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {F5DEB3}Master {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 40)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFD700}Legendary IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 41)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFD700}Legendary III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 42)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFD700}Legendary II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 43)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFD700}Legendary I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 44)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {FFD700}Legendary {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 45)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {00FF00}Nolife IV {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] == 46)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {00FF00}Nolife III {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 47)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {00FF00}Nolife II {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 48)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {00FF00}Nolife I {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
 	else if(pData[playerid][pLevel] == 49)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {00FF00}Nolife {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
	else if(pData[playerid][pLevel] > 49)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "[L] {E65555}Supreme {FFFFFF}|| %s [%d]: {33CCFF}(( {ffffff}%s {33CCFF}))", pData[playerid][pUCP], playerid, params);
        return 1;
	}
    return 1;
}

/*CMD:t(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(isnull(params))
		return Usage(playerid, "/t [typo text]");

	if(strlen(params) < 10)
	{
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s : %.10s*", ReturnName(playerid), params);
	}
	//printf("[OOC] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}*/

CMD:call(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new ph;
	if(pData[playerid][pPhone] == 0) return Error(playerid, "Anda tidak memiliki Ponsel!");
	if(pData[playerid][pPhoneStatus] == 0) return Error(playerid, "Handphone anda sedang dimatikan");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "Anda tidak memiliki Ponsel credits!");
	
	if(sscanf(params, "d", ph))
	{
		Usage(playerid, "/call [phone number] 933 - Taxi Call | 911 - SAPD Crime Call | 922 - SAMD Medic Call");
		foreach(new ii : Player)
		{	
			if(pData[ii][pMechDuty] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREEN, "Mekanik Duty: %s | PH: [%d]", ReturnName(ii), pData[ii][pPhone]);
			}
		}
		return 1;
	}
	if(ph == 911)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency crime only! please wait for SAPD respon!");
		SendFactionMessage(1, COLOR_PURPLE, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency crime! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 922)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency medical only! please wait for SAMD respon!");
		SendFactionMessage(3, COLOR_PINK2, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency medical! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 933)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Your calling has sent to the taxi driver. please wait for respon!");
		pData[playerid][pCallTime] = gettime() + 60;
		foreach(new tx : Player)
		{
			if(pData[tx][pFaction] == 6)
			{
				SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "WHITE_E"%s calling the taxi for order! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
			}
		}
	}
	if(ph == pData[playerid][pPhone])
	{
     	for(new i = 0; i < 16; i++)
		{
			TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
		}
		PlayerTextDrawShow(playerid, NamatelHP[playerid]);
		PlayerTextDrawShow(playerid, SibuktelHP[playerid]);
		SelectTextDraw(playerid, COLOR_LBLUE);
	}
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii))
			{
			    for(new i = 0; i < 16; i++)
				{
					TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
				}
				PlayerTextDrawShow(playerid, NamatelHP[playerid]);
				PlayerTextDrawShow(playerid, MemanggiltelHP[playerid]);
				SelectTextDraw(playerid, COLOR_LBLUE);
				
				new tstr[256];
				format(tstr, sizeof(tstr), "%s", pData[ii][pName]);
				PlayerTextDrawSetString(playerid, NamatelHP[playerid], tstr);
				return 1;
			}
			if(pData[ii][pPhoneStatus] == 0)
			{
			    for(new i = 0; i < 16; i++)
				{
					TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
				}
				PlayerTextDrawShow(playerid, NamatelHP[playerid]);
				PlayerTextDrawShow(playerid, MemanggiltelHP[playerid]);
				SelectTextDraw(playerid, COLOR_LBLUE);
				
				new tstr[256];
				format(tstr, sizeof(tstr), "%s", pData[ii][pName]);
				PlayerTextDrawSetString(playerid, NamatelHP[playerid], tstr);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(ii, 20, 2179.9531,-1009.7586,1021.6880))
				return Error(playerid, "Anda tidak dapat melakukan ini, orang yang dituju sedang berada di OOC Zone");

			if(pData[ii][pCall] == INVALID_PLAYER_ID)
			{
				pData[playerid][pCall] = ii;
				
				//SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE to %d] "WHITE_E"phone begins to ring, please wait for answer!", ph);
				for(new i = 0; i < 16; i++)
				{
					TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
				}
				PlayerTextDrawShow(playerid, NamatelHP[playerid]);
				PlayerTextDrawShow(playerid, BerderingtelHP[playerid]);
				PlayerTextDrawShow(playerid, BataltelHP[playerid]);
				new tstr[256];
				format(tstr, sizeof(tstr), "%s", pData[ii][pName]);
				PlayerTextDrawSetString(playerid, NamatelHP[playerid], tstr);
				SelectTextDraw(playerid, COLOR_LBLUE);
				
				//SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE form %d] "WHITE_E"Your phonecell is ringing, type '/p' to answer it!", pData[playerid][pPhone]);
    			for(new i = 0; i < 16; i++)
				{
					TextDrawShowForPlayer(ii, TeleponhpTD[i]);
				}
				PlayerTextDrawShow(ii, NamatelHP[ii]);
				PlayerTextDrawShow(ii, PanggiltelHP[ii]);
				PlayerTextDrawShow(ii, AngkatHP[ii]);
				PlayerTextDrawShow(ii, RijekHP[ii]);
				ToggleCall[ii] = 1;
				PlayerPlaySound(playerid, 3600, 0,0,0);
				PlayerPlaySound(ii, 6003, 0,0,0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				format(tstr, sizeof(tstr), "%s", pData[playerid][pName]);
				PlayerTextDrawSetString(ii, NamatelHP[ii], tstr);
				//SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s takes out a cellphone and calling someone.", ReturnName(playerid));
				return 1;
			}
			else
			{
    			for(new i = 0; i < 16; i++)
				{
					TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
				}
				PlayerTextDrawShow(playerid, NamatelHP[playerid]);
				PlayerTextDrawShow(playerid, SibuktelHP[playerid]);
				SelectTextDraw(playerid, COLOR_LBLUE);
				
				new tstr[256];
				format(tstr, sizeof(tstr), "%s", pData[ii][pName]);
				PlayerTextDrawSetString(playerid, NamatelHP[playerid], tstr);
				return 1;
			}
		}
	}
	return 1;
}

CMD:p(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
		return Error(playerid, "Anda sudah sedang menelpon seseorang!");
		
	if(pData[playerid][pInjured] != 0)
		return Error(playerid, "You cant do that in this time.");
		
	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[ii][pPhoneCredit]--;
			
			pData[playerid][pCall] = ii;
			//SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
   			for(new i = 0; i < 16; i++)
			{
				TextDrawHideForPlayer(ii, TeleponhpTD[i]);
			}
			PlayerTextDrawHide(ii, NamatelHP[ii]);
			PlayerTextDrawHide(ii, WaktutelHP[ii]);
			PlayerTextDrawHide(ii, BataltelHP[ii]);
			PlayerTextDrawHide(ii, MemanggiltelHP[ii]);
			PlayerTextDrawHide(ii, BerderingtelHP[ii]);
			PlayerTextDrawHide(ii, SibuktelHP[ii]);
			PlayerTextDrawHide(ii, PanggiltelHP[ii]);
			PlayerTextDrawHide(ii, RijekHP[ii]);
			PlayerTextDrawHide(ii, AngkatHP[ii]);
			
			for(new i = 0; i < 16; i++)
			{
				TextDrawShowForPlayer(ii, TeleponhpTD[i]);
			}
			PlayerTextDrawShow(ii, NamatelHP[ii]);
			PlayerTextDrawShow(ii, WaktutelHP[ii]);
			PlayerTextDrawShow(ii, BataltelHP[ii]);
			CancelSelectTextDraw(ii);
			//SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			for(new i = 0; i < 16; i++)
			{
				TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
			}
			PlayerTextDrawHide(playerid, NamatelHP[playerid]);
			PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
			PlayerTextDrawHide(playerid, BataltelHP[playerid]);
			PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
			PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
			PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, RijekHP[playerid]);
			PlayerTextDrawHide(playerid, AngkatHP[playerid]);
			
			for(new i = 0; i < 16; i++)
			{
				TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
			}
			PlayerTextDrawShow(playerid, NamatelHP[playerid]);
			PlayerTextDrawShow(playerid, WaktutelHP[playerid]);
			PlayerTextDrawShow(playerid, BataltelHP[playerid]);
			CancelSelectTextDraw(playerid);
			ToggleCall[playerid] = 1;
			ToggleCall[ii] = 1;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s answers their cellphone.", ReturnName(playerid));
			
			DetikCall[playerid] = 0;
			MenitCall[playerid] = 0;
			JamCall[playerid] = 0;
			
			DetikCall[ii] = 0;
			MenitCall[ii] = 0;
			JamCall[ii] = 0;
			
			KillTimer(CallTimer[playerid]);
			KillTimer(CallTimer[ii]);
			
			CallTimer[playerid] = SetTimerEx("TambahDetikCall", 1000, true, "i", playerid);
			CallTimer[ii] = SetTimerEx("TambahDetikCall", 1000, true, "i", ii);
			
   			new targetid = pData[playerid][pCall];

			OnPhone[targetid] = SvCreateGStream(0xFFA200FF, "InPhone");

		    if (OnPhone[targetid])
			{
		        SvAttachListenerToStream(OnPhone[targetid], targetid);
		        SvAttachListenerToStream(OnPhone[targetid], playerid);
		    }
		    if (OnPhone[targetid] && pData[playerid][pCall] != INVALID_PLAYER_ID)
			{
		        SvAttachSpeakerToStream(OnPhone[targetid], playerid);
		    }

		    if(OnPhone[targetid] && pData[targetid][pCall] != INVALID_PLAYER_ID)
			{
		        SvAttachSpeakerToStream(OnPhone[targetid], targetid);
		    }
		}
	}
	return 1;
}

CMD:ofhu(playerid, params[])
{
 	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[playerid][pCall] = ii;
			for(new i = 0; i < 16; i++)
			{
				TextDrawHideForPlayer(ii, TeleponhpTD[i]);
			}
			PlayerTextDrawHide(ii, NamatelHP[ii]);
			PlayerTextDrawHide(ii, WaktutelHP[ii]);
			PlayerTextDrawHide(ii, BataltelHP[ii]);
			PlayerTextDrawHide(ii, MemanggiltelHP[ii]);
			PlayerTextDrawHide(ii, BerderingtelHP[ii]);
			PlayerTextDrawHide(ii, SibuktelHP[ii]);
			PlayerTextDrawHide(ii, PanggiltelHP[ii]);
			PlayerTextDrawHide(ii, RijekHP[ii]);
			PlayerTextDrawHide(ii, AngkatHP[ii]);
			pData[ii][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(ii, SPECIAL_ACTION_STOPUSECELLPHONE);
			//SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			for(new i = 0; i < 16; i++)
			{
				TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
			}
			PlayerTextDrawHide(playerid, NamatelHP[playerid]);
			PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
			PlayerTextDrawHide(playerid, BataltelHP[playerid]);
			PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
			PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
			PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, RijekHP[playerid]);
			PlayerTextDrawHide(playerid, AngkatHP[playerid]);
			CancelSelectTextDraw(playerid);
			CancelSelectTextDraw(ii);
			ToggleCall[ii] = 0;
			ToggleCall[playerid] = 0;
			TogglePhone[ii] = 0;
			TogglePhone[playerid] = 0;
			DetikCall[playerid] = 0;
			MenitCall[playerid] = 0;
			JamCall[playerid] = 0;
			DetikCall[ii] = 0;
			MenitCall[ii] = 0;
			JamCall[ii] = 0;
			pData[playerid][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
	}
	return 1;
}

CMD:offhu(playerid, params[])
{
 	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	for(new i = 0; i < 16; i++)
	{
		TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
	}
	PlayerTextDrawHide(playerid, NamatelHP[playerid]);
	PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
	PlayerTextDrawHide(playerid, BataltelHP[playerid]);
	PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
	PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
	PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
	PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
	PlayerTextDrawHide(playerid, RijekHP[playerid]);
	PlayerTextDrawHide(playerid, AngkatHP[playerid]);
	CancelSelectTextDraw(playerid);
	ToggleCall[playerid] = 0;
	TogglePhone[playerid] = 0;
	DetikCall[playerid] = 0;
	MenitCall[playerid] = 0;
	JamCall[playerid] = 0;
	pData[playerid][pCall] = INVALID_PLAYER_ID;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	return 1;
}

CMD:hu(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new caller = pData[playerid][pCall];
	if(IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID)
	{
		pData[caller][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
		//SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(caller));
		for(new i = 0; i < 16; i++)
		{
			TextDrawHideForPlayer(caller, TeleponhpTD[i]);
		}
		PlayerTextDrawHide(caller, NamatelHP[caller]);
		PlayerTextDrawHide(caller, WaktutelHP[caller]);
		PlayerTextDrawHide(caller, BataltelHP[caller]);
		PlayerTextDrawHide(caller, MemanggiltelHP[caller]);
		PlayerTextDrawHide(caller, BerderingtelHP[caller]);
		PlayerTextDrawHide(caller, SibuktelHP[caller]);
		PlayerTextDrawHide(caller, PanggiltelHP[caller]);
		PlayerTextDrawHide(caller, RijekHP[caller]);
		PlayerTextDrawHide(caller, AngkatHP[caller]);
		CancelSelectTextDraw(caller);
		ToggleCall[caller] = 0;
		TogglePhone[caller] = 0;
		DetikCall[caller] = 0;
		MenitCall[caller] = 0;
		JamCall[caller] = 0;
		
		//SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(playerid));
  		for(new i = 0; i < 16; i++)
		{
			TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
		}
		PlayerTextDrawHide(playerid, NamatelHP[playerid]);
		PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
		PlayerTextDrawHide(playerid, BataltelHP[playerid]);
		PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
		PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
		PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
		PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
		PlayerTextDrawHide(playerid, RijekHP[playerid]);
		PlayerTextDrawHide(playerid, AngkatHP[playerid]);
		CancelSelectTextDraw(playerid);
		ToggleCall[playerid] = 0;
		TogglePhone[playerid] = 0;
		DetikCall[playerid] = 0;
		MenitCall[playerid] = 0;
		JamCall[playerid] = 0;
		pData[playerid][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);

  		if (OnPhone[caller] && pData[caller][pCall] != INVALID_PLAYER_ID)
	 	{
            SvDetachSpeakerFromStream(OnPhone[caller], caller);
        }

        if(OnPhone[caller] && pData[playerid][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[caller], playerid);
        }

        if(OnPhone[caller])
		{
            SvDetachListenerFromStream(OnPhone[caller], caller);
            SvDetachListenerFromStream(OnPhone[caller], playerid);
            SvDeleteStream(OnPhone[caller]);
            OnPhone[caller] = SV_NULL;
        }

		if (OnPhone[playerid] && pData[caller][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[playerid], caller);
        }

        if(OnPhone[playerid] && pData[playerid][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[playerid], playerid);
        }

        if(OnPhone[playerid])
		{
            SvDetachListenerFromStream(OnPhone[playerid], caller);
            SvDetachListenerFromStream(OnPhone[playerid], playerid);
            SvDeleteStream(OnPhone[playerid]);
            OnPhone[playerid] = SV_NULL;
        }
	}
	return 1;
}

CMD:sms(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new ph, text[50];
	if(pData[playerid][pPhone] == 0) return Error(playerid, "Anda tidak memiliki Ponsel!");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "Anda tidak memiliki Ponsel credits!");
	if(pData[playerid][pInjured] != 0) return Error(playerid, "You cant do at this time.");
	
	if(sscanf(params, "ds[50]", ph, text))
        return Usage(playerid, "/sms [phone number] [message max 50 text]");
	
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][pPhoneStatus] == 0) return Error(playerid, "Tidak dapat SMS, Ponsel tersebut yang dituju sedang Offline");
			if(IsPlayerInRangeOfPoint(ii, 20, 2179.9531,-1009.7586,1021.6880))
				return Error(playerid, "Anda tidak dapat melakukan ini, orang yang dituju sedang berada di OOC Zone");

			if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");
			SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", ph, text);
			SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], text);
			Info(ii, "Gunakan "LB_E"'@<text>' "WHITE_E"untuk membalas SMS!");
			PlayerPlaySound(ii, 6003, 0,0,0);
			pData[ii][pSMS] = pData[playerid][pPhone];
			
			pData[playerid][pPhoneCredit] -= 1;
			return 1;
		}
	}
	return 1;
}

CMD:number(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(pData[playerid][pPhoneBook] == 0)
		return Error(playerid, "You dont have a phone book.");
	
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/number [playerid]");
	
	if(!IsPlayerConnected(otherid))
		return Error(playerid, "That player is not listed in phone book.");
		
	if(pData[otherid][pPhone] == 0)
		return Error(playerid, "That player is not listed in phone book.");
	
	SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] Name: %s | Ph: %d.", ReturnName(otherid), pData[otherid][pPhone]);
	return 1;
}


CMD:setfreq(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(pData[playerid][pWT] == 0)
		return ErrorMsg(playerid, "You dont have walkie talkie!");
	
	new channel;
	if(sscanf(params, "d", channel))
		return Usage(playerid, "/setfreq [channel 1 - 1000]");
	
	if(pData[playerid][pTogWT] == 1) return ErrorMsg(playerid, "Your walkie talkie is turned off.");
	if(channel == pData[playerid][pWT]) return ErrorMsg(playerid, "You are already in this channel.");
	
	if(channel > 0 && channel <= 1000)
	{
		foreach(new i : Player)
		{
		    if(pData[i][pWT] == channel)
		    {
				SendClientMessageEx(i, COLOR_LIME, "[WT] "WHITE_E"%s has joined in to this channel!", ReturnName(playerid));
		    }
		}
		Info(playerid, "You have set your walkie talkie channel to "LIME_E"%d", channel);
		pData[playerid][pWT] = channel;
	}
	else
	{
		Error(playerid, "Invalid channel id! 1 - 1000");
	}
	return 1;
}

CMD:wt(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(pData[playerid][pWT] == 0)
		return ErrorMsg(playerid, "You dont have walkie talkie!");
		
	if(pData[playerid][pTogWT] == 1)
		return ErrorMsg(playerid, "Your walkie talkie is turned off!");
	
	new msg[128];
	if(sscanf(params, "s[128]", msg)) return Usage(playerid, "/wt [message]");
	foreach(new i : Player)
	{
	    if(pData[i][pTogWT] == 0)
	    {
	        if(pData[i][pWT] == pData[playerid][pWT])
	        {
				SendClientMessageEx(i, COLOR_LIME, "[WT] "WHITE_E"%s: %s", ReturnName(playerid), msg);
	        }
	    }
	}
	return 1;
}

/*CMD:savestats(playerid, params[])
{
	UpdateWeapons(playerid);
	UpdatePlayerData(playerid);
	Info(playerid, "Your data have been saved!");
	return 1;
}*/

CMD:ads(playerid, params[])
{
	if(pData[playerid][pPhoneStatus] == 0) return ErrorMsg(playerid, "Tidak dapat iklan, Ponsel anda sedang Offline");

	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2043.17, 1336.04, 1003.4)) return ErrorMsg(playerid, "Kamu tidak berada di tempat SANA!");
	if(pData[playerid][pDelayIklan] > 0) return Error(playerid, "Kamu masih cooldown %d detik", pData[playerid][pDelayIklan]);
	if(pData[playerid][pPhone] == 0) return ErrorMsg(playerid, "Anda tidak memiliki Ponsel!");
	
	if(isnull(params))
	{
		Usage(playerid, "/ads [text] | 1 character pay Rp.5.000");
		return 1;
	}
	if(strlen(params) >= 100 ) return Error(playerid, "Maximum character is 100 text." );
	new payout = strlen(params) * 5000;
	if(GetPlayerMoney(playerid) < payout) return Error(playerid, "Not enough money.");
	
	GivePlayerMoneyEx(playerid, -payout);
	Server_AddMoney(payout);
	pData[playerid][pDelayIklan] = 600;
	foreach(new ii : Player)
	{
		if(pData[ii][pTogAds] == 0)
		{
			SendClientMessageEx(ii, COLOR_LBLUE, "[IKLAN HARI INI] "GREEN_E"%s.", params);
			SendClientMessageEx(ii, COLOR_LBLUE, "PENGIKLAN: ["GREEN_E"%s"ORANGE_E2"]", pData[playerid][pName]);
		}
	}
	//SendClientMessageToAllEx(COLOR_ORANGE2, "[ADS] "GREEN_E"%s.", params);
	//SendClientMessageToAllEx(COLOR_ORANGE2, "Contact Info: ["GREEN_E"%s"ORANGE_E2"]", pData[playerid][pName]);
	return 1;
}

//------------------[ Bisnis and Buy Commands ]-------
CMD:buy(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");
	//trucker product
	if(IsPlayerInRangeOfPoint(playerid, 3.5, -279.67, -2148.42, 28.54))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new mstr[128];
			format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah product:\nProduct Stock: "GREEN_E"%d\n"WHITE_E"Product Price"GREEN_E"%s / item", Product, FormatMoney(ProductPrice));
			ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "Buy Product", mstr, "Buy", "Cancel");
		}
		else return Error(playerid, "You are not in vehicle trucker.");
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 336.70, 895.54, 20.40))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new mstr[128];
			format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah liter gasoil:\nGasOil Stock: "GREEN_E"%d\n"WHITE_E"GasOil Price"GREEN_E"%s / liters", GasOil, FormatMoney(GasOilPrice));
			ShowPlayerDialog(playerid, DIALOG_GASOIL, DIALOG_STYLE_INPUT, "Buy GasOil", mstr, "Buy", "Cancel");
		}
		else return Error(playerid, "You are not in vehicle trucker.");
	}
	//Material
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -258.54, -2189.92, 28.97))
	{
		if(pData[playerid][pMaterial] >= 500) return Error(playerid, "Anda sudah membawa 500 Material!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah material:\nMaterial Stock: "GREEN_E"%d\n"WHITE_E"Material Price"GREEN_E"%s / item", Material, FormatMoney(MaterialPrice));
		ShowPlayerDialog(playerid, DIALOG_MATERIAL, DIALOG_STYLE_INPUT, "Buy Material", mstr, "Buy", "Cancel");
	}
	//Component
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 854.5555, -605.2056, 18.4219))
	{
		if(pData[playerid][pComponent] >= 500) return Error(playerid, "Anda sudah membawa 500 Component!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah component:\nComponent Stock: "GREEN_E"%d\n"WHITE_E"Component Price"GREEN_E"%s / item", Component, FormatMoney(ComponentPrice));
		ShowPlayerDialog(playerid, DIALOG_COMPONENT, DIALOG_STYLE_INPUT, "Buy Component", mstr, "Buy", "Cancel");
	}
	//Apotek
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -1774.0746, -2005.6477, 1500.7853))
	{
		if(pData[playerid][pFaction] != 3)
			return Error(playerid, "Medical only!");
			
		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Medicine\t"GREEN_E"%s\n\
		Medkit\t"GREEN_E"%s\n\
		Bandage\t"GREEN_E"$100\n\
		", FormatMoney(MedicinePrice), FormatMoney(MedkitPrice));
		ShowPlayerDialog(playerid, DIALOG_APOTEK, DIALOG_STYLE_TABLIST_HEADERS, "Apotek", mstr, "Buy", "Cancel");
	}
	//Food and Seed
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -381.44, -1426.13, 25.93))
	{
		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Food\t"GREEN_E"%s\n\
		Seed\t"GREEN_E"%s\n\
		", FormatMoney(FoodPrice), FormatMoney(SeedPrice));
		ShowPlayerDialog(playerid, DIALOG_FOOD, DIALOG_STYLE_TABLIST_HEADERS, "Food", mstr, "Buy", "Cancel");
	}
	//Drugs
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 874.52, -15.98, 63.19))
	{
		if(pData[playerid][pMarijuana] >= 100) return Error(playerid, "Anda sudah membawa 100 kg Marijuana!");
		
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah marijuana:\nMarijuana Stock: "GREEN_E"%d\n"WHITE_E"Marijuana Price"GREEN_E"%s / item", Marijuana, FormatMoney(MarijuanaPrice));
		ShowPlayerDialog(playerid, DIALOG_DRUGS, DIALOG_STYLE_INPUT, "Buy Drugs", mstr, "Buy", "Cancel");
	}
	//Ayamfill
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 921.7545,-1299.1313,14.0938))
	{
		if(pData[playerid][AyamFillet] >= 100) return Error(playerid, "Anda sudah membawa 100 kg AyamFillet!");

		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah ayam:\nAyam Stock: "GREEN_E"%d\n"WHITE_E"Ayam Price"GREEN_E"%s / item", AyamFill, FormatMoney(AyamFillPrice));
		ShowPlayerDialog(playerid, DIALOG_AYAMFILL, DIALOG_STYLE_INPUT, "Buy Ayam", mstr, "Buy", "Cancel");
	}
	//crack
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -427.3773, -392.3799, 16.5802))
	{
		if(pData[playerid][pCrack] >= 8) return Error(playerid, "Anda sudah membawa 5 crack!");

		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah crack:\nCrack Stock: "GREEN_E"%d\n"WHITE_E"Crack Price"GREEN_E"%s / item", Crack, FormatMoney(CrackPrice));
		ShowPlayerDialog(playerid, DIALOG_CRACK, DIALOG_STYLE_INPUT, "Buy Crack", mstr, "Buy", "Cancel");
	}
	// Obat Myr
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -1772.3304, -2013.1531, 1500.7853))
	{
		if(pData[playerid][pObat] >= 100) return Error(playerid, "Anda sudah membawa 100 Obat Myr!");
		
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah Obat:\nObat Stock: "GREEN_E"%d\n"WHITE_E"Obat Price"GREEN_E"%s / item", ObatMyr, FormatMoney(ObatPrice));
		ShowPlayerDialog(playerid, DIALOG_OBAT, DIALOG_STYLE_INPUT, "Buy Obat", mstr, "Buy", "Cancel");
	}
	//Buy House
	foreach(new hid : Houses)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
		{
			if(hData[hid][hPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this houses.");
			if(strcmp(hData[hid][hOwner], "-")) return Error(playerid, "Someone already owns this house.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 10) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 11) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 12) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 13) return Error(playerid, "Kamu tidak dapat membeli rumah lebih.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -hData[hid][hPrice]);
			Server_AddMoney(hData[hid][hPrice]);
			GetPlayerName(playerid, hData[hid][hOwner], MAX_PLAYER_NAME);
			hData[hid][hOwnerID] = pData[playerid][pID];
			hData[hid][hVisit] = gettime();
			new str[150];
			format(str,sizeof(str),"[HOUSE]: %s membeli rumah id %d seharga %s!", GetRPName(playerid), hid, FormatMoney(hData[hid][hPrice]));
			LogServer("Property", str);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE houses SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", hData[hid][hOwner], hData[hid][hOwnerID], hData[hid][hVisit], hid);
			mysql_tquery(g_SQL, query);
			
			House_Refresh(hid);
		}
	}
	//Buy Bisnis
	foreach(new bid : Bisnis)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
		{
		    if(pData[playerid][pLicBiz] <= 0)
				return Error(playerid, "Anda tidak memiliki License Business.");

			if(bData[bid][bPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this bisnis.");
			if(strcmp(bData[bid][bOwner], "-") || bData[bid][bOwnerID] != 0) return Error(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 10) return Error(playerid, "Anda tidak dapat membeli bisnis lagi.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 11) return Error(playerid, "Anda tidak dapat membeli bisnis lagi.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 12) return Error(playerid, "Anda tidak dapat membeli bisnis lagi.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 13) return Error(playerid, "Anda tidak dapat membeli bisnis lagi.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[bid][bPrice]);
			Server_AddMoney(-bData[bid][bPrice]);
			GetPlayerName(playerid, bData[bid][bOwner], MAX_PLAYER_NAME);
			bData[bid][bOwnerID] = pData[playerid][pID];
			bData[bid][bVisit] = gettime();
			new str[150];
			format(str,sizeof(str),"[BIZ]: %s membeli bisnis id %d seharga %s!", GetRPName(playerid), bid, FormatMoney(bData[bid][bPrice]));
			LogServer("Property", str);
			
			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", bData[bid][bOwner], bData[bid][bOwnerID], bData[bid][bVisit], bid);
			mysql_tquery(g_SQL, query);

			Bisnis_Refresh(bid);
		}
	}
	//Buy Bisnis menu
	if(pData[playerid][pInBiz] >= 0 && IsPlayerInRangeOfPoint(playerid, 2.5, bData[pData[playerid][pInBiz]][bPointX], bData[pData[playerid][pInBiz]][bPointY], bData[pData[playerid][pInBiz]][bPointZ]))
	{
		Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
	}
	//Buy Vending Machine
	foreach(new vid : Vendings)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, VendingData[vid][vendingX], VendingData[vid][vendingY], VendingData[vid][vendingZ]))
		{
			if(VendingData[vid][vendingPrice] > GetPlayerMoney(playerid)) 
				return Error(playerid, "Not enough money, you can't afford this Vending.");

			if(strcmp(VendingData[vid][vendingOwner], "-") || VendingData[vid][vendingOwnerID] != 0) 
				return Error(playerid, "Someone already owns this Vending.");

			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_VendingCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Vending.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_VendingCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Vending.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_VendingCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Vending.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_VendingCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Vending.");
				#endif
			}

			SendClientMessageEx(playerid, COLOR_WHITE, "You has teleport to vending id %d", vid);
			GivePlayerMoneyEx(playerid, -VendingData[vid][vendingPrice]);
			Server_AddMoney(VendingData[vid][vendingPrice]);
			GetPlayerName(playerid, VendingData[vid][vendingOwner], MAX_PLAYER_NAME);
			VendingData[vid][vendingOwnerID] = pData[playerid][pID];
			new str[150];
			format(str,sizeof(str),"[VEND]: %s membeli vending id %d seharga %s!", GetRPName(playerid), vid, FormatMoney(VendingData[vid][vendingPrice]));
			LogServer("Property", str);
			
			Vending_RefreshText(vid);
			Vending_Save(vid);
		}
		//Buy Workshop
		foreach(new wid : Workshop)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]))
			{
				if(wsData[wid][wPrice] > GetPlayerMoney(playerid))
					return Error(playerid, "Not enough money, you can't afford this workshop.");
				if(wsData[wid][wOwnerID] != 0 || strcmp(wsData[wid][wOwner], "-")) 
					return Error(playerid, "Someone already owns this workshop.");

				#if LIMIT_PER_PLAYER > 0
				if(Player_WorkshopCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more workshop.");
				#endif

				GivePlayerMoneyEx(playerid, -wsData[wid][wPrice]);
				Server_AddMoney(wsData[wid][wPrice]);
				GetPlayerName(playerid, wsData[wid][wOwner], MAX_PLAYER_NAME);
				wsData[wid][wOwnerID] = pData[playerid][pID];
				new str[150];
				format(str,sizeof(str),"[WS]: %s membeli workshop id %d seharga %s!", GetRPName(playerid), wid, FormatMoney(wsData[wid][wPrice]));
				LogServer("Property", str);

				Workshop_Refresh(wid);
				Workshop_Save(wid);
			}
		}
	}
	return 1;
}

forward Revive(playerid);
public Revive(playerid)
{
	new otherid = GetPVarInt(playerid, "gcPlayer");
	TogglePlayerControllable(playerid,1);
	Servers(playerid, "Sukses revive");
	pData[playerid][pObat] -= 1;
    pData[otherid][pInjured] = 0;
    pData[otherid][pHospital] = 0;
    pData[otherid][pSick] = 0;
    pData[otherid][pHead] = 100;
    pData[otherid][pPerut] = 100;
    pData[otherid][pRHand] = 100;
    pData[otherid][pLHand] = 100;
    pData[otherid][pRFoot] = 100;
    pData[otherid][pLFoot] = 100;
}

forward DownloadTwitter(playerid);
public DownloadTwitter(playerid)
{
	pData[playerid][pTwitter] = 1;
	pData[playerid][pKuota] -= 38000;
	Servers(playerid, "Twitter berhasil di Download");
}

CMD:selfie(playerid,params[])
{
	if(takingselfie[playerid] == 0)
	{
	    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
		static Float: n1X, Float: n1Y;
		if(Degree[playerid] >= 360) Degree[playerid] = 0;
		Degree[playerid] += Speed;
		n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		takingselfie[playerid] = 1;
		ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
		return 1;
	}
    if(takingselfie[playerid] == 1)
	{
	    TogglePlayerControllable(playerid,1);
		SetCameraBehindPlayer(playerid);
	    takingselfie[playerid] = 0;
	    ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
	    return 1;
	}
    return 1;
}

CMD:claimsp(playerid, params)
{
	if(pData[playerid][pStarterpack] != 0)
	{
		return ErrorMsg(playerid, "Kamu sudah mengambil Starterpack!");
	}
	else
	{
		GivePlayerMoneyEx(playerid, 2500000);
		pData[playerid][pStarterpack] = 1;
		pData[playerid][pNasi] += 10;
		pData[playerid][pSusu] += 10;
		pData[playerid][pIDCard] = 0;
		pData[playerid][pIDCardTime] = gettime() + (30 * 86400);
		ShowItemBox(playerid, "Susu", "Mendapatkan 10x", 19570, 1);
		ShowItemBox(playerid, "Nasi", "Mendapatkan 10x", 2663, 2);
		ShowItemBox(playerid, "Ktp", "Mendapatkan 1x", 1581, 2);
		ShowItemBox(playerid, "uang", "Mendapatkan Rp.2,5jt", 1212, 4);
		new cQuery[1024];
		new Float:x,Float:y,Float:z, Float:a;
		GetPlayerPos(playerid, x ,y , z);
		GetPlayerFacingAngle(playerid, a);
		new model = 462, color1 = 1, color2 = 1;
		mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[playerid][pID], model, color1, color2, x, y, z, a);
		mysql_tquery(g_SQL, cQuery, "OnVehStarterpack", "dddddffff", playerid, pData[playerid][pID], model, color1, color2, x, y, z, a);
	}
	return 1;	

}

DelaysPlayer(playerid, p2)
{
	new str[(1024 * 2)], headers[500];
	strcat(headers, "Name\tTime\n");

	if(pData[p2][pExitJob] > 0)
    {
        format(str, sizeof(str), "%s{ff0000}Exit Jobs{ffffff}\t%i Second\n", str, ReturnTimelapse(gettime(), pData[p2][pExitJob]));
	}
	if(pData[p2][pJobTime] > 0)
    {
        format(str, sizeof(str), "%sJobs\t%i Second\n", str, pData[p2][pJobTime]);
	}
    if(pData[p2][pSweeperTime] > 0)
    {
        format(str, sizeof(str), "%sSweeper (Sidejob)\t%i Second\n", str, pData[p2][pSweeperTime]);
	}
	if(pData[p2][pForklifterTime] > 0)
    {
        format(str, sizeof(str), "%sForklifter (Sidejob)\t%i Second\n", str, pData[p2][pForklifterTime]);
	}
	if(pData[p2][pBusTime] > 0)
    {
        format(str, sizeof(str), "%sBus (Sidejob)\t%i Second\n", str, pData[p2][pBusTime]);
	}
	if(pData[p2][pMowerTime] > 0)
    {
        format(str, sizeof(str), "%sMower (Sidejob)\t%i Second\n", str, pData[p2][pMowerTime]);
	}
	
	strcat(headers, str);

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Delays", headers, "Okay", "");
	return 1;
}

CMD:delays(playerid, params)
{
	DelaysPlayer(playerid, playerid);
}

CMD:washmoney(playerid, params[])
{
	new merah = pData[playerid][pRedMoney];
	new rumus = (merah/200)*10; // 5 discount percent
 	new total = merah-rumus;
	if(pData[playerid][pRedMoney] < 0)
	{
		return ErrorMsg(playerid, "Kamu tidak memiliki uang merah.");
	}
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -427.3773, -392.3799, 16.5802))
	{
		return ErrorMsg(playerid, "Kamu harus berada di penukaran uang.");
	}
	Info(playerid, "Kamu mencuci uang dan menghasilkan %s.", FormatMoney(total));
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	pData[playerid][pRedMoney] -= total;
	GivePlayerMoneyEx(playerid, total);
	return 1;
}

CMD:clearchat(playerid, params[])
{
	ClearChat(playerid);
	return 1;
}

CMD:taclight(playerid, params[])
{
	if(!pData[playerid][pFlashlight]) 
		return Error(playerid, "Kamu tidak mempunyai senter.");
	if(pData[playerid][pUsedFlashlight] == 0)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid,8)) RemovePlayerAttachedObject(playerid,8);
		if(IsPlayerAttachedObjectSlotUsed(playerid,9)) RemovePlayerAttachedObject(playerid,9);
		SetPlayerAttachedObject(playerid, 8, 18656, 6, 0.25, -0.0175, 0.16, 86.5, -185, 86.5, 0.03, 0.1, 0.03);
		SetPlayerAttachedObject(playerid, 9, 18641, 6, 0.2, 0.01, 0.16, 90, -95, 90, 1, 1, 1);
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s attach the flashlight to the gun.", ReturnName(playerid));

		pData[playerid][pUsedFlashlight] = 1;
	}
	else
	{
		RemovePlayerAttachedObject(playerid,8);
		RemovePlayerAttachedObject(playerid,9);
		pData[playerid][pUsedFlashlight] =0;
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s take the flashlight off the gun.", ReturnName(playerid));
	}
	return 1;
}
CMD:flashlight(playerid, params[])
{
	if(!pData[playerid][pFlashlight])
		return Error(playerid, "Kamu tidak mempunyai senter.");

	if(pData[playerid][pUsedFlashlight] == 0)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid,8)) RemovePlayerAttachedObject(playerid,8);
		if(IsPlayerAttachedObjectSlotUsed(playerid,9)) RemovePlayerAttachedObject(playerid,9);
		SetPlayerAttachedObject(playerid, 8, 18656, 5, 0.1, 0.038, -0.01, -90, 180, 0, 0.03, 0.1, 0.03);
		SetPlayerAttachedObject(playerid, 9, 18641, 5, 0.1, 0.02, -0.05, 0, 0, 0, 1, 1, 1);
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s take out the flashlight and turn on the flashlight.", ReturnName(playerid));

		pData[playerid][pUsedFlashlight] =1;
	}
	else
	{
 		RemovePlayerAttachedObject(playerid,8);
		RemovePlayerAttachedObject(playerid,9);
		pData[playerid][pUsedFlashlight] =0;
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s turn off the flashlight and put it in.", ReturnName(playerid));
	}
	return 1;
}

/*CMD:blindfold(playerid,params[])
{
    new targetid;
	if(sscanf(params, "u", targetid))
	{
	    return Usage(playerid, "/blindfold [playerid]");
	}
	if(pData[playerid][pBlindfold] <= 0)
	{
	    return Error(playerid, "Kamu tidak memiliki blindfold");
	}
	if(!IsPlayerInVehicle(targetid, GetPlayerVehicleID(playerid)))
	{
	    return Error(playerid, "Orang yang ditentukan terputus.");
	}
	if(GetPlayerState(targetid) == PLAYER_STATE_DRIVER)
	{
	    return Error(playerid, "Kamu tidak bisa menutup mata pengemudi.");
	}
	if(targetid == playerid)
	{
	    return Error(playerid, "Kamu tidak bisa menutup matamu sendiri.");
	}
	if(pBlind[targetid])
	{
	    return Error(playerid, "Orang itu sudah ditutup matanya. '/unblindfold' untuk melepas.");
	}
	if(pData[targetid][pAdminDuty])
	{
	    return Error(playerid, "Kamu tidak dapat menutup mata Administrator");
	}

	pData[playerid][pBlindfold]--;

	GameTextForPlayer(targetid, "~r~Penutup Mata", 3000, 3);
	SendProximityMessage(playerid, 20.0, SERVER_COLOR, "{C2A2DA} %s menutup mata %s dengan bandana.", GetRPName(playerid), GetRPName(targetid));

	TogglePlayerControllable(targetid, 0);
	TextDrawShowForPlayer(targetid, Blind);
	pBlind[targetid] = 1;
    return 1;
}

CMD:unblindfold(playerid, params[])
{
	new targetid;

	if(sscanf(params, "u", targetid))
	{
	    return SCM(playerid, COLOR_SYNTAX, "Gunakan: /unblindfold [playerid]");
	}
	if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	{
	    return Error(playerid, "Orang yang ditentukan terputus atau jauh darimu.");
	}
	if(targetid == playerid)
	{
	    return Error(playerid, "Kamu tidak dapat membuka penutup mata dirimu sendiri.");
	}
	if(!pBlind[targetid])
	{
	    return Error(playerid, "Orang itu bukan penutup mata.");
	}
	if(IsPlayerInAnyVehicle(targetid) && !IsPlayerInVehicle(playerid, GetPlayerVehicleID(targetid)))
	{
	    return Error(playerid, "Kamu harus berada di dalam kendaraan pemain itu untuk membuka penutup matanya.");
	}

	GameTextForPlayer(targetid, "~g~Buka penutup mata", 3000, 3);
	SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s membuka penutup mata bandana dari %s.", GetRPName(playerid), GetRPName(targetid));

    TextDrawHideForPlayer(targetid, Blind);
	pBlind[targetid] = 0;
	return 1;
}*/

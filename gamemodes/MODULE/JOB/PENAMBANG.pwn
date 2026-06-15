CreatePointPenambang()
{
	new strings[150];
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2120.465576, 244.994247, 35.718391, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2120.465576, 244.994247, 35.718391, -1, -1, -1, 50);

	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2129.602783, 246.870574, 35.637325, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2129.602783, 246.870574, 35.637325, -1, -1, -1, 50);
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2126.851074, 274.000732, 36.036834, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2126.851074, 274.000732, 36.036834, -1, -1, -1, 50);
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2101.559082, 286.539398, 35.537796, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2101.559082, 286.539398, 35.537796, -1, -1, -1, 50);
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2093.238525, 289.009094, 35.639553, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2093.238525, 289.009094, 35.639553, -1, -1, -1, 50);
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Menambang");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2132.722412, 270.303680, 36.060974, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(905, 23, -2132.722412, 270.303680, 36.060974, -1, -1, -1, 50);
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Meleburkan Batu");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2080.745605, 251.336685, 35.598999, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(1239, 23, -2080.745605, 251.336685, 35.598999, -1, -1, -1, 50);
}

function nambang1(playerid)
{
	new dapetbatu = RandomEx(1,4);
	if(pData[playerid][pActivityTime] >= 100)
	{
	    pData[playerid][Batu] += dapetbatu;
	    pData[playerid][pMenambangStatus] -= 1;
	    pData[playerid][pActivityTime] = 0;
	    KillTimer(pData[playerid][timerambilbatu]);
	    HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	    PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	    RemovePlayerAttachedObject(playerid, 3);
	    TogglePlayerControllable(playerid, 1);
	    ClearAnimations(playerid);
		if(dapetbatu == 1)
		{
			ShowItemBox(playerid, "Batu", "Received_1x", 905, 2);
		}
		if(dapetbatu == 2)
		{
			ShowItemBox(playerid, "Batu", "Received_2x", 905, 2);
		}
		if(dapetbatu == 3)
		{
			ShowItemBox(playerid, "Batu", "Received_3x", 905, 2);
		}
		if(dapetbatu == 4)
		{
			ShowItemBox(playerid, "Batu", "Received_4x", 905, 2);
		}
	}
	else if(pData[playerid][pActivityTime] < 100)
    {
        pData[playerid][pActivityTime] += 5;
        SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
        ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.0, 1, 0, 0, 0, 0, 1);
		SetPlayerAttachedObject(playerid, 3, 18635, 6, 0.000000, -0.025000, 0.066000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
    }
	return 1;
}
CMD:wehdcweydshdddf(playerid, params[])
{
	if(pData[playerid][DutyPenambang])
    {
        new total = pData[playerid][Batu];
        if(total > 50) return ErrorMsg(playerid, "Batu terlalu penuh di Inventory! Maximal 50.");
        if(pData[playerid][pMenambangStatus] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
        if(pData[playerid][Batu] == 50) return ErrorMsg(playerid, "Anda sudah membawa 50 Batu!");
        TogglePlayerControllable(playerid, 0);
        ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.0, 1, 0, 0, 0, 0, 1);
		SetPlayerAttachedObject(playerid, 3, 18635, 6, 0.000000, -0.025000, 0.066000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
        pData[playerid][pMenambangStatus] += 1;
        pData[playerid][timerambilbatu] = SetTimerEx("nambang1", 400, true, "id", playerid);
        ShowProgressbar(playerid, "Menambang..", 9);
    }
	return 1;
}
enum E_PENAMBANG
{
    STREAMER_TAG_MAP_ICON:LockerMap,
    STREAMER_TAG_MAP_ICON:NambangMap,
    STREAMER_TAG_MAP_ICON:CuciMap,
    STREAMER_TAG_MAP_ICON:PeleburanMap,
    STREAMER_TAG_MAP_ICON:PenjualanMap,
	STREAMER_TAG_CP:LockerTambang,
	STREAMER_TAG_CP:TakeCarTambang,
	STREAMER_TAG_CP:Nambang,
	STREAMER_TAG_CP:Nambang2,
	STREAMER_TAG_CP:Nambang3,
	STREAMER_TAG_CP:Nambang4,
	STREAMER_TAG_CP:Nambang5,
	STREAMER_TAG_CP:Nambang6,
	STREAMER_TAG_CP:CuciBatu,
	STREAMER_TAG_CP:Peleburan,
	STREAMER_TAG_CP:Penjualan,
}

/*RefreshJobTambang(playerid)
{

	if(pData[playerid][DutyPenambang])
	{
		PenambangArea[playerid][Nambang] = CreateDynamicCP(-2120.465576, 244.994247, 35.718391, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang2] = CreateDynamicCP(-2129.602783, 246.870574, 35.637325, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang3] = CreateDynamicCP(-2126.851074, 274.000732, 36.036834, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang4] = CreateDynamicCP(-2101.559082, 286.539398, 35.537796, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang5] = CreateDynamicCP(-2093.238525, 289.009094, 35.639553, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang6] = CreateDynamicCP(-2132.722412, 270.303680, 36.060974, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][CuciBatu] = CreateDynamicCP(-2065.040039, 248.215011, 35.210678, 2.0, -1, -1, playerid, 30.0);
        PenambangArea[playerid][Peleburan] = CreateDynamicCP(-2080.745605, 251.336685, 35.598999, 2.0, -1, -1, playerid, 30.0);
		PenambangArea[playerid][NambangMap] = CreateDynamicMapIcon(-396.575592,1249.352050,6.749223, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][CuciMap] = CreateDynamicMapIcon(-2065.040039, 248.215011, 35.210678, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][PeleburanMap] = CreateDynamicMapIcon(-2080.745605, 251.336685, 35.598999, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
	}
	if(pData[playerid][DutyPenambang])
	{
		PenambangArea[playerid][Nambang] = CreateDynamicCP(--2120.465576, 244.994247, 35.718391, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang2] = CreateDynamicCP(-2129.602783, 246.870574, 35.637325, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang3] = CreateDynamicCP(-2126.851074, 274.000732, 36.036834, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang4] = CreateDynamicCP(-2101.559082, 286.539398, 35.537796, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang5] = CreateDynamicCP(-2093.238525, 289.009094, 35.639553, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang6] = CreateDynamicCP(-2132.722412, 270.303680, 36.060974, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][CuciBatu] = CreateDynamicCP(-2065.040039, 248.215011, 35.210678, 2.0, -1, -1, playerid, 30.0);
        PenambangArea[playerid][Peleburan] = CreateDynamicCP(-2080.745605, 251.336685, 35.598999, 2.0, -1, -1, playerid, 30.0);
		PenambangArea[playerid][NambangMap] = CreateDynamicMapIcon(-396.575592,1249.352050,6.749223, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][CuciMap] = CreateDynamicMapIcon(-2065.040039, 248.215011, 35.210678, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][PeleburanMap] = CreateDynamicMapIcon(-2080.745605, 251.336685, 35.598999, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
	}
	return 1;
}*/

CMD:uwdhewvdtwedbb(playerid, params[])
{
    if(pData[playerid][DutyPenambang])
    {
	    if(pData[playerid][pLeburStatus] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
	    if(pData[playerid][Batu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Batu Cucian");
	    TogglePlayerControllable(playerid, 0);
	    ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	    pData[playerid][pLeburStatus] += 1;
	    pData[playerid][timerpeleburanbatu] = SetTimerEx("leburkanbatuan", 400, true, "id", playerid);
	    ShowProgressbar(playerid, "Leburkan..", 9);
    }
	return 1;
}

function leburkanbatuan(playerid)
{
    new rand = RandomEx(1, 4);
    new str[64];
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][pActivityTime] >= 100)
    {
        TogglePlayerControllable(playerid, 1);
        if(rand == 1)
		{
			pData[playerid][Batu] -= 1;
			GivePlayerMoneyEx(playerid, 50000);
			ShowItemBox(playerid, "Uang", "Di dapat Rp.50.000", 1212, 2);
		}
		if(rand == 2)
		{
		    pData[playerid][pComponent] += 10;
		  	pData[playerid][Batu] -= 1;
			GivePlayerMoneyEx(playerid, 125000);
			ShowItemBox(playerid, "Uang", "Di dapat Rp.125.000", 1212, 2);
			ShowItemBox(playerid, "Component", "Di dapat 10x", 3096, 1);
		}
		if(rand == 3)
		{
			pData[playerid][Batu] -= 1;
			GivePlayerMoneyEx(playerid, 80000);
			ShowItemBox(playerid, "Uang", "Di dapat Rp.80.000", 1212, 2);
		}
  		if(rand == 4)
		{
			pData[playerid][Batu] -= 1;
			GivePlayerMoneyEx(playerid, 100000);
			ShowItemBox(playerid, "Uang", "Di dapat Rp.100.000", 1212, 2);
		}
        KillTimer(pData[playerid][timerpeleburanbatu]);
        pData[playerid][pActivityTime] = 0;
        pData[playerid][pLeburStatus] -= 1;
        HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
        PlayerTextDrawHide(playerid, ActiveTD[playerid]);
        ClearAnimations(playerid);
        return 1;
    }
    else if(pData[playerid][pActivityTime] < 100)
    {
        pData[playerid][pActivityTime] += 5;
        SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
        ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
    }
	return 1;
}

CMD:uvfbrtyhpukik(playerid, params[])
{
    new total = pData[playerid][bEmas];
    if( pData[playerid][bEmas] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Emas");
	new pay = pData[playerid][bEmas] * 20000;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][bEmas] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Emas", str, 19941, 4);
    Inventory_Update(playerid);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:ebydtcyvrvnfbv(playerid, params[])
{
    new total = pData[playerid][bAlumunium];
    if( pData[playerid][bAlumunium] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Alumunium");
	new pay = pData[playerid][bAlumunium] * 10000;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][bAlumunium] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Alumunium", str, 19809, 4);
    Inventory_Update(playerid);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}
CMD:pofcdbxvcfw(playerid, params[])
{
    new total = pData[playerid][pComponent];
    if( pData[playerid][pComponent] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Tembaga");
	new pay = pData[playerid][pComponent] * 5000;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pComponent] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Component", str, 3096, 1);
    Inventory_Update(playerid);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

function TungguNambang1(playerid)
{
	pData[playerid][pTimeTambang1] = 0;
	return 1;
}
function TungguNambang2(playerid)
{
	pData[playerid][pTimeTambang2] = 0;
	return 1;
}
function TungguNambang3(playerid)
{
	pData[playerid][pTimeTambang3] = 0;
	return 1;
}
function TungguNambang4(playerid)
{
	pData[playerid][pTimeTambang4] = 0;
	return 1;
}
function TungguNambang5(playerid)
{
	pData[playerid][pTimeTambang5] = 0;
	return 1;
}
function TungguNambang6(playerid)
{
	pData[playerid][pTimeTambang6] = 0;
	return 1;
}

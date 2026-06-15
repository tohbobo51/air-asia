CreatePointAyam()
{
	new strings[150];
	format(strings, sizeof(strings), "[AYAM HIDUP]\n{FFFFFF}Gunakan '{ffff00}ALT{ffffff}' Untuk Ambil Ayam Hidup");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2107.4541,-2400.1042,31.4123, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2107.4541,-2400.1042,31.4123, -1, -1, -1, 5.0);
	
	format(strings, sizeof(strings), "[Pemotongan]\n{FFFFFF}Gunakan '{ffff00}ALT{ffffff}' Untuk Memotong Ayam Hidup");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2110.5706,-2408.4841,31.3079, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2110.5706,-2408.4841,31.3079, -1, -1, -1, 5.0);

    format(strings, sizeof(strings), "[Packing Ayam]\n{FFFFFF}Gunakan '{ffff00}ALT{ffffff}' Untuk Membungkus Ayam Potong");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2117.5095,-2414.5049,31.2266, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, -2117.5095,-2414.5049,31.2266, -1, -1, -1, 5.0);
}

CMD:mapayam(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_AYAM, DIALOG_STYLE_LIST, "Butcher Menu", "Lokasi Jual Ayam\nLokasi Ambil Ayam", "Select", "Close");
    return 1;
}

CMD:ufhecudee(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 2.0, -2107.4541,-2400.1042,31.4123))
	{
		new total = pData[playerid][AyamHidup];
		if(total > 150) return ErrorMsg(playerid, "Ayam Hidup terlalu penuh di Inventory! Maximal 150.");
		if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "Anda Masih Proses Ayam");
		if(pData[playerid][AyamHidup] == 150) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Hidup!");
		{
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
		pData[playerid][pPemotongStatus] += 1;
		pData[playerid][timerambilayamhidup] = SetTimerEx("getchicken", 200, true, "id", playerid);
		ShowProgressbar(playerid, "Mengambil..", 4);
		}
	}
	else return Error(playerid, "Kamu Tidak Di Tempat Pengolah Ayam.");
	return 1;
}

/*function getchicken(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][AyamHidup] == 50) return Error(playerid, "Anda sudah membawa 50 Ayam Hidup!");
    {
        if(pData[playerid][pActivityTime] >= 100)
        {
            if(IsPlayerInRangeOfPoint(playerid, 2.0, -2107.4541,-2400.1042,31.4123))
            {
                    InfoMsg(playerid, "Anda telah berhasil mengambil Ayam Hidup.");
                    TogglePlayerControllable(playerid, 1);
                    InfoTD_MSG(playerid, 8000, "~g~Ayam Hidup +1");
                    pData[playerid][AyamHidup] += 1;
                    KillTimer(pData[playerid][pPemotong]);
                    pData[playerid][pActivityTime] = 0;
                    HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                    PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                    //pData[playerid][pEnergy] -= 3;
                    ClearAnimations(playerid);
            }
            else
            {
                KillTimer(pData[playerid][pPemotong]);
                pData[playerid][pActivityTime] = 0;
                HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                return 1;
            }
        }
        else if(pData[playerid][pActivityTime] < 100)
        {
            {
                pData[playerid][pActivityTime] += 5;
                SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
                ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, 0, 1, 1, 1, 1, 1);
            }
        }
    }
    return 1;
}*/

forward getchicken(playerid);
public getchicken(playerid)
{
    new rand = RandomEx(1, 4);
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][pActivityTime] >= 100)
    {
        TogglePlayerControllable(playerid, 1);
        if(rand == 1)
		{
			ShowItemBox(playerid, "AyamHidup", "Received_1x", 19078, 1);
		}
		if(rand == 2)
		{
			ShowItemBox(playerid, "AyamHidup", "Received_2x", 19078, 1);
		}
		if(rand == 3)
		{
			ShowItemBox(playerid, "AyamHidup", "Received_3x", 19078, 1);
		}
  		if(rand == 4)
		{
			ShowItemBox(playerid, "AyamHidup", "Received_4x", 19078, 1);
		}
        KillTimer(pData[playerid][timerambilayamhidup]);
        pData[playerid][pActivityTime] = 0;
        pData[playerid][pPemotongStatus] -= 1;
        pData[playerid][AyamHidup] += rand;
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

/*CMD:potongayam(playerid, params[])
{
    new total = pData[playerid][AyamPotong];
    if(total > 50) return Error(playerid, "Ayam Potong terlalu penuh di Inventory! Maximal 50.");
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, -2110.3020,-2408.2725,31.3098)) return Error(playerid, "Kamu Tidak Di Tempat Pengolah Ayam.");
    if(pData[playerid][pPemotongStatus] == 1) return Error(playerid, "Anda Masih Proses Ayam");
    if(pData[playerid][AyamPotong] == 50) return Error(playerid, "Anda sudah membawa 50 Ayam Potong!");
    if(pData[playerid][AyamHidup] < 1) return Error(playerid, "Kamu Tidak Mengambil Ayam Hidup.");
    TogglePlayerControllable(playerid, 0);
    Info(playerid, "Anda sedang Memotong Ayam!");
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
    pData[playerid][pPemotongStatus] += 1;
    pData[playerid][pPemotong] = SetTimerEx("frychicken", 1100, true, "id", playerid, 1);
    PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Memotong...");
    PlayerTextDrawShow(playerid, ActiveTD[playerid]);
    ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
    return 1;
}*/

CMD:ybefnucywe(playerid, params[])
{
	if(pData[playerid][pPemotongStatus] == 1) return Error(playerid, "Anda Masih potong Ayam");
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -2110.3020,-2408.2725,31.3098)) return Error(playerid, "Kamu Tidak Di Tempat Pemotongan Ayam.");
	if(pData[playerid][AyamPotong] == 150) return Error(playerid, "Anda sudah membawa 150 Ayam Potong!");
	if(pData[playerid][AyamHidup] < 1) return Error(playerid, "Kamu Tidak Memiliki Ayam Hidup.");
	{
		pData[playerid][pPemotongStatus] += 1;

		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
		pData[playerid][timerpotongayam] = SetTimerEx("frychicken", 250, true, "id", playerid);
		ShowProgressbar(playerid, "Memotong..", 5);
	}
    return 1;
}


/*function frychicken(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][AyamPotong] == 50) return Error(playerid, "Anda sudah membawa 50 Ayam Potong!");
    {
        if(pData[playerid][pActivityTime] >= 100)
        {
            if(IsPlayerInRangeOfPoint(playerid, 5.0, -2111.8376,-2410.1389,31.2962))
            {
                    InfoMsg(playerid, "Anda telah berhasil Memotong.");
                    TogglePlayerControllable(playerid, 1);
                    pData[playerid][AyamPotong] += 5;
                    pData[playerid][AyamHidup] -= 1;
                    KillTimer(pData[playerid][pPemotong]);
                    pData[playerid][pActivityTime] = 0;
                    HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                    PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                    pData[playerid][pEnergy] -= 2;
                    ClearAnimations(playerid);
                    ShowItemBox(playerid, "AyamHidup", "Removed_1x", 19078, 1);
                    ShowItemBox(playerid, "AyamPotong", "Received_5x", 2806, 1);
                    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
            }
            else
            {
                KillTimer(pData[playerid][pPemotong]);
                pData[playerid][pActivityTime] = 0;
                HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                return 1;
            }
        }
        else if(pData[playerid][pActivityTime] < 100)
        {
            if(IsPlayerInRangeOfPoint(playerid, 5.0, -2111.8376,-2410.1389,31.2962))
            {
                pData[playerid][pActivityTime] += 5;
                SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
                ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
            }
        }
    }
    return 1;
}*/

forward frychicken(playerid);
public frychicken(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][pActivityTime] >= 100)
    {
        TogglePlayerControllable(playerid, 1);
        KillTimer(pData[playerid][timerpotongayam]);
        pData[playerid][pActivityTime] = 0;
        pData[playerid][AyamPotong] += 5;
        pData[playerid][AyamHidup] -= 1;
        pData[playerid][pPemotongStatus] -= 1;
        ClearAnimations(playerid);
        ShowItemBox(playerid, "AyamHidup", "Removed_1x", 19078, 1);
        ShowItemBox(playerid, "AyamPotong", "Received_5x", 2806, 1);
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


/*CMD:packingayam(playerid, params[])
{
    new total = pData[playerid][AyamFillet];
    if(total > 50) return ErrorMsg(playerid, "Ayam Fillet terlalu penuh di Inventory! Maximal 50.");
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, -2117.5095,-2414.5049,31.2266)) return Error(playerid, "Kamu Tidak Di Tempat Pengolah Ayam.");
    if(pData[playerid][AyamFillet] == 50) return ErrorMsg(playerid, "Anda sudah membawa 50 Ayam Fillet!");
    if(pData[playerid][AyamPotong] < 3)
    return ErrorMsg(playerid, "Anda Butuh 3 Ayam Potong.");
    TogglePlayerControllable(playerid, 0);
    InfoMsg(playerid, "Anda sedang Membungkus Ayam!");
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
    pData[playerid][pPemotongStatus] += 1;
    pData[playerid][pPemotong] = SetTimerEx("packingchicken", 1000, true, "id", playerid, 1);
    PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Membungkus...");
    PlayerTextDrawShow(playerid, ActiveTD[playerid]);
    ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
    return 1;
}*/

CMD:lwvjnidue(playerid, params[])
{
	if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "Anda masih packing ayam");
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -2117.5095,-2414.5049,31.2266)) return ErrorMsg(playerid, "Kamu Tidak Di Tempat Packing Ayam.");
	if(pData[playerid][AyamPotong] < 1) return ErrorMsg(playerid, "Anda Tidak Punya Ayam Potong.");
	if(pData[playerid][AyamFillet] == 150) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Fillet!");
	{
		pData[playerid][pPemotongStatus] += 1;

		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
		pData[playerid][timerpackagingayam] = SetTimerEx("packingchicken", 250, true, "id", playerid);
		ShowProgressbar(playerid, "Membungkus..", 5);
		ShowItemBox(playerid, "AyamHidup", "Removed_3x", 19078, 1);
		ShowItemBox(playerid, "AyamPotong", "Received_1x", 2768, 1);
	}
    return 1;
}

/*function packingchicken(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][AyamFillet] == 50) return Error(playerid, "Anda sudah membawa 50 Ayam Fillet!");
    {
        if(pData[playerid][pActivityTime] >= 100)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, -2117.5095,-2414.5049,31.2266))
            {
                    Info(playerid, "Anda telah berhasil Mengpacking Ayam Potong.");
                    TogglePlayerControllable(playerid, 1);
                    pData[playerid][AyamFillet] += 1;
                    pData[playerid][AyamPotong] -= 3;
                    KillTimer(pData[playerid][pPemotong]);
                    pData[playerid][pActivityTime] = 0;
                    HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                    PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                    pData[playerid][pEnergy] -= 2;
                    ClearAnimations(playerid);
                    ShowItemBox(playerid, "AyamHidup", "Removed_3x", 19078, 1);
                    ShowItemBox(playerid, "AyamPotong", "Received_1x", 2768, 1);
            }
            else
            {
                KillTimer(pData[playerid][pPemotong]);
                pData[playerid][pActivityTime] = 0;
                HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
                PlayerTextDrawHide(playerid, ActiveTD[playerid]);
                return 1;
            }
        }
        else if(pData[playerid][pActivityTime] < 100)
        {
            {
                pData[playerid][pActivityTime] += 5;
                SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
                ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
            }
        }
    }
    return 1;
}*/

forward packingchicken(playerid);
public packingchicken(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(pData[playerid][pActivityTime] >= 100)
    {
        TogglePlayerControllable(playerid, 1);
        KillTimer(pData[playerid][timerpackagingayam]);
        pData[playerid][pActivityTime] = 0;
        pData[playerid][AyamFillet] += 1;
        pData[playerid][AyamPotong] -= 3;
        pData[playerid][pPemotongStatus] -= 1;
        ClearAnimations(playerid);
        ShowItemBox(playerid, "AyamHidup", "Removed_3x", 19078, 1);
        ShowItemBox(playerid, "AyamPotong", "Received_1x", 2768, 1);
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

CMD:jualayam(playerid, params[])
{

	if(!IsPlayerInRangeOfPoint(playerid, 3.5, -611.185302, -524.716674, 25.223440))
		return Error(playerid, "Kamu Tidak Berada Di Gudang Ayam!");

	if(pData[playerid][AyamFillet] < 1) return Error(playerid, "Kamu tidak memiliki ayam!");
	new pay = pData[playerid][AyamFillet] * 50000;
	new total = pData[playerid][AyamFillet];
	GivePlayerMoneyEx(playerid, pay);
	AyamFill += total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	Server_MinMoney(pay);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);

	Info(playerid, "You selling "RED_E"%d kg "WHITE_E"ayam to "GREEN_E"%s", total, FormatMoney(pay));
	pData[playerid][AyamFillet] = 0;
	return 1;
}

/*CMD:jualayam(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 901.1880,-1203.3790,16.9832)) return Error(playerid, "Kamu Tidak Di Area Industry.");
    if(pData[playerid][AyamFillet] < 1) return Error(playerid, "Kamu Tidak Memiliki Ayam Fillet.");

    GivePlayerMoneyEx(playerid, 50);

    pData[playerid][pAyambungkus] -= 1;
    InfoMsg(playerid, "Anda menjual Ayam Seharga "GREEN_E"Rp.50,000");
    return 1;
}*/



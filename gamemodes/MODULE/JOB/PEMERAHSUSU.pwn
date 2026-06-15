#define MAX_RANDOM_SUSU 8
new Float:PemerasSusuNew[8][3] =
{
	 {1040.479370, -300.935516, 73.693069},
	 {1040.479370, -313.036254, 73.693069},
	 {1040.479370, -310.036071, 73.693069},
	 {1040.479370, -306.935882, 73.693069},
	 {1040.479370, -303.835693, 73.693069},
	 {1050.976806, -302.535614, 73.6930696},
	 {1050.976806, -305.035766, 73.693069},
	 {1050.976806, -299.935455, 73.6930699}
};

CreatePointPemerasSusu()
{
	for(new PemerasSusu; PemerasSusu < MAX_RANDOM_SUSU; PemerasSusu++)
	{
	    CreatePickup(19570, 23, PemerasSusuNew[PemerasSusu][0], PemerasSusuNew[PemerasSusu][1], PemerasSusuNew[PemerasSusu][2], 0);
	    CreateDynamic3DTextLabel("{ffffff}Gunakan {00ffff}ALT {ffffff}Untuk Memeras Susu", COLOR_BLUE, PemerasSusuNew[PemerasSusu][0], PemerasSusuNew[PemerasSusu][1], PemerasSusuNew[PemerasSusu][2], 10.0);
	}
}

function meressusu(playerid)
{
	ShowItemBox(playerid, "Susu Mentah", "Mendapatkan 1x", 19569, 2);
	pData[playerid][pSusuOlahan] += 1;
	return 1;
}

function prosessusu(playerid)
{
	ShowItemBox(playerid, "Susu", "Mendapatkan 1x", 19570, 1);
	ShowItemBox(playerid, "Susu Mentah", "Mengeluarkan 1x", 19569, 2);
	pData[playerid][pSusu] += 1;
	pData[playerid][pSusuOlahan] -= 1;
	return 1;
}

function jualsusu(playerid)
{
	ShowItemBox(playerid, "uang", "Mendapatkan 1x", 1212, 4);
	ShowItemBox(playerid, "susu", "Mengeluarkan 1x", 19570, 1);
	pData[playerid][AyamPotong] -= 1;
	pData[playerid][pMoney] ++;
	return 1;
}

CMD:susutobrut1(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut2(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut3(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut4(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut5(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut6(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut7(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:susutobrut8(playerid, params[])
{
	if(pData[playerid][pJobmilkduty])
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pSusuOlahan] == 25) return ErrorMsg(playerid, "Anda sudah membawa 25 susu mentah");
	ShowProgressbar(playerid, "memeras susu..", 8);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	SetTimerEx("meressusu", 8000, false, "d", playerid);
	return 1;
}

CMD:prosessusutobrut(playerid, params[])
{
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
    if( pData[playerid][pSusuOlahan] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Susu Mentah");
    ShowProgressbar(playerid, "Memproses susu..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("prosessusu", 10000, false, "d", playerid);
	pData[playerid][pSusu] += 1;
    pData[playerid][pSusuOlahan] -= 1;
    GivePlayerMoneyEx(playerid, 50000);
	ShowItemBox(playerid, "Uang", "Di dapat Rp.50.000", 1212, 2);
	ShowItemBox(playerid, "Uang", "Di Keluarkan 1x", 19569, 2);
    Inventory_Update(playerid);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:jualsusutobrut(playerid, params[])
{
    new total = pData[playerid][pSusu];
    if( pData[playerid][pSusu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Susu");
	new pay = pData[playerid][pSusu] * 20000;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pSusu] -= total;
	new str[500];
	format(str, sizeof(str), "Mendapatkan_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, total);
	format(str, sizeof(str), "Mengeluarkan_%dx", total);
	ShowItemBox(playerid, "Susu", str, 19570, total);
    Inventory_Update(playerid);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}


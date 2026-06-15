#define MAX_RANDOM_KAYU 4
new Float:TukangKayuMas[4][3] =
{
	{-543.537597,-170.804534,78.006240},
	{-534.682800,-170.728393,78.006240},
	{-526.723144,-194.687545,78.004692},
	{-514.286560,-194.167083,77.906242}
};

CreatePointTukangKayu()
{
	for(new TukangKayu; TukangKayu < MAX_RANDOM_KAYU; TukangKayu++)
	{
	    CreatePickup(18867, 23, TukangKayuMas[TukangKayu][0], TukangKayuMas[TukangKayu][1], TukangKayuMas[TukangKayu][2], 0);
	    CreateDynamic3DTextLabel("{ffffff}Gunakan {00ffff}ALT {ffffff}Untuk Memotong Kayu", COLOR_BLUE, TukangKayuMas[TukangKayu][0], TukangKayuMas[TukangKayu][1], TukangKayuMas[TukangKayu][2], 10.0);
	}
}

function potongkayu(playerid)
{
	ShowItemBox(playerid, "kayu", "ADD_1x", 1463, 4);
	pData[playerid][pKayu] ++;
	return 1;
}

function proseskayu(playerid)
{
	ShowItemBox(playerid, "papan", "ADD_1x", 2969, 1);
	ShowItemBox(playerid, "kayu", "REMOVED_1x", 1463, 4);
	pData[playerid][pMaterial] ++;
	pData[playerid][pKayu] --;
	return 1;
}

function jualkayu(playerid)
{
	ShowItemBox(playerid, "uang", "ADD_1x", 1212, 4);
	ShowItemBox(playerid, "papan", "REMOVED_1x", 2969, 1);
	pData[playerid][pMoney] ++;
	pData[playerid][pMaterial] --;
	return 1;
}

CMD:potongkayu1(playerid, params[])
{
	if(GetPlayerWeapon(playerid) != WEAPON_CHAINSAW) return Error(playerid, "Anda membutuhkan Gergaji Mesin.");
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] == 10) return ErrorMsg(playerid, "Anda sudah membawa 10 kayu");
	ShowProgressbar(playerid, "memotong kayu..", 5);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("potongkayu", 5000, false, "d", playerid);
	return 1;
}

CMD:potongkayu2(playerid, params[])
{
	if(GetPlayerWeapon(playerid) != WEAPON_CHAINSAW) return Error(playerid, "Anda membutuhkan Gergaji Mesin.");
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] == 10) return ErrorMsg(playerid, "Anda sudah membawa 10 kayu");
	ShowProgressbar(playerid, "memotong kayu..", 5);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("potongkayu", 5000, false, "d", playerid);
	return 1;
}

CMD:potongkayu3(playerid, params[])
{
	if(GetPlayerWeapon(playerid) != WEAPON_CHAINSAW) return Error(playerid, "Anda membutuhkan Gergaji Mesin.");
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] == 10) return ErrorMsg(playerid, "Anda sudah membawa 10 kayu");
	ShowProgressbar(playerid, "memotong kayu..", 5);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("potongkayu", 5000, false, "d", playerid);
	return 1;
}

CMD:potongkayu4(playerid, params[])
{
	if(GetPlayerWeapon(playerid) != WEAPON_CHAINSAW) return Error(playerid, "Anda membutuhkan Gergaji Mesin.");
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] == 10) return ErrorMsg(playerid, "Anda sudah membawa 10 kayu");
	ShowProgressbar(playerid, "memotong kayu..", 5);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("potongkayu", 5000, false, "d", playerid);
	return 1;
}

CMD:potongkayu5(playerid, params[])
{
	if(GetPlayerWeapon(playerid) != WEAPON_CHAINSAW) return Error(playerid, "Anda membutuhkan Gergaji Mesin.");
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] == 10) return ErrorMsg(playerid, "Anda sudah membawa 10 kayu");
	ShowProgressbar(playerid, "memotong kayu..", 5);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("potongkayu", 5000, false, "d", playerid);
	return 1;
}

CMD:proseskayu1(playerid, params[])
{
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Kayu");
	ShowProgressbar(playerid, "Memproses kayu..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("proseskayu", 10000, false, "d", playerid);
	return 1;
}

CMD:proseskayu2(playerid, params[])
{
	if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	if(pData[playerid][pKayu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Kayu");
	ShowProgressbar(playerid, "Memproses kayu..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	SetTimerEx("proseskayu", 10000, false, "d", playerid);
	return 1;
}

CMD:jualpapan(playerid, params[])
{
    new total = pData[playerid][pMaterial];
    if(pData[playerid][pMaterial] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Papan");
	new pay = pData[playerid][pMaterial] * 50000;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pMaterial] -= total;
	new str[500];
	format(str, sizeof(str), "ADD_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, total);
	format(str, sizeof(str), "REMOVED_%dx", total);
	ShowItemBox(playerid, "Papan", str, 2969, total);
    Inventory_Update(playerid);
    ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	return 1;
}


function AdaOrangDiKendaraan(vehicleid)
{
	foreach(new i : Player)
	{
	    if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
	    {
	        return 1;
		}
	}
	return 0;
}

CMD:insu(playerid, params[])
{
	if(pData[playerid][pAdmin] < 2)
	{
	    return ErrorMsg(playerid, "Anda tidak memiliki akses untuk menggunakan perintah tersebut!");
	}
	//SendClientMessageToAllEx(ARWIN, "[AdmCmd]: "RED_E"%s "AWN"telah mengaktifkan pembersihan kendaraan fraksi dalam 60 detik.", pData[playerid][pAdminname]);
	SendClientMessageToAllEx(COLOR_RED, "[ASURANSI]: Mohon masuk kedalam kendaraan anda!, pembersihan kendaraan dikota dalam 60 detik.");
	SetTimer("InsuKeliling", 60000, false);
    foreach (new i : Player) 
	{
		PlayerTextDrawShow(i, AsterInsuKeliling[i][0]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][1]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][2]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][3]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][4]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][5]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][6]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][7]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][8]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][9]);
		PlayerPlaySound(i, 6401, 0,0,0);
		pData[i][pInsukelAstera] = 60;
	}
	return 1;
}
hook OnGameModeInit()
{  
    SetTimer("insuransikeliling", 3600000, true);
    return 1;
}

function insuransikeliling()
{
	SendClientMessageToAllEx(COLOR_RED, "[ASURANSI]: Mohon masuk kedalam kendaraan anda!, pembersihan kendaraan dikota dalam 60 detik.");
	SetTimer("InsuKeliling", 60000, false);
    foreach (new i : Player) 
	{
		PlayerTextDrawShow(i, AsterInsuKeliling[i][0]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][1]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][2]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][3]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][4]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][5]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][6]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][7]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][8]);
		PlayerTextDrawShow(i, AsterInsuKeliling[i][9]);
		pData[i][pInsukelAstera] = 60;
	}
	return 1;
}
//sesudahtimerwaktuhabis
function InsuKeliling()
{
	SendClientMessageToAllEx(ARWIN, "[ASURANSI]: Pembersihan telah selesai, silahkan lanjutkan aktifitas");
	foreach (new i : Player) 
	{
		PlayerTextDrawHide(i, AsterInsuKeliling[i][0]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][1]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][2]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][3]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][4]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][5]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][6]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][7]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][8]);
		PlayerTextDrawHide(i, AsterInsuKeliling[i][9]);
		pData[i][pInsukelAstera] = 0;
	}
    foreach(new i : PVehicles)
    {
        if(pvData[i][cPark] < 0 && pvData[i][cClaim] == 0)
        {
            if(AdaOrangDiKendaraan(pvData[i][cVeh])) continue;

            pvData[i][cClaim] = 1;
            
            if(IsValidVehicle(pvData[i][cVeh]))
                DestroyVehicle(pvData[i][cVeh]);
            
            pvData[i][cVeh] = INVALID_VEHICLE_ID;
        }
    }
    return 1;
}
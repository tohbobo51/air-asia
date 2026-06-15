#define MAX_RANDOM_INDIHOME 7
new Float:RandomIndiHome[7][3] =
{
	 {-68.932319,-1045.630981,20.619348},
	 {-169.818435,-964.842285,30.245483},
	 {-117.646240,-1234.314208,3.356834},
	 {-170.133575,-1363.823974,3.881113},
	 {-256.702697,-904.314147,44.830585},
	 {-318.527648,-849.138854,47.577476},
	 {-191.568664,-1461.484008,7.906981}
};

CreatePointIndiHome()
{
    new StrCodeIndiHome[260];
    CreateDynamicPickup(1275, 23, 1221.926269, -1811.559326, 16.493753, -1);
	format(StrCodeIndiHome, sizeof(StrCodeIndiHome), "{ffffff}GUNAKAN {00ffff}/DUTYINDIHOME {ffffff}UNTUK BEKERJA MENJADI PETUGAS INDIHOME");
	CreateDynamic3DTextLabel(StrCodeIndiHome, COLOR_BLUE, 1221.926269, -1811.559326, 16.493753, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
	
	CreateDynamicPickup(1239, 23, 1216.468139, -1811.514892, 16.393753, -1);
	format(StrCodeIndiHome, sizeof(StrCodeIndiHome), "{ffffff}GUNAKAN {ff0000}/HOMECAR {ffffff}UNTUK MEGAMBIL KENDARAAN INDIHOME");
	CreateDynamic3DTextLabel(StrCodeIndiHome, COLOR_BLUE, 1216.468139, -1811.514892, 16.393753, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //

	for(new IndiHome; IndiHome < MAX_RANDOM_INDIHOME; IndiHome++)
	{
	    CreatePickup(1252, 23, RandomIndiHome[IndiHome][0], RandomIndiHome[IndiHome][1], RandomIndiHome[IndiHome][2], 0);
	    CreateDynamic3DTextLabel("SERVICE INDIHOME\n /SERVICEHOME\n >> UNTUK MELAKUKAN SERVICE", COLOR_BLUE, RandomIndiHome[IndiHome][0], RandomIndiHome[IndiHome][1], RandomIndiHome[IndiHome][2], 10.0);
	}
}

CMD:DutyIndiHome(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 7, 1221.926269, -1811.559326, 16.493753)) return Error(playerid, "Anda Harus Berada Di Markas IndiHome");
    if(!DutyIndiHome[playerid])
	{
		DutyIndiHome[playerid] = 1;
		if(pData[playerid][pGender] == 1) SetPlayerSkin(playerid, 260);
		else SetPlayerSkin(playerid, 93);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
		Info(playerid, "Berhasil OnDuty IndiHome");
		Info(playerid, "Gunakan /HomeService Untuk Bekerja");
	}
	else
	{
		DutyIndiHome[playerid] = 0;
		IndiHomeStart[playerid] = 0;
		SetPlayerSkin(playerid, pData[playerid][pSkin]);
		Info(playerid, "Berhasil Off Duty IndiHome");
	}
	return 1;
}

CMD:servicehome(playerid)
{
	new RandTerbaru = AgusSampSystem[playerid];
    if(!IsPlayerInRangeOfPoint(playerid, 4, RandomIndiHome[RandTerbaru][0], RandomIndiHome[RandTerbaru][1], RandomIndiHome[RandTerbaru][2])) return Error(playerid, "Anda Harus Berada Di Tiang IndiHome");
    if(DutyIndiHome[playerid] == 0) return Error(playerid, "Anda Belum Bekerjaan Sebagai Petugas IndiHome");
    if(IndiHomeStart[playerid] == 0) return Error(playerid, "Anda Belum Memulai Gunakan /HomeService");
	IndiHomeService[playerid] += 1;
	IndiHomeStart[playerid] = 0;
	ShowProgressbar(playerid, "Memperbaiki..", 7);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	GivePlayerMoneyEx(playerid, 150000, "GAJI INDIHOME");
	Info(playerid, "Berhasil Service Tilang Listrik /homeservice Untuk Melanjutkan");
	Info(playerid, "Anda Di Gaji Untuk Tiang Listrik Ini Rp.150.000");
	return 1;
}

CMD:homeservice(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 7, 1227.284790,-1833.625610,12.985206)) return Error(playerid, "Anda Harus Berada Di Markas IndiHome");
    if(DutyIndiHome[playerid] == 0) return Error(playerid, "Anda Belum Bekerjaan Sebagai Petugas IndiHome");
    if(IndiHomeStart[playerid] == 1) return Error(playerid, "Anda Sudah Melakukan Pencarian Tiang");
    
    new rand = random(7);
    SetPlayerCheckpoint(playerid, RandomIndiHome[rand][0], RandomIndiHome[rand][1], RandomIndiHome[rand][2], 7.0);
    IndiHomeStart[playerid] = 1;
    AgusSampSystem[playerid] = rand;
    Info(playerid, "Anda Sekarang Berhasil Menemukan Tiang Rusak Segera Ke Sana");
	return 1;
}

CMD:homecar(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 4, 1216.468139, -1811.514892, 16.393753)) return Error(playerid, "Anda Harus Berada Di Vehicle IndiHome");
    if(DutyIndiHome[playerid] == 0) return Error(playerid, "Anda Belum Bekerjaan Sebagai Petugas IndiHome");
    if(!IndiHomeVeh[playerid])
	{
		IndiHomeVeh[playerid] = 2;

		VehicleJobs = CreateVehicle(552, 1227.284790,-1833.625610,12.985206, random(128), random(128), 60);

		PutPlayerInVehicle(playerid, VehicleJobs, 0);
		SetVehicleParamsEx(VehicleJobs,1,0,0,0,0,0,0);

		vehicle3Dtext[VehicleJobs] = Create3DTextLabel( "KENDARAAN PETUGAS INDIHOME", -1, 0.0, 0.0, 0.0, 50.0, 0, 1 );
	    Attach3DTextLabelToVehicle(vehicle3Dtext[VehicleJobs] , VehicleJobs, 0.0, 0.0, 2.0);

		Info(playerid, "Berhasil Megambil Kendaraan");
	}
	else
	{
		Error(playerid, "Anda Sudah Melakukan Nya");
	}
	return 1;
}

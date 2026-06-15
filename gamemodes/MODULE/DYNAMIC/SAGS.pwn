CMD:despawnsags(playerid, params[])
{
	// Sags Vehicle
	if(IsPlayerInRangeOfPoint(playerid, 8.0, 1093.72, -1765.4, 13.3449) || IsPlayerInRangeOfPoint(playerid, 8.0, 1424.6909, -1789.1492, 33.4297))
	{
		if(pData[playerid][pFaction] != 2)
	        return Error(playerid, "You must be at SAGS officer faction!.");
	        
		new vehicleid = GetPlayerVehicleID(playerid);
        if(pData[playerid][pFactionVeh] != vehicleid)
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");

    	DestroyVehicle(pData[playerid][pFactionVeh]);
		pData[playerid][pFactionVeh] = 0;
    	GameTextForPlayer(playerid, "~w~SAGS Vehicles ~r~Despawned", 3500, 3);
    }
    return 1;
}
CMD:spawnsags(playerid, params[])
{
    // Sags Vehicle
	if(IsPlayerInRangeOfPoint(playerid, 8.0, 1093.72, -1765.4, 13.3449))
	{
		if(pData[playerid][pFaction] != 2)
	        return Error(playerid, "You must be at  officer faction!.");

		//if(pData[playerid][pSpawnSags] == 1) return Error(playerid,"Anda sudah mengeluarkan 1 kendaraan.!");

	    new Zanv[10000], String[10000];
	    strcat(Zanv, "Vehicles Name\tType\n");
		format(String, sizeof(String), "Sags\tCars\n");// 596
		strcat(Zanv, String);
		format(String, sizeof(String), "Sags\tMotorcycle\n");// 597
		strcat(Zanv, String);
		format(String, sizeof(String), "Helicopter\tMotor Mabur\n");// 598
		strcat(Zanv, String);/*
		format(String, sizeof(String), "Helicopter 2\tCars\n"); // 599
		strcat(Zann, String);
		format(String, sizeof(String), "Premier\tSport Cars\n"); // 599
		strcat(Zann, String);*/
		ShowPlayerDialog(playerid,DIALOG_SAGS_GARAGE, DIALOG_STYLE_TABLIST_HEADERS,"Kendaraan Sags", Zanv, "Spawn","Cancel");
	}
	return 1;
}

// STATISTIC VEHICLE SAGS //
#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_SAGS_GARAGE)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1093.72, -1765.4, 13.3449))
				{
					pData[playerid][pFactionVeh] = CreateVehicle(409, 1093.72, -1765.4, 13.3449,273.5804, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SAGS Vehicles '"YELLOW_E"/despawnsags"WHITE_E"' to despawn vehicles");
			}
			case 1:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1093.72, -1765.4, 13.3449))
				{
					pData[playerid][pFactionVeh] = CreateVehicle(522, 1093.72, -1765.4, 13.3449,273.5804, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SAGS Vehicles '"YELLOW_E"/despawnsags"WHITE_E"' to despawn vehicles");
			}
			case 2:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1093.72, -1765.4, 13.3449))
				{
					pData[playerid][pFactionVeh] = CreateVehicle(487, 1093.72, -1765.4, 13.3449, 2.2475, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SAGS Vehicles '"YELLOW_E"/despawnsags"WHITE_E"' to despawn vehicles");
			}/*
			case 2:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1131.5339, -1332.3248, 13.5797))
				{
					SAMDVeh[playerid] = CreateVehicle(563, 1162.8176, -1313.8239, 32.2215, 270.7216, 0, 1,120000, 0);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SAMD Vehicles '"YELLOW_E"/despawnmd"WHITE_E"' to despawn vehicles");
			}
			case 3:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1131.5339, -1332.3248, 13.5797))
				{
					SAMDVeh[playerid] = CreateVehicle(487, 1162.8176, -1313.8239, 32.2215, 270.7216,0,1,120000,0);
				}
				Info(playerid, "You have succefully spawned SAMD Vehicles '"YELLOW_E"/despawnmd"WHITE_E"' to despawn vehicles");
			}
			case 4:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1131.5339, -1332.3248, 13.5797))
				{
					SAMDVeh[playerid] = CreateVehicle(426, 1120.0265, -1317.1208, 13.8679, 271.4225,0,1,120000,0);
					AddVehicleComponent(SAMDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SAMD Vehicles '"YELLOW_E"/despawnmd"WHITE_E"' to despawn vehicles");
			}*/
		}
		PutPlayerInVehicle(playerid, pData[playerid][pFactionVeh], 0);
	}
    return 1;
}
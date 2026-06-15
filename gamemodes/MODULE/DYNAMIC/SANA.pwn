CMD:despawnsana(playerid, params[])
{
	// Sana Vehicle
	if(IsPlayerInRangeOfPoint(playerid, 8.0, 743.5262, -1332.2343, 13.8414) || IsPlayerInRangeOfPoint(playerid, 8.0, 741.9764,-1371.2441,25.8835))
	{
		if(pData[playerid][pFaction] != 4)
	        return Error(playerid, "You must be at Sana officer faction!.");
	        
		new vehicleid = GetPlayerVehicleID(playerid);
        if(!IsEngineVehicle(vehicleid))
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");

    	DestroyVehicle(pData[playerid][SANAVeh]);
		pData[playerid][pSpawnSana] = 0;
    	GameTextForPlayer(playerid, "~w~SANA Vehicles ~r~Despawned", 3500, 3);
    }
    return 1;
}
CMD:spawnsana(playerid, params[])
{
    // Sana Vehicle
	if(IsPlayerInRangeOfPoint(playerid, 8.0, 743.5262, -1332.2343, 13.8414))
	{
		if(pData[playerid][pFaction] != 4)
	        return Error(playerid, "You must be at Sana officer faction!.");

		if(pData[playerid][pSpawnSana] == 1) return Error(playerid,"Anda sudah mengeluarkan 1 kendaraan.!");

	    new Zann[10000], String[10000];
	    strcat(Zann, "Vehicles Name\tType\n");
		format(String, sizeof(String), "Sanew\tCars\n");// 596
		strcat(Zann, String);
		format(String, sizeof(String), "Sanew\tMotorcycle\n");// 597
		strcat(Zann, String);
		format(String, sizeof(String), "Helicopter\tMotor Mabur\n");// 598
		strcat(Zann, String);
		ShowPlayerDialog(playerid,DIALOG_SANA_GARAGE, DIALOG_STYLE_TABLIST_HEADERS,"Static Vehicles San Andreas Agency", Zann, "Spawn","Cancel");
	}
	return 1;
}

// STATISTIC VEHICLE SANA //
#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_SANA_GARAGE)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 743.5262, -1332.2343, 13.8414))
				{
					pData[playerid][SANAVeh] = CreateVehicle(582, 751.3419,-1345.3467,13.8993,265.8653, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SANA Vehicles '"YELLOW_E"/despawnsana"WHITE_E"' to despawn vehicles");
			}
			case 1:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 743.5262, -1332.2343, 13.8414))
				{
					pData[playerid][SANAVeh] = CreateVehicle(586, 751.3419,-1345.3467,13.8993,265.8653, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SANA Vehicles '"YELLOW_E"/despawnsana"WHITE_E"' to despawn vehicles");
			}
			case 2:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 743.5262, -1332.2343, 13.8414))
				{
					pData[playerid][SANAVeh] = CreateVehicle(488, 741.9764, -1371.2441, 25.8835, 359.9998, 0, 1, 120000, 1);
					//AddVehicleComponent(SAPDVeh[playerid], 1098);
				}
				Info(playerid, "You have succefully spawned SANA Vehicles '"YELLOW_E"/despawnsana"WHITE_E"' to despawn vehicles");
			}
		}
		pData[playerid][pSpawnSana] = 1;
		PutPlayerInVehicle(playerid, pData[playerid][SANAVeh], 0);
	}
    return 1;
}

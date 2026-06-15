/*


         TASK OPTIMIZED LUNARPRIDE

*/

ptask PlayerDelay[1000](playerid)
{
	if(pData[playerid][IsLoggedIn] == false) return 0;
	NgecekCiter(playerid);
		//VIP Expired Checking
	if(pData[playerid][pVip] > 0)
	{
		if(pData[playerid][pVipTime] != 0 && pData[playerid][pVipTime] <= gettime())
		{
			Info(playerid, "Maaf, Level VIP player anda sudah habis! sekarang anda adalah player biasa!");
			pData[playerid][pVip] = 0;
			pData[playerid][pVipTime] = 0;
		}
	}
		//ID Card Expired Checking
	if(pData[playerid][pIDCard] > 0)
	{
		if(pData[playerid][pIDCardTime] != 0 && pData[playerid][pIDCardTime] <= gettime())
		{
			Info(playerid, "Masa berlaku ID Card anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pIDCard] = 0;
			pData[playerid][pIDCardTime] = 0;
		}
	}

	if(pData[playerid][pExitJob] != 0 && pData[playerid][pExitJob] <= gettime())
	{
		Info(playerid, "Now you can exit from your current job!");
		pData[playerid][pExitJob] = 0;
	}
	if(pData[playerid][pDriveLic] > 0)
	{
		if(pData[playerid][pDriveLicTime] != 0 && pData[playerid][pDriveLicTime] <= gettime())
		{
			Info(playerid, "Masa berlaku Driving anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pDriveLic] = 0;
			pData[playerid][pDriveLicTime] = 0;
		}
	}
	if(pData[playerid][pWeaponLic] > 0)
	{
		if(pData[playerid][pWeaponLicTime] != 0 && pData[playerid][pWeaponLicTime] <= gettime())
		{
			Info(playerid, "Masa berlaku License Weapon anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pWeaponLic] = 0;
			pData[playerid][pWeaponLicTime] = 0;
		}
	}
		//Player JobTime Delay
	if(pData[playerid][pJobTime] > 0)
	{
		pData[playerid][pJobTime]--;
	}
	if(pData[playerid][pSideJobTime] > 0)
	{
		pData[playerid][pSideJobTime]--;
	}
	if(pData[playerid][pSweeperTime] > 0)
	{
		pData[playerid][pSweeperTime]--;
	}
	if(pData[playerid][pForklifterTime] > 0)
	{
		pData[playerid][pForklifterTime]--;
	}
	if(pData[playerid][pBusTime] > 0)
	{
		pData[playerid][pBusTime]--;
	}
	if(pData[playerid][pMowerTime] > 0)
	{
		pData[playerid][pMowerTime]--;
	}
	//Twitter Post
	if(pData[playerid][pTwitterPostCooldown] > 0)
	{
		pData[playerid][pTwitterPostCooldown]--;
	}
	//Twitter Changename
	if(pData[playerid][pTwitterNameCooldown] > 0)
	{
		pData[playerid][pTwitterNameCooldown]--;
	}
	
		// Duty Delay
	if(pData[playerid][pDutyHour] > 0)
	{
		pData[playerid][pDutyHour]--;
	}
		// Rob Delay
	if(pData[playerid][pRobTime] > 0)
	{
		pData[playerid][pRobTime]--;
	}
		// Get Loc timer
	if(pData[playerid][pSuspectTimer] > 0)
	{
		pData[playerid][pSuspectTimer]--;
	}
	if(pData[playerid][pDelayIklan] > 0)
	{
		pData[playerid][pDelayIklan]--;
	}
		//Warn Player Check
	if(pData[playerid][pWarn] >= 20)
	{
		new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
		GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
		GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
		pData[playerid][pWarn] = 0;
			//SetPlayerPosition(playerid, 227.46, 110.0, 999.02, 360.0000, 10);
		BanPlayerMSG(playerid, playerid, "20 Total Warning", true);
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Player %s(%d) telah otomatis dibanned permanent dari server. [Reason: 20 Total Warning]", giveplayer, playerid);

		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', '20 Total Warning', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
		mysql_tquery(g_SQL, query);
		KickEx(playerid);
	}
	return 1;
}

ptask FarmDetect[1000](playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
	{
		if(pData[playerid][pPlant] >= 20)
		{
			pData[playerid][pPlant] = 0;
			pData[playerid][pPlantTime] = 600;
		}
		if(pData[playerid][pPlantTime] > 0)
		{
			pData[playerid][pPlantTime]--;
			if(pData[playerid][pPlantTime] < 1)
			{
				pData[playerid][pPlantTime] = 0;
				pData[playerid][pPlant] = 0;
			}
		}
		new pid = GetClosestPlant(playerid);
		if(pid != -1)
		{
			if(IsPlayerInDynamicCP(playerid, PlantData[pid][PlantCP]) && pid != -1)
			{
				new type[24], mstr[128];
				if(PlantData[pid][PlantType] == 1)
				{
					type = "Potato";
				}
				else if(PlantData[pid][PlantType] == 2)
				{
					type = "Wheat";
				}
				else if(PlantData[pid][PlantType] == 3)
				{
					type = "Orange";
				}
				else if(PlantData[pid][PlantType] == 4)
				{
					type = "Marijuana";
				}
				if(PlantData[pid][PlantTime] > 1)
				{
					format(mstr, sizeof(mstr), "~w~Plant Type: ~g~%s ~n~~w~Plant Time: ~r~%s", type, ConvertToMinutes(PlantData[pid][PlantTime]));
					InfoTD_MSG(playerid, 1000, mstr);
				}
				else
				{
					format(mstr, sizeof(mstr), "~w~Plant Type: ~g~%s ~n~~w~Plant Time: ~g~Now", type);
					InfoTD_MSG(playerid, 1000, mstr);
				}
			}
		}
	}
	return 1;
}

ptask playerTimer[1000](playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
	{
		
		pData[playerid][pSeconds] ++, pData[playerid][pCurrSeconds] ++;
		if(pData[playerid][pOnDuty] >= 1)
		{
			pData[playerid][pOnDutyTime]++;
		}
		if(pData[playerid][pTaxiDuty] >= 1)
		{
			pData[playerid][pTaxiTime]++;
		}
		if(theftInfo[tTime] > 0)
		{
			theftInfo[tTime]--;
		}
		if(pData[playerid][pSeconds] == 10800
)
		{
			new scoremath = ((pData[playerid][pLevel])*5);

			pData[playerid][pMinutes]++, pData[playerid][pCurrMinutes] ++;
			pData[playerid][pSeconds] = 0, pData[playerid][pCurrSeconds] = 0;

			switch(pData[playerid][pMinutes])
			{				
					}
					pData[playerid][pHours] ++;
					pData[playerid][pLevelUp] += 1;
					pData[playerid][pMinutes] = 0;
					UpdatePlayerData(playerid);

					if(pData[playerid][pLevelUp] >= scoremath)
					{
						new mstr[128];
						pData[playerid][pLevel] += 1;
						pData[playerid][pHours] ++;
						SetPlayerScore(playerid, pData[playerid][pLevel]);
						format(mstr,sizeof(mstr),"~g~Level Up!~n~~w~Sekarang anda level ~r~%d", pData[playerid][pLevel]);
						GameTextForPlayer(playerid, mstr, 6000, 1);
					}
				}
			}
			if(pData[playerid][pCurrMinutes] == 25)
			{
				pData[playerid][pCurrMinutes] = 0;
				pData[playerid][pCurrHours] ++;
			}
		}


/* 
	[ LOADING BAR BY LUMINOUZ AND REMWORK BY Zeezy#0001]
	[ DON'T SELL, ITS FREE]
*/
#if defined _loadingbar_included2
  #endinput
#endif
#define _loadingbar_included2

static  PlayerText:LoadingBar2[MAX_PLAYERS][13],
        LoadingTimer2[MAX_PLAYERS],
        LoadingValue2[MAX_PLAYERS],
        bool:IsLoading2[MAX_PLAYERS];

stock Loading_Remove2(playerid)
{
	for(new i = 0; i < 13; i++)
	{
		PlayerTextDrawDestroy(playerid, LoadingBar2[playerid][i]);
	}
	LoadingValue2[playerid] = 0;
	IsLoading2[playerid] = false;
	return 1;
}

stock UpdateLoading2(playerid)//ongkone
{
	new str[100];
	format(str, sizeof(str), "%d%", LoadingValue2[playerid]);
	PlayerTextDrawSetString(playerid, LoadingBar2[playerid][11], str);
	PlayerTextDrawShow(playerid, LoadingBar2[playerid][11]);
	return 1;
}

stock Loading_BarUpdate2(playerid)
{
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][2], 5.50, LoadingValue2[playerid]*-36.5/100);
	PlayerTextDrawShow(playerid, LoadingBar2[playerid][2]);
}

forward Loading_TimerUpdate2(playerid);
public Loading_TimerUpdate2(playerid)
{
	if(!IsValidLoadingBar2(playerid))
		return 0;

	if(LoadingValue2[playerid] < 100)
	{
		LoadingValue2[playerid]++;
		Loading_BarUpdate2(playerid);
	}
	else
	{
		StopPlayerLoadingBar2(playerid);
	}
	return 1;
}

/* Used Functions */

stock IsValidLoadingBar2(playerid)
	return IsLoading2[playerid];

stock ShowProgressbar2(playerid, text[] = "", interval)
{
	if(IsValidLoadingBar2(playerid))
		StopPlayerLoadingBar2(playerid);
	if(pData[playerid][pProgress2] > 0) return 1;
	pData[playerid][pProgress2] = 1;
	new time = interval*10;

	LoadingBar2[playerid][0] = CreatePlayerTextDraw(playerid, 276.000000, 215.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][0], 9.500000, 41.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][0], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][0], -4091393);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][0], 0);

	LoadingBar2[playerid][1] = CreatePlayerTextDraw(playerid, 277.000000, 216.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][1], 7.500000, 39.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][1], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][1], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][1], 0);

	LoadingBar2[playerid][2] = CreatePlayerTextDraw(playerid, 278.000000, 254.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][2], 5.500000, -36.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][2], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][2], -4091393);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][2], 0);

	LoadingBar2[playerid][3] = CreatePlayerTextDraw(playerid, 277.000000, 233.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][3], 7.500000, 1.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][3], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][3], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][3], 0);

	LoadingBar2[playerid][4] = CreatePlayerTextDraw(playerid, 277.000000, 225.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][4], 7.500000, 1.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][4], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][4], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][4], 0);

	LoadingBar2[playerid][5] = CreatePlayerTextDraw(playerid, 277.000000, 220.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][5], 7.500000, 1.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][5], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][5], 0);

	LoadingBar2[playerid][6] = CreatePlayerTextDraw(playerid, 277.000000, 229.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][6], 7.500000, 1.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][6], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][6], 0);

	LoadingBar2[playerid][7] = CreatePlayerTextDraw(playerid, 277.000000, 237.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][7], 7.500000, 1.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][7], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][7], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][7], 0);

	LoadingBar2[playerid][8] = CreatePlayerTextDraw(playerid, 277.000000, 241.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][8], 7.500000, 1.500000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][8], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][8], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][8], 0);

	LoadingBar2[playerid][9] = CreatePlayerTextDraw(playerid, 277.000000, 246.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][9], 7.500000, 1.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][9], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][9], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][9], 0);

	LoadingBar2[playerid][10] = CreatePlayerTextDraw(playerid, 277.000000, 250.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][10], 4);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][10], 7.500000, 1.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][10], 1);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][10], 255);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][10], 0);

	LoadingBar2[playerid][11] = CreatePlayerTextDraw(playerid, 282.000000, 257.000000, "100%");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][11], 1);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][11], 0.145833, 0.750000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][11], 2);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][11], 0);

	LoadingBar2[playerid][12] = CreatePlayerTextDraw(playerid, 280.000000, 264.000000, "Eat Burger...");
	PlayerTextDrawFont(playerid, LoadingBar2[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, LoadingBar2[playerid][12], 0.166666, 0.800000);
	PlayerTextDrawTextSize(playerid, LoadingBar2[playerid][12], 327.500000, 91.000000);
	PlayerTextDrawSetOutline(playerid, LoadingBar2[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, LoadingBar2[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, LoadingBar2[playerid][12], 2);
	PlayerTextDrawColor(playerid, LoadingBar2[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, LoadingBar2[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, LoadingBar2[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, LoadingBar2[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, LoadingBar2[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, LoadingBar2[playerid][12], 0);


	PlayerTextDrawSetString(playerid, LoadingBar2[playerid][12], text);

    PlayerTextDrawShow(playerid, LoadingBar2[playerid][0]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][1]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][2]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][3]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][4]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][5]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][6]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][7]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][8]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][9]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][10]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][11]);
    PlayerTextDrawShow(playerid, LoadingBar2[playerid][12]);
	LoadingValue2[playerid] = 0;
	IsLoading2[playerid] = true;
	LoadingTimer2[playerid] = SetTimerEx(#Loading_TimerUpdate2, time, true, "d", playerid);
	return 1;
}

stock StopPlayerLoadingBar2(playerid)
{
    KillTimer(LoadingTimer2[playerid]);
    Loading_Remove2(playerid);

	//ClearAnimations(playerid);

}
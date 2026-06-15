#define MAX_STORAGE 50
#define MAX_STORAGE_INT 10000

enum stinfo
{
	stOwner[MAX_PLAYER_NAME],
	stPrice,
	stComponent,
	stMaterial,
	stMoney,
	stRedMoney,
	stMarijuana,
	stBorax,
	stPaketBorax,
	stWeapon[10],
	stAmmo[10],
	Float:stPosX,
	Float:stPosY,
	Float:stPosZ,
	Text3D:stLabel,
	stPickup,
};

new stData[MAX_STORAGE][stinfo],
	Iterator: Storage<MAX_STORAGE>;

Storage_Refresh(stid)
{
	if(stid != -1)
    {
        if(IsValidDynamic3DTextLabel(stData[stid][stLabel]))
            DestroyDynamic3DTextLabel(stData[stid][stLabel]);

        if(IsValidDynamicPickup(stData[stid][stPickup]))
            DestroyDynamicPickup(stData[stid][stPickup]);

		new tstr[558];
		if(stData[stid][stPosX] != 0 && stData[stid][stPosY] != 0 && stData[stid][stPosZ] != 0 && strcmp(stData[stid][stOwner], "-"))
		{
            format(tstr, sizeof tstr,"{ffffff}ID: %d\n{ffff00}%s\n{00ffff}`/smenu`\n{00ffff}Private storage", stid, stData[stid][stOwner]);

			stData[stid][stPickup] = CreateDynamicPickup(1277, 23, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]+0.2, -1, -1, -1, 5.0);
			stData[stid][stLabel] = CreateDynamic3DTextLabel(tstr, COLOR_GREEN, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]+0.5, 4.5);
		}
		else if(stData[stid][stPosX] != 0 && stData[stid][stPosY] != 0 && stData[stid][stPosZ] != 0)
		{
	        format(tstr, sizeof tstr,"{00ffff}ID: %d\n{ffffff}Price: {ffff00}%s\n{ffff00}`/buystorage`", stid, FormatMoney(stData[stid][stPrice]));

			stData[stid][stPickup] = CreateDynamicPickup(1277, 23, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]+0.2, -1, -1, -1, 5.0);
			stData[stid][stLabel] = CreateDynamic3DTextLabel(tstr, COLOR_GREEN, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]+0.5, 4.5);
   		}
   		
	}
    return 1;
}

St_WeaponStorage(playerid, stid)
{
    if(stid == -1)
        return 0;

    static
        string[320];

    string[0] = 0;

    for (new i = 0; i < 10; i ++)
    {
        if(!stData[stid][stWeapon][i])
            format(string, sizeof(string), "%sSlot Kosong\n", string);

        else
            format(string, sizeof(string), "%s%s (Ammo: %d)\n", string, ReturnWeaponName(stData[stid][stWeapon][i]), stData[stid][stAmmo][i]);
    }
    ShowPlayerDialog(playerid, ST_WEAPONS, DIALOG_STYLE_LIST, "Weapon Storage", string, "Select", "Cancel");
    return 1;
}

function LoadStorage()
{
    static stid;

	new str[100], rows = cache_num_rows(), owner[MAX_PLAYER_NAME];
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "id", stid);
			cache_get_value_name(i, "owner", owner);
			format(stData[stid][stOwner], MAX_PLAYER_NAME, owner);
			cache_get_value_name_int(i, "price", stData[stid][stPrice]);
			cache_get_value_name_int(i, "component", stData[stid][stComponent]);
			cache_get_value_name_int(i, "material", stData[stid][stMaterial]);
            cache_get_value_name_int(i, "money", stData[stid][stMoney]);
            cache_get_value_name_int(i, "redmoney", stData[stid][stRedMoney]);
            cache_get_value_name_int(i, "marijuana", stData[stid][stMarijuana]);
            cache_get_value_name_int(i, "borax", stData[stid][stBorax]);
            cache_get_value_name_int(i, "paketborax", stData[stid][stPaketBorax]);
			cache_get_value_name_float(i, "posx", stData[stid][stPosX]);
			cache_get_value_name_float(i, "posy", stData[stid][stPosY]);
			cache_get_value_name_float(i, "posz", stData[stid][stPosZ]);
			
			for (new j = 0; j < 10; j ++)
			{
				format(str, 24, "weapon%d", j + 1);
				cache_get_value_name_int(i, str, stData[stid][stWeapon][j]);

				format(str, 24, "ammo%d", j + 1);
				cache_get_value_name_int(i, str, stData[stid][stAmmo][j]);
			}
			Storage_Refresh(stid);
			Iter_Add(Storage, stid);
		}
		printf("Storage Load %d.", rows);
	}
}

IsStorageOwner(playerid, stid)
{
    if(!strcmp(stData[stid][stOwner], pData[playerid][pName], true))
        return 1;

    return 0;
}


Storage_Save(stid)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE storage SET owner='%s', price='%d', component='%d', material='%d', money='%d', redmoney='%d', marijuana='%d', borax='%d', paketborax='%d'",
	stData[stid][stOwner],
	stData[stid][stPrice],
	stData[stid][stComponent],
	stData[stid][stMaterial],
	stData[stid][stMoney],
	stData[stid][stRedMoney],
	stData[stid][stMarijuana],
	stData[stid][stBorax],
	stData[stid][stPaketBorax]
    );

	for (new i = 0; i < 10; i ++)
	{
        format(cQuery, sizeof(cQuery), "%s, weapon%d='%d', ammo%d='%d'", cQuery, i + 1, stData[stid][stWeapon][i], i + 1, stData[stid][stAmmo][i]);
    }
    format(cQuery, sizeof(cQuery), "%s, posx='%f', posy='%f', posz='%f' WHERE ID='%d'",
    cQuery,
    stData[stid][stPosX],
	stData[stid][stPosY],
	stData[stid][stPosZ],
    stid);
	return mysql_tquery(g_SQL, cQuery);
}

CMD:gotostorage(playerid, params[])
{
	new stid;
	if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

	if(sscanf(params, "d", stid))
		return Usage(playerid, "/gotostorage [id]");
	//if(!Iter_Contains(MAX_STORAGE, wsid)) return Error(playerid, "The Storage you specified ID of doesn't exist.");
	SetPlayerPos(playerid, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
	Info(playerid, "You has teleport to Storage id %d", stid);
	return 1;
}

CMD:createstorage(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new query[512];
	new stid = Iter_Free(Storage);

	new price;
	if(sscanf(params, "d", price))
		return Usage(playerid, "/createstorage [price]");

	if((stid < 0 || stid >= MAX_STORAGE))
        return Error(playerid, "You have already input in this server.");

	format(stData[stid][stOwner], 128, "-");
	GetPlayerPos(playerid, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]);
	

	stData[stid][stPrice] = price;

	Iter_Add(Storage, stid);

	Storage_Refresh(stid);
	Storage_Save(stid);
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO storage SET ID='%d', owner='%s', price='%d'", stid, stData[stid][stOwner], stData[stid][stPrice]);
	mysql_tquery(g_SQL, query, "OnStorageCreated", "i", stid);
	return 1;
}

function OnStorageCreated(stid)
{
	Storage_Save(stid);
	return 1;
}

CMD:smenu(playerid, params[])
{
    foreach(new stid : Storage)
	{
        if(IsPlayerInRangeOfPoint(playerid, 4.0, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]))
        {
            if(!IsStorageOwner(playerid, stid))
                return Error(playerid, "Anda bukan pemilik storage ini");

            ShowStorageMenu(playerid, stid);
        }
    }
    return 1;
}

ShowStorageMenu(playerid, stid)
{
    pData[playerid][pMenuType] = 0;
    pData[playerid][pInSt] = stid;

    new str[256], items[1], vstr[64];

    for (new i = 0; i < 10; i ++) if(stData[stid][stWeapon][i])
	{
        items[0]++;
    }
    format(vstr, sizeof vstr,"Storage Private");
    format(str, sizeof str,"Weapon Storage\t(%d/10)\nComponent\t(%d/%d)\nMaterial\t(%d/%d)\nMarijuana\t(%d/%d)\nBorax\t(%d/%d)\nPaketBorax\t(%d/%d)\nMoney\t({00ff00}%s{ffffff})\nMoney\t({ff0000}%s{ffffff})",
        items[0],
        stData[stid][stComponent],
        MAX_STORAGE_INT,
        stData[stid][stMaterial],
        MAX_STORAGE_INT,
        stData[stid][stMarijuana],
        MAX_STORAGE_INT,
        stData[stid][stBorax],
        MAX_STORAGE_INT,
        stData[stid][stPaketBorax],
        MAX_STORAGE_INT,
        FormatMoney(stData[stid][stMoney]),
        FormatMoney(stData[stid][stRedMoney]));
    ShowPlayerDialog(playerid, ST_MENU, DIALOG_STYLE_LIST, vstr, str, "Select", "Cancel");
    return 1;
}

CMD:buystorage(playerid, params[])
{
	foreach(new stid : Storage)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]))
		{
			if(stData[stid][stPrice] > GetPlayerMoney(playerid))
				return Error(playerid, "Not enough money, you can't afford this storage.");

			if(strcmp(stData[stid][stOwner], "-"))
				return Error(playerid, "Someone already owns this storage.");


			GivePlayerMoneyEx(playerid, -stData[stid][stPrice]);
			Server_AddMoney(stData[stid][stPrice]);
	    	stData[stid][stOwner] = pData[playerid][pID];
			GetPlayerName(playerid, stData[stid][stOwner], MAX_PLAYER_NAME);

			Storage_Refresh(stid);
			Storage_Save(stid);
			new query[512];
			mysql_format(g_SQL, query, sizeof(query), "INSERT INTO storage SET ID='%d', owner='%s'", stid, stData[stid][stOwner]);
			mysql_tquery(g_SQL, query, "OnStorageCreated", "i", stid);
		}
	}
	return 1;
}


CMD:editstorage(playerid, params[])
{
    static
        stid,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", stid, type, string))
    {
        Usage(playerid, "/editstorage [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, price, delete");
        return 1;
    }
    if((stid < 0 || stid >= MAX_STORAGE))
        return Error(playerid, "You have specified an invagsid ID.");
	if(!Iter_Contains(Storage, stid)) return Error(playerid, "The doors you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, stData[stid][stPosX], stData[stid][stPosY], stData[stid][stPosZ]);
        Storage_Save(stid);
		Storage_Refresh(stid);

        SendAdminMessage(COLOR_RED, "%s has adjusted the location of storage ID: %d.", pData[playerid][pAdminname], stid);
    }
    else if(!strcmp(type, "price", true))
    {
        new stok;

        if(sscanf(string, "d", stok))
            return Usage(playerid, "/editstorage [id] [type] [Price]");

        stData[stid][stPrice] = stok;
        Storage_Save(stid);
		Storage_Refresh(stid);

        SendAdminMessage(COLOR_RED, "%s has set storage ID: %d price to %d.", pData[playerid][pAdminname], stid, stok);
    }
    else if(!strcmp(type, "owner", true))
    {
        new owners[MAX_PLAYER_NAME];

        if(sscanf(string, "s[24]", owners))
            return Usage(playerid, "/editstorage [id] [owner] [player name] (use '-' to no owner)");

        format(stData[stid][stOwner], MAX_PLAYER_NAME, owners);

        Storage_Save(stid);
		Storage_Refresh(stid);
        SendAdminMessage(COLOR_RED, "%s has adjusted the owner of Workshop ID: %d to %s", pData[playerid][pAdminname], stid, owners);
    }
    else if(!strcmp(type, "delete", true))
    {
		new query[128];
		DestroyDynamic3DTextLabel(stData[stid][stLabel]);
		DestroyDynamicPickup(stData[stid][stPickup]);
		stData[stid][stPosX] = 0;
		stData[stid][stPosY] = 0;
		stData[stid][stPosY] = 0;
		stData[stid][stPrice] = 0;
		stData[stid][stComponent] = 0;
		stData[stid][stMaterial] = 0;
		stData[stid][stMoney] = 0;
		stData[stid][stRedMoney] = 0;
		stData[stid][stMarijuana] = 0;
		stData[stid][stBorax] = 0;
		stData[stid][stPaketBorax] = 0;
		stData[stid][stWeapon][0] = 0;
	    stData[stid][stAmmo][0] = 0;
	    stData[stid][stWeapon][1] = 0;
	    stData[stid][stAmmo][1] = 0;
	    stData[stid][stWeapon][2] = 0;
	    stData[stid][stAmmo][2] = 0;
	    stData[stid][stWeapon][3] = 0;
	    stData[stid][stAmmo][3] = 0;
	    stData[stid][stWeapon][4] = 0;
	    stData[stid][stAmmo][4] = 0;
	    stData[stid][stWeapon][5] = 0;
	    stData[stid][stAmmo][5] = 0;
	    stData[stid][stWeapon][6] = 0;
	    stData[stid][stAmmo][6] = 0;
	    stData[stid][stWeapon][7] = 0;
	    stData[stid][stAmmo][7] = 0;
	    stData[stid][stWeapon][8] = 0;
	    stData[stid][stAmmo][8] = 0;
	    stData[stid][stWeapon][9] = 0;
	    stData[stid][stAmmo][9] = 0;
		stData[stid][stLabel] = Text3D: INVALID_3DTEXT_ID;
		stData[stid][stPickup] = -1;
		Iter_Remove(Storage, stid);
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM storage WHERE ID=%d", stid);
		mysql_tquery(g_SQL, query);
        SendAdminMessage(COLOR_RED, "%s has delete storage ID: %d.", pData[playerid][pAdminname], stid);
    }
    return 1;
}

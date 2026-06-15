public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == AngkatHP[playerid])
	{
        callcmd::p(playerid, "");
        TogglePhone[playerid] = 0;
	}
	if(playertextid == RijekHP[playerid])
	{
        callcmd::ofhu(playerid, "");
        TogglePhone[playerid] = 0;
	}
	if(playertextid == BataltelHP[playerid])
	{
        callcmd::hu(playerid, "");
        TogglePhone[playerid] = 0;
	}
 	for(new i = 0; i < MAX_INVENTORY; i++)
	{
		if(playertextid == MODELTD[playerid][i])
		{
			if(InventoryData[playerid][i][invExists])
			{
			    MenuStore_SelectRow(playerid, i);
			    new name[48];
            	strunpack(name, InventoryData[playerid][pData[playerid][pSelectItem]][invItem]);
			}
			else
			{
			    MenuStore_UnselectRow(playerid);
			    Error(playerid,"[Inventory] Tidak Ada Barang Di Slot Tersebut");
			}
		}
	}
	if(playertextid == GUNAKAN[playerid])
	{
		new id = pData[playerid][pSelectItem];

		if(id == -1)
		{
		    Error(playerid,"[Inventory] Tidak Ada Barang Di Slot Tersebut");
		}
		else
		{
			new string[64];
		    strunpack(string, InventoryData[playerid][id][invItem]);

		    if(!PlayerHasItem(playerid, string))
		    {
		   		Error(playerid,"[Inventory] Kamu Tidak Memiliki Barang Tersebut");
				MenuStore_UnselectRow(playerid);
                Inventory_Show(playerid);
			}
			else
			{
				CallLocalFunction("OnPlayerUseItem", "dds", playerid, id, string);
				Inventory_Close(playerid);
			}
		}
	}
	else if(playertextid == TUTUP[playerid])
	{
		Inventory_Close(playerid);
	}
	else if(playertextid == BERIKAN[playerid])
	{
		new id = pData[playerid][pSelectItem], str[500], count = 0;
		if(id == -1)
		{
			Info(playerid,"[Inventory] Pilih Barang Terlebih Dahulu");
		}
		else
		{
		    if (pData[playerid][pGiveAmount] < 1)
				return Info(playerid,"[Inventory] Masukan Jumlah Terlebih Dahulu"), PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

			//ShowPlayerDialog(playerid, DIALOG_GIVE, DIALOG_STYLE_INPUT, "Memberikan Barang", "Kantong Yang Ingin Di Berikan:", "Berikan", "Batal");
			foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 1) && i != playerid)
			{
				format(str, sizeof(str), "Kantong: %d\n", i);
				SetPlayerListitemValue(playerid, count++, i);
			}
			if(!count) ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Asia Pride - Inventory", "Tidak ada player disekitarmu", "Tutup", ""), PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
			else ShowPlayerDialog(playerid, DIALOG_GIVE, DIALOG_STYLE_LIST, "Asia Pride - Inventory", str, "Pilih", "Tutup");
		}
	}
	else if(playertextid == JUMLAH[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_AMOUNT, DIALOG_STYLE_INPUT, "Jumlah", "Masukan Jumlah:", "Enter", "Batal");
	}

    return 1;
}


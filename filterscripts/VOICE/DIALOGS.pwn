public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_RADIOSETTINGS)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    return callcmd::togradio(playerid);
                }
                case 1:
                {
                    return callcmd::gdtewyvwts(playerid);
                }
                case 2:
                {
                    ShowPlayerDialog(playerid, DIALOG_SETFREQ, DIALOG_STYLE_INPUT, "Set Frequensi Radio", "Masukkan Frequensi Radio Yang Ingin Kamu Hubungkan (Maksimal 1 - 99999)", "Hubungkan", "Tutup");
                }
                case 3:
                {
                    new str[256], togSfxTurnOn[256], togSfxTurnOff[256];
                    if(pData[playerid][pSfxTurnOn] == 0)
                    {
                        togSfxTurnOn = "{ff0000}Disable";
                    }
                    else if(pData[playerid][pSfxTurnOn] == 1)
                    {
                        togSfxTurnOn = "{00ff00}Enable";
                    }

                    if(pData[playerid][pSfxTurnOff] == 0)
                    {
                        togSfxTurnOff = "{ff0000}Disable";
                    }
                    else if(pData[playerid][pSfxTurnOff] == 1)
                    {
                        togSfxTurnOff = "{00ff00}Enable";
                    }

                    format(str, sizeof(str), "Sound Effect Settings\tStatus\n{FFFFFF}Status FX TurnON:\t%s\n{FFFFFF}Status FX TurnOFF:\t%s\n{FFFFFF}Hidupkan Semua FX\n{FFFFFF}Matikan Semua FX", togSfxTurnOn, togSfxTurnOff);
                    ShowPlayerDialog(playerid, DIALOG_SETSFX, DIALOG_STYLE_TABLIST_HEADERS, "FX Radio Settings", str, "Set", "Close");
                    // if(pData[playerid][pSfxTurnOn] == 0)
                    // {
                    //     pData[playerid][pSfxTurnOn] = 1;
                    //     Info(playerid, "(Sfx Turning On) Radio Berhasil Dihidupkan.");
                    // }
                    // else if(pData[playerid][pSfxTurnOn] == 1)
                    // {
                    //     pData[playerid][pSfxTurnOn] = 0;
                    //     Info(playerid, "(Sfx Turning On) Radio Berhasil Dimatikan.");
                    // }
                }
                case 4:
                {
                    if(pData[playerid][pSfxTurnOff] == 0)
                    {
                        pData[playerid][pSfxTurnOff] = 1;
                        Info(playerid, "(Sfx Turning Off) Radio Berhasil Dihidupkan.");
                    }
                    else if(pData[playerid][pSfxTurnOff] == 1)
                    {
                        pData[playerid][pSfxTurnOff] = 0;
                        Info(playerid, "(Sfx Turning Off) Radio Berhasil Dimatikan.");
                    }
                }
            }
        }
    }
    if(dialogid == DIALOG_SETFREQ)
    {
        if(response)
        {
            new Frequensi = strval(inputtext);

            if(isnull(inputtext))
            {
                ShowPlayerDialog(playerid, DIALOG_SETFREQ, DIALOG_STYLE_INPUT, "Set Frequensi Radio", "{ff0000}ERROR: {FFFFFF}Harap Input Frequensi Yang Benar\n\nMasukkan Frequensi Radio Yang Ingin Anda Hubungkan (Maksimal 1 - 99999)", "Hubungkan", "Tutup");
                return 1;
            }
            if(Frequensi > 99999 || Frequensi < 0)
            {
                ShowPlayerDialog(playerid, DIALOG_SETFREQ, DIALOG_STYLE_INPUT, "Set Frequensi Radio", "{ff0000}ERROR: {FFFFFF}Maksimal Frequensi 1 - 99999\n\nMasukkan Frequensi Radio Yang Ingin Anda Hubungkan (Maksimal 1 - 99999)", "Hubungkan", "Tutup");
                return 1;
            }

            if(Frequensi == 0)
		    {
		    	DisconnectToFrequensi(playerid, pData[playerid][pFreqRadio], false);
		    }
		    else
		    {
		        if(pData[playerid][pFreqRadio] >= 1)
		        {
		            SetTimerEx("ConnectToFrequensi", 100, false, "idb", playerid, Frequensi, true);
		        }

		        if(pData[playerid][pFreqRadio] == 0)
		        {
		            SetTimerEx("ConnectToFrequensi", 100, false, "idb", playerid, Frequensi, false);
		        }
		    }
        }
    }
    if(dialogid == DIALOG_MVOICE)
    {
            if(!response) return 1;

             switch(listitem) {
                case 0:    {
                    if((lstream[playerid] = SvCreateDLStreamAtPlayer(4.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
                     SvAddKey(playerid, 0x42);
                    SvAddKey(playerid, 0x5A);
                    SendClientMessage(playerid, 0xff0000ff, "BERHASIL MENGUBAH SUARA KE MODE BERBISIK");
                }
                case 1:    {
                    if((lstream[playerid] = SvCreateDLStreamAtPlayer(60.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
                     SvAddKey(playerid, 0x42);
                    SvAddKey(playerid, 0x5A);
                    SendClientMessage(playerid, 0xff0000ff, "BERHASIL MENGUBAH SUARA KE MODE TERIAK");
                }
                case 2:    {
                    if((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
                     SvAddKey(playerid, 0x42);
                    SvAddKey(playerid, 0x5A);
                    SendClientMessage(playerid, 0xff0000ff, "BERHASIL MENGUBAH SUARA KE MODE NORMAL");
                    }
                }
    }
    if(dialogid == DIALOG_SETSFX)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    if(pData[playerid][pSfxTurnOn] == 0)
                    {
                        pData[playerid][pSfxTurnOn] = 1;
                        Info(playerid, "(FX) Radio TurnON Berhasil Dihidupkan.");
                    }
                    else if(pData[playerid][pSfxTurnOn] == 1)
                    {
                        pData[playerid][pSfxTurnOn] = 0;
                        Info(playerid, "(FX) Radio TurnON Berhasil Dimatikan.");
                    }
                }
                case 1:
                {
                    if(pData[playerid][pSfxTurnOff] == 0)
                    {
                        pData[playerid][pSfxTurnOff] = 1;
                        Info(playerid, "(FX) Radio TurnOFF Berhasil Dihidupkan.");
                    }
                    else if(pData[playerid][pSfxTurnOff] == 1)
                    {
                        pData[playerid][pSfxTurnOff] = 0;
                        Info(playerid, "(FX) Radio TurnOFF Berhasil Dimatikan.");
                    }
                }
                case 2:
                {
                    if(pData[playerid][pSfxTurnOn] == 1 && pData[playerid][pSfxTurnOff] == 1) return Error(playerid, "(FX) Radio Anda telah Aktif");

                    pData[playerid][pSfxTurnOn] = 1;
                    pData[playerid][pSfxTurnOff] = 1;

                    Info(playerid, "(FX) Radio anda berhasil di aktifkan semua");
                }
                case 3:
                {
                    if(pData[playerid][pSfxTurnOn] == 0 && pData[playerid][pSfxTurnOff] == 0) return Error(playerid, "(FX) Radio Anda telah Nonaktif");

                    pData[playerid][pSfxTurnOn] = 0;
                    pData[playerid][pSfxTurnOff] = 0;

                    Info(playerid, "(FX) Radio anda berhasil di Nonaktifkan semua");
                }
            }
        }
    }
    return 1;
}

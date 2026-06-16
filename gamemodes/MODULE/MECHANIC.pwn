//=============================================================
  // FRAKSI MEKANIK — Asia Pride Roleplay
  // fix: pOnDuty, single-line format strings, no warning 219
  //=============================================================

  #define FACTION_MECH            5
  #define MAX_MECH_ORDERS         50

  #define DIALOG_MECH_MENU          8100
  #define DIALOG_MECH_PREVIEW_CAT   8101
  #define DIALOG_MECH_COLOR1        8102
  #define DIALOG_MECH_COLOR2        8103
  #define DIALOG_MECH_PAINTJOB      8104
  #define DIALOG_MECH_NEON          8105
  #define DIALOG_MECH_COMPONENT     8106
  #define DIALOG_MECH_CONFIRM       8107
  #define DIALOG_MECH_PAYMENT       8108
  #define DIALOG_MECH_ORDERS        8109
  #define DIALOG_MECH_ORDER_DETAIL  8110
  #define DIALOG_MECH_KAS           8112

  new MechanicKas;

  enum E_MECH_ORDER
  {
      moID,
      moPlayerName[MAX_PLAYER_NAME],
      moPlayerID,
      moVehicleModel,
      moVehicleDB,
      moColor1,
      moColor2,
      moPaintJob,
      moNeon,
      moMods[17],
      moPrice,
      moPayType,
      moStatus,
      moMechName[MAX_PLAYER_NAME]
  };
  new MechOrders[MAX_MECH_ORDERS][E_MECH_ORDER],
      MechOrderCount,
      Iterator:MechOrderIter<MAX_MECH_ORDERS>;

  enum E_VEH_SNAP
  {
      snapColor1,
      snapColor2,
      snapPaintJob,
      snapNeon,
      snapMods[17],
      snapActive,
      snapVehID,
      snapDBID,
      snapPrice
  };
  new VehSnapshot[MAX_PLAYERS][E_VEH_SNAP];

  static const MechPriceColor = 50000;
  static const MechPricePaint = 75000;
  static const MechPriceNeon  = 60000;
  static const MechPriceComp  = 30000;

  //-----------------------------------------------------------
  // HELPER FUNCTIONS
  //-----------------------------------------------------------

  bool:IsMechanic(playerid)
      return pData[playerid][pFaction] == FACTION_MECH;

  bool:IsMechanicDuty(playerid)
      return pData[playerid][pFaction] == FACTION_MECH && pData[playerid][pOnDuty] == 1;

  GetMechRankName(mechRank)
  {
      new mechRankStr[32];
      switch(mechRank) {
          case 1: mechRankStr = "Apprentice";
          case 2: mechRankStr = "Mechanic";
          case 3: mechRankStr = "Senior Mechanic";
          case 4: mechRankStr = "Chief Mechanic";
          default: mechRankStr = "Trainee";
      }
      return mechRankStr;
  }

  GetNeonName(mechNeon)
  {
      new mechNeonStr[24];
      switch(mechNeon) {
          case 0: mechNeonStr = "Tidak Ada";
          case 1: mechNeonStr = "Merah";
          case 2: mechNeonStr = "Hijau";
          case 3: mechNeonStr = "Biru";
          case 4: mechNeonStr = "Kuning";
          case 5: mechNeonStr = "Ungu";
          case 6: mechNeonStr = "Pink";
          case 7: mechNeonStr = "Putih";
          default: mechNeonStr = "Tidak Ada";
      }
      return mechNeonStr;
  }

  GetSnapPrice(playerid)
  {
      new mechTotal;
      new mechPvid = GetPlayerVehicleID(playerid);
      new mechDbid = -1;
      foreach(new mechIdx : PVehicles) {
          if(pvData[mechIdx][cVeh] == mechPvid) { mechDbid = mechIdx; break; }
      }
      if(mechDbid == -1) return 0;
      if(VehSnapshot[playerid][snapColor1] != pvData[mechDbid][cColor1] || VehSnapshot[playerid][snapColor2] != pvData[mechDbid][cColor2])
          mechTotal += MechPriceColor;
      if(VehSnapshot[playerid][snapPaintJob] != pvData[mechDbid][cPaintJob])
          mechTotal += MechPricePaint;
      if(VehSnapshot[playerid][snapNeon] != pvData[mechDbid][cNeon])
          mechTotal += MechPriceNeon;
      for(new mechS = 0; mechS < 17; mechS++) {
          if(VehSnapshot[playerid][snapMods][mechS] != pvData[mechDbid][cMod][mechS])
              mechTotal += MechPriceComp;
      }
      return mechTotal;
  }

  RevertVehicle(playerid)
  {
      new mechVehid = VehSnapshot[playerid][snapVehID];
      new mechDbid  = VehSnapshot[playerid][snapDBID];
      if(mechVehid == INVALID_VEHICLE_ID || mechDbid == -1) return;
      ChangeVehicleColor(mechVehid, VehSnapshot[playerid][snapColor1], VehSnapshot[playerid][snapColor2]);
      if(pvData[mechDbid][cPaintJob] != VehSnapshot[playerid][snapPaintJob])
          ChangeVehiclePaintjob(mechVehid, pvData[mechDbid][cPaintJob]);
      for(new mechS = 0; mechS < 17; mechS++) {
          if(pvData[mechDbid][cMod][mechS] != 0 && VehSnapshot[playerid][snapMods][mechS] == 0)
              RemoveVehicleComponent(mechVehid, pvData[mechDbid][cMod][mechS]);
      }
      VehSnapshot[playerid][snapActive] = 0;
  }

  NotifyMechanics(const mechMsg[])
  {
      foreach(new mechI : Player) {
          if(IsMechanicDuty(mechI))
              SendClientMessage(mechI, 0xFF8800FF, mechMsg);
      }
  }

  ShowPreviewMenu(playerid)
  {
      new mechPvid = GetPlayerVehicleID(playerid);
      if(mechPvid == INVALID_VEHICLE_ID)
          return Error(playerid, "Kamu harus berada di dalam kendaraanmu!");

      new mechDbid = -1;
      foreach(new mechIdx : PVehicles) {
          if(pvData[mechIdx][cVeh] == mechPvid && strcmp(pvData[mechIdx][cOwner], GetRPName(playerid), true) == 0) {
              mechDbid = mechIdx; break;
          }
      }
      if(mechDbid == -1) return Error(playerid, "Kendaraan ini bukan milikmu!");

      if(!VehSnapshot[playerid][snapActive]) {
          VehSnapshot[playerid][snapColor1]   = pvData[mechDbid][cColor1];
          VehSnapshot[playerid][snapColor2]   = pvData[mechDbid][cColor2];
          VehSnapshot[playerid][snapPaintJob] = pvData[mechDbid][cPaintJob];
          VehSnapshot[playerid][snapNeon]     = pvData[mechDbid][cNeon];
          for(new mechS = 0; mechS < 17; mechS++)
              VehSnapshot[playerid][snapMods][mechS] = pvData[mechDbid][cMod][mechS];
          VehSnapshot[playerid][snapActive] = 1;
          VehSnapshot[playerid][snapVehID]  = mechPvid;
          VehSnapshot[playerid][snapDBID]   = mechDbid;
          Info(playerid, "Preview mode aktif. Kondisi awal kendaraan telah disimpan.");
      }

      new mechPriceTotal = GetSnapPrice(playerid);
      new mechMenuStr[512];
      format(mechMenuStr, sizeof mechMenuStr, "Warna Kendaraan
Paintjob
Neon Bawah
Komponen / Tuning

Estimasi Total: {FFFF00}Rp.%s
Konfirmasi Order", FormatMoney(mechPriceTotal));
      ShowPlayerDialog(playerid, DIALOG_MECH_PREVIEW_CAT, DIALOG_STYLE_LIST, "{FF8800}[ MODIFIKASI KENDARAAN ]{FFFFFF} — Preview", mechMenuStr, "Pilih", "Tutup");
      return 1;
  }

  //-----------------------------------------------------------
  // COMMANDS
  //-----------------------------------------------------------

  CMD:previewmodif(playerid, params[])
  {
      if(!pData[playerid][pLoggedIn]) return 1;
      return ShowPreviewMenu(playerid);
  }
  alias:previewmodif("modif")

  CMD:cancelpreview(playerid, params[])
  {
      if(!VehSnapshot[playerid][snapActive])
          return Error(playerid, "Kamu tidak sedang dalam mode preview.");
      RevertVehicle(playerid);
      Info(playerid, "Preview dibatalkan. Kendaraan dikembalikan ke kondisi awal.");
      return 1;
  }

  CMD:confirmorder(playerid, params[])
  {
      if(!VehSnapshot[playerid][snapActive])
          return Error(playerid, "Kamu belum membuka preview modifikasi. Gunakan /modif terlebih dahulu.");
      new mechPriceConfirm = GetSnapPrice(playerid);
      if(mechPriceConfirm <= 0)
          return Error(playerid, "Kamu belum memilih modifikasi apapun.");
      VehSnapshot[playerid][snapPrice] = mechPriceConfirm;
      new mechPayStr[512];
      format(mechPayStr, sizeof mechPayStr, "Total Biaya Modifikasi: {FFFF00}Rp.%s{FFFFFF}

Pilih metode pembayaran:

{FFFFFF}[ {00FF00}Cash{FFFFFF} ]	{AAAAAA}Uang di tangan berkurang
{FFFFFF}[ {00AAFF}Transfer Bank{FFFFFF} ]	{AAAAAA}Saldo bank berkurang", FormatMoney(mechPriceConfirm));
      ShowPlayerDialog(playerid, DIALOG_MECH_PAYMENT, DIALOG_STYLE_LIST, "{FF8800}[ KONFIRMASI ORDER ]{FFFFFF} — Pilih Pembayaran", mechPayStr, "Bayar", "Batal");
      return 1;
  }

  CMD:mechorders(playerid, params[])
  {
      if(!IsMechanicDuty(playerid))
          return Error(playerid, "Kamu harus menjadi Mekanik dan sedang duty.");
      if(MechOrderCount == 0)
          return Info(playerid, "Tidak ada order yang pending saat ini.");
      new mechOrdStr[2048], mechOrdCount;
      format(mechOrdStr, sizeof mechOrdStr, "");
      foreach(new mechI : MechOrderIter) {
          if(MechOrders[mechI][moStatus] == 0) {
              new mechPayLabel[10];
              mechPayLabel = MechOrders[mechI][moPayType] == 0 ? "Cash" : "Bank";
              format(mechOrdStr, sizeof mechOrdStr, "%s#%d | %s | %s | Rp.%s
", mechOrdStr, MechOrders[mechI][moID], MechOrders[mechI][moPlayerName], mechPayLabel, FormatMoney(MechOrders[mechI][moPrice]));
              mechOrdCount++;
          }
      }
      if(!mechOrdCount) return Info(playerid, "Tidak ada order pending.");
      ShowPlayerDialog(playerid, DIALOG_MECH_ORDERS, DIALOG_STYLE_LIST, "{FF8800}[ ORDER MODIFIKASI ]{FFFFFF} — Pilih untuk proses", mechOrdStr, "Proses", "Tutup");
      return 1;
  }

  CMD:mechduty(playerid, params[])
  {
      if(!IsMechanic(playerid))
          return Error(playerid, "Kamu bukan anggota Fraksi Mekanik.");
      if(pData[playerid][pOnDuty] == 0) {
          pData[playerid][pOnDuty] = 1;
          Info(playerid, "Kamu sekarang ON DUTY sebagai Mekanik.");
          new mechDutyMsg[128];
          format(mechDutyMsg, sizeof mechDutyMsg, "* %s [Mekanik] kini siap melayani modifikasi.", GetRPName(playerid));
          SendClientMessageToAll(0xFF8800FF, mechDutyMsg);
      } else {
          pData[playerid][pOnDuty] = 0;
          Info(playerid, "Kamu sekarang OFF DUTY.");
      }
      return 1;
  }

  CMD:mechmenu(playerid, params[])
  {
      if(!IsMechanic(playerid))
          return Error(playerid, "Kamu bukan anggota Fraksi Mekanik.");
      new mechMnuStr[512];
      format(mechMnuStr, sizeof mechMnuStr, "Status Duty: %s
Rank: %s
Kas Fraksi: Rp.%s

Lihat Order Pending
Toggle Duty", pData[playerid][pOnDuty] ? "{00FF00}ON DUTY" : "{FF0000}OFF DUTY", GetMechRankName(pData[playerid][pFactionRank]), FormatMoney(MechanicKas));
      ShowPlayerDialog(playerid, DIALOG_MECH_MENU, DIALOG_STYLE_LIST, "{FF8800}[ MENU MEKANIK ]", mechMnuStr, "Pilih", "Tutup");
      return 1;
  }

  //-----------------------------------------------------------
  // DIALOG HANDLER
  //-----------------------------------------------------------

  hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
  {
      switch(dialogid)
      {
          case DIALOG_MECH_MENU:
          {
              if(!response) return 1;
              switch(listitem) {
                  case 4: CMD:mechorders(playerid, "");
                  case 5: CMD:mechduty(playerid, "");
              }
              return 1;
          }

          case DIALOG_MECH_PREVIEW_CAT:
          {
              if(!response) return 1;
              switch(listitem)
              {
                  case 0:
                  {
                      new mechColStr[1024];
                      new mechColorNames[13][] = {"Putih","Hitam","Merah","Biru","Hijau","Kuning","Oranye","Ungu","Pink","Abu-abu","Coklat","Silver","Gold"};
                      format(mechColStr, sizeof mechColStr, "");
                      for(new mechC = 0; mechC < 13; mechC++)
                          format(mechColStr, sizeof mechColStr, "%s%s	{AAAAAA}+Rp.%s
", mechColStr, mechColorNames[mechC], FormatMoney(MechPriceColor));
                      ShowPlayerDialog(playerid, DIALOG_MECH_COLOR1, DIALOG_STYLE_LIST, "{FF8800}[ PILIH WARNA UTAMA ]", mechColStr, "Pilih", "Kembali");
                  }
                  case 1:
                  {
                      new mechPjStr[256];
                      format(mechPjStr, sizeof mechPjStr, "Paintjob 1	{AAAAAA}+Rp.%s
Paintjob 2	{AAAAAA}+Rp.%s
Paintjob 3	{AAAAAA}+Rp.%s
Hapus Paintjob	{AAAAAA}Gratis", FormatMoney(MechPricePaint), FormatMoney(MechPricePaint), FormatMoney(MechPricePaint));
                      ShowPlayerDialog(playerid, DIALOG_MECH_PAINTJOB, DIALOG_STYLE_LIST, "{FF8800}[ PAINTJOB ]", mechPjStr, "Pilih", "Kembali");
                  }
                  case 2:
                  {
                      new mechNeonStr[512];
                      format(mechNeonStr, sizeof mechNeonStr, "Tidak Ada Neon	{AAAAAA}Gratis
Neon Merah	{AAAAAA}+Rp.%s
Neon Hijau	{AAAAAA}+Rp.%s
Neon Biru	{AAAAAA}+Rp.%s
Neon Kuning	{AAAAAA}+Rp.%s
Neon Ungu	{AAAAAA}+Rp.%s
Neon Pink	{AAAAAA}+Rp.%s
Neon Putih	{AAAAAA}+Rp.%s", FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon));
                      ShowPlayerDialog(playerid, DIALOG_MECH_NEON, DIALOG_STYLE_LIST, "{FF8800}[ NEON BAWAH ]", mechNeonStr, "Pilih", "Kembali");
                  }
                  case 3:
                  {
                      new mechCompStr[1024];
                      new mechSlotNames[17][] = {"Spoiler","Hood","Roof","Sideskirt","Lamps","Nitro x2","Nitro x5","Nitro x10","Exhaust","Wheels","Stereo","Hydraulics","Front Bumper","Rear Bumper","Misc 1","Misc 2","Misc 3"};
                      format(mechCompStr, sizeof mechCompStr, "");
                      for(new mechS = 0; mechS < 17; mechS++) {
                          new mechSlotStat[24];
                          mechSlotStat = VehSnapshot[playerid][snapMods][mechS] != 0 ? "{00FF00}Terpasang" : "{AAAAAA}Kosong";
                          format(mechCompStr, sizeof mechCompStr, "%s%s	%s (+Rp.%s)
", mechCompStr, mechSlotNames[mechS], mechSlotStat, FormatMoney(MechPriceComp));
                      }
                      ShowPlayerDialog(playerid, DIALOG_MECH_COMPONENT, DIALOG_STYLE_LIST, "{FF8800}[ KOMPONEN / TUNING ]", mechCompStr, "Pilih", "Kembali");
                  }
                  case 5: CMD:confirmorder(playerid, "");
              }
              return 1;
          }

          case DIALOG_MECH_COLOR1:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new mechColorCodes1[13] = {1,0,6,3,53,88,10,71,135,101,7,4,11};
              new mechColorNames2[13][] = {"Putih","Hitam","Merah","Biru","Hijau","Kuning","Oranye","Ungu","Pink","Abu-abu","Coklat","Silver","Gold"};
              if(listitem < 13) {
                  SetPVarInt(playerid, "MechTmpColor1", mechColorCodes1[listitem]);
                  new mechCol2Str[512];
                  format(mechCol2Str, sizeof mechCol2Str, "");
                  for(new mechC = 0; mechC < 13; mechC++)
                      format(mechCol2Str, sizeof mechCol2Str, "%s%s
", mechCol2Str, mechColorNames2[mechC]);
                  ShowPlayerDialog(playerid, DIALOG_MECH_COLOR2, DIALOG_STYLE_LIST, "{FF8800}[ PILIH WARNA SEKUNDER ]", mechCol2Str, "Pilih", "Kembali");
              }
              return 1;
          }

          case DIALOG_MECH_COLOR2:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new mechColorCodes2[13] = {1,0,6,3,53,88,10,71,135,101,7,4,11};
              if(listitem < 13) {
                  new mechPvidC = GetPlayerVehicleID(playerid);
                  new mechC1 = GetPVarInt(playerid, "MechTmpColor1");
                  new mechC2 = mechColorCodes2[listitem];
                  ChangeVehicleColor(mechPvidC, mechC1, mechC2);
                  VehSnapshot[playerid][snapColor1] = mechC1;
                  VehSnapshot[playerid][snapColor2] = mechC2;
                  Info(playerid, "Preview warna diterapkan. Gunakan /confirmorder untuk pesan.");
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          case DIALOG_MECH_PAINTJOB:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new mechPvidPj = GetPlayerVehicleID(playerid);
              if(listitem < 3) {
                  ChangeVehiclePaintjob(mechPvidPj, listitem);
                  VehSnapshot[playerid][snapPaintJob] = listitem;
                  Info(playerid, "Preview paintjob diterapkan.");
              } else {
                  ChangeVehiclePaintjob(mechPvidPj, -1);
                  VehSnapshot[playerid][snapPaintJob] = -1;
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          case DIALOG_MECH_NEON:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              VehSnapshot[playerid][snapNeon] = listitem;
              if(listitem == 0) Info(playerid, "Neon dihapus dari preview.");
              else Info(playerid, "Preview neon %s diterapkan.", GetNeonName(listitem));
              ShowPreviewMenu(playerid);
              return 1;
          }

          case DIALOG_MECH_COMPONENT:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              if(listitem < 17) {
                  new mechCompSlot = listitem;
                  new mechCompNames[17][] = {"Spoiler","Hood","Roof","Sideskirt","Lamps","Nitro x2","Nitro x5","Nitro x10","Exhaust","Wheels","Stereo","Hydraulics","Front Bumper","Rear Bumper","Misc 1","Misc 2","Misc 3"};
                  if(VehSnapshot[playerid][snapMods][mechCompSlot] != 0) {
                      VehSnapshot[playerid][snapMods][mechCompSlot] = 0;
                      Info(playerid, "%s dihapus dari order.", mechCompNames[mechCompSlot]);
                  } else {
                      VehSnapshot[playerid][snapMods][mechCompSlot] = 1;
                      Info(playerid, "%s ditambahkan ke order. (+Rp.%s)", mechCompNames[mechCompSlot], FormatMoney(MechPriceComp));
                  }
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          case DIALOG_MECH_PAYMENT:
          {
              if(!response) return 1;
              new mechPayTotal = VehSnapshot[playerid][snapPrice];
              new mechPayType  = listitem;
              if(mechPayType == 0 && pData[playerid][pMoney] < mechPayTotal)
                  return Error(playerid, "Uang cash tidak cukup! Butuh Rp.%s", FormatMoney(mechPayTotal));
              if(mechPayType == 1 && pData[playerid][pBankMoney] < mechPayTotal)
                  return Error(playerid, "Saldo bank tidak cukup! Butuh Rp.%s", FormatMoney(mechPayTotal));
              if(mechPayType == 0) {
                  GivePlayerMoney(playerid, -mechPayTotal);
                  pData[playerid][pMoney] -= mechPayTotal;
              } else {
                  pData[playerid][pBankMoney] -= mechPayTotal;
                  new mechBankQ[256];
                  mysql_format(g_SQL, mechBankQ, sizeof mechBankQ, "UPDATE characters SET bmoney=%d WHERE id=%d", pData[playerid][pBankMoney], pData[playerid][pID]);
                  mysql_tquery(g_SQL, mechBankQ);
              }
              MechanicKas += mechPayTotal;
              new mechOidNew = Iter_Free(MechOrderIter);
              if(mechOidNew == -1) return Error(playerid, "Server penuh, coba lagi nanti.");
              Iter_Add(MechOrderIter, mechOidNew);
              MechOrders[mechOidNew][moID]       = mechOidNew;
              format(MechOrders[mechOidNew][moPlayerName], MAX_PLAYER_NAME, "%s", GetRPName(playerid));
              MechOrders[mechOidNew][moPlayerID]  = playerid;
              MechOrders[mechOidNew][moPrice]     = mechPayTotal;
              MechOrders[mechOidNew][moPayType]   = mechPayType;
              MechOrders[mechOidNew][moStatus]    = 0;
              MechOrderCount++;
              new mechPvidPay = GetPlayerVehicleID(playerid);
              new mechDbidPay = VehSnapshot[playerid][snapDBID];
              MechOrders[mechOidNew][moVehicleModel] = GetVehicleModel(mechPvidPay);
              MechOrders[mechOidNew][moVehicleDB]    = mechDbidPay;
              MechOrders[mechOidNew][moColor1]       = VehSnapshot[playerid][snapColor1];
              MechOrders[mechOidNew][moColor2]       = VehSnapshot[playerid][snapColor2];
              MechOrders[mechOidNew][moPaintJob]     = VehSnapshot[playerid][snapPaintJob];
              MechOrders[mechOidNew][moNeon]         = VehSnapshot[playerid][snapNeon];
              for(new mechS = 0; mechS < 17; mechS++)
                  MechOrders[mechOidNew][moMods][mechS] = VehSnapshot[playerid][snapMods][mechS];
              RevertVehicle(playerid);
              new mechInsQ[512];
              mysql_format(g_SQL, mechInsQ, sizeof mechInsQ, "INSERT INTO mechanic_orders(player_name,vehicle_model,color1,color2,paintjob,neon,price,pay_type) VALUES('%s',%d,%d,%d,%d,%d,%d,%d)", MechOrders[mechOidNew][moPlayerName], MechOrders[mechOidNew][moVehicleModel], MechOrders[mechOidNew][moColor1], MechOrders[mechOidNew][moColor2], MechOrders[mechOidNew][moPaintJob], MechOrders[mechOidNew][moNeon], MechOrders[mechOidNew][moPrice], MechOrders[mechOidNew][moPayType]);
              mysql_tquery(g_SQL, mechInsQ);
              new mechNotifMsg[128];
              format(mechNotifMsg, sizeof mechNotifMsg, "[Mekanik] Order baru dari %s! Rp.%s | /mechorders untuk proses.", GetRPName(playerid), FormatMoney(mechPayTotal));
              NotifyMechanics(mechNotifMsg);
              Info(playerid, "Order diterima! Kendaraan dikembalikan ke kondisi awal. Tunggu mekanik.");
              return 1;
          }

          case DIALOG_MECH_ORDERS:
          {
              if(!response) return 1;
              new mechOrdSel, mechOidSel = -1;
              foreach(new mechI : MechOrderIter) {
                  if(MechOrders[mechI][moStatus] == 0) {
                      if(mechOrdSel == listitem) { mechOidSel = mechI; break; }
                      mechOrdSel++;
                  }
              }
              if(mechOidSel == -1) return 1;
              SetPVarInt(playerid, "MechSelOrder", mechOidSel);
              new mechDetStr[512];
              format(mechDetStr, sizeof mechDetStr, "ID Order   : {FFFF00}#%d{FFFFFF}
Player     : {FFFF00}%s{FFFFFF}
Kendaraan  : {FFFF00}%s{FFFFFF}
Warna      : {FFFF00}%d / %d{FFFFFF}
Paintjob   : {FFFF00}%d{FFFFFF}
Neon       : {FFFF00}%s{FFFFFF}
Harga      : {FFFF00}Rp.%s{FFFFFF}
Bayar via  : {FFFF00}%s{FFFFFF}

Klik {00FF00}Proses{FFFFFF} untuk apply modif ke kendaraan player.", MechOrders[mechOidSel][moID], MechOrders[mechOidSel][moPlayerName], GetVehicleModelName(MechOrders[mechOidSel][moVehicleModel]), MechOrders[mechOidSel][moColor1], MechOrders[mechOidSel][moColor2], MechOrders[mechOidSel][moPaintJob], GetNeonName(MechOrders[mechOidSel][moNeon]), FormatMoney(MechOrders[mechOidSel][moPrice]), MechOrders[mechOidSel][moPayType] == 0 ? "Cash" : "Bank");
              ShowPlayerDialog(playerid, DIALOG_MECH_ORDER_DETAIL, DIALOG_STYLE_MSGBOX, "{FF8800}[ DETAIL ORDER ]", mechDetStr, "Proses", "Kembali");
              return 1;
          }

          case DIALOG_MECH_ORDER_DETAIL:
          {
              if(!response) { CMD:mechorders(playerid, ""); return 1; }
              new mechOidProc = GetPVarInt(playerid, "MechSelOrder");
              if(mechOidProc == -1 || MechOrders[mechOidProc][moStatus] != 0)
                  return Error(playerid, "Order ini sudah tidak tersedia.");
              new mechTargetid = MechOrders[mechOidProc][moPlayerID];
              new mechDbidProc = MechOrders[mechOidProc][moVehicleDB];
              new mechPvidProc = pvData[mechDbidProc][cVeh];
              if(mechPvidProc == INVALID_VEHICLE_ID)
                  return Error(playerid, "Kendaraan player tidak ditemukan.");
              ChangeVehicleColor(mechPvidProc, MechOrders[mechOidProc][moColor1], MechOrders[mechOidProc][moColor2]);
              pvData[mechDbidProc][cColor1] = MechOrders[mechOidProc][moColor1];
              pvData[mechDbidProc][cColor2] = MechOrders[mechOidProc][moColor2];
              if(MechOrders[mechOidProc][moPaintJob] >= 0) {
                  ChangeVehiclePaintjob(mechPvidProc, MechOrders[mechOidProc][moPaintJob]);
                  pvData[mechDbidProc][cPaintJob] = MechOrders[mechOidProc][moPaintJob];
              }
              pvData[mechDbidProc][cNeon] = MechOrders[mechOidProc][moNeon];
              for(new mechS = 0; mechS < 17; mechS++)
                  pvData[mechDbidProc][cMod][mechS] = MechOrders[mechOidProc][moMods][mechS];
              new mechUpdQ[512];
              mysql_format(g_SQL, mechUpdQ, sizeof mechUpdQ, "UPDATE vehicles SET color1=%d,color2=%d,paintjob=%d,neon=%d WHERE id=%d", pvData[mechDbidProc][cColor1], pvData[mechDbidProc][cColor2], pvData[mechDbidProc][cPaintJob], pvData[mechDbidProc][cNeon], pvData[mechDbidProc][cID]);
              mysql_tquery(g_SQL, mechUpdQ);
              MechOrders[mechOidProc][moStatus] = 1;
              format(MechOrders[mechOidProc][moMechName], MAX_PLAYER_NAME, "%s", GetRPName(playerid));
              MechOrderCount--;
              new mechStatQ[256];
              mysql_format(g_SQL, mechStatQ, sizeof mechStatQ, "UPDATE mechanic_orders SET status=1,mech_name='%s' WHERE id=%d", GetRPName(playerid), MechOrders[mechOidProc][moID]);
              mysql_tquery(g_SQL, mechStatQ);
              Info(playerid, "Modifikasi berhasil diterapkan ke kendaraan %s!", MechOrders[mechOidProc][moPlayerName]);
              if(IsPlayerConnected(mechTargetid))
                  Info(mechTargetid, "Kendaraanmu telah dimodifikasi oleh Mekanik %s!", GetRPName(playerid));
              return 1;
          }
      }
      return 1;
  }
  
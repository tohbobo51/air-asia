
  //=============================================================
  // FRAKSI MEKANIK — Asia Pride Roleplay
  // Features:
  //  - /previewmodif  → dialog pilih modif (preview sementara)
  //  - /confirmorder  → dialog bayar cash/bank → revert kendaraan
  //  - /mechorders    → mekanik lihat antrian order
  //  - /processorder  → mekanik proses order (apply permanen)
  //  - /mechduty      → toggle duty mekanik
  //  - /mechmenu      → menu utama fraksi mekanik
  //=============================================================

  #define FACTION_MECH        5
  #define MAX_MECH_ORDERS     50
  #define MECH_WORKSHOP_RANGE 5.0

  // Kas fraksi mekanik (simpan di memory, save ke DB berkala)
  new MechanicKas;

  // Dialog IDs
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
  #define DIALOG_MECH_DUTY_CONFIRM  8111
  #define DIALOG_MECH_KAS           8112

  // Enum order
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
      moMods[17],         // array komponen (slot 0-16)
      moPrice,
      moPayType,          // 0=cash, 1=bank
      moStatus,           // 0=pending, 1=done, 2=cancel
      moMechName[MAX_PLAYER_NAME]
  };
  new MechOrders[MAX_MECH_ORDERS][E_MECH_ORDER],
      MechOrderCount,
      Iterator:MechOrderIter<MAX_MECH_ORDERS>;

  // Snapshot kendaraan sebelum preview (per player)
  enum E_VEH_SNAP
  {
      snapColor1,
      snapColor2,
      snapPaintJob,
      snapNeon,
      snapMods[17],
      snapActive,         // apakah sedang preview?
      snapVehID,
      snapDBID,
      snapPrice           // total harga yang sudah dipilih
  };
  new VehSnapshot[MAX_PLAYERS][E_VEH_SNAP];

  // Harga komponen
  static const MechPriceColor   = 50000;
  static const MechPricePaint   = 75000;
  static const MechPriceNeon    = 60000;
  static const MechPriceComp    = 30000;  // per komponen

  //-----------------------------------------------------------
  // FUNGSI HELPER
  //-----------------------------------------------------------

  bool:IsMechanic(playerid)
      return pData[playerid][pFaction] == FACTION_MECH;

  bool:IsMechanicDuty(playerid)
      return pData[playerid][pFaction] == FACTION_MECH && pData[playerid][pDuty] == 1;

  GetMechRankName(rank)
  {
      new name[32];
      switch(rank) {
          case 1: name = "Apprentice";
          case 2: name = "Mechanic";
          case 3: name = "Senior Mechanic";
          case 4: name = "Chief Mechanic";
          default: name = "Trainee";
      }
      return name;
  }

  GetNeonName(neon)
  {
      new name[24];
      switch(neon) {
          case 0:  name = "Tidak Ada";
          case 1:  name = "Merah";
          case 2:  name = "Hijau";
          case 3:  name = "Biru";
          case 4:  name = "Kuning";
          case 5:  name = "Ungu";
          case 6:  name = "Pink";
          case 7:  name = "Putih";
          default: name = "Tidak Ada";
      }
      return name;
  }

  // Hitung total harga dari snapshot player
  GetSnapPrice(playerid)
  {
      new total;
      new pvid = GetPlayerVehicleID(playerid);
      new dbid = -1;
      foreach(new i : PVehicles) {
          if(pvData[i][cVeh] == pvid) { dbid = i; break; }
      }
      if(dbid == -1) return 0;

      if(VehSnapshot[playerid][snapColor1] != pvData[dbid][cColor1] ||
         VehSnapshot[playerid][snapColor2] != pvData[dbid][cColor2])
          total += MechPriceColor;

      if(VehSnapshot[playerid][snapPaintJob] != pvData[dbid][cPaintJob])
          total += MechPricePaint;

      if(VehSnapshot[playerid][snapNeon] != pvData[dbid][cNeon])
          total += MechPriceNeon;

      for(new s = 0; s < 17; s++) {
          if(VehSnapshot[playerid][snapMods][s] != pvData[dbid][cMod][s])
              total += MechPriceComp;
      }
      return total;
  }

  // Revert kendaraan ke kondisi sebelum preview
  RevertVehicle(playerid)
  {
      new vehid = VehSnapshot[playerid][snapVehID];
      new dbid  = VehSnapshot[playerid][snapDBID];
      if(vehid == INVALID_VEHICLE_ID || dbid == -1) return;

      // Revert warna
      ChangeVehicleColor(vehid, VehSnapshot[playerid][snapColor1], VehSnapshot[playerid][snapColor2]);
      // Revert paintjob
      if(pvData[dbid][cPaintJob] != VehSnapshot[playerid][snapPaintJob])
          ChangeVehiclePaintjob(vehid, pvData[dbid][cPaintJob]);

      // Revert komponen
      for(new s = 0; s < 17; s++) {
          if(pvData[dbid][cMod][s] != 0 && VehSnapshot[playerid][snapMods][s] == 0)
              RemoveVehicleComponent(vehid, pvData[dbid][cMod][s]);
      }

      VehSnapshot[playerid][snapActive] = 0;
  }

  // Notify semua mekanik duty ada order baru
  NotifyMechanics(const msg[])
  {
      foreach(new i : Player) {
          if(IsMechanicDuty(i))
              SendClientMessage(i, 0xFF8800FF, msg);
      }
  }

  // Tampilkan menu preview utama
  ShowPreviewMenu(playerid)
  {
      new pvid = GetPlayerVehicleID(playerid);
      if(pvid == INVALID_VEHICLE_ID)
          return Error(playerid, "Kamu harus berada di dalam kendaraanmu!");

      // Cek apakah kendaraan milik player
      new dbid = -1;
      foreach(new i : PVehicles) {
          if(pvData[i][cVeh] == pvid && strcmp(pvData[i][cOwner], GetRPName(playerid), true) == 0) {
              dbid = i; break;
          }
      }
      if(dbid == -1) return Error(playerid, "Kendaraan ini bukan milikmu!");

      // Simpan snapshot kalau belum ada
      if(!VehSnapshot[playerid][snapActive]) {
          VehSnapshot[playerid][snapColor1]  = pvData[dbid][cColor1];
          VehSnapshot[playerid][snapColor2]  = pvData[dbid][cColor2];
          VehSnapshot[playerid][snapPaintJob]= pvData[dbid][cPaintJob];
          VehSnapshot[playerid][snapNeon]    = pvData[dbid][cNeon];
          for(new s = 0; s < 17; s++)
              VehSnapshot[playerid][snapMods][s] = pvData[dbid][cMod][s];
          VehSnapshot[playerid][snapActive]  = 1;
          VehSnapshot[playerid][snapVehID]   = pvid;
          VehSnapshot[playerid][snapDBID]    = dbid;
          Info(playerid, "Preview mode aktif. Kondisi awal kendaraan telah disimpan.");
      }

      new total = GetSnapPrice(playerid);
      new str[512];
      format(str, sizeof str,
          "Warna Kendaraan\n"
          "Paintjob\n"
          "Neon Bawah\n"
          "Komponen / Tuning\n"
          "\n"
          "Estimasi Total: {FFFF00}Rp.%s\n"
          "Konfirmasi Order",
          FormatMoney(total)
      );
      ShowPlayerDialog(playerid, DIALOG_MECH_PREVIEW_CAT, DIALOG_STYLE_LIST,
          "{FF8800}[ MODIFIKASI KENDARAAN ]{FFFFFF} — Preview",
          str, "Pilih", "Tutup");
      return 1;
  }

  //-----------------------------------------------------------
  // CMD: /previewmodif — Player buka menu preview modif
  //-----------------------------------------------------------
  CMD:previewmodif(playerid, params[])
  {
      if(!pData[playerid][pLoggedIn]) return 1;
      return ShowPreviewMenu(playerid);
  }
  alias:previewmodif("modif")

  //-----------------------------------------------------------
  // CMD: /cancelpreview — Batalkan preview, revert kendaraan
  //-----------------------------------------------------------
  CMD:cancelpreview(playerid, params[])
  {
      if(!VehSnapshot[playerid][snapActive])
          return Error(playerid, "Kamu tidak sedang dalam mode preview.");
      RevertVehicle(playerid);
      Info(playerid, "Preview dibatalkan. Kendaraan dikembalikan ke kondisi awal.");
      return 1;
  }

  //-----------------------------------------------------------
  // CMD: /confirmorder — Konfirmasi order dan pilih pembayaran
  //-----------------------------------------------------------
  CMD:confirmorder(playerid, params[])
  {
      if(!VehSnapshot[playerid][snapActive])
          return Error(playerid, "Kamu belum membuka preview modifikasi. Gunakan /modif terlebih dahulu.");

      new total = GetSnapPrice(playerid);
      if(total <= 0)
          return Error(playerid, "Kamu belum memilih modifikasi apapun.");

      VehSnapshot[playerid][snapPrice] = total;

      // Tampilkan ringkasan + pilihan pembayaran
      new str[512];
      format(str, sizeof str,
          "Total Biaya Modifikasi: {FFFF00}Rp.%s{FFFFFF}\n\n"
          "Pilih metode pembayaran:\n\n"
          "{FFFFFF}[ {00FF00}Cash{FFFFFF} ]\t{AAAAAA}Uang di tangan berkurang\n"
          "{FFFFFF}[ {00AAFF}Transfer Bank{FFFFFF} ]\t{AAAAAA}Saldo bank berkurang",
          FormatMoney(total)
      );
      ShowPlayerDialog(playerid, DIALOG_MECH_PAYMENT, DIALOG_STYLE_LIST,
          "{FF8800}[ KONFIRMASI ORDER ]{FFFFFF} — Pilih Pembayaran",
          str, "Bayar", "Batal");
      return 1;
  }

  //-----------------------------------------------------------
  // CMD: /mechorders — Mekanik lihat antrian order
  //-----------------------------------------------------------
  CMD:mechorders(playerid, params[])
  {
      if(!IsMechanicDuty(playerid))
          return Error(playerid, "Kamu harus menjadi Mekanik dan sedang duty.");

      if(MechOrderCount == 0)
          return Info(playerid, "Tidak ada order yang pending saat ini.");

      new str[2048], count;
      format(str, sizeof str, "");
      foreach(new i : MechOrderIter) {
          if(MechOrders[i][moStatus] == 0) {
              new pay[10];
              pay = MechOrders[i][moPayType] == 0 ? "Cash" : "Bank";
              format(str, sizeof str, "%s#%d | %s | %s | Rp.%s\n",
                  str,
                  MechOrders[i][moID],
                  MechOrders[i][moPlayerName],
                  pay,
                  FormatMoney(MechOrders[i][moPrice])
              );
              count++;
          }
      }

      if(!count) return Info(playerid, "Tidak ada order pending.");

      ShowPlayerDialog(playerid, DIALOG_MECH_ORDERS, DIALOG_STYLE_LIST,
          "{FF8800}[ ORDER MODIFIKASI ]{FFFFFF} — Pilih untuk proses",
          str, "Proses", "Tutup");
      return 1;
  }

  //-----------------------------------------------------------
  // CMD: /mechduty — Toggle duty mekanik
  //-----------------------------------------------------------
  CMD:mechduty(playerid, params[])
  {
      if(!IsMechanic(playerid))
          return Error(playerid, "Kamu bukan anggota Fraksi Mekanik.");

      if(pData[playerid][pDuty] == 0) {
          pData[playerid][pDuty] = 1;
          Info(playerid, "Kamu sekarang ON DUTY sebagai Mekanik. Notif order akan masuk.");
          SendClientMessageToAll(0xFF8800FF, "* %s [Mekanik] kini siap melayani modifikasi kendaraan.", GetRPName(playerid));
      } else {
          pData[playerid][pDuty] = 0;
          Info(playerid, "Kamu sekarang OFF DUTY.");
      }
      return 1;
  }

  //-----------------------------------------------------------
  // CMD: /mechmenu — Menu info fraksi mekanik
  //-----------------------------------------------------------
  CMD:mechmenu(playerid, params[])
  {
      if(!IsMechanic(playerid))
          return Error(playerid, "Kamu bukan anggota Fraksi Mekanik.");

      new str[512];
      format(str, sizeof str,
          "Status Duty: %s\n"
          "Rank: %s\n"
          "Kas Fraksi: Rp.%s\n"
          "\n"
          "Lihat Order Pending\n"
          "Toggle Duty",
          pData[playerid][pDuty] ? "{00FF00}ON DUTY" : "{FF0000}OFF DUTY",
          GetMechRankName(pData[playerid][pFactionRank]),
          FormatMoney(MechanicKas)
      );
      ShowPlayerDialog(playerid, DIALOG_MECH_MENU, DIALOG_STYLE_LIST,
          "{FF8800}[ MENU MEKANIK ]",
          str, "Pilih", "Tutup");
      return 1;
  }

  //-----------------------------------------------------------
  // DIALOG HANDLER — Semua dialog mekanik
  //-----------------------------------------------------------
  hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
  {
      switch(dialogid)
      {
          // ======================================================
          // MENU UTAMA MEKANIK
          // ======================================================
          case DIALOG_MECH_MENU:
          {
              if(!response) return 1;
              switch(listitem) {
                  case 4: CMD:mechorders(playerid, "");   // Lihat Order
                  case 5: CMD:mechduty(playerid, "");     // Toggle Duty
              }
              return 1;
          }

          // ======================================================
          // KATEGORI PREVIEW MODIFIKASI
          // ======================================================
          case DIALOG_MECH_PREVIEW_CAT:
          {
              if(!response) return 1;
              switch(listitem)
              {
                  case 0: // Warna Kendaraan
                  {
                      new str[1024];
                      new colors[13][] = {"Putih","Hitam","Merah","Biru","Hijau","Kuning","Oranye","Ungu","Pink","Abu-abu","Coklat","Silver","Gold"};
                      new colorCodes[13] = {1, 0, 6, 3, 53, 88, 10, 71, 135, 101, 7, 4, 11};
                      format(str, sizeof str, "");
                      for(new c = 0; c < 13; c++) {
                          format(str, sizeof str, "%s%s\t{AAAAAA}+Rp.%s\n", str, colors[c], FormatMoney(MechPriceColor));
                      }
                      ShowPlayerDialog(playerid, DIALOG_MECH_COLOR1, DIALOG_STYLE_LIST,
                          "{FF8800}[ PILIH WARNA UTAMA ]", str, "Pilih", "Kembali");
                  }
                  case 1: // Paintjob
                  {
                      new str[512];
                      format(str, sizeof str,
                          "Paintjob 1\t{AAAAAA}+Rp.%s\n"
                          "Paintjob 2\t{AAAAAA}+Rp.%s\n"
                          "Paintjob 3\t{AAAAAA}+Rp.%s\n"
                          "Hapus Paintjob\t{AAAAAA}Gratis",
                          FormatMoney(MechPricePaint), FormatMoney(MechPricePaint), FormatMoney(MechPricePaint)
                      );
                      ShowPlayerDialog(playerid, DIALOG_MECH_PAINTJOB, DIALOG_STYLE_LIST,
                          "{FF8800}[ PAINTJOB ]", str, "Pilih", "Kembali");
                  }
                  case 2: // Neon
                  {
                      new str[512];
                      format(str, sizeof str,
                          "Tidak Ada Neon\t{AAAAAA}Gratis\n"
                          "Neon Merah\t{AAAAAA}+Rp.%s\n"
                          "Neon Hijau\t{AAAAAA}+Rp.%s\n"
                          "Neon Biru\t{AAAAAA}+Rp.%s\n"
                          "Neon Kuning\t{AAAAAA}+Rp.%s\n"
                          "Neon Ungu\t{AAAAAA}+Rp.%s\n"
                          "Neon Pink\t{AAAAAA}+Rp.%s\n"
                          "Neon Putih\t{AAAAAA}+Rp.%s",
                          FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon),
                          FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon), FormatMoney(MechPriceNeon),
                          FormatMoney(MechPriceNeon)
                      );
                      ShowPlayerDialog(playerid, DIALOG_MECH_NEON, DIALOG_STYLE_LIST,
                          "{FF8800}[ NEON BAWAH ]", str, "Pilih", "Kembali");
                  }
                  case 3: // Komponen
                  {
                      new str[1024], pvid = GetPlayerVehicleID(playerid);
                      new model = GetVehicleModel(pvid);
                      // Tampilkan slot komponen yang tersedia (slot 0-16 sesuai SA-MP)
                      new slotNames[17][] = {
                          "Spoiler","Hood","Roof","Sideskirt","Lamps","Nitro x2","Nitro x5","Nitro x10",
                          "Exhaust","Wheels","Stereo","Hydraulics","Front Bumper","Rear Bumper","Misc 1","Misc 2","Misc 3"
                      };
                      format(str, sizeof str, "");
                      for(new s = 0; s < 17; s++) {
                          new cur[20];
                          cur = VehSnapshot[playerid][snapMods][s] != 0 ? "{00FF00}Terpasang" : "{AAAAAA}Kosong";
                          format(str, sizeof str, "%s%s\t%s (+Rp.%s)\n",
                              str, slotNames[s], cur, FormatMoney(MechPriceComp));
                      }
                      SetPVarInt(playerid, "MechCompPage", 0);
                      ShowPlayerDialog(playerid, DIALOG_MECH_COMPONENT, DIALOG_STYLE_LIST,
                          "{FF8800}[ KOMPONEN / TUNING ]", str, "Pilih", "Kembali");
                  }
                  case 5: // Konfirmasi Order
                  {
                      CMD:confirmorder(playerid, "");
                  }
              }
              return 1;
          }

          // ======================================================
          // PILIH WARNA UTAMA
          // ======================================================
          case DIALOG_MECH_COLOR1:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new colorCodes[13] = {1, 0, 6, 3, 53, 88, 10, 71, 135, 101, 7, 4, 11};
              if(listitem < 13) {
                  new pvid = GetPlayerVehicleID(playerid);
                  SetPVarInt(playerid, "MechTmpColor1", colorCodes[listitem]);
                  // Tanya warna kedua
                  new str[512];
                  new colors[13][] = {"Putih","Hitam","Merah","Biru","Hijau","Kuning","Oranye","Ungu","Pink","Abu-abu","Coklat","Silver","Gold"};
                  format(str, sizeof str, "");
                  for(new c = 0; c < 13; c++)
                      format(str, sizeof str, "%s%s\n", str, colors[c]);
                  ShowPlayerDialog(playerid, DIALOG_MECH_COLOR2, DIALOG_STYLE_LIST,
                      "{FF8800}[ PILIH WARNA SEKUNDER ]", str, "Pilih", "Kembali");
              }
              return 1;
          }

          // ======================================================
          // PILIH WARNA SEKUNDER
          // ======================================================
          case DIALOG_MECH_COLOR2:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new colorCodes[13] = {1, 0, 6, 3, 53, 88, 10, 71, 135, 101, 7, 4, 11};
              if(listitem < 13) {
                  new pvid = GetPlayerVehicleID(playerid);
                  new c1 = GetPVarInt(playerid, "MechTmpColor1");
                  new c2 = colorCodes[listitem];
                  ChangeVehicleColor(pvid, c1, c2);
                  VehSnapshot[playerid][snapColor1] = c1;
                  VehSnapshot[playerid][snapColor2] = c2;
                  Info(playerid, "Preview warna diterapkan. Gunakan /confirmorder untuk pesan.");
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          // ======================================================
          // PAINTJOB
          // ======================================================
          case DIALOG_MECH_PAINTJOB:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              new pvid = GetPlayerVehicleID(playerid);
              if(listitem < 3) {
                  ChangeVehiclePaintjob(pvid, listitem);
                  VehSnapshot[playerid][snapPaintJob] = listitem;
                  Info(playerid, "Preview paintjob diterapkan.");
              } else {
                  ChangeVehiclePaintjob(pvid, -1);
                  VehSnapshot[playerid][snapPaintJob] = -1;
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          // ======================================================
          // NEON
          // ======================================================
          case DIALOG_MECH_NEON:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              VehSnapshot[playerid][snapNeon] = listitem; // 0=none, 1-7=warna
              if(listitem == 0)
                  Info(playerid, "Neon dihapus dari preview.");
              else
                  Info(playerid, "Preview neon %s diterapkan.", GetNeonName(listitem));
              ShowPreviewMenu(playerid);
              return 1;
          }

          // ======================================================
          // KOMPONEN
          // ======================================================
          case DIALOG_MECH_COMPONENT:
          {
              if(!response) { ShowPreviewMenu(playerid); return 1; }
              if(listitem < 17) {
                  new slot = listitem;
                  new slotNames[17][] = {
                      "Spoiler","Hood","Roof","Sideskirt","Lamps","Nitro x2","Nitro x5","Nitro x10",
                      "Exhaust","Wheels","Stereo","Hydraulics","Front Bumper","Rear Bumper","Misc 1","Misc 2","Misc 3"
                  };
                  if(VehSnapshot[playerid][snapMods][slot] != 0) {
                      // Toggle off
                      VehSnapshot[playerid][snapMods][slot] = 0;
                      Info(playerid, "%s dihapus dari order.", slotNames[slot]);
                  } else {
                      // Mark slot aktif (nilai 1 = dipesan, nilai aktual dipasang saat proses)
                      VehSnapshot[playerid][snapMods][slot] = 1;
                      Info(playerid, "%s ditambahkan ke order. (+Rp.%s)", slotNames[slot], FormatMoney(MechPriceComp));
                  }
              }
              ShowPreviewMenu(playerid);
              return 1;
          }

          // ======================================================
          // KONFIRMASI PEMBAYARAN
          // ======================================================
          case DIALOG_MECH_PAYMENT:
          {
              if(!response) return 1;

              new total = VehSnapshot[playerid][snapPrice];
              new payType = listitem; // 0=cash, 1=bank

              // Cek saldo
              if(payType == 0 && pData[playerid][pMoney] < total)
                  return Error(playerid, "Uang cash kamu tidak cukup! Butuh Rp.%s", FormatMoney(total));
              if(payType == 1 && pData[playerid][pBankMoney] < total)
                  return Error(playerid, "Saldo bank kamu tidak cukup! Butuh Rp.%s", FormatMoney(total));

              // Potong uang player
              if(payType == 0) {
                  GivePlayerMoney(playerid, -total);
                  pData[playerid][pMoney] -= total;
              } else {
                  pData[playerid][pBankMoney] -= total;
                  // Update bank di DB
                  new query[256];
                  mysql_format(g_SQL, query, sizeof query,
                      "UPDATE characters SET bmoney=%d WHERE id=%d",
                      pData[playerid][pBankMoney], pData[playerid][pID]);
                  mysql_tquery(g_SQL, query);
              }

              // Masuk ke kas mekanik
              MechanicKas += total;

              // Simpan order ke array
              new oid = Iter_Free(MechOrderIter);
              if(oid == -1) return Error(playerid, "Server penuh, coba lagi nanti.");
              Iter_Add(MechOrderIter, oid);

              MechOrders[oid][moID]          = oid;
              format(MechOrders[oid][moPlayerName], MAX_PLAYER_NAME, "%s", GetRPName(playerid));
              MechOrders[oid][moPlayerID]    = playerid;
              MechOrders[oid][moPrice]       = total;
              MechOrders[oid][moPayType]     = payType;
              MechOrders[oid][moStatus]      = 0;

              new pvid = GetPlayerVehicleID(playerid);
              new dbid = VehSnapshot[playerid][snapDBID];
              MechOrders[oid][moVehicleModel]= GetVehicleModel(pvid);
              MechOrders[oid][moVehicleDB]   = dbid;
              MechOrders[oid][moColor1]      = VehSnapshot[playerid][snapColor1];
              MechOrders[oid][moColor2]      = VehSnapshot[playerid][snapColor2];
              MechOrders[oid][moPaintJob]    = VehSnapshot[playerid][snapPaintJob];
              MechOrders[oid][moNeon]        = VehSnapshot[playerid][snapNeon];
              for(new s = 0; s < 17; s++)
                  MechOrders[oid][moMods][s] = VehSnapshot[playerid][snapMods][s];

              MechOrderCount++;

              // Revert kendaraan ke kondisi awal
              RevertVehicle(playerid);

              // Simpan order ke DB
              new query[512];
              mysql_format(g_SQL, query, sizeof query,
                  "INSERT INTO mechanic_orders(player_name, vehicle_model, color1, color2, paintjob, neon, price, pay_type) VALUES ('%s', %d, %d, %d, %d, %d, %d, %d)",
                  MechOrders[oid][moPlayerName],
                  MechOrders[oid][moVehicleModel],
                  MechOrders[oid][moColor1],
                  MechOrders[oid][moColor2],
                  MechOrders[oid][moPaintJob],
                  MechOrders[oid][moNeon],
                  MechOrders[oid][moPrice],
                  MechOrders[oid][moPayType]
              );
              mysql_tquery(g_SQL, query);

              // Notif ke semua mekanik duty
              new notif[128];
              format(notif, sizeof notif,
                  "[Mekanik] Order baru dari %s! Rp.%s | /mechorders untuk proses.",
                  GetRPName(playerid), FormatMoney(total));
              NotifyMechanics(notif);

              Info(playerid, "Order diterima! Kendaraan dikembalikan ke kondisi awal. Tunggu mekanik memproses.");
              return 1;
          }

          // ======================================================
          // DAFTAR ORDER — MEKANIK
          // ======================================================
          case DIALOG_MECH_ORDERS:
          {
              if(!response) return 1;

              // Cari order ke-listitem yang pending
              new cur, oid = -1;
              foreach(new i : MechOrderIter) {
                  if(MechOrders[i][moStatus] == 0) {
                      if(cur == listitem) { oid = i; break; }
                      cur++;
                  }
              }
              if(oid == -1) return 1;

              // Simpan oid yang dipilih mekanik
              SetPVarInt(playerid, "MechSelOrder", oid);

              // Tampilkan detail order
              new str[512];
              format(str, sizeof str,
                  "ID Order   : {FFFF00}#%d{FFFFFF}\n"
                  "Player     : {FFFF00}%s{FFFFFF}\n"
                  "Kendaraan  : {FFFF00}%s{FFFFFF}\n"
                  "Warna      : {FFFF00}%d / %d{FFFFFF}\n"
                  "Paintjob   : {FFFF00}%d{FFFFFF}\n"
                  "Neon       : {FFFF00}%s{FFFFFF}\n"
                  "Harga      : {FFFF00}Rp.%s{FFFFFF}\n"
                  "Bayar via  : {FFFF00}%s{FFFFFF}\n\n"
                  "Klik {00FF00}Proses{FFFFFF} untuk apply modif ke kendaraan player.",
                  MechOrders[oid][moID],
                  MechOrders[oid][moPlayerName],
                  GetVehicleModelName(MechOrders[oid][moVehicleModel]),
                  MechOrders[oid][moColor1], MechOrders[oid][moColor2],
                  MechOrders[oid][moPaintJob],
                  GetNeonName(MechOrders[oid][moNeon]),
                  FormatMoney(MechOrders[oid][moPrice]),
                  MechOrders[oid][moPayType] == 0 ? "Cash" : "Bank"
              );
              ShowPlayerDialog(playerid, DIALOG_MECH_ORDER_DETAIL, DIALOG_STYLE_MSGBOX,
                  "{FF8800}[ DETAIL ORDER ]", str, "Proses", "Kembali");
              return 1;
          }

          // ======================================================
          // PROSES ORDER — APPLY PERMANEN
          // ======================================================
          case DIALOG_MECH_ORDER_DETAIL:
          {
              if(!response) { CMD:mechorders(playerid, ""); return 1; }

              new oid = GetPVarInt(playerid, "MechSelOrder");
              if(oid == -1 || MechOrders[oid][moStatus] != 0)
                  return Error(playerid, "Order ini sudah tidak tersedia.");

              new targetid  = MechOrders[oid][moPlayerID];
              new dbid      = MechOrders[oid][moVehicleDB];

              // Cek target masih online dan di kendaraan
              if(!IsPlayerConnected(targetid))
                  return Error(playerid, "Player sudah offline. Order tetap tercatat.");

              new pvid = pvData[dbid][cVeh];
              if(pvid == INVALID_VEHICLE_ID)
                  return Error(playerid, "Kendaraan player tidak ditemukan.");

              // ---- Apply modif ke kendaraan permanen ----
              ChangeVehicleColor(pvid, MechOrders[oid][moColor1], MechOrders[oid][moColor2]);
              pvData[dbid][cColor1] = MechOrders[oid][moColor1];
              pvData[dbid][cColor2] = MechOrders[oid][moColor2];

              if(MechOrders[oid][moPaintJob] >= 0) {
                  ChangeVehiclePaintjob(pvid, MechOrders[oid][moPaintJob]);
                  pvData[dbid][cPaintJob] = MechOrders[oid][moPaintJob];
              }

              pvData[dbid][cNeon] = MechOrders[oid][moNeon];

              for(new s = 0; s < 17; s++)
                  pvData[dbid][cMod][s] = MechOrders[oid][moMods][s];

              // Simpan ke DB
              new query[512];
              mysql_format(g_SQL, query, sizeof query,
                  "UPDATE vehicles SET color1=%d, color2=%d, paintjob=%d, neon=%d WHERE id=%d",
                  pvData[dbid][cColor1], pvData[dbid][cColor2],
                  pvData[dbid][cPaintJob], pvData[dbid][cNeon], pvData[dbid][cID]);
              mysql_tquery(g_SQL, query);

              // Update status order
              MechOrders[oid][moStatus] = 1;
              format(MechOrders[oid][moMechName], MAX_PLAYER_NAME, "%s", GetRPName(playerid));
              MechOrderCount--;

              // Update DB order
              mysql_format(g_SQL, query, sizeof query,
                  "UPDATE mechanic_orders SET status=1, mech_name='%s' WHERE id=%d",
                  GetRPName(playerid), MechOrders[oid][moID]);
              mysql_tquery(g_SQL, query);

              // Notif
              Info(playerid, "Modifikasi berhasil diterapkan ke kendaraan %s!", MechOrders[oid][moPlayerName]);
              if(IsPlayerConnected(targetid))
                  Info(targetid, "Kendaraanmu telah dimodifikasi oleh Mekanik %s!", GetRPName(playerid));

              return 1;
          }
      }
      return 1;
  }
  
//============FS ANTI WEAPON HACK============//

/*______________________________________
Nama Author : Faruq dan Ryu$
Tidak Untuk Diperjual Belikan
No Makelar Anjing*/
#include <a_samp>

#define 	WHITE 				0xFFFFFFFF
#define     GREY                0xAFAFAFFF

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

forward KickPlayer(playerid);
public KickPlayer(playerid)
{
    SetTimerEx("KickUser", 1000, 0, "i", playerid);
}

forward KickUser(playerid);
public KickUser(playerid)
{
	Kick(playerid);
}

public OnPlayerUpdate(playerid)
{
    if(GetPlayerScore(playerid) < 4)//artinya kalau level dibawah 4 bakalan ke kick terkena anti cheat weapon hack
 	{
		if(GetPlayerWeapon(playerid) == 25)//id 25 sama dengan senjata shotgun
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
        if(GetPlayerWeapon(playerid) == 38)//id 38 sama dengan senjata minigun
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
	       if(GetPlayerWeapon(playerid) == 24)//id 24 sama dengan senjata desert
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 16)//id 16 sama dengan senjata Bom
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 35)//id 35 sama dengan senjata Basoka
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 31)//id 31 sama dengan senjata M4
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 30)//id 30 sama dengan senjata AK
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 29)//id 29 sama dengan senjata Mp5
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 26)//id 26 sama dengan senjata Sg2
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 37)//id 37 sama dengan senjata Api
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 34)//id 34 sama dengan senjata Snipper
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 27)//id 27 sama dengan senjata Spash12
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
			if(GetPlayerWeapon(playerid) == 28)//id 28 sama dengan senjata MicroUzi
		{
			new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
	 }
    /*if(PlayerInfo[playerid][AdminLevel] == 0)//ini adalah variable yang mengget varibale player apa bila bukan admin dia akan terkena kick weapon hack
	{
        if(GetPlayerWeapon(playerid) == 38)
		{
		    new string[168];
			new gunID = GetPlayerWeapon(playerid);
			RemovePlayerWeapon(playerid, gunID);
		    format(string,sizeof(string), "{B0C4DE}FARUQBOT : {FFFF00}%s {FFFFFF}telah dikick dari server {FF0000}WEAPON-HACK!", PlayerIrwanIbrahim(playerid));
		    SendClientMessageToAll(WHITE, string);
		    KickPlayer(playerid);
		}
	}*/
	return 1;
}

stock PlayerIrwanIbrahim(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid,name,sizeof(name));
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if(name[i] == '_') name[i] = ' ';
    }
    return name;
}

stock RemovePlayerWeapon(playerid, weaponid) //Credits to Faruq & leapfish untuk membantu saya membuat stock ini
{
	new plyWeapons[12];
	new plyAmmo[12];
	for(new slot = 0; slot != 12; slot++)
	{
	    new wep, ammo;
	    GetPlayerWeaponData(playerid, slot, wep, ammo);
	    if(wep != weaponid)
	    {
	        GetPlayerWeaponData(playerid, slot, plyWeapons[slot], plyAmmo[slot]);
		}
	}
	ResetPlayerWeapons(playerid);
	for(new slot = 0; slot != 12; slot++)
	{
	    GivePlayerWeapon(playerid, plyWeapons[slot], plyAmmo[slot]);
	}
}
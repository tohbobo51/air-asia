//Paytax
CMD:paytax(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1083.47, -1771.3, 13.9284)) return Error(playerid, "Anda harus berada di Balai Kota!");
	new string[1024];
	format(string, sizeof(string), "Pajak Bisnis\nPajak Rumah");
	ShowPlayerDialog(playerid, DIALOG_PAYTAX, DIALOG_STYLE_LIST, "Pajak Akses", string , "Pilih","Tidak");
	return 1;
}
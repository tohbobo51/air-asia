#define MAX_RENTVEH 20

new Float:rentVehicle[][3] =
{
    {2816.284912, 951.004272, 10.450001},
    {425.459106, -1806.017089, 5.146874},
    {-599.577514, -496.425567, 25.423440}
};

new Float:unrentVehicle[][3] =
{
    {1689.7552, -2311.7261, 13.5469},
    {804.9299, -1362.8210, 13.5469},
    {1757.7032, -1864.0552, 13.5743}
};

CMD:rentbike(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2816.284912, 951.004272, 10.450001) && !IsPlayerInRangeOfPoint(playerid, 3.0, 425.459106, -1806.017089, 5.146874) && !IsPlayerInRangeOfPoint(playerid, 3.0, -599.577514, -496.425567, 25.423440)) 
        return Error(playerid, "Kamu tidak berada di dekat penyewaan sepeda!");
        
    new str[1024];
    format(str, sizeof(str), "Kendaraan\tHarga\n"WHITE_E"%s\t"LG_E"Rp.20.000 / 30 minute\n%s\t"LG_E"Rp.50.000 / 30 minute\n%s\t"LG_E"Rp.125.000 / 30 minute\n%s\t"LG_E"Rp.225.000 / 30 minute",
    GetVehicleModelName(481), 
    GetVehicleModelName(462),
    GetVehicleModelName(418),
    GetVehicleModelName(422));
                
    ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "Rent Bike", str, "Rent", "Close");
    return 1;
}    
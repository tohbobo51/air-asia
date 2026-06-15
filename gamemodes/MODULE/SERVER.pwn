new ServerMoney, //2255.92, -1747.33, 1014.77
	Material,
	MaterialPrice,
	LumberPrice,
	Component,
	ComponentPrice,
	MetalPrice,
	GasOil,
	GasOilPrice,
	CoalPrice,
	Product,
	ProductPrice,
	Apotek,
	MedicinePrice,
	MedkitPrice,
	Food,
	FoodPrice,
	SeedPrice,
	PotatoPrice,
	WheatPrice,
	OrangePrice,
	Marijuana,
	MarijuanaPrice,
	Crack,
	CrackPrice,
	FishPrice,
	CrateFish,
	FishStock,
	CrateComponent,
	CrateMaterial,
	GStationPrice,
	Pedagang,
	ObatMyr,
	ObatPrice,
	AyamFill,
	AyamFillPrice;

new MoneyPickup,
	Text3D:MoneyText,
	MatPickup,
	Text3D:MatText,
	CompPickup,
	Text3D:CompText,
	GasOilPickup,
	Text3D:GasOilText,
	OrePickup,
	Text3D:OreText,
	PedagangPickup,
	Text3D:PedagangText,
	AyamPickup,
	Text3D:AyamText,
	ProductPickup,
	Text3D:ProductText,
	ApotekPickup,
	Text3D:ApotekText,
	FoodPickup,
	Text3D:FoodText,
	DrugPickup,
	Text3D:DrugText,
	ObatPickup,
	Text3D:ObatText,
	CargoPickup,
	Text3D:CargoText,
	CrateComponentStockPickup,
	Text3D:CrateComponentStockText;

CreateServerPoint()
{
	if(IsValidDynamic3DTextLabel(MoneyText))
            DestroyDynamic3DTextLabel(MoneyText);

	if(IsValidDynamicPickup(MoneyPickup))
		DestroyDynamicPickup(MoneyPickup);

	//Server Money
	new strings[1024];
	MoneyPickup = CreateDynamicPickup(1239, 23, 1648.69, -1356.05, 18.20, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Server Money]\n"WHITE_E"Goverment Money: "LG_E"%s", FormatMoney(ServerMoney));
	MoneyText = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1648.69, -1356.05, 18.20, 5.0);

	if(IsValidDynamic3DTextLabel(MatText))
            DestroyDynamic3DTextLabel(MatText);

	if(IsValidDynamicPickup(MatPickup))
		DestroyDynamicPickup(MatPickup);

	if(IsValidDynamic3DTextLabel(CompText))
            DestroyDynamic3DTextLabel(CompText);

	if(IsValidDynamicPickup(CompPickup))
		DestroyDynamicPickup(CompPickup);

	if(IsValidDynamic3DTextLabel(AyamText))
            DestroyDynamic3DTextLabel(AyamText);
            
    if(IsValidDynamic3DTextLabel(CrateComponentStockText))
            DestroyDynamic3DTextLabel(CrateComponentStockText);

    if(IsValidDynamicPickup(CrateComponentStockPickup))
		DestroyDynamicPickup(CrateComponentStockPickup);
		
	if(IsValidDynamicPickup(AyamPickup))
		DestroyDynamicPickup(AyamPickup);

	if(IsValidDynamic3DTextLabel(GasOilText))
            DestroyDynamic3DTextLabel(GasOilText);

	if(IsValidDynamicPickup(GasOilPickup))
		DestroyDynamicPickup(GasOilPickup);

	if(IsValidDynamic3DTextLabel(PedagangText))
            DestroyDynamic3DTextLabel(PedagangText);

	if(IsValidDynamicPickup(PedagangPickup))
		DestroyDynamicPickup(PedagangPickup);

	if(IsValidDynamic3DTextLabel(OreText))
            DestroyDynamic3DTextLabel(OreText);

	if(IsValidDynamicPickup(OrePickup))
		DestroyDynamicPickup(OrePickup);

	if(IsValidDynamic3DTextLabel(ProductText))
            DestroyDynamic3DTextLabel(ProductText);

	if(IsValidDynamicPickup(ProductPickup))
		DestroyDynamicPickup(ProductPickup);

	if(IsValidDynamic3DTextLabel(ApotekText))
            DestroyDynamic3DTextLabel(ApotekText);

	if(IsValidDynamicPickup(ApotekPickup))
		DestroyDynamicPickup(ApotekPickup);

	if(IsValidDynamic3DTextLabel(FoodText))
            DestroyDynamic3DTextLabel(FoodText);

	if(IsValidDynamicPickup(FoodPickup))
		DestroyDynamicPickup(FoodPickup);

	if(IsValidDynamic3DTextLabel(DrugText))
            DestroyDynamic3DTextLabel(DrugText);

	if(IsValidDynamicPickup(DrugPickup))
		DestroyDynamicPickup(DrugPickup);

	if(IsValidDynamic3DTextLabel(ObatText))
            DestroyDynamic3DTextLabel(ObatText);

	if(IsValidDynamicPickup(ObatPickup))
		DestroyDynamicPickup(ObatPickup);

	if(IsValidDynamicPickup(DrugPickup))
		DestroyDynamicPickup(DrugPickup);

	if(IsValidDynamic3DTextLabel(CargoText))
            DestroyDynamic3DTextLabel(CargoText);

	if(IsValidDynamicPickup(CargoPickup))
		DestroyDynamicPickup(CargoPickup);


	//JOBS
	MatPickup = CreateDynamicPickup(1239, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Material]\n"WHITE_E"Material Stock: "LG_E"%d\n\n"WHITE_E"Material Price: "LG_E"%s /item\n\n"WHITE_E"Lumber Price: "LG_E"%s /item\n"LB_E"/buy", Material, FormatMoney(MaterialPrice), FormatMoney(LumberPrice));
	MatText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // lumber

	CompPickup = CreateDynamicPickup(1239, 23, 854.5555, -605.2056, 18.4219, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Miner]\n"WHITE_E"Component Stock: "LG_E"%d\n\n"WHITE_E"Component Price: "LG_E"%s /item\n"LB_E"/buy", Component, FormatMoney(ComponentPrice));
	CompText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 854.5555, -605.2056, 18.4219, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // comp

	GasOilPickup = CreateDynamicPickup(1239, 23, 336.70, 895.54, 20.40, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Gasoil]\n"WHITE_E"GasOil Stock: "LG_E"%d liters\n\n"WHITE_E"GasOil Price: "LG_E"%s /liters\n"LB_E"/buy", GasOil, FormatMoney(GasOilPrice));
	GasOilText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 336.70, 895.54, 20.40, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // gasoil

	PedagangPickup = CreateDynamicPickup(1239, 23, 1256.2795, -1281.5076, 1061.1492, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[PEDAGANG]\n"WHITE_E"Pedagang Stock: "LG_E"%d\n"LB_E"/locker", Pedagang);
	PedagangText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1256.2795, -1281.5076, 1061.1492, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Apotek hospital

	AyamPickup = CreateDynamicPickup(1239, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[GUDANG AYAM]\n"WHITE_E"Ayam Stock: "LG_E"%d\n\n"WHITE_E"Ayam Price: "LG_E"%s /item\n"LB_E"/buy ", AyamFill, FormatMoney(AyamFillPrice));
	AyamText = CreateDynamic3DTextLabel(strings, COLOR_GREY, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product

	OrePickup = CreateDynamicPickup(1239, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Miner]\n"WHITE_E"Ore Metal Price: "LG_E"%s / item\n\n"WHITE_E"Ore Coal Price: "LG_E"%s /item\n"LB_E"/ore sell", FormatMoney(MetalPrice), FormatMoney(CoalPrice));
	OreText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // sell ore

	ProductPickup = CreateDynamicPickup(1239, 23, 365.92, 885.47, 21.28, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[PRODUCT]\n"WHITE_E"Product Stock: "LG_E"%d\n\n"WHITE_E"Product Price: "LG_E"%s /item\n"LB_E"/buy", Product, FormatMoney(ProductPrice));
	ProductText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 365.92, 885.47, 21.28, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product

	ApotekPickup = CreateDynamicPickup(1241, 23, 1344.85, 1572.11, 3010.90, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Hospital]\n"WHITE_E"Apotek Stock: "LG_E"%d\n"LB_E"/buy", Apotek);
	ApotekText = CreateDynamic3DTextLabel(strings, COLOR_PINK, 1344.85, 1572.11, 3010.90, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Apotek hospital

	FoodPickup = CreateDynamicPickup(1239, 23, -381.44, -1426.13, 25.93, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Food]\n"WHITE_E"Food Stock: "LG_E"%d\n"WHITE_E"Food Price: "LG_E"%s /item\n\n"WHITE_E"Seed Price: "LG_E"%s /item\n"WHITE_E"Potato Price: "LG_E"%s /kg\n"WHITE_E"Wheat Price: "LG_E"%s /kg\n"WHITE_E"Orange Price: "LG_E"%s /kg\n\n"WHITE_E"Fish Price: "LG_E"%s /kg\n"LB_E"/buy /sellfish",
	Food, FormatMoney(FoodPrice), FormatMoney(SeedPrice), FormatMoney(PotatoPrice), FormatMoney(WheatPrice), FormatMoney(OrangePrice), FormatMoney(FishPrice));
	FoodText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -381.44, -1426.13 , 25.93+1, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // food

	DrugPickup = CreateDynamicPickup(1239, 23, 82537.0117,-1304.5032,34.9453, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Black Market]\n"WHITE_E"Marijuana Stock: "LG_E"%d\n\n"WHITE_E"Marijuana Price: "LG_E"%s /item\n"LB_E"/buy /sellmarijuana", Marijuana, FormatMoney(MarijuanaPrice));
	DrugText = CreateDynamic3DTextLabel(strings, COLOR_GREY, 2537.0117,-1304.5032,34.9453, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product
	
	CreateDynamicPickup(1239, 23, -427.3773, -392.3799, 16.5802, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Pencucian Uang]\n"WHITE_E"Stock: "LG_E"%d\n\n"WHITE_E"Price: "LG_E"%s /item\n"LB_E"/washmoney", Crack, FormatMoney(CrackPrice));
	CreateDynamic3DTextLabel(strings, COLOR_GREY, -427.3773, -392.3799, 16.5802, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product

	//Vending Restock
	new box = ProductPrice*15;
	CargoPickup = CreateDynamicPickup(1271, 23, -50.61, -233.28, 6.76, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Cargo Warehouse]\n"WHITE_E"Box Stock: "LG_E"%d\n\n"WHITE_E"Product Price: "LG_E"%s /item\n"LB_E"/cargo buy", Product, FormatMoney(box));
	CargoText = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -50.61, -233.28, 6.76, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Vending Product
	
 	CreateDynamicPickup(2912, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 12.0);
	format(strings, sizeof(strings), "[Crate Fish]\n"WHITE_E"Stock Crates: "LG_E"%d\n"WHITE_E"use '"YELLOW_E"/getcrate"WHITE_E"' to pickup crate", CrateFish);
	CreateDynamic3DTextLabel(strings, ARWIN, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product

	CreateDynamicPickup(2912, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Crates Component]\n"WHITE_E"Available Stock: "LG_E"%d\n"WHITE_E"use command '"YELLOW_E"/getcrate"WHITE_E"' to pickup crates", CrateComponent);
	CreateDynamic3DTextLabel(strings, ARWIN, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // comp

	CrateComponentStockPickup = CreateDynamicPickup(2912, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Component Restock]\n"WHITE_E"use command '"YELLOW_E"/sellcrate"WHITE_E"' to store crates component");
	CrateComponentStockText = CreateDynamic3DTextLabel(strings, ARWIN, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // comp

	CreateDynamicPickup(2912, 23, -2062.2, 2691.63, 1499.98, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Material Crates]\n"WHITE_E"Available Stock: "LG_E"%d\n"WHITE_E"use command '"YELLOW_E"/getcrate"WHITE_E"' to pickup crate\n"WHITE_E"use command '"YELLOW_E"/lum sell"WHITE_E"' to sealed lumber", CrateMaterial);
	CreateDynamic3DTextLabel(strings, ARWIN, -2062.2, 2691.63, 1499.98, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
}

Server_Percent(price)
{
    return floatround((float(price) / 100) * 85);
}

Server_AddPercent(price)
{
    new money = (price - Server_Percent(price));
    ServerMoney = ServerMoney + money;
    Server_Save();
}

Server_AddMoney(amount)
{
    ServerMoney = ServerMoney + amount;
    Server_Save();
}

Server_MinMoney(amount)
{
    ServerMoney -= amount;
    Server_Save();
}

Server_Save()
{
    new str[2024];

	CreateServerPoint();
    format(str, sizeof(str), "UPDATE server SET servermoney='%d', material='%d', materialprice='%d', lumberprice='%d', component='%d', componentprice='%d', metalprice='%d', gasoil='%d', gasoilprice='%d', coalprice='%d', product='%d', productprice='%d', medicineprice='%d', medkitprice='%d', food='%d', foodprice='%d', seedprice='%d', potatoprice='%d', wheatprice='%d', ayamfill='%d', ayamfillprice='%d', orangeprice='%d', marijuana='%d', marijuanaprice='%d', fishprice='%d', gstationprice='%d', obatmyr='%d', obatprice='%d' WHERE id=0",
	ServerMoney, Material, MaterialPrice, LumberPrice, Component, ComponentPrice, MetalPrice, GasOil, GasOilPrice, CoalPrice, Product, ProductPrice, MedicinePrice, MedkitPrice, Food, FoodPrice, SeedPrice, PotatoPrice, WheatPrice, AyamFill, AyamFillPrice, OrangePrice, Marijuana, MarijuanaPrice, FishPrice, GStationPrice, ObatMyr, ObatPrice);
    return mysql_tquery(g_SQL, str);
}

function LoadServer()
{
	cache_get_value_name_int(0, "servermoney", ServerMoney);
	cache_get_value_name_int(0, "material", Material);
	cache_get_value_name_int(0, "materialprice", MaterialPrice);
	cache_get_value_name_int(0, "lumberprice", LumberPrice);
	cache_get_value_name_int(0, "component", Component);
	cache_get_value_name_int(0, "componentprice", ComponentPrice);
	cache_get_value_name_int(0, "metalprice", MetalPrice);
	cache_get_value_name_int(0, "gasoil", GasOil);
	cache_get_value_name_int(0, "gasoilprice", GasOilPrice);
	cache_get_value_name_int(0, "coalprice", CoalPrice);
	cache_get_value_name_int(0, "product", Product);
	cache_get_value_name_int(0, "productprice", ProductPrice);
	cache_get_value_name_int(0, "apotek", Apotek);
	cache_get_value_name_int(0, "pedagang", Pedagang);
	cache_get_value_name_int(0, "medicineprice", MedicinePrice);
	cache_get_value_name_int(0, "medkitprice", MedkitPrice);
	cache_get_value_name_int(0, "food", Food);
	cache_get_value_name_int(0, "foodprice", FoodPrice);
	cache_get_value_name_int(0, "seedprice", SeedPrice);
	cache_get_value_name_int(0, "potatoprice", PotatoPrice);
	cache_get_value_name_int(0, "wheatprice", WheatPrice);
	cache_get_value_name_int(0, "orangeprice", OrangePrice);
	cache_get_value_name_int(0, "ayamfill", AyamFill);
	cache_get_value_name_int(0, "ayamfillprice", AyamFillPrice);
	cache_get_value_name_int(0, "marijuana", Marijuana);
	cache_get_value_name_int(0, "marijuanaprice", MarijuanaPrice);
	cache_get_value_name_int(0, "fishprice", FishPrice);
	cache_get_value_name_int(0, "gstationprice", GStationPrice);
	cache_get_value_name_int(0, "obatmyr", ObatMyr);
	cache_get_value_name_int(0, "obatprice", ObatPrice);
	printf("[Server] Loaded Data Server...");
	printf("[Server] %d Server Money", ServerMoney);
	//printf("[Server] Material: %d", Material);
	//printf("[Server] MaterialPrice: %d", MaterialPrice);
	//printf("[Server] LumberPrice: %d", LumberPrice);

	CreateServerPoint();
}

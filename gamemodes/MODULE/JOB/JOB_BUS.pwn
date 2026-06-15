//======== Bus ===========
#define buspoint1 		-110.172218, -1487.607055, 2.495311
#define buspoint2 		-152.736785, -1313.831420, 2.595312
#define buspoint3 		-114.203712, -1157.818603, 1.939190
#define buspoint4 		-161.854888, -958.377990, 29.944252
#define buspoint5 		-354.395385, -788.603881, 29.531732
#define buspoint6 		-493.991668, -1018.248107, 24.324689
#define buspoint7 		-596.405273, -1188.257568, 21.453598
#define buspoint8 		-650.934326, -1369.294921, 18.667371
#define buspoint9 		-706.666381, -1719.074218, 44.594139
#define buspoint10 		-725.515869, -1291.311889, 64.901092
#define buspoint11 		-758.318115, -1492.855468, 89.974494
#define buspoint12 		-794.932678, -1776.387084, 92.243942
#define buspoint13 		-969.981994, -1917.743896, 80.140441
#define buspoint14 		-1028.093994, -2037.015869, 61.722213
#define buspoint15 		-1109.420166, -2178.227783, 32.691684
#define buspoint16 		-1158.383544, -2330.165283, 40.101894
#define buspoint17 		-1158.431640, -2538.657470, 67.740089
#define buspoint18 		-1030.214965, -2610.380126, 81.252723
#define buspoint19 		-889.582031, -2562.707763, 90.180152
#define buspoint20 		-739.654052, -2390.219482, 54.100265
#define buspoint21 		-675.870361, -2233.454589, 11.152519
#define buspoint22 		-551.911499, -2160.548339, 43.589763
#define buspoint23 		-395.765136, -2190.218017, 51.212451
#define buspoint24 		-262.724670, -2075.116210, 36.403743
#define buspoint25 		-281.399932, -1905.545410, 26.678585
#define buspoint26 		-246.853927, -1686.012939, 2.179008
#define buspoint27 		-91.233451, -1501.742797, 2.195312
#define cpbus1 			1639.3451, -1439.9066, 13.3746
#define cpbus2 			1578.5664, -1297.4679, 17.2882
#define cpbus3 			1366.4038, -1239.3553, 13.3771
#define cpbus4 			1376.0468,  -933.2687, 34.1769
#define cpbus5 		 	 960.3029,  -969.7812, 38.8355
#define cpbus6 			1016.2396, -1146.9741, 23.6474
#define cpbus7 			1449.8273, -1163.9070, 23.6518
#define cpbus8 			1501.6725, -1440.9535, 13.3748
#define cpbus9 			1655.5128, -1481.2784, 13.3828

new BusVeh[8];

AddBusVehicle()
{
	BusVeh[0] = AddStaticVehicleEx(431, -112.833999, -1535.711425, 4.136203, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[1] = AddStaticVehicleEx(431, -118.133918, -1532.812133, 4.136203, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[2] = AddStaticVehicleEx(431, -123.833831, -1529.612915, 4.136203, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[3] = AddStaticVehicleEx(431, -129.133834, -1526.613647, 4.136203, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[4] = AddStaticVehicleEx(431, -107.334083, -1520.715087, 4.136202, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[5] = AddStaticVehicleEx(431, -112.933998, -1517.515869, 4.136202, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[6] = AddStaticVehicleEx(431, -118.733909, -1514.316650, 4.136202, -29.999998, -1, -1, VEHICLE_RESPAWN);
	BusVeh[7] = AddStaticVehicleEx(431, -124.333824, -1511.217407, 4.136202, -29.999998, -1, -1, VEHICLE_RESPAWN);
}

IsABusVeh(carid)
{
	for(new v = 0; v < sizeof(BusVeh); v++) {
	    if(carid == BusVeh[v]) return 1;
	}
	return 0;
}

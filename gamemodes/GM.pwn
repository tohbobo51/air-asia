/*
/////////////////////////////////////////////////////////////////////////////////////////////////

											SEO DEVELOPMENT
									Asia Pride ROLEPLAY REALITY PROJECT
											SINCE 2024-2025
									    BASIC LRP REMAKE BY SEO
								       TIDAK DIPERJUAL BELIKAN!!!

									VOICE SISTEM TANGGAL 20 AGUSTUS.

								  Full Update 2024 By : Seo Ganteng.
								tiktok:@seoxyzbca
								youtube:CherySamp
								My Server: https://discord.gg/rpUuvupgZr
								
								NOTE: NAMA ASIA PRIDE SUDAH DI GUNAKAN SAYA HIMBAU UNTUK
								TIDAK MENGGUNAKAN NAMA ASIA PRIDE KARNA SUDAH DI PAKAI UNTUK
								SERVER SAYA TERIMA KASIH..!!!
//////////////////////////////////////////////////////////////////////////////////////////////////
*/
#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS	100
#include <crashdetect>
#include <gvar>
#include <a_mysql>
#include <a_actor>
#include <a_zones>
#include <progress2>
#include <Pawn.CMD>
#include <selection>
#include <FiTimestamp>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg>
#include <streamer>
#include <EVF2>
#include <YSI\y_timers>
#include <YSI\y_ini>
#include <sscanf2>
#include <yom_buttons>
#include <geoiplite>
#include <garageblock>
#include <tp>
#include <compat>
#define DCMD_PREFIX '!'
#include <discord-connector>
#include <discord-cmd>
#include <sampvoice>
#include <YSI_Coding\y_hooks>

//-----[ Modular ]-----
#include "MODULE\DEFINE.pwn"

new SV_GSTREAM:OnPhone[MAX_PLAYERS];

new TogglePhone[MAX_PLAYERS];
new ToggleSid[MAX_PLAYERS];
new ToggleCall[MAX_PLAYERS];


//-----[ Quiz ]-----
new quiz,
	answers[256],
	answermade,
	qprs;

//-----[ Twitter ]-----
new tweet[60];
new JamFivEm;
new DetikFivEm;
new JamCall[MAX_PLAYERS];
new DetikCall[MAX_PLAYERS];
new MenitCall[MAX_PLAYERS];

//-----[ New HamZyy ]----
new DCC_Channel:SAVEPOS;
//-----[ Rob ]-----
new RobMember = 0;

//-----[ Event ]-----
new EventCreated = 0, 
	EventStarted = 0, 
	EventPrize = 500;
new Float: RedX, 
	Float: RedY, 
	Float: RedZ, 
	EventInt, 
	EventWorld;
new Float: BlueX, 
	Float: BlueY, 
	Float: BlueZ;
new EventHP = 100,
	EventArmour = 0,
	EventLocked = 0;
new EventWeapon1, 
	EventWeapon2, 
	EventWeapon3, 
	EventWeapon4, 
	EventWeapon5;
new BlueTeam = 0, 
	RedTeam = 0;
new MaxRedTeam = 5, 
	MaxBlueTeam = 5;
new IsAtEvent[MAX_PLAYERS];

new AntiBHOP[MAX_PLAYERS];

enum C_PLAYERS
{
	vCrateFish,
	vCrateCompo,
	vCrateMats,
	// Depositor
	vBankMoney,
	vDepositorAlat,
};
new vCrateData[MAX_PLAYERS][C_PLAYERS];

new CallTimer[MAX_PLAYERS];

new InRob[MAX_PLAYERS];

//-----[ Discord Connector ]-----
new pemainic;
new upt = 0;

//-----[ Selfie System ]-----
new takingselfie[MAX_PLAYERS];
new Float:Degree[MAX_PLAYERS];
const Float: Radius = 1.4; //do not edit this
const Float: Speed  = 1.25; //do not edit this
const Float: Height = 1.0; // do not edit this
new Float:lX[MAX_PLAYERS];
new Float:lY[MAX_PLAYERS];
new Float:lZ[MAX_PLAYERS];


enum
{
	DIALOG_MAKE_CHAR,
	DIALOG_CHARLIST,
	DIALOG_STREAMER,
	DIALOG_VERIFYCODE,
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_GIVE,
    DIALOG_DISNAKER,
    DIALOG_VOICE,
    DIALOG_EMS,
    DIALOG_EMS1,
    DIALOG_EMS2,
    DIALOG_EMS3,
    DIALOG_EMS4,
    DIALOG_EMS5,
    DIALOG_EMSG,
    DIALOG_EMSC,
    DIALOG_VRM,
    DIALOG_SAPD,
    DIALOG_SAPD1,
    DIALOG_SAPD2,
    DIALOG_SAPD3,
    DIALOG_SAPD4,
    DIALOG_SAPD5,
    DIALOG_SAPD6,
    DIALOG_SAPD7,
    DIALOG_AIRDROP,
    DIALOG_AIRDROP1,
    DIALOG_AMOUNT,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	DIALOG_GOLDSHOP,
	DIALOG_GOLDNAME,
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_REALMONEY,
	HOUSE_WITHDRAW_REALMONEY,
	HOUSE_DEPOSIT_REALMONEY,
	HOUSE_REDMONEY,
	HOUSE_WITHDRAW_REDMONEY,
	HOUSE_DEPOSIT_REDMONEY,
	HOUSE_FOODDRINK,
	HOUSE_FOOD,
	HOUSE_FOOD_DEPOSIT,
	HOUSE_FOOD_WITHDRAW,
	HOUSE_DRINK,
	HOUSE_DRINK_DEPOSIT,
	HOUSE_DRINK_WITHDRAW,
	HOUSE_DRUGS,
	HOUSE_MEDICINE,
	HOUSE_MEDICINE_DEPOSIT,
	HOUSE_MEDICINE_WITHDRAW,
	HOUSE_MEDKIT,
	HOUSE_MEDKIT_DEPOSIT,
	HOUSE_MEDKIT_WITHDRAW,
	HOUSE_BANDAGE,
	HOUSE_BANDAGE_DEPOSIT,
	HOUSE_BANDAGE_WITHDRAW,
	HOUSE_OTHER,
	HOUSE_SEED,
	HOUSE_SEED_DEPOSIT,
	HOUSE_SEED_WITHDRAW,
	HOUSE_MATERIAL,
	HOUSE_MATERIAL_DEPOSIT,
	HOUSE_MATERIAL_WITHDRAW,
	HOUSE_COMPONENT,
	HOUSE_COMPONENT_DEPOSIT,
	HOUSE_COMPONENT_WITHDRAW,
	HOUSE_MARIJUANA,
	HOUSE_MARIJUANA_DEPOSIT,
	HOUSE_MARIJUANA_WITHDRAW,
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_PICKUPVEH,
	DIALOG_TRACKVEH2,
	DIALOG_TRACKPARKEDVEH,
	DIALOG_GOTOVEH,
	DIALOG_HP_TWITTER,
	DIALOG_HP_FACEBOOK,
	DIALOG_HP_ABANGKU,
	DIALOG_SKIBIDI,
	DIALOG_AURORA,
	DIALOG_ROMAKEPALA,
	DIALOG_RORMANG,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_BUYPVCP,
	DIALOG_LOCKVEH,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	DIALOG_RENT_BOAT,
	DIALOG_RENT_BOATCONFIRM,
	DIALOG_RENT_BIKE,
	DIALOG_RENT_BIKECONFIRM,
	DIALOG_GARKOT,
	DIALOG_MY_VEHICLE,
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYEDIT_ANDROID,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	DIALOG_TOYPOSSX,
	DIALOG_TOYPOSSY,
	DIALOG_TOYPOSSZ,
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_PENAMBANG,
	DIALOG_PENAMBANG1,
	DIALOG_JOB,
	DIALOG_GPS_JOB,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_PROPERTIES,
	DIALOG_GPS_GENERAL,
	DIALOG_GPS_MISSION,
	DIALOG_TRACKBUSINESS,
	DIALOG_ELECTRONIC_TRACK,
	DIALOG_PAY,
	DIALOG_EDITBONE,
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	DIALOG_SERVERMONEY,
	DIALOG_SERVERMONEY_STORAGE,
	DIALOG_SERVERMONEY_WITHDRAW,
	DIALOG_SERVERMONEY_DEPOSIT,
	DIALOG_SERVERMONEY_REASON,
	DIALOG_LOCKERTNI,
	DIALOG_WEAPONTNI,
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_DRUGSSAMD,
	DIALOG_LOCKERPEDAGANG,
	DIALOG_GUDANGPEDAGANG,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	DIALOG_GOJEK,
	DIALOG_LOCKERTAMBANG,
	DIALOG_LOCKERPEMERAH,
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	DIALOG_MENU_TRUCKER,
	DIALOG_SHIPMENTS,
	DIALOG_SHIPMENTS_VENDING,
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_CRATES,
	DIALOG_CRATE_EXPORT,
	DIALOG_RESTOCK_VENDING,
	DIALOG_ARMS_GUN,
	DIALOG_MENUMASAK,
	DIALOG_MENU,
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	ST_MENU,
	ST_MONEY,
	ST_WITHDRAWMONEY,
	ST_DEPOSITMONEY,
	ST_IKAN,
	ST_IKAN2,
	ST_COMPONENT,
	ST_COMPONENT2,
	ST_MATERIAL,
	ST_MATERIAL2,
	ST_REDMONEY,
	ST_REDMONEY2,
	ST_BORAX,
	ST_BORAX2,
	GARKOT_PICKUP,
	DIALOG_SAPD_GARAGE,
	DIALOG_SAMD_GARAGE,
	DIALOG_SANA_GARAGE,
	DIALOG_SAGS_GARAGE,
	//PAJAK
	DIALOG_PAYTAX,
	DIALOG_PAYTAX_BISNIS,
	DIALOG_PAYTAX_HOUSE,
	DIALOG_OFFER,
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_CRACK,
	DIALOG_AYAMFILL,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	DIALOG_ATM,
	DIALOG_TRACKATM,
	DIALOG_ATMWITHDRAW,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	DIALOG_PHONE,
	DIALOG_TWITTER,
	DIALOG_TWITTERPOST,
	DIALOG_TWITTERNAME,
	DIALOG_PHONE_ADDCONTACT,
	DIALOG_PHONE_CONTACT,
	DIALOG_PHONE_NEWCONTACT,
	DIALOG_PHONE_INFOCONTACT,
	DIALOG_PHONE_SENDSMS,
	DIALOG_PHONE_TEXTSMS,
	DIALOG_PHONE_DIALUMBER,
	DIALOG_TOGGLEPHONE,
	DIALOG_PANELPHONE,
	DIALOG_IBANK,
	DIALOG_REPORTS,
	DIALOG_ANSWER_REPORTS,
	DIALOG_ASKS,
	DIALOG_SALARY,
	DIALOG_SWEEPER,
	DIALOG_BUS,
	DIALOG_FORKLIFT,
	DIALOG_MOWER,
	DIALOG_RUTE_SWEEPER,
	DIALOG_RUTE_BUS,
	DIALOG_BAGGAGE,
	DIALOG_HEALTH,
	DIALOG_OBAT,
	DIALOG_ISIKUOTA,
	DIALOG_DOWNLOAD,
	DIALOG_KUOTA,
	DIALOG_STUCK,
	DIALOG_TDM,
	DIALOG_TRACKPARK,
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
	DIALOG_ACTORANIM,
	DIALOG_MY_VENDING,
	DIALOG_VENDING_INFO,
	DIALOG_VENDING_BUYPROD,
	DIALOG_VENDING_MANAGE,
	DIALOG_VENDING_NAME,
	DIALOG_VENDING_VAULT,
	DIALOG_VENDING_WITHDRAW,
	DIALOG_VENDING_DEPOSIT,
	DIALOG_VENDING_EDITPROD,
	DIALOG_VENDING_PRICESET,
	DIALOG_VENDING_RESTOCK,
	DIALOG_SPAWN_1,
	DIALOG_BUY_TOL,
	DIALOG_MYVEH,
	DIALOG_MYVEH_INFO,
	DIALOG_FAMILY_INTERIOR,
	DIALOG_SPAREPART,
	DIALOG_BUYPARTS,
	DIALOG_BUYPARTS_DONE,
	VEHICLE_STORAGE,
	VEHICLE_WEAPON,
	VEHICLE_MONEY,
	VEHICLE_REALMONEY,
	VEHICLE_REALMONEY_WITHDRAW,
	VEHICLE_REALMONEY_DEPOSIT,
	VEHICLE_REDMONEY,
	VEHICLE_REDMONEY_WITHDRAW,
	VEHICLE_REDMONEY_DEPOSIT,
	VEHICLE_DRUGS,
	VEHICLE_MEDICINE,
	VEHICLE_MEDICINE_WITHDRAW,
	VEHICLE_MEDICINE_DEPOSIT,
	VEHICLE_MEDKIT,
	VEHICLE_MEDKIT_WITHDRAW,
	VEHICLE_MEDKIT_DEPOSIT,
	VEHICLE_BANDAGE,
	VEHICLE_BANDAGE_WITHDRAW,
	VEHICLE_BANDAGE_DEPOSIT,
	VEHICLE_OTHER,
	VEHICLE_SEED,
	VEHICLE_SEED_WITHDRAW,
	VEHICLE_SEED_DEPOSIT,
	VEHICLE_MATERIAL,
	VEHICLE_MATERIAL_WITHDRAW,
	VEHICLE_MATERIAL_DEPOSIT,
	VEHICLE_COMPONENT,
	VEHICLE_COMPONENT_WITHDRAW,
	VEHICLE_COMPONENT_DEPOSIT,
	VEHICLE_MARIJUANA,
	VEHICLE_MARIJUANA_WITHDRAW,
	VEHICLE_MARIJUANA_DEPOSIT,
	DIALOG_NONRPNAME,
	DIALOG_AYAM
}

//-----[ Download System ]-----
new download[MAX_PLAYERS];
new CampfirePlaced[MAX_PLAYERS] = {INVALID_OBJECT_ID, ...};
new CampPlaced[MAX_PLAYERS] = {INVALID_OBJECT_ID, ...};
new JourneyInterior[MAX_PLAYERS];
//-----[ Count System ]-----
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

//-----[ Rob System ]-----
new robmoney;

//-----[ Server Uptime ]-----
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;
	
new afk_check[MAX_PLAYERS];
new afk_tick[MAX_PLAYERS];
new afk_time[MAX_PLAYERS];

//-----[ Faction Vehicle ]-----	
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[75],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30],
	TNIVehicles[30];

IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsTNICar(carid)
{
	for(new v = 0; v < sizeof(TNIVehicles); v++)
	{
	    if(carid == TNIVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}
//[SPAWN SHAMAL]
new keluarshamal;
//-----[ Showroom Checkpoint ]-----	
new ShowRoomCP,
	ShowRoomCPRent,
	ShowRoomSusu,
	ShowRoomTambang;

new DutyTimer;
new MalingKendaraan;
new TwtTimer[MAX_PLAYERS];
new FbTimer[MAX_PLAYERS];
new SkTimer[MAX_PLAYERS];
new AuTimer[MAX_PLAYERS];
new RkTimer[MAX_PLAYERS];
new RmTimer[MAX_PLAYERS];
new LoadingPlayerBar[MAX_PLAYERS];
new TimerLoading[MAX_PLAYERS];
new ProgressTimer[MAX_PLAYERS][128];

//voicehp
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

//-----[ indihome ]-----	
new DutyIndiHome[MAX_PLAYERS],
	IndiHomeVeh[MAX_PLAYERS],
	IndiHomeService[MAX_PLAYERS],
	IndiHomeStart[MAX_PLAYERS],
	AgusSampSystem[MAX_PLAYERS];

new Text3D:vehicle3Dtext[MAX_VEHICLES], VehicleJobs,
	rent_vehicle_id;

//-----[ Button ]-----	
new SAGSLobbyBtn[8],
	SAGSLobbyDoor[4],
	SAMCLobbyBtn[6],
	SAMCLobbyDoor[3];



//-----[ MySQL Connect ]-----	
new MySQL: g_SQL;

new TogOOC = 1;

//-----[ Player Data ]-----	
enum E_PLAYERS
{
	pID,
	pUCP[22],
	pExtraChar,
	pChar,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	bool:pAhide,
	pIP[16],
	pVerifyCode,
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pMenikah[MAX_PLAYER_NAME],
	pMelamar,
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pRedMoney,
	Text3D:pMaskLabel,
	Text3D:pAdminLabel,
	Text3D:pSidLabel,
	pBankMoney,
	pBankRek,
	pProgressBar,
	pStreamer,
	pPhone,
	pPhoneCredit,
	pToggleAtm,
	pContact,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pSkin,
	pFacSkin,
	pGender,
	pAge[50],
	pInDoor,
	pInHouse,
	pInBiz,
	pInVending,
	pInFamily,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	Float:pPos[4],
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
    pStress,
	pHunger,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pStressTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	Text3D: pInjuredLabel,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pDivisi,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pGetcrateFish[MAX_PLAYERS],
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pGPS,
	pGpsActive,
	pMaterial,
	pKayu,
	pComponent,
	pFood,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pPlant,
	pPlantTime,
	pDutyJob,
	bool:DutyPenambang,
	bool:pJobmilkduty,
	pRokok,
	pSusuOlahan,
	pRepairKit,
	pGetPARKID,
	EditingGarkot,
	pFactionVeh,
	pSpawnSamd,
	SAMDVeh,
	pSpawnSana,
	SANAVeh,
	pFishTool,
	pWorm,
	pFish,
	pInFish,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pDriveLicApp,
	pBoatLic,
	pBoatLicTime,
	pLicBiz,
	pLicBizTime,
	pSkck,
	pSkckTime,
	pPenebangs,
	pPenebangsTime,
	pBpjs,
	pBpjsTime,
	pWeaponLic,
	pWeaponLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	pCrack,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	PilihSpawn,
	pSpawnList,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	Text3D:pAdoTag,
	Text3D:pBTag,
	bool:pBActive,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pTrackVending,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	pInsukelAstera,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pEditingVendingItem,
	pVendingProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pSeatBelt,
	pInSt,
	pReportTime,
	pAskTime,
	BankDelay,
	pRobStatus,
	RobbankTime,
	RobatmTime,
	RobbizTime,
	//Player Progress Bar
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:activitybar,
	pSelectItem,
	pTarget,
	pGiveAmount,
	pProducting,
	pProductingStatus,
	pPemotongStatus,
	pMenambangStatus,
	pCuciStatus,
	pLeburStatus,
	pCooking,
	pCookingStatus,
	pArmsDealer,
	pArmsDealerStatus,
	pMechanic,
	pMechanicStatus,
	pActivity,
	pActivityStatus,
	pActivityTime,
	//pedagang
	pNasi,
	pBurger,
	pAGoreng,
	pKebab,
	pSusu,
	//penambang
	timerambilbatu,
    timerpencucianbatu,
    timerpeleburanbatu,
    Batu,
    pTimeTambang1,
    pTimeTambang2,
    pTimeTambang3,
    pTimeTambang4,
    pTimeTambang5,
    pTimeTambang6,
	BatuCucian,
	bEmas,
	bTembaga,
	bAlumunium,
	sedangambilbatu,
    sedangpencucianbatu,
    sedangpeleburanbatu,
	//pemotong ayam
	timerambilayamhidup,
    timerpotongayam,
    timerpackagingayam,
    timerjualayam,
    AyamHidup,
	AyamPotong,
	AyamFillet,
	sedangambilayam,
    sedangpotongayam,
    sedangfilletayam,
    sedangjualayam,
	//Jobs
	pSideJob,
	pSideJobTime,
	pSweeperTime,
	pForklifterTime,
	pSpaTime,
	pBusTime,
	pMowerTime,
	pGetJob,
	pGetJob2,
	pTaxiDuty,
	pTaxiTime,
	pFare,
	pFareTimer,
	pTotalFare,
	Float:pFareOldX,
	Float:pFareOldY,
	Float:pFareOldZ,
	Float:pFareNewX,
	Float:pFareNewY,
	Float:pFareNewZ,
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	//ATM
	EditingATMID,
	//lumber job
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//Vending
	EditingVending,
	//production
	CarryProduct,
	//trucker
	pMission,
	pHauling,
	pVendingRestock,
	bool: CarryingBox,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillStatus,
	pFillTime,
	pFillPrice,
	//Gate
	gEditID,
	gEdit,
	// WBR
	pHead,
 	pPerut,
 	pLHand,
 	pRHand,
 	pLFoot,
 	pRFoot,
 	// Inspect Offer
 	pInsOffer,
 	// Obat System
 	pObat,
 	// Suspect
 	pSuspectTimer,
 	pSuspect,
 	// Phone On Off
 	pPhoneStatus,
 	// Kurir
 	pKurirEnd,
 	// Shareloc Offer
 	pLocOffer,
 	//lockpick
 	pLockPick,
 	pBooster,
 	pBoostTime,
 	pCharacterStory,
 	// Twitter
 	pTwitter,
	pTwitterStatus, 
	pTwittername[MAX_PLAYER_NAME],
	pTwitterPostCooldown,
	pTwitterNameCooldown,
 	pRegTwitter,
 	//Untuk Toll
 	pTikettol,
 	// Kuota
 	pKuota,
 	// DUTY SYSTEM
 	pDutyHour,
 	// CHECKPOINT
 	pCP,
 	// ROBBERY
 	pRobTime,
 	pRobOffer,
 	pRobLeader,
 	pRobMember,
 	pMemberRob,
	pTrailer,
	// Smuggler
	bool:pTakePacket,
	pTrackPacket,
	// Garkot
	pPark,
	pLoc,
	// WS
	pMenuType,
	pInWs,
	pTransferWS,
	//Baggage
	pBaggage,
	pDelayBaggage,
	pTrailerBaggage,
	//Anticheat
	pACWarns,
	pACTime,
	pJetpack,
	pArmorTime,
	pLastUpdate,
	//Checkpoint
	pCheckPoint,
	pBus,
	pSweeper,
	pMower,
	//SpeedCam
	pSpeedTime,
	//Forklifter New System
	pForklifter,
	pForklifterLoad,
	pForklifterLoadStatus,
	pForklifterUnLoad,
	pForklifterUnLoadStatus,
	//Starterpack
	pStarterpack,
	//Anim
	pLoopAnim,
	//Rob Car
	pLastChop,
	pLastChopTime,
	pIsStealing,
	//Sparepart
	pSparepart,
	//
	pUangKorup,
	//Senter
	pFlashlight,
	pUsedFlashlight,
	//Moderator
	pServerModerator,
	pEventModerator,
	pFactionModerator,
	pFamilyModerator,
	//
	pPaintball,
	pPaintball2,
	//
	pDelayIklan,
	pMarkTemp
};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];

//-----[ Smuggler ]-----	

new Text3D:packetLabel,
	packetObj,
	Float:paX, 
	Float:paY, 
	Float:paZ;

//-----[ Forklifter Object ]-----	
new 
	VehicleObject[MAX_VEHICLES] = {-1, ...};

//-----[ Lumber Object Vehicle ]-----	
#define MAX_BOX 50
#define BOX_LIFETIME 100
#define BOX_LIMIT 5

enum    E_BOX
{
	boxDroppedBy[MAX_PLAYER_NAME],
	boxSeconds,
	boxObjID,
	boxTimer,
	boxType,
	Text3D: boxLabel
}
new BoxData[MAX_BOX][E_BOX],
	Iterator:Boxs<MAX_BOX>;

new
	BoxStorage[MAX_VEHICLES][BOX_LIMIT];

//-----[ Lumber Object Vehicle ]-----	
#define MAX_LUMBERS 50
#define LUMBER_LIFETIME 100
#define LUMBER_LIMIT 10

enum    E_LUMBER
{
	lumberDroppedBy[MAX_PLAYER_NAME],
	lumberSeconds,
	lumberObjID,
	lumberTimer,
	Text3D: lumberLabel
}
new LumberData[MAX_LUMBERS][E_LUMBER],
	Iterator:Lumbers<MAX_LUMBERS>;

new
	LumberObjects[MAX_VEHICLES][LUMBER_LIMIT];

	
new
	Float: LumberAttachOffsets[LUMBER_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};

//-----[ Ores Miner ]-----	
#define LOG_LIFETIME 100
#define LOG_LIMIT 10
#define MAX_LOG 100

enum    E_LOG
{
	bool:logExist,
	logType,
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D:logLabel
}
new LogData[MAX_LOG][E_LOG];

new
	LogStorage[MAX_VEHICLES][2];

//-----[ Trucker ]-----	
new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];

//-----[ Baggage ]-----	
new bool:DialogBaggage[10];
new bool:MyBaggage[MAX_PLAYERS][10];

//-----[ Type Checkpoint ]-----	
enum
{
	CHECKPOINT_NONE = 0,
	CHECKPOINT_FORKLIFTER,
	CHECKPOINT_DRIVELIC,
	CHECKPOINT_SWEEPER,
	CHECKPOINT_BAGGAGE,
	CHECKPOINT_MOWER,
	CHECKPOINT_MISC,
	CHECKPOINT_BUS
}

//-----[ Storage Limit ]-----	
enum
{
	LIMIT_SNACK,
	LIMIT_SPRUNK,
	LIMIT_MEDICINE,
	LIMIT_MEDKIT,
 	LIMIT_BANDAGE,
 	LIMIT_SEED,
	LIMIT_MATERIAL,
	LIMIT_COMPONENT,
	LIMIT_MARIJUANA
};

//-----[ eSelection Define ]-----	
#define 	SPAWN_SKIN_MALE 		1
#define 	SPAWN_SKIN_FEMALE 		2
#define 	SHOP_SKIN_MALE 			3
#define 	SHOP_SKIN_FEMALE 		4
#define 	VIP_SKIN_MALE 			5
#define 	VIP_SKIN_FEMALE 		6
#define 	SAPD_SKIN_MALE 			7
#define 	SAPD_SKIN_FEMALE 		8
#define 	SAPD_SKIN_WAR 			9
#define 	SAGS_SKIN_MALE 			10
#define 	SAGS_SKIN_FEMALE 		11
#define 	SAMD_SKIN_MALE 			12
#define 	SAMD_SKIN_FEMALE 		13
#define 	SANA_SKIN_MALE 			14
#define 	SANA_SKIN_FEMALE 		15
#define 	TNI_SKIN_MALE 			7
#define 	TNI_SKIN_FEMALE 		8
#define 	TOYS_MODEL 				16
#define 	VIPTOYS_MODEL 			17
#define 	VTOYS_LIST 			18

new SpawnSkinMale[] =
{
	1, 2, 3, 4, 5, 6, 7, 14, 100,137 
};

new SpawnSkinFemale[] =
{
	9, 10, 11, 12, 13, 31, 38, 39, 40, 41
};

new ShopSkinMale[] =
{
	1, 2, 3, 4, 5, 6, 7, 8, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 32, 33,
	34, 35, 36, 37, 42, 43, 44, 45, 46, 47, 48, 49, 52, 58, 59, 60, 62, 66, 68, 72,
	78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
	110, 111, 112, 113, 114, 115, 116, 117, 118, 120, 122, 123, 124, 125, 126, 127, 128, 132, 133,
	134, 135, 136, 142, 143, 146, 154, 155, 156, 159, 160, 161, 162, 168, 170,
	171, 173, 174, 175, 176, 177, 179, 180, 181, 182, 183, 184, 185, 186, 187, 200, 202,
	206, 208, 209, 210, 212, 213, 220, 221, 222, 223, 228, 229, 234, 235, 236, 239, 240, 241,
	242, 247, 248, 250, 254, 258, 259, 260, 261, 262, 272, 273, 289, 290, 291, 292, 293,
	294, 295, 297, 299
};

new ShopSkinFemale[] =
{
	9, 10, 11, 12, 13, 31, 38, 39, 40, 41, 53, 54, 55, 56, 65, 77, 88, 89, 91,
	93, 129, 130, 148, 157, 169, 190, 192, 193, 194, 195, 196,
	197, 198, 207, 214, 215, 216, 219, 224, 225, 226, 231, 232, 233,
	251, 263
};

new SAPDSkinWar[] =
{
	121, 285, 286, 287, 117, 118, 165, 166
};

new SAPDSkinMale[] =
{
	280, 281, 282, 283, 284, 288, 300, 301, 302, 303, 304, 305, 310, 311, 165, 166
};

new SAPDSkinFemale[] =
{
	306, 307, 309, 148, 150
};

new TNISkinMale[] =
{
	//287, 73, 282, 283, 284, 288, 300, 301, 302, 303, 304, 305, 310, 311, 165, 166
	287, 73
};

new TNISkinFemale[] =
{
	306, 307, 309, 148, 150
};

new SAGSSkinMale[] =
{
	171, 17, 71, 147, 187, 165, 166, 163, 164, 255, 295, 294, 303, 304, 305, 189, 253
};

new SAGSSkinFemale[] =
{
	9, 11, 76, 141, 150, 219, 169, 172, 194, 263
};

new SAMDSkinMale[] =
{
	70, 187, 303, 304, 305, 274, 275, 276, 277, 278, 279, 165, 71, 177
};

new SAMDSkinFemale[] =
{
	308, 76, 141, 148, 150, 169, 172, 194, 219
};

new SANASkinMale[] =
{
	171, 187, 189, 240, 303, 304, 305, 20, 59
};

new SANASkinFemale[] =
{
	172, 194, 211, 216, 219, 233, 11, 9
};

new ToysModel[] =
{
	19006, 19007, 19008, 19009, 19010, 19011, 19012, 19013, 19014, 19015, 19016, 19017, 19018, 19019, 19020, 19021, 19022,
	19023, 19024, 19025, 19026, 19027, 19028, 19029, 19030, 19031, 19032, 19033, 19034, 19035, 19801, 18891, 18892, 18893,
	18894, 18895, 18896, 18897, 18898, 18899, 18900, 18901, 18902, 18903, 18904, 18905, 18906, 18907, 18908, 18909, 18910,
	18911, 18912, 18913, 18914, 18915, 18916, 18917, 18918, 18919, 18920, 19036, 19037, 19038, 19557, 19472, 18974,
	19163, 19064, 19160, 19352, 19528, 19330, 19331, 18921, 18922, 18923, 18924, 18925, 18926, 18927, 18928, 18929, 18930,
	18931, 18932, 18933, 18934, 18935, 18939, 18940, 18941, 18942, 18943, 18944, 18945, 18946, 18947, 18948, 18949, 18950,
	18951, 18953, 18954, 18960, 18961, 19098, 19096, 18964, 18967, 18968, 18969, 19106, 19113, 19114, 19115, 18970, 18638,
	19553, 19558, 19554, 18971, 18972, 18973, 19101, 19116, 19117, 19118, 19119, 19120, 18952, 18645, 19039, 19040, 19041,
	19042, 19043, 19044, 19045, 19046, 19047, 19053, 19421, 19422, 19423, 19424, 19274, 19518, 19077, 19517, 19317, 19318,
	19319, 19520, 1550, 19592, 19621, 19622, 19623, 19624, 19625, 19626, 19555, 19556, 19469, 19085, 19559, 19904, 19942, 
	19944, 11745, 19773, 18639, 18640, 18641, 18635, 18633, 3028, 11745, 19142, 18963, 11712, 6865, 19079, 19904, 19590, 
	19319, 19100, 2919, 3026, 19833, 1254, 2045
};



//-----[ Modular ]-----	
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
}
#include "NOTIFIKASISYSTEM\INFONOTIF.pwn"
#include "NOTIFIKASISYSTEM\NOTIFIKASI.pwn"
#include "NOTIFIKASISYSTEM\SHOWITEMBOX.pwn"
#include "MODULE\COLOR.pwn"
#include "MODULE\UCP.pwn"
#include "MODULE\TEXTDRAW.pwn"
#include "MODULE\ANIMS.pwn"
#include "MODULE\RENTAL.pwn"
#include "MODULE\PRIVATE_VEHICLE.pwn"
#include "MODULE\VSTORAGE.pwn"
#include "MODULE\DYNAMIC\GARKOT.pwn"
#include "MODULE\DYNAMIC\SAPD.pwn"
#include "MODULE\DYNAMIC\SAGS.pwn"
#include "MODULE\DYNAMIC\SAMD.pwn"
#include "MODULE\DYNAMIC\SANA.pwn"
#include "MODULE\DYNAMIC\PAJAK.pwn"
#include "MODULE\REPORT.pwn"
#include "MODULE\ASK.pwn"
#include "MODULE\WEAPON_ATTH.pwn"
#include "MODULE\TOYS.pwn"
#include "MODULE\HELMET.pwn"
#include "MODULE\SERVER.pwn"
#include "MODULE\DOOR.pwn"
#include "MODULE\FAMILY.pwn"
#include "MODULE\INSU.pwn"
#include "MODULE\HOUSE.pwn"
#include "MODULE\PROGRES.pwn"
#include "MODULE\BISNIS.pwn"
#include "MODULE\GAS_STATION.pwn"
#include "MODULE\DYNAMIC_LOCKER.pwn"
#include "MODULE\NATIVE.pwn"
#include "MODULE\VOUCHER.pwn"
#include "MODULE\SALARY.pwn"
#include "MODULE\ATM.pwn"
#include "MODULE\ARMS_DEALER.pwn"
#include "MODULE\GATE.pwn"
//#include "MODULE\AUDIO.pwn"
#include "MODULE\ROBBERY.pwn"
#include "MODULE\ROB.pwn"
#include "MODULE\GRANDINV.pwn"
#include "MODULE\GUDANG.pwn"
#include "MODULE\TEXTCLICK.pwn"
#include "MODULE\WORKSHOP.pwn"
#include "MODULE\DMV.pwn"
#include "MODULE\ANTICHEAT.pwn"
#include "MODULE\SPEEDCAM.pwn"
#include "MODULE\ACTOR.pwn"
#include "MODULE\VENDING.pwn"
#include "MODULE\CONTACT.pwn"
#include "MODULE\TOLL.pwn"


#include "MODULE\JOB\JOB_PRODUCTION.pwn"
#include "MODULE\JOB\JOB_CRATE.pwn"
#include "MODULE\JOB\JOB_FORKLIFT.pwn"
#include "MODULE\JOB\JOB_SMUGGLER.pwn"
#include "MODULE\JOB\JOB_SWEEPER.pwn"
#include "MODULE\JOB\JOB_TRUCKER.pwn"
#include "MODULE\JOB\JOB_BAGGAGE.pwn"
#include "MODULE\JOB\JOB_LUMBER.pwn"
#include "MODULE\JOB\JOB_FARMER.pwn"
#include "MODULE\JOB\JOB_MINER.pwn"
#include "MODULE\JOB\JOB_PEMOTONGAYAM.pwn"
#include "MODULE\JOB\PENAMBANG.pwn"
#include "MODULE\JOB\PEMERAHSUSU.pwn"
#include "MODULE\JOB\TUKANGKAYU.pwn"
#include "MODULE\JOB\INDIHOME.pwn"
//#include "MODULE\JOB\JOB_KURIR.pwn"
#include "MODULE\JOB\JOB_MOWER.pwn"
#include "MODULE\JOB\JOB_TAXI.pwn"
#include "MODULE\JOB\JOB_MECH.pwn"
#include "MODULE\JOB\JOB_FISH.pwn"
#include "MODULE\JOB\JOB_BUS.pwn"

#include "MODULE\CMD\FACTION.pwn"
#include "MODULE\CMD\PLAYER.pwn"
#include "MODULE\CMD\ADMIN.pwn"

#include "MODULE\SAPD_TASER.pwn"
#include "MODULE\SAPD_SPIKE.pwn"

#include "MODULE\DIALOG.pwn"
#include "MODULE\MAPPING.pwn"

#include "MODULE\CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_HOUSE.pwn"

#include "MODULE\EVENT.pwn"

#include "MODULE\FUNCTION.pwn"

#include "MODULE\TASK.pwn"

#include "MODULE\CMD\DISCORD.pwn"

//-----[ Discord Status ]-----	
forward BotStatus();
public BotStatus()
{
    new h = 0, m = 0, statuz[256];
	h = floatround(upt / 3600);
	m = floatround((upt / 60) - (h * 60));
	upt++;
	//format(statuz,sizeof(statuz),"Revolium Roleplay | %d Players");
	format(statuz,sizeof(statuz),"%d Players | %dh %02dm Uptime", pemainic, h, m);
	DCC_SetBotActivity(statuz);
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:g_Discord_Chat;
    g_Discord_Chat = DCC_FindChannelById("970580507249246228");
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s", user_name, realMsg);
        SendClientMessageToAll(-1, str);
    }

    return 1;
}

stock GetCS(playerid)
{
 	new astring[48];
 	if(pData[playerid][pCharacterStory] == 0)format(astring, sizeof(astring), ""RED_E"None");
	else if(pData[playerid][pCharacterStory] == 1)format(astring, sizeof(astring), ""LG_E"Approved");
	return astring;
}

public OnGameModeInit()
{
	//mysql_log(ALL);
	SetTimer("BotStatus", 1000, true);
	new MySQLOpt: option_id = mysql_init_options();

    DCC_FindChannelById("969343884780007505"); //
    
    JamFivEm = 7;

	SetTimer("TambahDetikFivEM", 2500, true);
	
	SetTimer("TanggalHp", 1000, true);
	
	SetTimer("JamServer", 1000, true);
    
	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `storage`", "LoadStorage");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `parks`", "LoadPark");
	mysql_tquery(g_SQL, "SELECT * FROM `garkot`", "LoadGarkot");
	mysql_tquery(g_SQL, "SELECT * FROM `speedcameras`", "LoadSpeedCam");
	mysql_tquery(g_SQL, "SELECT * FROM `actor`", "LoadActor");
	mysql_tquery(g_SQL, "SELECT * FROM `vending`", "LoadVending");
	
	ShowNameTags(0);
	EnableTirePopping(0);
	CreateTextDraw();
	CreateServerPoint();
	CreatePointIndiHome();
	CreatePointPenambang();
	CreatePointAyam();
	CreatePointPemerasSusu();
	CreatePointTukangKayu();
	CreateArmsPoint();
	//CreateJoinKurirPoint();
	LoadTazerSAPD();
	CreateCarStealingPoint();
	LoadMap();
	
	ResetCarStealing();

	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname San Andreas");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(20.0);
	//SetNameTagDrawDistance(20.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");	
	
	new strings[150];
	
	for(new i = 0; i < sizeof(rentVehicle); i ++)
	{
	    CreateDynamicPickup(19131, 23, rentVehicle[i][0], rentVehicle[i][1], rentVehicle[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "[Rental]\n{00FFFF}/rentbike\n {00FFFF}JANGAN MALING RENTAL MILIK ORANG LAIN.!!");
		CreateDynamic3DTextLabel(strings, COLOR_LBLUE, rentVehicle[i][0], rentVehicle[i][1], rentVehicle[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}

	for(new i = 0; i < sizeof(unrentVehicle); i ++)
	{
	    CreateDynamicPickup(1239, 23, unrentVehicle[i][0], unrentVehicle[i][1], unrentVehicle[i][2], -1, -1, -1, 50);
		format(strings, sizeof(strings), "[Unrent Vehicle]\n{FFFFFF}/unrentpv\n to unrent your vehicle");
		CreateDynamic3DTextLabel(strings, COLOR_LBLUE, unrentVehicle[i][0], unrentVehicle[i][1], unrentVehicle[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike
	}

	//-----[ Toll System ]-----	
	for(new i;i < sizeof(BarrierInfo);i ++)
	{
		new
		Float:X = BarrierInfo[i][brPos_X],
		Float:Y = BarrierInfo[i][brPos_Y];

		ShiftCords(0, X, Y, BarrierInfo[i][brPos_A]+90.0, 3.5);
		CreateDynamicObject(966,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z],0.00000000,0.00000000,BarrierInfo[i][brPos_A]);
		if(!BarrierInfo[i][brOpen])
		{
			gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,90.00000000,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.75,BARRIER_SPEED,0.0,90.0,BarrierInfo[i][brPos_A]+180);
		}
		else gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,20.00000000,BarrierInfo[i][brPos_A]+180);
	}

	CreateDynamicPickup(1239, 23, 1083.47, -1771.3, 13.9284, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[City Hall]\n{FFFFFF}/newidcard - Membuat new ID Card\n/paytax - Membayar Pajak");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1083.47, -1771.3, 13.9284, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk mengakses Disnaker");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -2063.5922, 2663.7612, 1498.7764, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // disnker
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk proses kayu");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -551.597473, -197.158843, 78.206237, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
	
	CreateDynamicPickup(2912, 23, -371.83, -1428.88, 25.72, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Fish Restock]\n"WHITE_E"use command '"YELLOW_E"/sellcrate"WHITE_E"' to store crates fish");
	CreateDynamic3DTextLabel(strings, ARWIN, -371.83, -1428.88, 25.72, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // fish
	
	CreateDynamicPickup(2912, 23, -258.51, -2183.10, 29.01, -1, -1, -1, 50.0);
	format(strings, sizeof(strings), "[Material Restock]\n"WHITE_E"use command '"YELLOW_E"/sellcrate"WHITE_E"' to store crates Material");
	CreateDynamic3DTextLabel(strings, COLOR_GREY, -258.51, -2183.10, 29.01, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // product
	
	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ff00}ALT{ffffff}' Untuk Memproses Susu");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1070.703491, -288.285614, 73.992172, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(19566, 23, 1070.703491, -288.285614, 73.992172, -1, -1, -1, 50);
	
	CreateDynamicPickup(1316, 23, 1568.493774, -1701.049926, 5.390624, -1, -1, -1, 50);
	format(strings, sizeof(strings), ""LB_E"[SAPD Vehicles]\n"WHITE_E"use '"YELLOW_E"/spawnpd"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnpd"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1568.4937, -1701.0499, 5.3906, 5.0);

	CreateDynamicPickup(1316, 23, 1563.965698, -1647.338134, 27.902116, -1, -1, -1, 50);
	format(strings, sizeof(strings), ""LB_E"[SAPD Vehicles]\n"WHITE_E"use '"YELLOW_E"/spawnpd"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnpd"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1563.9656, -1647.3381, 27.9021, 5.0);
	
	CreateDynamicPickup(1316, 23, 1093.72, -1765.4, 13.3449, -1, -1, -1, 50);
	format(strings, sizeof(strings), ""LB_E"[SAGS Vehicles]\n"WHITE_E"use '"YELLOW_E"/spawnsags"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnsags"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1093.72, -1765.4, 13.3449, 5.0);

	CreateDynamicPickup(1239, 23, 741.9764,-1371.2441,25.8835, -1);
	format(strings, sizeof(strings), ""LB_E"[Sana Vehicles]\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn helicopter agency");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 741.9764,-1371.2441,25.8835, 5.0);

	CreateDynamicPickup(1239, 23, 743.5262, -1332.2343, 13.8414, -1);
	format(strings, sizeof(strings), ""LB_E"[Sana Vehicles]\n"WHITE_E"use '"YELLOW_E"/spawnsana"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnsana"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 743.5262, -1332.2343, 13.8414, 5.0); // Vehicles Stats Sana

	CreateDynamicPickup(1239, 23, 1131.5339, -1332.3248, 13.5797, -1);
	format(strings, sizeof(strings), ""LB_E"[Samd Vehicles]\n"WHITE_E"use '"YELLOW_E"/spawnmd"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1131.5339, -1332.3248, 13.5797, 5.0); // Vehicles Stats Samd

	CreateDynamicPickup(1239, 23, 1162.8176, -1313.8239, 32.2215, -1);
	format(strings, sizeof(strings), ""LB_E"[Samd Vehicles]\n"WHITE_E"use '"YELLOW_E"/despawnmd"WHITE_E"' to despawn helicopter medical");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1162.8176, -1313.8239, 32.2215, 5.0);

	format(strings, sizeof(strings), "{ffffff}Gunakan '{00ffff}/buytikettol{ffffff}' Untuk Membeli Tiket Tol!!");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 40.771163, -1529.770751, 5.116502, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	CreateDynamicPickup(1581, 23, 40.771163, -1529.770751, 5.116502, -1, -1, -1, 50);
	
	CreateDynamicPickup(1239, 23, 1324.78, -885.75, 39.57, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Veh Insurance]\n{FFFFFF}/buyinsu - buy insurance\n/claimpv - claim insurance");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1324.78, -885.75, 39.57, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 1325.27, -881.80, 39.57, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart Shop]\n{FFFFFF}/buysparepart\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1325.27, -881.80, 39.57, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, 1960.78, 1393.53, 2889.81, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Arrest Point]\n{FFFFFF}/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1960.78, 1393.53, 2889.81, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1142.38, -1330.74, 13.62, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_PINK, 1142.38, -1330.74, 13.62, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	CreateDynamicPickup(1239, 23, -36.972934, -1124.334350, 1.078125, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -36.972934, -1124.334350, 1.078125, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, -1103.19, -1038.87, 2997.99, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/robbank - To Robbery");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -1103.19, -1038.87, 2997.99, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, -43.692825, -1139.563964, 1.178125, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/bank - access rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -43.692825, -1139.563964, 1.178125, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 1228.08, -1424.94, 13.50, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[PEDAGANG CENTER]\n{FFFFFF}/menu -  untuk membuka list menu");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1228.08, -1424.94, 13.50, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 2043.17, 1336.04, 1003.4, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[IKLAN]\n{FFFFFF}/ads - public ads");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 2043.17, 1336.04, 1003.4, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	CreateDynamicPickup(1241, 23, 1358.27, -33.0632, 1008.52, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MYRICOUS PRODUCTION]\n{FFFFFF}/mix");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 1358.27, -33.0632, 1008.52, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // racik obat

	CreateDynamicPickup(1239, 23, 1229.49, -1427.36, 13.55, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Dapur]\n{FFFFFF}/menumasak");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 1229.49, -1427.36, 13.55, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // pencucian uang haram

    /*format(strings, sizeof(strings), "[Gudang Ayam]\n{FFFFFF}Gunakan /jualayam Untuk Menjual Ayam Potong");
    CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 921.7545,-1299.1313,14.0938, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
    CreateDynamicPickup(2992, 23, 921.7545,-1299.1313,14.0938, -1, -1, -1, 5.0);
	*/

	//-----[ Dynamic Checkpoint ]-----	
	ShowRoomCP = CreateDynamicCP(686.482116, -1512.735595, 14.888568, 1.0, -1, -1, -1, 5.0);
	keluarshamal = CreateDynamicCP(2.4902,33.1088,1199.5938, 1.0, -1, -1, -1, 8.0);
	
	CreateDynamicPickup(1239, 23, 686.482116, -1512.735595, 14.888568, -1, -1, -1, 50);
	CreateDynamic3DTextLabel("{7fffd4}Vehicle Showroom\n{ffffff}Stand Here!", COLOR_GREEN, 686.482116, -1512.735595, 14.888568, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	ShowRoomCPRent = CreateDynamicCP(-611.185302, -524.716674, 25.223440, 1.0, -1, -1, -1, 5.0);
	
	CreateDynamicPickup(1275, 23, -2071.365234, 225.581604, 35.751686, -1, -1, -1, 50);
	ShowRoomTambang = CreateDynamicCP(-2071.365234, 225.581604, 35.751686, 1.0, -1, -1, -1, 5.0);
	
	CreateDynamicPickup(1275, 23, 1050.249390, -315.993011, 73.392181, -1, -1, -1, 50);
	ShowRoomSusu = CreateDynamicCP(1050.249390, -315.993011, 73.392181, 1.0, -1, -1, -1, 5.0);
	
	SAGSLobbyBtn[0] = CreateButton(-2688.83, 808.989, 1501.67, 180.0000);//bank
	SAGSLobbyBtn[1] = CreateButton(-2691.719238, 807.353333, 1501.422241, 0.000000); //bank
	SAGSLobbyBtn[2] = CreateButton(-2067.57, 2692.6, 1501.75, 90.0000);
	SAGSLobbyBtn[3] = CreateButton(-2067.81, 2692.64, 1501.64, -90.0000);
	SAGSLobbyBtn[4] = CreateButton(-2062.34, 2695.24, 1501.72, -90.0000);
	SAGSLobbyBtn[5] = CreateButton(-2062.09, 2695.21, 1501.7, 90.0000);
	SAGSLobbyBtn[6] = CreateButton(-2062.33, 2706.59, 1501.71, -90.0000);
	SAGSLobbyBtn[7] = CreateButton(-2062.08, 2706.69, 1501.73, 90.0000);
	SAGSLobbyDoor[0] = CreateDynamicObject(1569, -2689.33, 807.425, 1499.95, 0.000000, 0.000000, -179.877, -1, -1, -1, 300.00, 300.00);//Bank
	SAGSLobbyDoor[1] = CreateDynamicObject(1569, -2067.72, 2694.67, 1499.96, 0.000000, 0.000000, -89.6241, -1, -1, -1, 300.00, 300.00);
	SAGSLobbyDoor[2] = CreateDynamicObject(1569, -2062.2, 2693.16, 1499.98, 0.000000, 0.000000, 89.9741, -1, -1, -1, 300.00, 300.00);
	SAGSLobbyDoor[3] = CreateDynamicObject(1569, -2062.22, 2704.74, 1499.96, 0.000000, 0.000000, 90.2693, -1, -1, -1, 300.00, 300.00);

	SAMCLobbyBtn[0] = CreateButton(-1786.67, -1999.45, 1501.55, 90.0000);
	SAMCLobbyBtn[1] = CreateButton(-1786.89, -1999.48, 1501.56, -90.0000);
	SAMCLobbyBtn[2] = CreateButton(-1773.67, -1994.98, 1501.57, 180.0000);
	SAMCLobbyBtn[3] = CreateButton(-1773.71, -1995.25, 1501.56, 0.0000);
	SAMCLobbyBtn[4] = CreateButton(-1758.02, -1999.46, 1501.56, -90.0000);
	SAMCLobbyBtn[5] = CreateButton(-1757.81, -1999.46, 1501.57, 90.0000);
	SAMCLobbyDoor[0] = CreateDynamicObject(1569, -1786.8, -1997.48, 1499.77, 0.000000, 0.000000, -90.4041, -1, -1, -1, 300.00, 300.00);
	SAMCLobbyDoor[1] = CreateDynamicObject(1569, -1771.77, -1995.14, 1499.77, 0.000000, 0.000000, -179.415, -1, -1, -1, 300.00, 300.00);
	SAMCLobbyDoor[2] = CreateDynamicObject(1569, -1757.91, -1997.48, 1499.76, 0.000000, 0.000000, -91.6195, -1, -1, -1, 300.00, 300.00);
	
	//-----[ Sidejob Vehicle ]-----	
	AddBusVehicle();
	//AddKurirVehicle();
	AddForVehicle();
	AddMowerVehicle();

	//-----[ Job Vehicle ]-----	
	AddBaggageVehicle();

	printf("[Objects]: %d Loaded.", CountDynamicObjects());
	new DCC_Channel:channell, DCC_Embed:logss;
	new y, m, d, timestamp[200];
	getdate(y, m , d);
	channell = DCC_FindChannelById("1041768890008600647");
	format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	logss = DCC_CreateEmbed("Grandland Roleplay");
	DCC_SetEmbedTitle(logss, "Grandland Roleplay");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0x00ff00);
	DCC_SetEmbedUrl(logss, "ComingSoon");
	DCC_SetEmbedThumbnail(logss, "https://media.discordapp.net/attachments/1060801042675142687/1118390916982517790/standard_6.gif");
//	new DCC_Embed:embed = DCC_CreateEmbed(.title="Revolium Roleplay", .image_url="https://cdn.discordapp.com/avatars/707938825447407983/7de5854e7d880ed9873d4949bd5adf39.png?size=4096");
	DCC_SetEmbedFooter(logss, "Grandland Roleplay", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "```\nServer Kembali Online``` @everyone");
	DCC_AddEmbedField(logss, "Server Status", stroi, true);
	DCC_SendChannelEmbedMessage(channell, logss);
    
    
    /// ============= [mapping] ====================
    //MAP INT RUMAH MBIM
	CreateDynamicObject(19069, 2216.379883, -465.359985, 1025.060059, 0.000000, 45.000000, 60.310001);
	CreateDynamicObject(18946, 2216.949951, -465.410004, 1025.079956, -15.000000, 270.000000, 60.310001);
	new motorhome0 = CreateDynamicObject(1744, 2217.080078, -465.760010, 1024.689941, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome0, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome1 = CreateDynamicObject(19370, 2216.060059, -465.679993, 1024.449951, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome1, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome2 = CreateDynamicObject(19829, 2217.330322, -465.583893, 1024.091431, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome2, 0, 65535, "none", "none");
	CreateDynamicObject(2853, 2215.638672, -465.588257, 1023.846802, 0.000000, 0.000000, -155.399902);
	new motorhome3 = CreateDynamicObject(1428, 2217.682129, -464.629761, 1025.487549, 0.000000, 89.900063, -104.999992);
	SetDynamicObjectMaterial(motorhome3, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome4 = CreateDynamicObject(2559, 2217.219971, -463.829987, 1023.969971, 0.000000, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome4, 256, 14713, "lahss2aint2", "HS2_Curt3");
	new motorhome5 = CreateDynamicObject(2610, 2217.392090, -465.457642, 1023.118347, 0.000000, 720.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome5, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome6 = CreateDynamicObject(9131, 2218.167725, -465.735870, 1024.042480, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome6, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome7 = CreateDynamicObject(2559, 2218.189941, -464.799988, 1023.780029, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome7, 256, 14713, "lahss2aint2", "HS2_Curt3");
	new motorhome8 = CreateDynamicObject(2911, 2216.060059, -465.609985, 1022.700012, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome8, 0, 65535, "none", "none");
	new motorhome9 = CreateDynamicObject(1563, 2218.639404, -464.940002, 1023.890015, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome9, 0, 65535, "none", "none");
	new motorhome10 = CreateDynamicObject(19370, 2217.709961, -466.730011, 1023.530029, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome10, 0, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(2854, 2214.526611, -465.610718, 1025.123901, 0.000000, 0.000000, -11.700003);
	new motorhome11 = CreateDynamicObject(2610, 2218.854736, -465.227722, 1025.058838, 0.000000, 450.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome11, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome12 = CreateDynamicObject(1742, 2214.729980, -465.739990, 1023.460022, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome12, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	CreateDynamicObject(1731, 2218.019287, -465.443634, 1026.504150, 0.000000, 0.000000, 270.000000);
	new motorhome13 = CreateDynamicObject(9131, 2218.888428, -465.746216, 1025.063477, 0.000000, 90.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome13, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome14 = CreateDynamicObject(19373, 2216.469971, -464.000000, 1022.619995, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome14, 0, 14443, "ganghoos", "mp_burn_carpet2");
	CreateDynamicObject(2855, 2214.265869, -465.383423, 1024.260498, 0.000000, 0.000000, -88.500023);
	CreateDynamicObject(19586, 2215.439453, -463.073120, 1024.259888, 90.000000, 0.000000, 90.000000);
	CreateDynamicObject(19583, 2215.458008, -462.985260, 1024.243652, 90.000000, 0.000000, 90.000000);
	new motorhome15 = CreateDynamicObject(1428, 2217.580078, -462.850006, 1024.180054, 15.000000, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome15, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome16 = CreateDynamicObject(19357, 2218.500000, -465.890015, 1026.390015, 65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome16, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome17 = CreateDynamicObject(1562, 2218.979492, -464.940002, 1023.359985, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome17, 0, 65535, "none", "none");
	new motorhome18 = CreateDynamicObject(19808, 2215.336426, -462.881592, 1024.365967, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome18, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome19 = CreateDynamicObject(2558, 2215.550049, -462.799988, 1024.109985, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome19, 256, 14713, "lahss2aint2", "HS2_Curt3");
	new motorhome20 = CreateDynamicObject(2258, 2216.289795, -462.988922, 1023.122314, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome20, 256, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome21 = CreateDynamicObject(19581, 2215.461670, -462.756226, 1024.370728, 88.400024, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome21, 0, 65535, "none", "none");
	CreateDynamicObject(2967, 2213.950195, -465.169128, 1023.849915, 0.000000, 0.000000, 65.379997);
	CreateDynamicObject(11719, 2216.113770, -462.607147, 1023.712891, 0.000000, 0.000000, -112.499977);
	new motorhome22 = CreateDynamicObject(19370, 2219.229980, -464.130005, 1025.359985, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome22, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome23 = CreateDynamicObject(1563, 2218.559326, -463.160004, 1023.890015, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome23, 0, 65535, "none", "none");
	new motorhome24 = CreateDynamicObject(2200, 2215.529053, -465.488342, 1021.959717, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome24, 768, 10765, "airportgnd_sfse", "black64");
	CreateDynamicObject(1565, 2214.489990, -463.970001, 1026.150024, 0.000000, 0.000000, 0.000000);
	new motorhome25 = CreateDynamicObject(19357, 2216.696289, -465.291504, 1027.549072, -32.600025, -27.299961, -133.039993);
	SetDynamicObjectMaterial(motorhome25, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome26 = CreateDynamicObject(2150, 2216.347412, -462.487793, 1023.530334, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome26, 0, 1560, "7_11_door", "cj_sheetmetal2");
	new motorhome27 = CreateDynamicObject(19416, 2216.060059, -462.320007, 1024.449951, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome27, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome28 = CreateDynamicObject(19359, 2219.378906, -464.229156, 1025.229248, 0.000007, 90.000000, 179.999969);
	SetDynamicObjectMaterial(motorhome28, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome29 = CreateDynamicObject(19357, 2214.199951, -465.470001, 1026.339966, 65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome29, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome30 = CreateDynamicObject(19359, 2216.588379, -462.209015, 1024.328247, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome30, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome31 = CreateDynamicObject(2978, 2218.929443, -464.959991, 1022.599976, 0.000000, 0.000007, 0.000000);
	SetDynamicObjectMaterial(motorhome31, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome32 = CreateDynamicObject(19359, 2219.398926, -465.549225, 1023.128784, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome32, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome33 = CreateDynamicObject(2417, 2215.909912, -462.809998, 1022.710022, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome33, 0, 1560, "7_11_door", "cj_sheetmetal2");
	new motorhome34 = CreateDynamicObject(1649, 2215.566895, -462.332703, 1023.845032, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome34, 0, 18065, "ab_sfammumain", "shelf_glas");
	new motorhome35 = CreateDynamicObject(19357, 2214.199951, -464.000000, 1026.290039, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome35, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome36 = CreateDynamicObject(18633, 2219.657715, -465.348541, 1023.513916, 0.000000, 810.000000, 800.000000);
	SetDynamicObjectMaterial(motorhome36, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome37 = CreateDynamicObject(2610, 2216.684814, -462.705566, 1022.619202, 0.000000, 720.000000, 360.000000);
	SetDynamicObjectMaterial(motorhome37, 512, 18888, "forcefields", "white");
	new motorhome38 = CreateDynamicObject(19357, 2217.000000, -464.000000, 1027.599976, 0.000000, 40.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome38, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome39 = CreateDynamicObject(2610, 2218.854736, -462.847717, 1025.038818, 0.000000, 270.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome39, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome40 = CreateDynamicObject(3047, 2219.899170, -464.950012, 1024.860107, 0.000000, 270.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome40, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome41 = CreateDynamicObject(2258, 2216.990234, -462.332855, 1023.122314, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome41, 256, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome42 = CreateDynamicObject(9131, 2218.167725, -462.356018, 1024.042480, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome42, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome43 = CreateDynamicObject(1250, 2218.759277, -465.109985, 1022.099976, -0.000007, 0.000000, -89.999977);
	SetDynamicObjectMaterial(motorhome43, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome44 = CreateDynamicObject(1562, 2218.899414, -463.160004, 1023.359985, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome44, 0, 65535, "none", "none");
	new motorhome45 = CreateDynamicObject(2258, 2216.287842, -462.996887, 1022.182007, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome45, 256, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome46 = CreateDynamicObject(19810, 2219.723145, -465.354980, 1023.281128, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome46, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome47 = CreateDynamicObject(2147, 2214.944092, -463.040039, 1022.710022, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome47, 0, 1560, "7_11_door", "cj_sheetmetal2");
	new motorhome48 = CreateDynamicObject(2167, 2215.009521, -462.808228, 1022.935608, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome48, 256, 18888, "forcefields", "white");
	new motorhome49 = CreateDynamicObject(1752, 2219.628662, -465.430389, 1023.024658, 0.000000, 0.000000, 360.000000);
	SetDynamicObjectMaterial(motorhome49, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome50 = CreateDynamicObject(2610, 2219.973633, -465.777649, 1025.038818, 0.000000, 270.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome50, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome51 = CreateDynamicObject(2167, 2214.950439, -462.808228, 1022.935608, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome51, 256, 18888, "forcefields", "white");
	new motorhome52 = CreateDynamicObject(19468, 2219.771240, -465.428345, 1023.286804, 22.000000, 90.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome52, 0, 11631, "mp_ranchcut", "mpcj_speaker_6");
	new motorhome53 = CreateDynamicObject(19370, 2216.060059, -465.679993, 1027.949951, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome53, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome54 = CreateDynamicObject(19360, 2219.765625, -466.536652, 1025.214111, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome54, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome55 = CreateDynamicObject(19357, 2218.540039, -464.000000, 1027.300049, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome55, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(1731, 2218.019287, -462.563568, 1026.504150, 0.000000, 0.000000, 450.000000);
	CreateDynamicObject(2291, 2213.679932, -465.089996, 1022.710022, 0.000000, 0.000000, 180.000000);
	new motorhome56 = CreateDynamicObject(2167, 2215.011475, -462.558228, 1022.935608, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome56, 256, 18888, "forcefields", "white");
	new motorhome57 = CreateDynamicObject(2167, 2215.970459, -462.758148, 1022.146057, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome57, 256, 18888, "forcefields", "white");
	new motorhome58 = CreateDynamicObject(2167, 2214.948486, -462.558167, 1022.935608, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome58, 256, 18888, "forcefields", "white");
	new motorhome59 = CreateDynamicObject(19370, 2219.270020, -465.679993, 1027.040039, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome59, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome60 = CreateDynamicObject(19348, 2219.740234, -463.794128, 1023.355713, 0.000000, 130.899994, 0.000000);
	SetDynamicObjectMaterial(motorhome60, 256, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(19368, 2219.429932, -463.989990, 1022.630005, 0.000000, 90.000000, 0.000000);
	new motorhome61 = CreateDynamicObject(19370, 2216.050049, -462.309998, 1022.520020, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome61, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome62 = CreateDynamicObject(9131, 2220.286621, -465.256165, 1025.020142, 25.000000, 90.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome62, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome63 = CreateDynamicObject(19940, 2213.631592, -465.642334, 1022.607483, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome63, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome64 = CreateDynamicObject(19804, 2220.127197, -464.944244, 1023.508911, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome64, 0, 65535, "none", "none");
	new motorhome65 = CreateDynamicObject(9131, 2218.888428, -462.346252, 1025.063477, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome65, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome66 = CreateDynamicObject(19370, 2217.709961, -461.869995, 1023.530029, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome66, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome67 = CreateDynamicObject(2978, 2218.929443, -463.119995, 1022.599976, 0.000000, 0.000007, 0.000000);
	SetDynamicObjectMaterial(motorhome67, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome68 = CreateDynamicObject(2266, 2212.959473, -465.101654, 1024.125366, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome68, 256, 2266, "picture_frame", "CJ_PAINTING37");
	new motorhome69 = CreateDynamicObject(2006, 2219.949707, -464.269501, 1023.147156, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome69, 0, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(19835, 2219.954102, -464.112061, 1023.217773, 0.000000, 0.000000, 0.000000);
	new motorhome70 = CreateDynamicObject(2149, 2220.185791, -464.947906, 1023.359497, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome70, 1024, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome71 = CreateDynamicObject(19359, 2219.398926, -465.449158, 1022.057983, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome71, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(1787, 2220.012451, -463.524170, 1024.960938, 18.299999, 0.000000, 270.000000);
	new motorhome72 = CreateDynamicObject(2006, 2219.949707, -464.109436, 1023.147156, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome72, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome73 = CreateDynamicObject(2610, 2212.938965, -465.557648, 1025.239502, 0.000000, 630.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome73, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome74 = CreateDynamicObject(1786, 2220.110352, -465.137115, 1023.079468, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome74, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome75 = CreateDynamicObject(3047, 2219.899170, -463.220001, 1024.860107, 0.000000, 270.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome75, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome76 = CreateDynamicObject(19370, 2212.860107, -465.679993, 1024.449951, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome76, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome77 = CreateDynamicObject(1250, 2218.769287, -463.269989, 1022.099976, -0.000007, 0.000000, -89.999977);
	SetDynamicObjectMaterial(motorhome77, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome78 = CreateDynamicObject(14722, 2216.771729, -468.112396, 1022.107544, 90.000000, 180.000000, 360.000000);
	SetDynamicObjectMaterial(motorhome78, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome79 = CreateDynamicObject(1786, 2220.112305, -464.527100, 1023.077515, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome79, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome80 = CreateDynamicObject(1510, 2219.938721, -463.804199, 1023.174866, 0.000000, -29.500029, 0.000000);
	SetDynamicObjectMaterial(motorhome80, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	CreateDynamicObject(16101, 2218.840088, -463.989990, 1027.569946, 0.000000, 0.000000, 0.000000);
	new motorhome81 = CreateDynamicObject(19357, 2216.659912, -462.600006, 1027.489990, -30.000000, 20.000000, 298.720001);
	SetDynamicObjectMaterial(motorhome81, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome82 = CreateDynamicObject(2167, 2215.970459, -462.268188, 1022.146057, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome82, 256, 18888, "forcefields", "white");
	new motorhome83 = CreateDynamicObject(2702, 2219.933105, -463.309143, 1023.619812, -24.800001, -158.299957, 12.399998);
	SetDynamicObjectMaterial(motorhome83, 256, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome84 = CreateDynamicObject(1958, 2220.086426, -463.787933, 1023.328491, 88.800018, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome84, 768, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome85 = CreateDynamicObject(1786, 2219.940186, -465.917023, 1022.569031, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome85, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome86 = CreateDynamicObject(1958, 2220.302002, -464.157959, 1023.548584, -1.199980, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome86, 768, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome87 = CreateDynamicObject(19370, 2217.718506, -464.130005, 1020.976013, 0.000000, 360.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome87, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome88 = CreateDynamicObject(2200, 2215.529053, -465.488342, 1020.838684, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome88, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome89 = CreateDynamicObject(18635, 2220.042236, -463.411011, 1023.619141, 46.000000, 106.800064, 92.800179);
	SetDynamicObjectMaterial(motorhome89, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome90 = CreateDynamicObject(1958, 2220.299561, -464.157898, 1023.452515, -1.199980, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome90, 768, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome91 = CreateDynamicObject(1942, 2219.902344, -463.167816, 1023.583252, 30.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome91, 256, 2718, "cj_ff_acc2", "CJ_FLY_TUBE");
	CreateDynamicObject(11746, 2219.975098, -463.369110, 1023.441772, 27.999996, 0.000000, 66.799980);
	new motorhome92 = CreateDynamicObject(1958, 2220.297363, -464.157898, 1023.358398, -1.199980, 0.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome92, 768, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome93 = CreateDynamicObject(11747, 2219.990234, -463.318665, 1023.439026, -1.799998, 90.000000, 70.599998);
	SetDynamicObjectMaterial(motorhome93, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome94 = CreateDynamicObject(19357, 2218.479980, -462.119995, 1026.420044, -65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome94, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome95 = CreateDynamicObject(19357, 2214.199951, -462.529999, 1026.339966, -65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome95, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome96 = CreateDynamicObject(1747, 2219.965576, -463.593384, 1023.016724, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome96, 256, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome97 = CreateDynamicObject(1786, 2220.110352, -463.847168, 1023.079529, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome97, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome98 = CreateDynamicObject(1786, 2219.940186, -464.127045, 1022.569031, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome98, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome99 = CreateDynamicObject(2610, 2220.202393, -465.187561, 1026.569580, 0.000000, 630.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome99, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome100 = CreateDynamicObject(1747, 2220.031250, -463.132385, 1023.825684, 90.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome100, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome101 = CreateDynamicObject(2702, 2219.917236, -463.023865, 1023.606140, -167.799988, 138.699860, -6.500030);
	SetDynamicObjectMaterial(motorhome101, 256, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome102 = CreateDynamicObject(18633, 2219.682861, -462.745697, 1023.513916, 0.000000, 270.000000, 460.000000);
	SetDynamicObjectMaterial(motorhome102, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome103 = CreateDynamicObject(19359, 2219.398926, -462.539246, 1023.128784, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome103, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome104 = CreateDynamicObject(1649, 2220.483643, -464.129150, 1023.431885, 20.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(motorhome104, 0, 18065, "ab_sfammumain", "shelf_glas");
	CreateDynamicObject(2595, 2213.432129, -462.649902, 1024.022705, 0.000000, 0.000000, -85.899986);
	new motorhome105 = CreateDynamicObject(1747, 2219.853027, -462.960236, 1023.199219, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome105, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome106 = CreateDynamicObject(1752, 2219.528564, -462.660156, 1023.024658, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome106, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome107 = CreateDynamicObject(19810, 2219.723145, -462.734863, 1023.281128, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome107, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome108 = CreateDynamicObject(18635, 2219.998047, -462.906982, 1023.664185, -41.699986, 103.400009, -94.199966);
	SetDynamicObjectMaterial(motorhome108, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome109 = CreateDynamicObject(19359, 2220.389893, -466.909882, 1023.707336, 0.000000, -19.999992, 0.000000);
	SetDynamicObjectMaterial(motorhome109, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome110 = CreateDynamicObject(1747, 2220.033203, -462.830200, 1023.827698, 90.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome110, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome111 = CreateDynamicObject(1649, 2220.583740, -465.435944, 1023.108276, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome111, 0, 18065, "ab_sfammumain", "shelf_glas");
	new motorhome112 = CreateDynamicObject(2167, 2215.910400, -461.708008, 1022.356262, -90.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome112, 256, 18888, "forcefields", "white");
	new motorhome113 = CreateDynamicObject(19468, 2219.771240, -462.668488, 1023.286804, 22.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome113, 0, 11631, "mp_ranchcut", "mpcj_speaker_6");
	new motorhome114 = CreateDynamicObject(9131, 2220.286621, -462.986237, 1025.020142, 25.000000, 90.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome114, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome115 = CreateDynamicObject(19370, 2212.500000, -466.359985, 1024.449951, 0.000000, 0.000000, 45.000000);
	SetDynamicObjectMaterial(motorhome115, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome116 = CreateDynamicObject(1786, 2220.112305, -463.157196, 1023.081482, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome116, 512, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome117 = CreateDynamicObject(2167, 2215.009521, -462.808228, 1021.425476, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome117, 0, 18888, "forcefields", "white");
	new motorhome118 = CreateDynamicObject(2163, 2213.474365, -462.263336, 1024.570068, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome118, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome119 = CreateDynamicObject(2167, 2214.950439, -462.808228, 1021.425903, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome119, 0, 18888, "forcefields", "white");
	new motorhome120 = CreateDynamicObject(19373, 2212.969971, -464.000000, 1022.619995, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome120, 0, 14443, "ganghoos", "mp_burn_carpet2");
	CreateDynamicObject(2798, 2220.071777, -463.363251, 1022.535522, 0.000000, -35.000000, 0.000000);
	new motorhome121 = CreateDynamicObject(19359, 2220.711914, -464.229156, 1023.118713, 0.000007, 20.000000, 179.999969);
	SetDynamicObjectMaterial(motorhome121, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome122 = CreateDynamicObject(19370, 2216.058838, -462.321014, 1027.946899, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome122, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome123 = CreateDynamicObject(19357, 2220.530029, -463.939850, 1026.390015, 65.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome123, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(2798, 2220.071777, -463.253174, 1022.535522, 0.000000, -35.000000, 0.000000);
	new motorhome124 = CreateDynamicObject(2902, 2220.392578, -463.179382, 1023.220642, -0.799997, -146.300232, 0.000000);
	SetDynamicObjectMaterial(motorhome124, 0, 65535, "none", "none");
	new motorhome125 = CreateDynamicObject(2167, 2214.927490, -461.752045, 1022.356262, -90.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome125, 0, 18888, "forcefields", "white");
	new motorhome126 = CreateDynamicObject(2610, 2220.037598, -462.301727, 1025.038818, 0.000000, 270.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome126, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome127 = CreateDynamicObject(2167, 2215.009521, -461.708008, 1022.356262, -90.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome127, 0, 18888, "forcefields", "white");
	new motorhome128 = CreateDynamicObject(19940, 2212.646729, -464.652313, 1022.607483, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome128, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome129 = CreateDynamicObject(1795, 2221.159912, -465.510010, 1025.099976, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome129, 0, 18888, "forcefields", "white");
	new motorhome130 = CreateDynamicObject(1250, 2220.759521, -465.650024, 1022.730042, -0.000007, 0.000000, -89.999977);
	SetDynamicObjectMaterial(motorhome130, 0, 18368, "cs_mountaintop", "des_woodrails");
	new motorhome131 = CreateDynamicObject(2167, 2214.031738, -462.434235, 1022.149536, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome131, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome132 = CreateDynamicObject(19359, 2219.398926, -462.639313, 1022.057983, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome132, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome133 = CreateDynamicObject(19370, 2220.320068, -464.010010, 1027.050049, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome133, 0, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(2798, 2220.093018, -463.003174, 1022.542603, 0.000000, -45.000000, 0.000000);
	new motorhome134 = CreateDynamicObject(19370, 2219.270020, -462.320007, 1027.040039, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome134, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome135 = CreateDynamicObject(19359, 2220.339844, -464.229156, 1022.057983, 0.000007, 0.000000, 179.999969);
	SetDynamicObjectMaterial(motorhome135, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome136 = CreateDynamicObject(19940, 2212.680664, -463.772339, 1022.607483, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome136, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome137 = CreateDynamicObject(2610, 2220.202393, -462.817566, 1026.589600, 0.000000, 810.000000, 270.000000);
	SetDynamicObjectMaterial(motorhome137, 512, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome138 = CreateDynamicObject(1795, 2221.159912, -463.829987, 1025.099976, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome138, 0, 18888, "forcefields", "white");
	new motorhome139 = CreateDynamicObject(19920, 2212.747314, -462.583557, 1024.017822, 0.000000, 0.000000, -53.399998);
	SetDynamicObjectMaterial(motorhome139, 0, 65535, "none", "none");
	new motorhome140 = CreateDynamicObject(19370, 2212.860107, -462.320007, 1024.449951, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome140, 0, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(2292, 2212.260010, -465.100006, 1022.710022, 0.000000, 0.000000, 90.000000);
	new motorhome141 = CreateDynamicObject(1786, 2219.940186, -462.367126, 1022.569031, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome141, 512, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(2291, 2212.260010, -464.660004, 1022.710022, 0.000000, 0.000000, 90.000000);
	new motorhome142 = CreateDynamicObject(2167, 2213.573242, -462.438263, 1022.151550, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome142, 256, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome143 = CreateDynamicObject(19360, 2219.765625, -461.546570, 1025.214111, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome143, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome144 = CreateDynamicObject(2558, 2211.810059, -464.500031, 1024.109985, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome144, 256, 14713, "lahss2aint2", "HS2_Curt3");
	new motorhome145 = CreateDynamicObject(1649, 2220.583740, -462.656006, 1023.108276, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome145, 0, 18065, "ab_sfammumain", "shelf_glas");
	new motorhome146 = CreateDynamicObject(2163, 2212.603760, -462.265350, 1024.570068, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome146, 256, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(2291, 2212.260010, -463.730011, 1022.710022, 0.000000, 0.000000, 90.000000);
	new motorhome147 = CreateDynamicObject(19360, 2221.645508, -464.256744, 1024.889893, 0.000000, 90.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome147, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome148 = CreateDynamicObject(2167, 2211.627930, -465.730988, 1023.973511, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome148, 512, 10765, "airportgnd_sfse", "black64");
	new motorhome149 = CreateDynamicObject(19357, 2211.840088, -465.279999, 1026.329956, 0.000000, 35.000000, 45.000000);
	SetDynamicObjectMaterial(motorhome149, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome150 = CreateDynamicObject(2167, 2214.031738, -462.434235, 1021.209351, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome150, 256, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(1250, 2221.340088, -464.200012, 1022.719971, 0.000000, 0.000000, 270.000000);
	new motorhome151 = CreateDynamicObject(1510, 2211.590088, -464.440002, 1023.868042, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome151, 0, 65535, "none", "none");
	CreateDynamicObject(19813, 2212.605469, -462.418488, 1022.915344, 0.000000, 0.000000, 0.000000);
	new motorhome152 = CreateDynamicObject(2167, 2211.347656, -465.460754, 1023.975525, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome152, 512, 10765, "airportgnd_sfse", "black64");
	new motorhome153 = CreateDynamicObject(2167, 2213.573242, -462.438263, 1021.211426, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome153, 256, 1730, "cj_furniture", "CJ_WOOD5");
	CreateDynamicObject(3092, 2218.899902, -464.350006, 1029.489990, 0.000000, 0.000000, 180.000000);
	new motorhome154 = CreateDynamicObject(19359, 2221.761230, -465.459137, 1022.789124, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome154, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome155 = CreateDynamicObject(19357, 2211.639893, -463.959991, 1026.329956, 0.000000, 35.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome155, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome156 = CreateDynamicObject(19416, 2211.340088, -463.989990, 1024.449951, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome156, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome157 = CreateDynamicObject(19370, 2212.489990, -461.640015, 1024.449951, 0.000000, 0.000000, -45.000000);
	SetDynamicObjectMaterial(motorhome157, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome158 = CreateDynamicObject(19369, 2213.004395, -461.106384, 1024.665039, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome158, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome159 = CreateDynamicObject(1744, 2211.260010, -464.459991, 1023.520020, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome159, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome160 = CreateDynamicObject(19359, 2211.227295, -464.039001, 1024.328247, 0.000007, 0.000000, 179.999969);
	SetDynamicObjectMaterial(motorhome160, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(3092, 2218.850098, -463.640015, 1029.489990, 0.000000, 0.000000, 0.000000);
	new motorhome161 = CreateDynamicObject(19359, 2220.389893, -461.179840, 1023.707336, 0.000000, -19.999992, 0.000000);
	SetDynamicObjectMaterial(motorhome161, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome162 = CreateDynamicObject(19940, 2212.476318, -462.788269, 1021.828918, 90.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome162, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome163 = CreateDynamicObject(1649, 2211.325195, -463.482727, 1023.845032, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome163, 0, 18065, "ab_sfammumain", "shelf_glas");
	new motorhome164 = CreateDynamicObject(19357, 2211.750000, -462.809998, 1026.329956, 0.000000, 35.000000, -45.000000);
	SetDynamicObjectMaterial(motorhome164, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome165 = CreateDynamicObject(2167, 2211.687988, -462.271027, 1023.973511, 0.000000, 0.000000, 360.000000);
	SetDynamicObjectMaterial(motorhome165, 512, 10765, "airportgnd_sfse", "black64");
	new motorhome166 = CreateDynamicObject(19940, 2212.035889, -462.788269, 1021.828918, 90.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome166, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome167 = CreateDynamicObject(1744, 2211.588867, -462.250092, 1023.665283, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome167, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome168 = CreateDynamicObject(2167, 2211.347656, -462.490784, 1023.975525, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome168, 512, 10765, "airportgnd_sfse", "black64");
	new motorhome169 = CreateDynamicObject(19359, 2221.759277, -462.639252, 1022.789124, 0.000007, 0.000000, 89.999977);
	SetDynamicObjectMaterial(motorhome169, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	CreateDynamicObject(14722, 2212.557617, -464.222595, 1028.950439, 0.000000, 180.000000, 270.000000);
	new motorhome170 = CreateDynamicObject(19357, 2220.530029, -460.820007, 1026.400024, 65.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(motorhome170, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome171 = CreateDynamicObject(19357, 2210.709961, -465.470001, 1026.339966, 65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome171, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome172 = CreateDynamicObject(14722, 2219.093994, -460.002563, 1022.107544, 90.000000, 180.000000, 180.000000);
	SetDynamicObjectMaterial(motorhome172, 0, 1730, "cj_furniture", "CJ_WOOD5");
	new motorhome173 = CreateDynamicObject(19357, 2210.699951, -464.000000, 1026.290039, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome173, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome174 = CreateDynamicObject(19369, 2210.351807, -466.888336, 1024.064697, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome174, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome175 = CreateDynamicObject(19357, 2210.699951, -462.529999, 1026.339966, -65.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome175, 0, 11631, "mp_ranchcut", "mpCJ_SPEAKER4");
	new motorhome176 = CreateDynamicObject(19369, 2210.031494, -466.638245, 1024.062622, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome176, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	CreateDynamicObject(14722, 2212.557617, -461.422699, 1028.950439, 0.000000, 180.000000, 270.000000);
	CreateDynamicObject(14722, 2210.695801, -465.592438, 1028.950439, 0.000000, 180.000000, 360.000000);
	new motorhome177 = CreateDynamicObject(19369, 2210.351807, -461.106384, 1024.064697, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome177, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	new motorhome178 = CreateDynamicObject(19369, 2210.031494, -461.368347, 1024.062622, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(motorhome178, 0, 1355, "break_s_bins", "CJ_WOOD_DARK");
	CreateDynamicObject(14722, 2210.695801, -468.372284, 1028.950439, 0.000000, 180.000000, 360.000000);
	CreateDynamicObject(9931, 1980.557617, -368.515625, 1108.010864, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(6959, 1976.876953, -356.753906, 1095.519653, 309.995728, 180.000000, 270.000000);
	CreateDynamicObject(6959, 1963.977539, -368.121094, 1072.754395, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(3976, 1962.701172, -400.466797, 1109.529419, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(6959, 1958.957153, -378.233063, 1096.338135, 309.995728, 180.000000, 180.000000);
	CreateDynamicObject(3976, 1970.657227, -341.238281, 1100.229492, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(6959, 1951.265625, -360.225586, 1095.560303, 309.995728, 180.000000, 90.000000);
	CreateDynamicObject(9931, 1947.540039, -368.512695, 1108.010864, 0.000000, 0.000000, 90.000000);

	return 1;

}

public OnGameModeExit()
{

	new count = 0, count1 = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station]: %d Saved.", count);
	
	foreach(new pid : Plants)
	{
		if(Iter_Contains(Plants, pid))
		{
			count1++;
			Plant_Save(pid);
		}
	}
	printf("[Farmer Plants]: %d Saved.", count1);
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	UnloadTazerSAPD();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	return 1;
}

/*public OnQueryError(errorid, error[], callback[], query[], connectionHandle)
{
	new
	    File:file = fopen("mysql_error.txt", io_append);

	if(file)
	{
	    new
	        string[2048];

		format(string, sizeof(string), "[%s]\r\nError ID: %i\r\nCallback: %s\r\nQuery: %s\r\n[!] %s\r\n\r\n", GetDate(), errorid, callback, query, error);
		fwrite(file, string);
		fclose(file);
	}

	SendStaffMessage(COLOR_RED, "[ERROR MySQL]:{ffffff} MySQL terjadi kesalahan (error %i). Detail ditulis di mysql_error.txt.", errorid);
	return 1;
}*/

//-----[ Button System ]-----	
function SAGSLobbyDoorClose()
{
	MoveDynamicObject(SAGSLobbyDoor[0], -2689.33, 807.425, 1499.95, 3);
	MoveDynamicObject(SAGSLobbyDoor[1], -2067.72, 2694.67, 1499.96, 3);
	MoveDynamicObject(SAGSLobbyDoor[2], -2062.2, 2693.16, 1499.98, 3);
	MoveDynamicObject(SAGSLobbyDoor[3], -2062.22, 2704.74, 1499.96, 3);
	return 1;
}

function SAMCLobbyDoorClose()
{
	MoveDynamicObject(SAMCLobbyDoor[0], -1786.8, -1997.48, 1499.77, 3);
	MoveDynamicObject(SAMCLobbyDoor[1], -1771.77, -1995.14, 1499.77, 3);
	MoveDynamicObject(SAMCLobbyDoor[2], -1757.91, -1997.48, 1499.76, 3);
	return 1;
}


public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0] || buttonid == SAGSLobbyBtn[1])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[0], -2687.77, 807.428, 1499.95, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAGSLobbyBtn[2] || buttonid == SAGSLobbyBtn[3])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[1], -2067.73, 2696.24, 1499.96, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAGSLobbyBtn[4] || buttonid == SAGSLobbyBtn[5])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[2], -2062.2, 2691.63, 1499.98, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAGSLobbyBtn[6] || buttonid == SAGSLobbyBtn[7])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor[3], -2062.21, 2703.22, 1499.96, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[0] || buttonid == SAMCLobbyBtn[1])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[0], -1786.79, -1995.97, 1499.77, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[2] || buttonid == SAMCLobbyBtn[3])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[1], -1770.25, -1995.13, 1499.77, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	if(buttonid == SAMCLobbyBtn[4] || buttonid == SAMCLobbyBtn[5])
	{
		if(pData[playerid][pFaction] == 3)
		{
			MoveDynamicObject(SAMCLobbyDoor[2], -1757.87, -1995.95, 1499.76, 3, -1000.0, -1000.0, -1000.0);
			SetTimer("SAMCLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Akses ditolak.");
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	//RemovePlayerAttachedObject(playerid, BOX_INDEX);
	//angkatBox[playerid] = false;
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SANEWS!");
			}
		}
		if(IsTNICar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 5)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsABaggageVeh(vehicleid))
		{
			if(pData[playerid][pJob] != 10 && pData[playerid][pJob2] != 10)
			{
				RemovePlayerFromVehicle(playerid);
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
                Error(playerid, "Kamu tidak bekerja sebagai Baggage Airport");
			}
		}
		if(IsADmvVeh(vehicleid))
        {
            if(!pData[playerid][pDriveLicApp])
            {
                RemovePlayerFromVehicle(playerid);
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
                Error(playerid, "Kamu tidak sedang mengikuti Tes Mengemudi");
			}
			else 
			{
				Info(playerid, "Silahkan ikuti Checkpoint yang ada di GPS mobil ini.");
				SetPlayerRaceCheckpoint(playerid, 1, dmvpoint1, dmvpoint1, 5.0);
			}
		}
		/*if(IsAKurirVeh(vehicleid))
		{
			if(pData[playerid][pJob] != 8 && pData[playerid][pJob2] != 8)
			{
				RemovePlayerFromVehicle(playerid);
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
                Error(playerid, "Kamu tidak bekerja sebagai Courier");
			}
		}*/
		/*foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) && pvData[pv][cLocked] == 1)
				{
					RemovePlayerFromVehicle(playerid);
					new Float:slx, Float:sly, Float:slz;
					GetPlayerPos(playerid, slx, sly, slz);
					SetPlayerPos(playerid, slx, sly, slz);
					Error(playerid, "This bike is locked by owner.");
				}
			}
		}*/
	}
	return 1;
}

stock SGetName(playerid)
{
    new name[ 64 ];
    GetPlayerName(playerid, name, sizeof( name ));
    return name;
}

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	new str[150];
	format(str,sizeof(str),"[CHAT] %s: %s", GetRPName(playerid), text);
	LogServer("Chat", str);
	printf(str);

	/*if(pData[playerid][pAdminDuty] == 1)
	{
		new lstr[200];
		format(lstr, sizeof(lstr), "{FF0000}%s : {FFFFFF}(( %s ))", ReturnName(playerid), text);
		ProxDetector(25, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
	}*/

	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	//-----[ Auto RP ]-----
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s lepaskan senjatanya dari sabuk dan siap untuk menembak kapan saja.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s kaget setelah kecelakaan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfish", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memancing dengan kedua tangannya.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfall", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s jatuh dan merasakan sakit.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpmad", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa kesal dan ingin mengeluarkan amarah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprob", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menggeledah sesuatu dan siap untuk merampok.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcj", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencuri kendaraan seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpwar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berperang dengan sesorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdie", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s pingsan dan tidak sadarkan diri.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfixmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memperbaiki mesin kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcheckmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memeriksa kondisi kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfight", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ribut dan memukul seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcry", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang bersedih dan menangis.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berlari dan kabur.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfear", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa ketakutan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdropgun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meletakkan senjata kebawah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rptakegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mengamnbil senjata.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpgivegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memberikan kendaraan kepada seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpshy", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa malu.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnusuk", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menusuk dan membunuh seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpharvest", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memanen tanaman.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockhouse", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci rumah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockcar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnodong", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memulai menodong seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpeat", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s makan makanan yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdrink", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meminum minuman yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "Anda tidak memiliki Credit!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "Tidak dapat melakukan saat ini.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "Nomor ini tidak aktif!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];

					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (result == -1)
    {
        ErrorMsg(playerid, "Unknown Command! Gunakan /help untuk info lanjut.");
        return 0;
    }
	new str[150];
	format(str,sizeof(str),"[CMD] %s: [%s] [%s]", GetRPName(playerid), cmd, params);
	LogServer("Command", str);
	printf(str);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

//TD DEATH
stock ShowTdDeath(playerid)
{
	PlayerTextDrawShow(playerid, DeathTD[playerid][0]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][1]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][2]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][3]);
	PlayerTextDrawShow(playerid, DeathTD[playerid][4]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][5]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][6]);
    PlayerTextDrawShow(playerid, DeathTD[playerid][7]);
    return 1;
}
stock HideTdDeath(playerid)
{
	PlayerTextDrawHide(playerid, DeathTD[playerid][0]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][1]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][2]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][3]);
	PlayerTextDrawHide(playerid, DeathTD[playerid][4]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][5]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][6]);
    PlayerTextDrawHide(playerid, DeathTD[playerid][7]);
    return 1;
}

public OnPlayerConnect(playerid)
{

	SendClientMessage(playerid, -1, "{56A4E4}[Server] -> {FFFFFF}Checking your account status.");
	
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	pemainic++;
	CreatePlayerInv(playerid);
    pData[playerid][pSelectItem] = 0;
    for (new i = 0; i != MAX_INVENTORY; i ++)
	{
	    InventoryData[playerid][i][invExists] = false;
	    InventoryData[playerid][i][invModel] = 0;
	}
	pData[playerid][pMarkTemp] = 0;
	AntiBHOP[playerid] = 0;
	IsAtEvent[playerid] = 0;
	TogglePhone[playerid] = 0;
	ToggleCall[playerid] = 0;
	ToggleSid[playerid] = 0;
	takingselfie[playerid] = 0;
	DetikCall[playerid] = 0;
	MenitCall[playerid] = 0;
	JamCall[playerid] = 0;
	pData[playerid][pDriveLicApp] = 0;
	//AntiCheat
	pData[playerid][pJetpack] = 0;
	pData[playerid][pLastUpdate] = 0;
	pData[playerid][pArmorTime] = 0;
	pData[playerid][pACTime] = 0;
	//Anim
	pData[playerid][pLoopAnim] = 0;
	//Rob
	pData[playerid][pLastChop] = 0;
	//camp
	CampfirePlaced[playerid] = INVALID_OBJECT_ID;
	CampPlaced[playerid] = INVALID_OBJECT_ID;
	//journey
	JourneyInterior[playerid] = 0;
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pForklifterLoadStatus] = 0;
	pData[playerid][pForklifterUnLoadStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pRobStatus] = 0;
	pData[playerid][pTikettol] = 0;
	
	pData[playerid][pMelamar] = 0;
	
	ResetVariables(playerid);
	RemoveMappingGreenland(playerid);
	CreatePlayerTextDraws(playerid);

	/*LagiKerja[playerid] = false;
	Kurir[playerid] = false;
	angkatBox[playerid] = false;*/

	SetPlayerMapIcon(playerid, 12, 1001.29,-1356.507,12.992, 51 , 0, MAPICON_LOCAL); // ICON TRUCKER
	
	GetPlayerName(playerid, pData[playerid][pUCP], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	pData[playerid][pID] = playerid;
	InterpolateCameraPos(playerid, -1998.9644,1051.5966,139.4728, -1998.9644,1051.5966,139.4728, 3000);
	InterpolateCameraLookAt(playerid, -1998.9644,1051.5966,139.4728, -1998.9644,1051.5966,139.4728, 3000);
	
	if (SvGetVersion(playerid) == SV_NULL)
    {
        new Name1[MAX_PLAYER_NAME], lstr[512];
        new rand = RandomEx(1, 50);
    	GetPlayerName(playerid, Name1, sizeof(Name1));
		format(lstr, sizeof(lstr), "{FFFFFF}Dari: Penjaga Pintu {FF0000}Asia Pride #%d\n{FFFFFF}Kepada: Aktor ({FF0000}%s{FFFFFF}) Pemeran di Server Kami\n\nUntuk bermain peran di Server Asia Pride, maka Anda harus memenuhi salah satu syarat yaitu memasang Plugins Voice.\n{FF0000}AsiaPride Comeback", rand, Name1);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{FFFFFF}AsiaPride Roleplay - {FF0000}Plugins Voice Tidak Terdeteksi", lstr, "Keluar", "");
		SendClientMessage(playerid, -1, "{FF0000}[i] {FFFFFF}Anda telah ditendang dari server karena {FF0000}Plugin Voice {FFFFFF}tidak terdeteksi!");
        return KickEx(playerid);
    }
    
    /*foreach(new ii : Player)
	{
		if(pData[ii][pUCP] == pData[playerid][pUCP])
		{
			Info(playerid, "UCP mu terdeteksi sudah login!");
			KickEx(playerid);
		}
	}*/
	
	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	
	//dualucp
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	//Prose Load Data
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `playerucp` WHERE `ucp` = '%e' LIMIT 1", pData[playerid][pUCP]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);
		
		//new str[1000];
		//format(str, sizeof(str), "ID (%d)", playerid);
		//playerID[playerid] = Create3DTextLabel(str, 0xFFFFFFFF,0,0,0,10,0);
		//Attach3DTextLabelToPlayer(playerID[playerid], playerid,0.0,0.0,0.1);

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 8.000000, 5930683, 100, 0);
	
	//HBE textdraw Simple
	pData[playerid][spdamagebar] = CreatePlayerProgressBar(playerid, 385.000000, 419.000000, 41.000000, 7.500000, -16776961, 1000.0, 0);
	pData[playerid][spfuelbar] = CreatePlayerProgressBar(playerid, 385.000000, 435.000000, 41.000000, 7.500000, -16776961, 1000.0, 0);
                
	pData[playerid][sphungrybar] = CreatePlayerProgressBar(playerid, 530.000000, 401.000000, 64.000000, 9.500000, 852308735, 100.0, 0);
	pData[playerid][spenergybar] = CreatePlayerProgressBar(playerid, 530.000000, 425.000000, 64.000000, 9.500000, 1687547391, 100.0, 0);
	
	pData[playerid][pInjuredLabel] = CreateDynamic3DTextLabel("", COLOR_ORANGE, 0.0, 0.0, -0.3, 10, .attachedplayer = playerid, .testlos = 1);

    if(pData[playerid][pHead] < 0) return pData[playerid][pHead] = 20;

    if(pData[playerid][pPerut] < 0) return pData[playerid][pPerut] = 20;

    if(pData[playerid][pRFoot] < 0) return pData[playerid][pRFoot] = 20;

    if(pData[playerid][pLFoot] < 0) return pData[playerid][pLFoot] = 20;

    if(pData[playerid][pLHand] < 0) return pData[playerid][pLHand] = 20;
   
    if(pData[playerid][pRHand] < 0) return pData[playerid][pRHand] = 20;
	//PlayAudioStreamForPlayer(playerid, "http://www.soi-rp.com/music/songs/LP-A_Light.mp3");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	pemainic--;

	//voice
	if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }

	SetPlayerName(playerid, pData[playerid][pUCP]);
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pForklifterLoadStatus] = 0;
	pData[playerid][pForklifterUnLoadStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pRobStatus] = 0;
	
	pData[playerid][pSpaTime] = gettime() + 500;
	
	TogglePhone[playerid] = 0;
	ToggleSid[playerid] = 0;
	ToggleCall[playerid] = 0;
	DetikCall[playerid] = 0;
	MenitCall[playerid] = 0;
	JamCall[playerid] = 0;
	
	DestroyDynamic3DTextLabel(pData[playerid][pInjuredLabel]);
	/*LagiKerja[playerid] = false;
	Kurir[playerid] = false;*/
	pData[playerid][pDriveLicApp] = 0;
	pData[playerid][pSpawnList] = 0;
	takingselfie[playerid] = 0;
	//KillTimer(Unload_Timer[playerid]);

	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }
	
	for(new i; i <= 9; i++)
	{
		if(MyBaggage[playerid][i] == true)
		{
		    MyBaggage[playerid][i] = false;
		    DialogBaggage[i] = false;
			if(IsValidVehicle(pData[playerid][pTrailerBaggage]))
		    	DestroyVehicle(pData[playerid][pTrailerBaggage]);  //jika player disconnect maka trailer akan kembali seperti awal
		}
    }
	//UpdateWeapons(playerid);
	g_MysqlRaceCheck[playerid]++;
	
	if(CampfirePlaced[playerid] != INVALID_OBJECT_ID) DestroyDynamicObject(CampfirePlaced[playerid]);
	if(CampPlaced[playerid] != INVALID_OBJECT_ID) DestroyDynamicObject(CampPlaced[playerid]);
	
	if(pData[playerid][IsLoggedIn] == true)
	{
		if(IsAtEvent[playerid] == 0)
		{
			UpdatePlayerData(playerid);
		}
		RemovePlayerVehicle(playerid);
		Report_Clear(playerid);
		Ask_Clear(playerid);
		Player_ResetMining(playerid);
		Player_ResetCutting(playerid);
		Player_RemoveLumber(playerid);
		Player_ResetHarvest(playerid);
		KillTazerTimer(playerid);
		if(IsValidVehicle(pData[playerid][pTrailer]))
			DestroyVehicle(pData[playerid][pTrailer]);

		pData[playerid][pTrailer] = INVALID_VEHICLE_ID;
		if(IsAtEvent[playerid] == 1)
		{
			if(GetPlayerTeam(playerid) == 1)
			{
				if(EventStarted == 1)
				{
					RedTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 2)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 1)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							RedTeam = 0;
						}
					}
				}
			}
			if(GetPlayerTeam(playerid) == 2)
			{
				if(EventStarted == 1)
				{
					BlueTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 1)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 2)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
					}
				}
			}
			SetPlayerTeam(playerid, 0);
			IsAtEvent[playerid] = 0;
			pData[playerid][pInjured] = 0;
			pData[playerid][pSpawned] = 1;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
		}
		if(pData[playerid][pRobLeader] == 1)
		{
			foreach(new ii : Player) 
			{
				if(pData[ii][pMemberRob] > 1)
				{
					Servers(ii, "* Pemimpin Perampokan anda telah keluar! [ MISI GAGAL ]");
					pData[ii][pMemberRob] = 0;
					RobMember = 0;
					pData[ii][pRobLeader] = 0;
					ServerMoney += robmoney;
				}
			}
		}
		if(pData[playerid][pMemberRob] == 1)
		{
			pData[playerid][pMemberRob] = 0;
			foreach(new ii : Player) 
			{
				if(pData[ii][pRobLeader] > 1)
				{
					Servers(ii, "* Member berkurang 1");
					pData[ii][pMemberRob] -= 1;
					RobMember -= 1;
				}
			}
		}
	}
	
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

    if(IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);
    
    if(pData[playerid][pMaskOn] == 1)
            DestroyDynamic3DTextLabel(pData[playerid][pMaskLabel]);
            
    if(pData[playerid][pAdminDuty] == 1)
            DestroyDynamic3DTextLabel(pData[playerid][pAdminLabel]);
            
    if(ToggleSid[playerid] == 1)
            DestroyDynamic3DTextLabel(pData[playerid][pSidLabel]);

    pData[playerid][pAdoActive] = false;
	
	/*if(cache_is_valid(pData[playerid][Cache_ID]) && pData[playerid][IsLoggedIn] == false)
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}*/

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	
	foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(FC/Crash/Timeout)", pData[playerid][pName]);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(Disconnected)", pData[playerid][pName]);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]:"YELLOW_E" %s disconnected from the server.{7fffd4}(Kick/Banned)", pData[playerid][pName]);
				}
			}
		}
	}
	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/ Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kicked/ Banned";
	}
	
	KillTimer(TwtTimer[playerid]);
	
	KillTimer(FbTimer[playerid]);
	
	KillTimer(RmTimer[playerid]);
	
	KillTimer(RkTimer[playerid]);
	
	KillTimer(AuTimer[playerid]);
	
	KillTimer(SkTimer[playerid]);
	
	foreach(new i: PVehicles)
	{
		Vehicle_StorageSave(i);
	}
	return 1;
}

function pilihanspawn(playerid)
{
    for(new i = 0; i < 8; i++)
	{
		TextDrawShowForPlayer(playerid, Mewing[i]);
	}
	TextDrawShowForPlayer(playerid, Tanah);
	TextDrawShowForPlayer(playerid, Terminal);
	TextDrawShowForPlayer(playerid, Pasar);
	TextDrawShowForPlayer(playerid, Lokasi);
	TextDrawShowForPlayer(playerid, Spawn);
	SelectTextDraw(playerid, COLOR_BLUE);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SendClientMessage(playerid, COLOR_RED, "{ffffff}Welcome to {ffff00}Asia Pride roleplay - Voice Only");
	SendClientMessage(playerid, COLOR_RED, "{ffffff}Selalu Mengikuti Peraturan Asia Pride Roleplay.");
	SendClientMessage(playerid, COLOR_RED, "{ffffff}Happy Roleplay di Asia Pride Roleplay #TempatKitaBercerita.");
	SendClientMessage(playerid, COLOR_RED, "{ffffff}`/help` untuk mengetahui cmd, {ffff00}`/ask` {ffffff}Dan {ffff00}`/report` {ffffff}untuk bertanya dan melaporkan sesuatu.");
	Servers(playerid, "{ffff00}\"/claimsp\" {ffffff}untuk mengambil hadiah pertama kali untuk warga baru");
	//SetSpawnInfo(playerid, 0, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	//SpawnPlayer(playerid);
	//LagiKerja[playerid] = false;
	//Kurir[playerid] = false;
	new string[256];
	format(string, sizeof(string), "%d", playerid);
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);
	
	for(new i = 0; i < 16; i++)
	{
		TextDrawHideForPlayer(playerid, HBEBARUV1[i]);
	}
	
	PlayerTextDrawShow(playerid, VoiceTD[playerid][0]);
	PlayerTextDrawShow(playerid, VoiceTD[playerid][1]);
	
	PlayerTextDrawShow(playerid, TDNAMEKOTA[playerid]);
	PlayerTextDrawShow(playerid, TDVERKOTA[playerid]);
	
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);

	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 2823.21,-2440.34,12.08);
			SetPlayerCameraPos(playerid,1058.544433, -1086.021362, 41);
			SetPlayerCameraLookAt(playerid,1055.534057, -1082.029296, 39.802570);
			SetPlayerVirtualWorld(playerid, 0);
			for(new i = 0; i < 8; i++)
			{
				TextDrawHideForPlayer(playerid, Mewing[i]);
			}
			TextDrawHideForPlayer(playerid, Tanah);
			TextDrawHideForPlayer(playerid, Terminal);
			TextDrawHideForPlayer(playerid, Pasar);
			TextDrawHideForPlayer(playerid, Lokasi);
			TextDrawHideForPlayer(playerid, Spawn);
			CancelSelectTextDraw(playerid);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir\n(Tgl/Bulan/Tahun)\nMisal : 15/04/1998", "Enter", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			/*new Float:lapar, Float:haus;

			lapar = pData[playerid][pHunger] * 60.0/100;
		    PlayerTextDrawTextSize(playerid,StatsTD[playerid][7], lapar, 12.5);
		    PlayerTextDrawShow(playerid,StatsTD[playerid][7]);

		    haus = pData[playerid][pEnergy] * 60.0/100;
		    PlayerTextDrawTextSize(playerid,StatsTD[playerid][2], haus, 12.5);
		    PlayerTextDrawShow(playerid,StatsTD[playerid][2]);*/

		//	CheckPlayerSpawn3Titik(playerid);
	/*		if(pData[playerid][pHBEMode] == 1) //modern
			{
				RefreshPSkin(playerid);
			//	ShowPlayerProgressBar(playerid, pData[playerid][sphungrybar]);
			//	ShowPlayerProgressBar(playerid, pData[playerid][spenergybar]);
				for(new txd; txd < 19; txd++)
				{
				//	TextDrawShowForPlayer(playerid, StatsTD[txd]);
					PlayerTextDrawShow(playerid, StatsTD[playerid][txd]);
				}
			}
			else
			{
				
			}*/

			SpawnAwal(playerid);
	//		CheckPlayerSpawn3Titik(playerid);
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 5, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pInjured] == 1)
	{
		for(new i = 0; i < 8; i++)
		{
			TextDrawHideForPlayer(playerid, Mewing[i]);
		}
		TextDrawHideForPlayer(playerid, Tanah);
		TextDrawHideForPlayer(playerid, Terminal);
		TextDrawHideForPlayer(playerid, Pasar);
		TextDrawHideForPlayer(playerid, Lokasi);
		TextDrawHideForPlayer(playerid, Spawn);
		CancelSelectTextDraw(playerid);
		return 1;
	}
	if(pData[playerid][pJail] > 0)
	{
		for(new i = 0; i < 8; i++)
		{
			TextDrawHideForPlayer(playerid, Mewing[i]);
		}
		TextDrawHideForPlayer(playerid, Tanah);
		TextDrawHideForPlayer(playerid, Terminal);
		TextDrawHideForPlayer(playerid, Pasar);
		TextDrawHideForPlayer(playerid, Lokasi);
		TextDrawHideForPlayer(playerid, Spawn);
		CancelSelectTextDraw(playerid);
		JailPlayer(playerid);
		return 1;
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		for(new i = 0; i < 8; i++)
		{
			TextDrawHideForPlayer(playerid, Mewing[i]);
		}
		TextDrawHideForPlayer(playerid, Tanah);
		TextDrawHideForPlayer(playerid, Terminal);
		TextDrawHideForPlayer(playerid, Pasar);
		TextDrawHideForPlayer(playerid, Lokasi);
		TextDrawHideForPlayer(playerid, Spawn);
		CancelSelectTextDraw(playerid);
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
		return 1;
	}
	if(pData[playerid][pSpaTime] >= gettime())
	{
	    return 1;
	}
    else
	{
		for(new i = 0; i < 8; i++)
		{
			TextDrawShowForPlayer(playerid, Mewing[i]);
		}
		TextDrawShowForPlayer(playerid, Tanah);
		TextDrawShowForPlayer(playerid, Terminal);
		TextDrawShowForPlayer(playerid, Pasar);
		TextDrawShowForPlayer(playerid, Lokasi);
		TextDrawShowForPlayer(playerid, Spawn);
		SelectTextDraw(playerid, COLOR_LBLUE);
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    SetPlayerCameraPos(playerid, -1998.9644,1051.5966,139.4728);
	SetPlayerCameraLookAt(playerid, -1998.9644,1051.5966,139.4728);
	InterpolateCameraPos(playerid, -1998.9644,1051.5966,139.4728, -1998.9644,1051.5966,139.4728, 3000);
	InterpolateCameraLookAt(playerid, -1998.9644,1051.5966,139.4728, -1998.9644,1051.5966,139.4728, 3000);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	Info(playerid, "{ff0000}Jangan di pencet spawn bang!!!");
	KickEx(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);
	
	pData[playerid][CarryProduct] = 0;
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pForklifterLoadStatus] = 0;
	pData[playerid][pForklifterUnLoadStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pRobStatus] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pTaxiDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
    if(IsAtEvent[playerid] == 1)
    {
    	SetPlayerPos(playerid, 1474.65, -1736.36, 13.38);
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerInterior(playerid, 0);
    	ClearAnimations(playerid);
    	ResetPlayerWeaponsEx(playerid);
       	SetPlayerColor(playerid, COLOR_WHITE);
    	if(GetPlayerTeam(playerid) == 1)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		RedTeam -= 1;
    	}
    	else if(GetPlayerTeam(playerid) == 2)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		BlueTeam -= 1;
    	}
    	if(BlueTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 1)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 2)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    		}
    	}
    	if(RedTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 2)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 1)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				RedTeam = 0;
    			}
    		}
    	}
    	SetPlayerTeam(playerid, 0);
    	IsAtEvent[playerid] = 0;
    	pData[playerid][pInjured] = 0;
    	pData[playerid][pSpawned] = 1;
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
    }
    if(IsAtEvent[playerid] == 0)
    {
    	new asakit = RandomEx(0, 5);
    	new bsakit = RandomEx(0, 9);
    	new csakit = RandomEx(0, 7);
    	new dsakit = RandomEx(0, 6);
    	pData[playerid][pLFoot] -= dsakit;
    	pData[playerid][pLHand] -= bsakit;
    	pData[playerid][pRFoot] -= csakit;
    	pData[playerid][pRHand] -= dsakit;
    	pData[playerid][pHead] -= asakit;
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];
 
            GetWeaponName(weaponid, weaponname, sizeof(weaponname));
           
            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;
 
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
 
            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);
           
            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			InfoTD_MSG(playerid, 4000, "~g~~h~Toy Position Updated~y~!");

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			InfoTD_MSG(playerid, 4000, "~r~~h~Selection Cancelled~y~!");

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(pData[playerid][EditingTreeID] != -1 && Iter_Contains(Trees, pData[playerid][EditingTreeID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        TreeData[etid][treeX] = x;
	        TreeData[etid][treeY] = y;
	        TreeData[etid][treeZ] = z;
	        TreeData[etid][treeRX] = rx;
	        TreeData[etid][treeRY] = ry;
	        TreeData[etid][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_X, TreeData[etid][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Y, TreeData[etid][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Z, TreeData[etid][treeZ] + 1.5);

		    Tree_Save(etid);
	        pData[playerid][EditingTreeID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
	        pData[playerid][EditingTreeID] = -1;
	    }
	}
	if(pData[playerid][EditingOreID] != -1 && Iter_Contains(Ores, pData[playerid][EditingOreID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        OreData[etid][oreX] = x;
	        OreData[etid][oreY] = y;
	        OreData[etid][oreZ] = z;
	        OreData[etid][oreRX] = rx;
	        OreData[etid][oreRY] = ry;
	        OreData[etid][oreRZ] = rz;

	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_X, OreData[etid][oreX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Y, OreData[etid][oreY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Z, OreData[etid][oreZ] + 1.5);

		    Ore_Save(etid);
	        pData[playerid][EditingOreID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);
	        pData[playerid][EditingOreID] = -1;
	    }
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][EditingVending] != -1 && Iter_Contains(Vendings, pData[playerid][EditingVending]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new venid = pData[playerid][EditingVending];
	        VendingData[venid][vendingX] = x;
	        VendingData[venid][vendingY] = y;
	        VendingData[venid][vendingZ] = z;
	        VendingData[venid][vendingRX] = rx;
	        VendingData[venid][vendingRY] = ry;
	        VendingData[venid][vendingRZ] = rz;

	        SetDynamicObjectPos(objectid, VendingData[venid][vendingX], VendingData[venid][vendingY], VendingData[venid][vendingZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][vendingRX], VendingData[venid][vendingRY], VendingData[venid][vendingRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_X, VendingData[venid][vendingX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_Y, VendingData[venid][vendingY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][vendingText], E_STREAMER_Z, VendingData[venid][vendingZ] + 0.3);

		    Vending_Save(venid);
	        pData[playerid][EditingVending] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new venid = pData[playerid][EditingVending];
	        SetDynamicObjectPos(objectid, VendingData[venid][vendingX], VendingData[venid][vendingY], VendingData[venid][vendingZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][vendingRX], VendingData[venid][vendingRY], VendingData[venid][vendingRZ]);
	    	pData[playerid][EditingVending] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	if(checkpointid == ShowRoomCP)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "{7fffd4}Asia Pride Showroom", "Motorcycle\nMobil\nKendaraan Unik\nKendaraan Job", "Select", "Cancel");
	}
	if(checkpointid == keluarshamal)
	{
		SetPlayerPos(playerid, 444.974182, -1796.701171, 8.028781);
		SetPlayerFacingAngle(playerid, 89.7671);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		ClearAnimations(playerid);
		Info(playerid, "Selamat datang dikota Asia Pride Roleplay, gunakan /claimsp untuk mengambil hadiah, gunakan /fixvisu jika bug visual.");
	}
	if(checkpointid == ShowRoomCPRent)
	{
		ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARS, DIALOG_STYLE_LIST, "{7fffd4}Penjualan Barang", "Susu\nComponent\nAyam\nIkan", "Select", "Cancel");
	}
	if(checkpointid == ShowRoomSusu)
	{
		ShowPlayerDialog(playerid, DIALOG_LOCKERPEMERAH, DIALOG_STYLE_LIST, "{ffffff}Duty Pemeras", "Onduty\nOffduty", "Select", "Cancel");
	}
	if(checkpointid == ShowRoomTambang)
	{
		ShowPlayerDialog(playerid, DIALOG_LOCKERTAMBANG, DIALOG_STYLE_LIST, "{ffffff}Duty Tambang", "Onduty\nOffduty", "Select", "Cancel");
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	switch(pData[playerid][pCheckPoint])
	{
		case CHECKPOINT_BAGGAGE:
		{
			if(pData[playerid][pBaggage] > 0)
			{
				if(pData[playerid][pBaggage] == 1)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 2;
					SetPlayerRaceCheckpoint(playerid, 1, 1524.4792, -2435.2844, 13.2118, 1524.4792, -2435.2844, 13.2118, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 2)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 3;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2087.7998, -2392.8328, 13.2083, 2087.7998, -2392.8328, 13.2083, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 2087.7998, -2392.8328, 13.2083, 179.9115, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 3)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 4;
					SetPlayerRaceCheckpoint(playerid, 1, 1605.2043, -2435.4360, 13.2153, 1605.2043, -2435.4360, 13.2153, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 4)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 5;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2006.6425, -2340.5103, 13.2045, 2006.6425, -2340.5103, 13.2045, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 2006.6425, -2340.5103, 13.2045, 90.0068, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 5)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 6;
					SetPlayerRaceCheckpoint(playerid, 1, 1684.9463, -2435.2239, 13.2137, 1684.9463, -2435.2239, 13.2137, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 6)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 7;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2006.4136, -2273.7458, 13.2012, 2006.4136, -2273.7458, 13.2012, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 2006.4136, -2273.7458, 13.2012, 92.4049, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 7)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 8;
					SetPlayerRaceCheckpoint(playerid, 1, 1765.8700, -2435.1189, 13.2090, 1765.8700, -2435.1189, 13.2090, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 8)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 9;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2056.9043, -2392.0959, 13.2038, 2056.9043, -2392.0959, 13.2038, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 2056.9043, -2392.0959, 13.2038, 179.4666, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 9)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 10;
					SetPlayerRaceCheckpoint(playerid, 1, 1524.1018, -2435.0664, 13.2139, 1524.1018, -2435.0664, 13.2139, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 10)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 11;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint terakhir di GPSmu, Untuk mendapatkan gajimu!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2099.8982, -2200.7234, 13.2042, 2099.8982, -2200.7234, 13.2042, 5.0);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 11)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					DisablePlayerRaceCheckpoint(playerid);
					pData[playerid][pBaggage] = 0;
					pData[playerid][pJobTime] += 1380;
					pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
					DialogBaggage[0] = false;
					MyBaggage[playerid][0] = false;
					AddPlayerSalary(playerid, "Job(Baggage)", 400);
					InfoMsg(playerid, "Job(Baggage) telah masuk ke pending salary anda!");
					RemovePlayerFromVehicle(playerid);
					SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					return 1;
				}
				//RUTE BAGGGAGE 2
				else if(pData[playerid][pBaggage] == 12)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 13;
					SetPlayerRaceCheckpoint(playerid, 1, 1891.7626, -2638.8113, 13.2074, 1891.7626, -2638.8113, 13.2074, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 13)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 14;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2007.5886, -2406.7236, 13.2065, 2007.5886, -2406.7236, 13.2065, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 2007.5886, -2406.7236, 13.2065, 85.9836, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 14)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 15;
					SetPlayerRaceCheckpoint(playerid, 1, 1822.6267, -2637.9224, 13.2049, 1822.6267, -2637.9224, 13.2049, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 15)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 16;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2007.2054, -2358.0920, 13.2030, 2007.2054, -2358.0920, 13.2030, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 2007.2054, -2358.0920, 13.2030, 89.7154, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 16)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 17;
					SetPlayerRaceCheckpoint(playerid, 1, 1617.9980, -2638.5725, 13.2034, 1617.9980, -2638.5725, 13.2034, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 17)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 18;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 1874.9221, -2348.8616, 13.2039, 1874.9221, -2348.8616, 13.2039, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 1874.9221, -2348.8616, 13.2039, 274.8172, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 18)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 19;
					SetPlayerRaceCheckpoint(playerid, 1, 1681.0703, -2638.5410, 13.2045, 1681.0703, -2638.5410, 13.2045, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 19)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 20;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 1424.8074, -2415.5378, 13.2094, 1424.8074, -2415.5378, 13.2094, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 1424.8074, -2415.5378, 13.2094, 268.7459, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 20)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 21;
					SetPlayerRaceCheckpoint(playerid, 1, 1755.4872, -2639.1306, 13.2014, 1755.4872, -2639.1306, 13.2014, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 21)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 22;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint terakhir di GPSmu, Untuk mendapatkan gajimu!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2110.0212, -2211.1377, 13.2008, 2110.0212, -2211.1377, 13.2008, 5.0);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 22)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					DisablePlayerRaceCheckpoint(playerid);
					pData[playerid][pBaggage] = 0;
					pData[playerid][pJobTime] += 1380;
					pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
					DialogBaggage[1] = false;
					MyBaggage[playerid][1] = false;
					AddPlayerSalary(playerid, "Job(Baggage)", 400);
					InfoMsg(playerid, "Job(Baggage) telah masuk ke pending salary anda!");
					RemovePlayerFromVehicle(playerid);
					SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					return 1;
				}
				//RUTE BAGGAGE 3
				else if(pData[playerid][pBaggage] == 23)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 24;
					SetPlayerRaceCheckpoint(playerid, 1, 1509.5022, -2431.4277, 13.2163, 1509.5022, -2431.4277, 13.2163, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 24)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 25;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 1913.4680, -2678.1877, 13.2135, 1913.4680, -2678.1877, 13.2135, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 1913.4680, -2678.1877, 13.2135, 358.3546, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 25)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 26;
					SetPlayerRaceCheckpoint(playerid, 1, 1591.0934, -2432.3208, 13.2094, 1591.0934, -2432.3208, 13.2094, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 26)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 27;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 1593.1262, -2685.6423, 13.2016, 1593.1262, -2685.6423, 13.2016, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 1593.1262, -2685.6423, 13.2016, 359.1027, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 27)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 28;
					SetPlayerRaceCheckpoint(playerid, 1, 1751.1523, -2432.6274, 13.2132, 1751.1523, -2432.6274, 13.2132, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 28)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 29;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 1706.6799, -2686.6472, 13.2031, 1706.6799, -2686.6472, 13.2031, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(607, 1706.6799, -2686.6472, 13.2031, 358.5210, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 29)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 30;
					SetPlayerRaceCheckpoint(playerid, 1, 1892.2029, -2344.9568, 13.2069, 1892.2029, -2344.9568, 13.2069, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 30)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 31;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint selanjutnya di GPSmu, Untuk mengambil muatan!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2160.3184, -2390.0625, 13.2055, 2160.3184, -2390.0625, 13.2055, 5.0);
						pData[playerid][pTrailerBaggage] = CreateVehicle(606, 2160.3184, -2390.0625, 13.2055, 157.5291, 1, 1, -1);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 31)
				{
					DisablePlayerRaceCheckpoint(playerid);
					SendClientMessage(playerid, COLOR_LBLUE,"[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mengirim muatan!.");
					pData[playerid][pBaggage] = 32;
					SetPlayerRaceCheckpoint(playerid, 1, 1891.8900, -2261.1121, 13.2071, 1891.8900, -2261.1121, 13.2071, 5.0);
					return 1;
				}
				else if(pData[playerid][pBaggage] == 32)
				{
					if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBaggage] = 33;
						DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
						SendClientMessage(playerid, COLOR_LBLUE, "[BAGGAGE]: {FFFFFF}Pergi ke checkpoint di GPSmu, Untuk mendapatkan gajimu!.");
						SetPlayerRaceCheckpoint(playerid, 1, 2087.1458, -2192.2161, 13.2047, 2087.1458, -2192.2161, 13.2047, 5.0);
						return 1;
					}
				}
				else if(pData[playerid][pBaggage] == 33)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					DisablePlayerRaceCheckpoint(playerid);
					pData[playerid][pBaggage] = 0;
					pData[playerid][pJobTime] += 1380;
					pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
					DialogBaggage[2] = false;
					MyBaggage[playerid][2] = false;
					AddPlayerSalary(playerid, "Job(Baggage)", 400);
					InfoMsg(playerid, "Job(Baggage) telah masuk ke pending salary anda!");
					RemovePlayerFromVehicle(playerid);
					SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					return 1;
				}	
			}
		}
		case CHECKPOINT_DRIVELIC:
		{
			if(pData[playerid][pDriveLicApp] > 0)
			{
				if(pData[playerid][pDriveLicApp] == 1)
				{
					pData[playerid][pDriveLicApp] = 2;
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint2, dmvpoint2, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 2)
				{
					pData[playerid][pDriveLicApp] = 3;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint3, dmvpoint3, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 3)
				{
					pData[playerid][pDriveLicApp] = 4;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint4, dmvpoint4, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 4)
				{
					pData[playerid][pDriveLicApp] = 5;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint5, dmvpoint5, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 5)
				{
					pData[playerid][pDriveLicApp] = 6;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint6, dmvpoint6, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 6)
				{
					pData[playerid][pDriveLicApp] = 7;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint7, dmvpoint7, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 7)
				{
					pData[playerid][pDriveLicApp] = 8;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint8, dmvpoint8, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 8)
				{
					pData[playerid][pDriveLicApp] = 9;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint9, dmvpoint9, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 9)
				{
					pData[playerid][pDriveLicApp] = 10;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint10, dmvpoint10, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 10)
				{
					pData[playerid][pDriveLicApp] = 11;
					DisablePlayerRaceCheckpoint(playerid);
					SetPlayerRaceCheckpoint(playerid, 1, dmvpoint11, dmvpoint11, 5.0);
					return 1;
				}
				else if(pData[playerid][pDriveLicApp] == 11)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					pData[playerid][pDriveLicApp] = 0;
					pData[playerid][pDriveLic] = 1;
					pData[playerid][pDriveLicTime] = gettime() + (30 * 86400);
					pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
					DisablePlayerRaceCheckpoint(playerid);
					GivePlayerMoneyEx(playerid, -700);
					Server_AddMoney(700);
					Info(playerid, "Selamat kamu telah berhasil membuat SIM");
					RemovePlayerFromVehicle(playerid);
					SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					return 1;
				}
				
			}
		}
		case CHECKPOINT_BUS:
		{
			if(pData[playerid][pSideJob] == 2)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 431)
				{
					if(pData[playerid][pBus] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint2, buspoint2, 5.0);
					}
					else if(pData[playerid][pBus] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint3, buspoint3, 5.0);
					}
					else if(pData[playerid][pBus] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint4, buspoint4, 5.0);
					}
					else if(pData[playerid][pBus] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint5, buspoint5, 5.0);
					}
					else if(pData[playerid][pBus] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint6, buspoint6, 5.0);
					}
					else if(pData[playerid][pBus] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint7, buspoint7, 5.0);
					}
					else if(pData[playerid][pBus] == 7)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 8;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint8, buspoint8, 5.0);
					}
					else if(pData[playerid][pBus] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint9, buspoint9, 5.0);
					}
					else if(pData[playerid][pBus] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint10, buspoint10, 5.0);
					}
					else if(pData[playerid][pBus] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint11, buspoint11, 5.0);
					}
					else if(pData[playerid][pBus] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 12;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint12, buspoint12, 5.0);
					}
					else if(pData[playerid][pBus] == 12)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 13;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint13, buspoint13, 5.0);
					}
					else if(pData[playerid][pBus] == 13)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 14;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint14, buspoint14, 5.0);
					}
					else if(pData[playerid][pBus] == 14)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 15;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint15, buspoint15, 5.0);
					}
					else if(pData[playerid][pBus] == 15)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 16;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint16, buspoint16, 5.0);
					}
					else if(pData[playerid][pBus] == 16)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 17;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint17, buspoint17, 5.0);
					}
					else if(pData[playerid][pBus] == 17)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 18;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint18, buspoint18, 5.0);
					}
					else if(pData[playerid][pBus] == 18)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 19;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint19, buspoint19, 5.0);
					}
					else if(pData[playerid][pBus] == 19)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 20;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint20, buspoint20, 5.0);
					}
					else if(pData[playerid][pBus] == 20)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 21;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint21, buspoint21, 5.0);
					}
					else if(pData[playerid][pBus] == 21)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 22;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint22, buspoint22, 5.0);
					}
					else if(pData[playerid][pBus] == 22)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 23;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint23, buspoint23, 5.0);
					}
					else if(pData[playerid][pBus] == 23)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 24;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint24, buspoint24, 5.0);
					}
					else if(pData[playerid][pBus] == 24)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 25;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint25, buspoint25, 5.0);
					}
					else if(pData[playerid][pBus] == 25)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 26;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint26, buspoint26, 5.0);
					}
					else if(pData[playerid][pBus] == 26)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 27;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint27, buspoint27, 5.0);
					}
					else if(pData[playerid][pBus] == 27)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pBusTime] = 360;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						GivePlayerMoneyEx(playerid, 300000);
						InfoMsg(playerid, "kamu mendapatkan uang sebesar Rp.300.000!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					}
					else if(pData[playerid][pBus] == 28)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 29;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus3, cpbus3, 5.0);
					}
					else if(pData[playerid][pBus] == 29)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 30;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus4, cpbus4, 5.0);
					}
					else if(pData[playerid][pBus] == 30)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 31;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus5, cpbus5, 5.0);
					}
					else if(pData[playerid][pBus] == 31)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 32;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus6, cpbus6, 5.0);
					}
					else if(pData[playerid][pBus] == 32)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 33;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus7, cpbus7, 5.0);
					}
					else if(pData[playerid][pBus] == 33)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 34;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus8, cpbus8, 5.0);
					}
					else if(pData[playerid][pBus] == 34)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 35;
						SetPlayerRaceCheckpoint(playerid, 1, cpbus9, cpbus9, 5.0);
					}
					else if(pData[playerid][pBus] == 35)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pBusTime] = 400;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						GivePlayerMoneyEx(playerid, 300000);
						InfoMsg(playerid, "kamu mendapatkan uang sebesar Rp.300.000!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					}
				}
			}
		}
		case CHECKPOINT_SWEEPER:
		{
			if(pData[playerid][pSideJob] == 1)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 574)
				{
					if(pData[playerid][pSweeper] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint2, sweperpoint2, 5.0);
					}
					else if(pData[playerid][pSweeper] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint3, sweperpoint3, 5.0);
					}
					else if(pData[playerid][pSweeper] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint4, sweperpoint4, 5.0);
					}
					else if(pData[playerid][pSweeper] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint5, sweperpoint5, 5.0);
					}
					else if(pData[playerid][pSweeper] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint6, sweperpoint6, 5.0);
					}
					else if(pData[playerid][pSweeper] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint7, sweperpoint7, 5.0);
					}
					else if(pData[playerid][pSweeper] == 7)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 8;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint8, sweperpoint8, 5.0);
					}
					else if(pData[playerid][pSweeper] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint9, sweperpoint9, 5.0);
					}
					else if(pData[playerid][pSweeper] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint10, sweperpoint10, 5.0);
					}
					else if(pData[playerid][pSweeper] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, sweperpoint11, sweperpoint11, 5.0);
					}
					else if(pData[playerid][pSweeper] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 12;
						SetPlayerRaceCheckpoint(playerid, 1, sweperpoint12, sweperpoint12, 5.0);
					}
					else if(pData[playerid][pSweeper] == 12)
					{
						pData[playerid][pSweeper] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pSweeperTime] = 90;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						AddPlayerSalary(playerid, "Sidejob(Sweeper)", 100);
						InfoMsg(playerid, "Sidejob(Sweeper) telah masuk ke pending salary anda!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					}
					else if(pData[playerid][pSweeper] == 13)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 14;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep3, cpswep3, 5.0);
					}
					else if(pData[playerid][pSweeper] == 14)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 15;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep4, cpswep4, 5.0);
					}
					else if(pData[playerid][pSweeper] == 15)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 16;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep5, cpswep5, 5.0);
					}
					else if(pData[playerid][pSweeper] == 16)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 17;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep6, cpswep6, 5.0);
					}
					else if(pData[playerid][pSweeper] == 17)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 18;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep7, cpswep7, 5.0);
					}
					else if(pData[playerid][pSweeper] == 18)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 19;
						SetPlayerRaceCheckpoint(playerid, 2, cpswep8, cpswep8, 5.0);
					}
					else if(pData[playerid][pSweeper] == 19)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pSweeper] = 20;
						SetPlayerRaceCheckpoint(playerid, 1, cpswep9, cpswep9, 5.0);
					}
					else if(pData[playerid][pSweeper] == 20)
					{
						pData[playerid][pSweeper] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pSweeperTime] = 110;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						AddPlayerSalary(playerid, "Sidejob(Sweeper)", 120);
						InfoMsg(playerid, "Sidejob(Sweeper) telah masuk ke pending salary anda!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					}
				}
			}
		}
		case CHECKPOINT_FORKLIFTER:
		{
			if(pData[playerid][pSideJob] == 3)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 530)
				{
					if(pData[playerid][pForklifter] == 1)
					{
						pData[playerid][pForklifter] = 2;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterLoadStatus] = 1;
						pData[playerid][pForklifterLoad] = SetTimerEx("ForklifterLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 2)
					{
						pData[playerid][pForklifter] = 3;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterUnLoadStatus] = 1;
						pData[playerid][pForklifterUnLoad] = SetTimerEx("ForklifterUnLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Unloaded...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 3)
					{
						pData[playerid][pForklifter] = 4;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterLoadStatus] = 1;
						pData[playerid][pForklifterLoad] = SetTimerEx("ForklifterLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 4)
					{
						pData[playerid][pForklifter] = 5;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterUnLoadStatus] = 1;
						pData[playerid][pForklifterUnLoad] = SetTimerEx("ForklifterUnLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Unloaded...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 5)
					{
						pData[playerid][pForklifter] = 6;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterLoadStatus] = 1;
						pData[playerid][pForklifterLoad] = SetTimerEx("ForklifterLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 6)
					{
						pData[playerid][pForklifter] = 7;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterUnLoadStatus] = 1;
						pData[playerid][pForklifterUnLoad] = SetTimerEx("ForklifterUnLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Unloaded...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 7)
					{
						pData[playerid][pForklifter] = 8;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterLoadStatus] = 1;
						pData[playerid][pForklifterLoad] = SetTimerEx("ForklifterLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 8)
					{
						pData[playerid][pForklifter] = 9;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterUnLoadStatus] = 1;
						pData[playerid][pForklifterUnLoad] = SetTimerEx("ForklifterUnLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Unloaded...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 9)
					{
						pData[playerid][pForklifter] = 10;
						TogglePlayerControllable(playerid, 0);
						pData[playerid][pForklifterLoadStatus] = 1;
						pData[playerid][pForklifterLoad] = SetTimerEx("ForklifterLoadBox", 1000, true, "i", playerid);
						PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading...");
						PlayerTextDrawShow(playerid, ActiveTD[playerid]);
						ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					}
					else if(pData[playerid][pForklifter] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pForklifter] = 11;
						DestroyDynamicObject(VehicleObject[vehicleid]);
						VehicleObject[vehicleid] = INVALID_OBJECT_ID;
						SetPlayerRaceCheckpoint(playerid, 1, forpoint3, forpoint3, 4.0);
					}
					else if(pData[playerid][pForklifter] == 11)
					{
						pData[playerid][pSideJob] = 0;
						pData[playerid][pForklifterTime] = 90;
						DisablePlayerRaceCheckpoint(playerid);
						AddPlayerSalary(playerid, "Sidejob(Forklift)", 440);
						InfoMsg(playerid, "Sidejob(Forklift) telah masuk ke pending salary anda!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
						return 1;
					}
				}
			}
		}
		case CHECKPOINT_MOWER:
		{
			if(pData[playerid][pSideJob] == 4)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 572)
				{
					if(pData[playerid][pMower] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint2, mowerpoint2, 5.0);
					}
					else if(pData[playerid][pMower] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint3, mowerpoint3, 5.0);
					}
					else if(pData[playerid][pMower] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint4, mowerpoint4, 5.0);
					}
					else if(pData[playerid][pMower] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint5, mowerpoint5, 5.0);
					}
					else if(pData[playerid][pMower] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint6, mowerpoint6, 5.0);
					}
					else if(pData[playerid][pMower] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint7, mowerpoint7, 5.0);
					}
					else if(pData[playerid][pMower] == 7)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 8;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint8, mowerpoint8, 5.0);
					}
					else if(pData[playerid][pMower] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint9, mowerpoint9, 5.0);
					}
					else if(pData[playerid][pMower] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint10, mowerpoint10, 5.0);
					}
					else if(pData[playerid][pMower] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint11, mowerpoint11, 5.0);
					}
					else if(pData[playerid][pMower] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pMower] = 12;
						SetPlayerRaceCheckpoint(playerid, 2, mowerpoint12, mowerpoint12, 5.0);
					}
					else if(pData[playerid][pMower] == 12)
					{
						pData[playerid][pSideJob] = 0;
						pData[playerid][pMower] = 0;
						pData[playerid][pMowerTime] += 100;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						AddPlayerSalary(playerid, "Sidejob(Mower)", 90);
						InfoMsg(playerid, "Sidejob(Mower) telah masuk ke pending salary anda!");
						RemovePlayerFromVehicle(playerid);
						SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					}
				}
			}
		}
		case CHECKPOINT_MISC:
		{
			pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
			DisablePlayerRaceCheckpoint(playerid);
		}
	}
	if(pData[playerid][pGpsActive] == 1)
	{
		pData[playerid][pGpsActive] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackVending] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan mesin vending anda!");
		pData[playerid][pTrackVending] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		{
			DisablePlayerRaceCheckpoint(playerid);
			Info(playerid, "'/storegas' untuk menyetor GasOilnya!");
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 10.0, 335.66, 861.02, 21.01))
			{
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerCheckpoint(playerid, 336.70, 895.54, 20.40, 5.5);
				Info(playerid, "Silahkan ambil trailer dan menuju ke checkpoint untuk membeli GasOil!");
			}
			else
			{
				Error(playerid, "Kamu tidak membawa Trailer Gasnya, Silahkan ambil kembali trailernnya!");
			}
		}
	}
	return 1;
}

forward TanggalHp();
public TanggalHp()
{
 new string[500],
	 	month[15],
	 	date[6];

	getdate(date[3], date[4], date[5]);

	switch(date[4])
	{
     	case 1: month = "January";
	    case 2: month = "February";
	    case 3: month = "March";
	    case 4: month = "April";
	    case 5: month = "May";
	    case 6: month = "June";
	    case 7: month = "July";
	    case 8: month = "August";
	    case 9: month = "September";
	    case 10: month = "October";
	    case 11: month = "November";
	    case 12: month = "December";
	}
	
	format(string, sizeof(string), "%02d %s %d", date[5], month, date[3]);
	return 1;
}

forward TwtOffline(playerid);
public TwtOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, TextPolisi);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(TwtTimer[playerid]);
    return 1;
}

forward RmOffline(playerid);
public RmOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, Abangku);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(RmTimer[playerid]);
    return 1;
}

forward RkOffline(playerid);
public RkOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, Aurora);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(RkTimer[playerid]);
    return 1;
}

forward AuOffline(playerid);
public AuOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, Skibidi);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(AuTimer[playerid]);
    return 1;
}

forward SkOffline(playerid);
public SkOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, Romakepala);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(SkTimer[playerid]);
    return 1;
}

forward FbOffline(playerid);
public FbOffline(playerid)
{
    TextDrawHideForPlayer(playerid, Polisi[0]);
    TextDrawHideForPlayer(playerid, Polisi[1]);
    TextDrawHideForPlayer(playerid, Polisi[2]);
    TextDrawHideForPlayer(playerid, Polisi[3]);
    TextDrawHideForPlayer(playerid, Polisi[4]);
    TextDrawHideForPlayer(playerid, Polisi[5]);
    TextDrawHideForPlayer(playerid, Polisi[6]);
    TextDrawHideForPlayer(playerid, Polisi[7]);
    TextDrawHideForPlayer(playerid, Polisi[8]);
    TextDrawHideForPlayer(playerid, Polisi[9]);
    TextDrawHideForPlayer(playerid, Polisi[10]);
    TextDrawHideForPlayer(playerid, Polisi[11]);
    TextDrawHideForPlayer(playerid, Polisi[12]);
    TextDrawHideForPlayer(playerid, Polisi[13]);
    TextDrawHideForPlayer(playerid, Rormang);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][0]);
    PlayerTextDrawHide(playerid, TWTNOTIFTD[playerid][1]);
    KillTimer(FbTimer[playerid]);
    return 1;
}

forward TambahDetikCall(playerid);
public TambahDetikCall(playerid)
{
	DetikCall[playerid] ++;

	if(DetikCall[playerid] == 60)
	{
		DetikCall[playerid] = 0;
		TambahMenitCall(playerid);
	}
}

forward TambahMenitCall(playerid);
public TambahMenitCall(playerid)
{
	MenitCall[playerid] ++;

	if(MenitCall[playerid] == 60)
	{
		MenitCall[playerid] = 0;
		TambahJamCall(playerid);
	}
}

forward TambahJamCall(playerid);
public TambahJamCall(playerid)
{
	JamCall[playerid] ++;

	if(JamCall[playerid] == 24)
	{
		JamCall[playerid] = 0;
	}
}

forward TambahDetikFivEM();
public TambahDetikFivEM()
{
	DetikFivEm ++;

	if(DetikFivEm == 60)
	{
		DetikFivEm = 0;
		TambahJamFivEm();
	}

	SetWorldTime(JamFivEm);
}

forward TambahJamFivEm();
public TambahJamFivEm()
{
	JamFivEm ++;

	if(JamFivEm == 24)
	{
		JamFivEm = 0;
	}

	SetWorldTime(JamFivEm);
}

forward UpdtLoading(playerid);
public UpdtLoading(playerid)
{
	LoadingPlayerBar[playerid] += 1;
	UpdateLoading(playerid);
	if(LoadingPlayerBar[playerid] >= 100)
	{
	    pData[playerid][pProgressBar] = 0;
		KillTimer(TimerLoading[playerid]);
		LoadingPlayerBar[playerid] = 0;
		HideProgressBar(playerid);
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}
ShowProgressbar(playerid, text[] = "", Times)
{
    if(pData[playerid][pProgressBar] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress");
    
    pData[playerid][pProgressBar] = 1;
	LoadingPlayerBar[playerid] = 0;
	new Float:Value = LoadingPlayerBar[playerid]*101/100;
	new Timeron = Times*1000/100;
	TextDrawTextSize(PROGRESSBAR[1], Value, 23.5);
	TextDrawSetString(PROGRESSBAR[2], text);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[0]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[1]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[2]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[3]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[4]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[5]);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[6]);
	TogglePlayerControllable(playerid, 0);
	TimerLoading[playerid] = SetTimerEx("UpdtLoading", Timeron, true, "d", playerid);
	return 1;
}
stock UpdateLoading(playerid)
{
	new Float:Value = LoadingPlayerBar[playerid]*101.0/100;
	TextDrawTextSize(PROGRESSBAR[1], Value, 23.4);
	TextDrawShowForPlayer(playerid, PROGRESSBAR[1]);
	return 1;
}
HideProgressBar(playerid)
{
	TextDrawHideForPlayer(playerid, PROGRESSBAR[0]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[1]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[2]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[3]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[4]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[5]);
	TextDrawHideForPlayer(playerid, PROGRESSBAR[6]);
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	/*new playerState = GetPlayerState(playerid);
    if(playerState == PLAYER_STATE_ONFOOT )
    {
	    if(Kurir[playerid] == true)
	    {
            if(angkatBox[playerid] == false)
	        {
				 Error(playerid,"Silahkan bawa Box pengiriman barang, /angkatbox");
			}
			else if(angkatBox[playerid] == true)
	        {
	        RemovePlayerAttachedObject(playerid, BOX_INDEX);
			GameTextForPlayer(playerid, "~g~MELETAKKAN BARANG...", 4000, 3);
            ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0 ,0,0,0,0,1);
	        Unload_Timer[playerid] = SetTimerEx("PekerjaanSelesai", 5000, false, "i", playerid);
	        TogglePlayerControllable(playerid,0);
		    }
        }
	}*/
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			Info(playerid, "/buy, /gps(My Hauling), /storegas.");
		}
	}
	/*if(pData[playerid][pCP] == 1)
	{
		pData[playerid][pJobTime] = 120;
		DisablePlayerCheckpoint(playerid);
		AddPlayerSalary(playerid, "Job (Kurir)", 120);
        pData[playerid][pKurirEnd] = 0;
        pData[playerid][pCP] = 0;
		InfoMsg(playerid, "Job (Kurir) telah masuk ke pending salary anda!");
		RemovePlayerFromVehicle(playerid);
		SetTimerEx("RespawnPV", 3000, false, "d", GetPlayerVehicleID(playerid));
	}*/
	if(pData[playerid][CarryingLog] != -1)
	{
		if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 574)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint1))
			{
				SetPlayerCheckpoint(playerid, sweperpoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint2))
			{
				SetPlayerCheckpoint(playerid, sweperpoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint3))
			{
				SetPlayerCheckpoint(playerid, sweperpoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint4))
			{
				SetPlayerCheckpoint(playerid, sweperpoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint5))
			{
				SetPlayerCheckpoint(playerid, sweperpoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint6))
			{
				SetPlayerCheckpoint(playerid, sweperpoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint7))
			{
				SetPlayerCheckpoint(playerid, sweperpoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint8))
			{
				SetPlayerCheckpoint(playerid, sweperpoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint9))
			{
				SetPlayerCheckpoint(playerid, sweperpoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint10))
			{
				SetPlayerCheckpoint(playerid, sweperpoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint11))
			{
				SetPlayerCheckpoint(playerid, sweperpoint12, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint12))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSweeperTime] = 120;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Sweeper)", 120);
				InfoMsg(playerid, "Sidejob(Sweeper) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 280;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 1000);
				InfoMsg(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

forward JobForklift(playerid);
public JobForklift(playerid)
{
	TogglePlayerControllable(playerid, 1);
	GameTextForPlayer(playerid, "~w~SELESAI!", 5000, 3);
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_CTRL_BACK)
	{
		TextDrawShowForPlayer(playerid, PublicTD[0]);
		TextDrawShowForPlayer(playerid, PublicTD[1]);
		TextDrawShowForPlayer(playerid, PublicTD[2]);
		TextDrawShowForPlayer(playerid, PublicTD[3]);
		TextDrawShowForPlayer(playerid, PublicTD[4]);
		TextDrawShowForPlayer(playerid, PublicTD[5]);
		TextDrawShowForPlayer(playerid, PublicTD[6]);
		TextDrawShowForPlayer(playerid, PublicTD[7]);
		TextDrawShowForPlayer(playerid, PublicTD[8]);
		TextDrawShowForPlayer(playerid, PublicTD[9]);
		TextDrawShowForPlayer(playerid, PublicTD[10]);
		TextDrawShowForPlayer(playerid, PublicTD[11]);
		TextDrawShowForPlayer(playerid, PublicTD[12]);
		TextDrawShowForPlayer(playerid, PublicTD[13]);
		SelectTextDraw(playerid, 0xFF0000FF);
	}
	
	if(newkeys == KEY_NO)
	{
		TextDrawShowForPlayer(playerid, PanelV[0]);
		TextDrawShowForPlayer(playerid, PanelV[1]);
		TextDrawShowForPlayer(playerid, PanelV[2]);
		TextDrawShowForPlayer(playerid, Mesin);
		TextDrawShowForPlayer(playerid, Kunci);
		TextDrawShowForPlayer(playerid, BEnsin);
		TextDrawShowForPlayer(playerid, Lampu);
		TextDrawShowForPlayer(playerid, Kap);
		TextDrawShowForPlayer(playerid, Bagasi);
		TextDrawShowForPlayer(playerid, Tutup);
		TextDrawShowForPlayer(playerid, PanelV[3]);
		TextDrawShowForPlayer(playerid, PanelV[4]);
		TextDrawShowForPlayer(playerid, PanelV[5]);
		TextDrawShowForPlayer(playerid, PanelV[6]);
		TextDrawShowForPlayer(playerid, PanelV[7]);
		TextDrawShowForPlayer(playerid, PanelV[8]);
		TextDrawShowForPlayer(playerid, PanelV[9]);
		SelectTextDraw(playerid, 0xFF0000FF);
	}
	
	if(newkeys & KEY_CROUCH)
	{
	TextDrawDestroy(PublicTD[0]);
	TextDrawDestroy(PublicTD[1]);
	TextDrawDestroy(PublicTD[2]);
	TextDrawDestroy(PublicTD[3]);
	TextDrawDestroy(PublicTD[4]);
	TextDrawDestroy(PublicTD[5]);
	TextDrawDestroy(PublicTD[6]);
	TextDrawDestroy(PublicTD[7]);
	TextDrawDestroy(PublicTD[8]);
	TextDrawDestroy(PublicTD[9]);
	TextDrawDestroy(PublicTD[10]);
	TextDrawDestroy(PublicTD[11]);
	TextDrawDestroy(PublicTD[12]);
	TextDrawDestroy(PublicTD[13]);
	}
		
    if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
    {
        AntiBHOP[playerid] ++;
        if(pData[playerid][pRFoot] <= 70 || pData[playerid][pLFoot] <= 70)
        {
        	SetTimerEx("AppuiePasJump", 1700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 90 || pData[playerid][pLFoot] <= 90)
        {
        	SetTimerEx("AppuiePasJump", 700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 40 || pData[playerid][pLFoot] <= 40)
        {
        	SetTimerEx("AppuiePasJump", 3200, false, "i", playerid);
        	if(AntiBHOP[playerid] == 3)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
    }
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingBox])
		{
			Player_DropBox(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_LOOK_BEHIND))
    {
        callcmd::lock(playerid, "");
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
//		new vidx = GetPlayerVehicleID(playerid);
		if(JourneyInterior[playerid] > 0)
		{
			new seatavailable = 1;
			foreach(new pl: Player)
			{
				if(GetPlayerVehicleID(pl) == JourneyInterior[playerid] && GetPlayerState(pl) == PLAYER_STATE_PASSENGER)
				{
					seatavailable = 0;
				}
			}

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(JourneyInterior[playerid]));

			if(seatavailable == 0)
			{
				new Float:sPos[3];
				GetVehiclePos(JourneyInterior[playerid], sPos[0], sPos[1], sPos[2]);
				SetPlayerPos(playerid, sPos[0]+2.0, sPos[1]+2.0, sPos[2]);
			}
			else PutPlayerInVehicle(playerid, JourneyInterior[playerid], 1);

			JourneyInterior[playerid] = 0;
			return true;
		}
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return Error(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				/*if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return Error(playerid, "This door only for family.");
				}*/
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return Error(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return Error(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");
					
				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);
				
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			pData[playerid][pInBiz] = -1;
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				pData[playerid][pInFamily] = fid;	
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
			new difamily = pData[playerid][pInFamily];
			if(pData[playerid][pInFamily] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, fData[difamily][fIntposX], fData[difamily][fIntposY], fData[difamily][fIntposZ]))
			{
				pData[playerid][pInFamily] = -1;	
				SetPlayerPositionEx(playerid, fData[difamily][fExtposX], fData[difamily][fExtposY], fData[difamily][fExtposZ], fData[difamily][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		foreach(new vid : Vendings)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, VendingData[vid][vendingX], VendingData[vid][vendingY], VendingData[vid][vendingZ]) && strcmp(VendingData[vid][vendingOwner], "-"))
			{
				SetPlayerFacingAngle(playerid, VendingData[vid][vendingA]);
				ApplyAnimation(playerid, "VENDING", "VEND_USE", 10.0, 0, 0, 0, 0, 0, 1);
				SetTimerEx("VendingNgentot", 3000, false, "i", playerid);
			}
		}
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "You got tased for %d secounds!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	//-----[ Vehicle ]-----	
	if(newkeys & KEY_YES)
	{
	    if(pData[playerid][pFaction] == 3)
        {
            foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 1) && i != playerid)
			{
				ShowPlayerDialog(playerid, DIALOG_EMS1, DIALOG_STYLE_LIST, "Asia Pride - SAMD Panel", "Revive\nGendong\nCheck Health\nInvoice Manual\nTreatment\nHealBone\nLoadInjured\nDropInjured", "Select", "Cancel");
			}
		}
	}
	if(newkeys & KEY_YES)
	{
	    if(pData[playerid][pFaction] == 1)
        {
            foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 1) && i != playerid)
			{
				ShowPlayerDialog(playerid, DIALOG_SAPD, DIALOG_STYLE_LIST, "Asia Pride - SAPD Panel", "Borgol\nBuka Borgol\nMasukkan/Keluarkan paksa ( car )\nGendong\nPeriksa\nAmbil Barang Paksa", "Select", "Cancel");
			}
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 1, -2063.6318,2663.7707,1498.7764))
        {
        	callcmd::wehdcweydshddf(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2, -514.286560, -194.167083, 77.906242))
        {
        	callcmd::potongkayu1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -526.723144, -194.687545, 78.004692))
        {
        	callcmd::potongkayu2(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -534.682800, -170.728393, 78.006240))
        {
        	callcmd::potongkayu3(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -543.537597, -170.804534, 78.006240))
        {
        	callcmd::potongkayu4(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -520.361206, -194.716049, 77.924926))
        {
        	callcmd::potongkayu5(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -551.597473, -197.158843, 78.206237))
        {
        	callcmd::proseskayu1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -551.597473, -197.158843, 78.206237))
        {
        	callcmd::proseskayu2(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2, 1040.479370, -313.036254, 73.693069))
        {
        	callcmd::susutobrut8(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1040.479370, -310.036071, 73.693069))
        {
        	callcmd::susutobrut1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1040.479370, -306.935882, 73.693069))
        {
        	callcmd::susutobrut2(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1050.976806, -305.035766, 73.693069))
        {
        	callcmd::susutobrut3(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1040.479370, -303.835693, 73.693069))
        {
        	callcmd::susutobrut4(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1040.479370, -300.935516, 73.693069))
        {
        	callcmd::susutobrut5(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1050.976806, -299.935455, 73.693069))
        {
        	callcmd::susutobrut6(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1070.703491, -288.285614, 73.992172))
        {
        	callcmd::prosessusutobrut(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1050.976806, -302.535614, 73.693069))
        {
        	callcmd::susutobrut7(playerid, "");
        }
	}
 	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 1, -2120.465576, 244.994247, 35.718391))
        {
            if(pData[playerid][pTimeTambang1] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang1] = 1;
        	SetTimerEx("TungguNambang1", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, -2129.602783, 246.870574, 35.637325))
        {
        	if(pData[playerid][pTimeTambang2] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang2] = 1;
        	SetTimerEx("TungguNambang2", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, -2126.851074, 274.000732, 36.036834))
        {
        	if(pData[playerid][pTimeTambang3] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang3] = 1;
        	SetTimerEx("TungguNambang3", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, -2101.559082, 286.539398, 35.537796))
        {
        	if(pData[playerid][pTimeTambang4] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang4] = 1;
        	SetTimerEx("TungguNambang4", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, -2093.238525, 289.009094, 35.639553))
        {
        	if(pData[playerid][pTimeTambang5] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang5] = 1;
        	SetTimerEx("TungguNambang5", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, -2132.722412, 270.303680, 36.060974))
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::wehdcweydshdddf(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang6", 50000, false, "d", playerid);
        }
	}
	if(newkeys & KEY_WALK)
	{
        if(IsPlayerInRangeOfPoint(playerid, 9, -2080.745605, 251.336685, 35.598999))
        {
        	callcmd::uwdhewvdtwedbb(playerid, "");
        }
	}
 	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5, -2107.4541,-2400.1042,31.4123))
		{
		    callcmd::ufhecudee(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5, -2110.3020,-2408.2725,31.3098))
        {
        	callcmd::ybefnucywe(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -2117.5095,-2414.5049,31.2266))
        {
        	callcmd::lwvjnidue(playerid, "");
        }
	}
	//-----[ Toll System ]-----	
	if(newkeys & KEY_CROUCH)
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			if(pData[playerid][pEnergy] >= 100 )
			{
  				Info(playerid, " Kamu terlalu banyak minum.");
	 	  	}
		   	else
		   	{
			    pData[playerid][pEnergy] += 5;
			}
		}
	}
	// STREAMER MASK SYSTEM
	/*if(PRESSED( KEY_WALK ))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(pData[playerid][pAdmin] < 2)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetEngineStatus(vehicleid))
				{
					if(GetVehicleSpeed(vehicleid) <= 40)
					{
						new playerState = GetPlayerState(playerid);
						if(playerState == PLAYER_STATE_DRIVER)
						{
							SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: "GREY2_E"%s have been auto kicked for vehicle engine hack!", pData[playerid][pName]);
							KickEx(playerid);
						}
					}
				}
			}	
		}
	}*/
	if(PRESSED( KEY_YES ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
							return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

						if(dData[did][dLocked])
							return Error(playerid, "This entrance is locked at the moment.");
							
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
						if(dData[did][dFamily] > 0)
						{
							if(dData[did][dFamily] != pData[playerid][pFamily])
								return Error(playerid, "This door only for family.");
						}
						
						if(dData[did][dVip] > pData[playerid][pVip])
							return Error(playerid, "Your VIP level not enough to enter this door.");
						
						if(dData[did][dAdmin] > pData[playerid][pAdmin])
							return Error(playerid, "Your admin level not enough to enter this door.");
							
						if(strlen(dData[did][dPass]))
						{
							new params[256];
							if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
							if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
							
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
						else
						{
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
					
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[did][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	//if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	/*if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			if(pData[playerid][pLoopAnim])
	    	{	
	        	pData[playerid][pLoopAnim] = 0;

				ClearAnimations(playerid, 1);
				StopLoopingAnim(playerid);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		    	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
		    	TextDrawHideForPlayer(playerid, AnimationTD);
			}
			
		}
    }*/
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	if(takingselfie[playerid] == 1)
	{
		if(PRESSED(KEY_ANALOG_RIGHT))
		{
			GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] += Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
		if(PRESSED(KEY_ANALOG_LEFT))
		{
		    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] -= Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
	}
	/*if(StatusCrateTerangkat == true)
    {
        if(PRESSED (KEY_JUMP))
        {
            ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
        }
    }*/
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	//JOB KURIR
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		/*if(IsAKurirVeh(GetPlayerVehicleID(playerid)))
		{
			GameTextForPlayer(playerid, "~w~PENGANTARAN BARANG TERSEDIA /STARTKURIR", 5000, 3);
			SendClientMessage(playerid, 0x76EEC6FF, "* Tampaknya ada paket yang tidak terkirim di Burrito Anda.");
		}*/
		if(IsABaggageVeh(GetPlayerVehicleID(playerid)))
		{
			InfoTD_MSG(playerid, 8000, "/~g~startbg");
		}
	}
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pSpaTime] = gettime() + 18000;
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        pData[playerid][pMarkTemp] = vehicleid;
		if(pData[playerid][pInjured] == 1)
        {
            pData[playerid][pSpaTime] = gettime() + 18000;
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		//TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
		
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][0]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][1]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][2]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][3]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][4]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][5]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][6]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][7]);
		PlayerTextDrawHide(playerid, Hbebaruv[playerid][8]);
		
		if(pData[playerid][pTaxiDuty] == 1)
		{
			pData[playerid][pTaxiDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "You are no longer on taxi duty!");
		}
		if(pData[playerid][pFare] == 1)
		{
			KillTimer(pData[playerid][pFareTimer]);
			Info(playerid, "Anda telah menonaktifkan taxi fare pada total: {00FF00}%s", FormatMoney(pData[playerid][pTotalFare]));
			pData[playerid][pFare] = 0;
			pData[playerid][pTotalFare] = 0;
		}
		if(pData[playerid][pIsStealing] == 1)
		{
			pData[playerid][pIsStealing] = 0;
			pData[playerid][pLastChopTime] = 0;
			InfoMsg(playerid, "Kamu gagal mencuri kendaraan ini, di karenakan kamu keluar kendaraan saat proses pencurian!");
			KillTimer(MalingKendaraan);

		}
		
  		vehicleid = GetNearestVehicleToPlayer(playerid,4.0,false);

	    if (vehicleid == INVALID_VEHICLE_ID)
	    	return 1;

	    switch (GetEngineStatus(GetNearestVehicleToPlayer(playerid)))
	    {
	        case false:
	        {
	            SwitchVehicleEngine(GetNearestVehicleToPlayer(playerid), false);
	        }
	        case true:
	        {
	            SwitchVehicleEngine(GetNearestVehicleToPlayer(playerid), false);
	            
	            SwitchVehicleLight(vehicleid, false);

	            SendNearbyMessage(playerid, 0.0, COLOR_WHITE, "ACTION: {D0AEEB}Mesin mati.");
	        }
	    }
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		/*if(IsSRV(vehicleid))
		{
			new tstr[128], price = GetVehicleCost(GetVehicleModel(vehicleid));
			format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleName(vehicleid), FormatMoney(price));
			ShowPlayerDialog(playerid, DIALOG_BUYPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
		}
		else if(IsVSRV(vehicleid))
		{
			new tstr[128], price = GetVipVehicleCost(GetVehicleModel(vehicleid));
			if(pData[playerid][pVip] == 0)
			{
				Error(playerid, "Kendaraan Khusus VIP Player.");
				RemovePlayerFromVehicle(playerid);
				//SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
			else
			{
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d Coin", GetVehicleName(vehicleid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYVIPPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
		}*/
		
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "Kendaraan ini di kunci oleh pemiliknya.");
						return 1;
					}
				}
			}
		}
		
		
		if(IsASweeperVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_SWEEPER, DIALOG_STYLE_MSGBOX, "Side Job - Sweeper", "Anda akan bekerja sebagai pembersih jalan?", "Start Job", "Close");
		}
		if(IsABusVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_BUS, DIALOG_STYLE_MSGBOX, "Side Job - Bus", "Anda akan bekerja sebagai pengangkut penumpang bus?", "Start Job", "Close");
		}
		if(IsAForVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_FORKLIFT, DIALOG_STYLE_MSGBOX, "Side Job - Forklift", "Anda akan bekerja sebagai pemuat barang dengan Forklift?", "Start Job", "Close");
		}
		if(IsAMowerVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_MOWER, DIALOG_STYLE_MSGBOX, "Side Job - Mower", "Anda akan bekerja sebagai Mower?", "Start Job", "Close");
		}
		if(IsABaggageVeh(vehicleid))
		{
			if(pData[playerid][pJob] != 10 && pData[playerid][pJob2] != 10)
			{
				RemovePlayerFromVehicle(playerid);
                Error(playerid, "Kamu tidak bekerja sebagai Baggage Airport");
			}
		}
		if(IsADmvVeh(vehicleid))
        {
            if(!pData[playerid][pDriveLicApp])
            {
                RemovePlayerFromVehicle(playerid);
                Error(playerid, "Kamu tidak sedang mengikuti Tes Mengemudi");
			}
			else 
			{
				Info(playerid, "Silahkan ikuti Checkpoint yang ada di GPS mobil ini.");
				SetPlayerRaceCheckpoint(playerid, 1, dmvpoint1, dmvpoint1, 5.0);
			}
		}
		/*if(IsAKurirVeh(vehicleid))
		{
			if(pData[playerid][pJob] != 8 && pData[playerid][pJob2] != 8)
			{
				RemovePlayerFromVehicle(playerid);
                Error(playerid, "Kamu tidak bekerja sebagai Courier");
			}
		}*/
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    Error(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    Error(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    Error(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    Error(playerid, "Anda bukan SANEWS!");
			}
		}
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
        if(GetEngineStatus(vehicleid))
		{
			EngineStatuss(playerid, vehicleid);
		}
  		else
        {
            if(!GetEngineStatus(vehicleid))
            {
                //if(CoreVehicles[vehicleid][vehFuel] < 1.0) ShowPlayerFooter(playerid, "There is no ~r~fuel~w~ in this vehicle.", 3000, 1);
                //else if(ReturnVehicleHealth(vehicleid) <= 300) ShowPlayerFooter(playerid, "This vehicle is ~r~totalled~w~ and needs repairing.", 3000, 1);
                //else ShowPlayerFooter(playerid, "Type ~r~/v engine~w~ to start the engine.");
                vehicleid = GetPlayerVehicleID(playerid);

		        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		            return 1;

                SetTimerEx("EngineStatuss", 1500, false, "dd", playerid, GetPlayerVehicleID(playerid));
	            SendNearbyMessage(playerid, 0.0, COLOR_WHITE, "ACTION: {D0AEEB}Mencoba menyalakan mesin.");
			}
            if(pData[playerid][pDriveLic] <= 0)
			{
                Info(playerid, "Anda tidak memiliki surat izin mengemudi, berhati-hatilah.");
            }
        }

		if(pData[playerid][pHBEMode] == 1)
		{
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][0]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][1]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][2]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][3]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][4]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][5]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][6]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][7]);
   			PlayerTextDrawShow(playerid, Hbebaruv[playerid][8]);
		}
		else
		{
		
		}
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float:health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    if(pData[playerid][pSeatBelt] == 0 || pData[playerid][pHelmetOn] == 0)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 2);
    		new bsakit = RandomEx(0, 2);
    		new csakit = RandomEx(0, 2);
    		new dsakit = RandomEx(0, 2);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -2);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		new asakit = RandomEx(0, 3);
    		new bsakit = RandomEx(0, 3);
    		new csakit = RandomEx(0, 3);
    		new dsakit = RandomEx(0, 3);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -5);
    		return 1;
    	}
    	return 1;
    }
    if(pData[playerid][pSeatBelt] == 1 || pData[playerid][pHelmetOn] == 1)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -3);
    		return 1;
    	}
    }
    return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    //GetPlayerPos(playerid, x, y, z);
//    GetPlayerName(playerid, attacker, sizeof (attacker));
//    GetPlayerName(damagedid, victim, sizeof (victim));

//    SendClientMessageToAll(0xFFFFFFFF, string);
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(IsAtEvent[playerid] == 0)
	{
		new sakit = RandomEx(1, 4);
		new asakit = RandomEx(1, 5);
		new bsakit = RandomEx(1, 7);
		new csakit = RandomEx(1, 4);
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			pData[playerid][pHead] -= 20;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 3)
		{
			pData[playerid][pPerut] -= sakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 6)
		{
			pData[playerid][pRHand] -= bsakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 5)
		{
			pData[playerid][pLHand] -= asakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 8)
		{
			pData[playerid][pRFoot] -= csakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 7)
		{
			pData[playerid][pLFoot] -= bsakit;
		}
	}
	else if(IsAtEvent[playerid] == 1)
	{
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			GivePlayerHealth(playerid, -90);
			SendClientMessage(issuerid, -1,"{7fffd4}[ TDM ]{ffffff} Headshot!");
		}
	}
    return 1;
}

public OnPlayerUpdate(playerid)
{
    afk_tick[playerid]++;
    if(pData[playerid][pSpaTime] > 0)
	{
		pData[playerid][pSpaTime]--;
	}
	new string[256];
 	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			format(string, sizeof(string), "%02d:%02d:%02d", JamCall[ii], MenitCall[ii], DetikCall[ii]);
			PlayerTextDrawSetString(ii, WaktutelHP[ii], string);

			format(string, sizeof(string), "%02d:%02d:%02d", JamCall[playerid], MenitCall[playerid], DetikCall[playerid]);
			PlayerTextDrawSetString(playerid, WaktutelHP[playerid], string);
		}
	}
	
	format(string, sizeof(string), "%02d:%02d", JamFivEm, DetikFivEm);
	PlayerTextDrawSetString(playerid, Hbebaruv[playerid][0], string);
	
	new Float: HealthPlayer[MAX_PLAYERS], Float:ArmorPlayer[MAX_PLAYERS];
	new Float: Lapar, Float: Haus, Float: HealthBar, Float: ArmourBar;
	new Float: healths, Float: armours;

	GetPlayerHealth(playerid, healths);
	GetPlayerArmour(playerid, armours);

	HealthPlayer[playerid] = healths;
	ArmorPlayer[playerid] = armours;

	HealthBar = HealthPlayer[playerid] * 25.0/100;
	TextDrawTextSize(HBEBARUV1[12], HealthBar, 4);
	TextDrawShowForPlayer(playerid, HBEBARUV1[12]);

	ArmourBar = ArmorPlayer[playerid] * 25.0/100;
	TextDrawTextSize(HBEBARUV1[13], ArmourBar, 4);
	TextDrawShowForPlayer(playerid, HBEBARUV1[13]);

	Lapar = pData[playerid][pHunger] * 25.0/100;
	TextDrawTextSize(HBEBARUV1[14], Lapar, 4);
	TextDrawShowForPlayer(playerid, HBEBARUV1[14]);

	Haus = pData[playerid][pEnergy] * 25.0/100;
	TextDrawTextSize(HBEBARUV1[15], Haus, 4);
	TextDrawShowForPlayer(playerid, HBEBARUV1[15]);
	for(new i = 0; i < 16; i++)
	{
		TextDrawShowForPlayer(playerid, HBEBARUV1[i]);
	}
	TextDrawShowForPlayer(playerid, HBEBARUV1[12]);
	TextDrawShowForPlayer(playerid, HBEBARUV1[13]);
	TextDrawShowForPlayer(playerid, HBEBARUV1[14]);
	TextDrawShowForPlayer(playerid, HBEBARUV1[15]);
	
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);

	//Report ask
	//GetPlayerName(playerid, g_player_name[playerid], MAX_PLAYER_NAME);

	//AntiCheat
	pData[playerid][pLastUpdate] = gettime();
	
	//SpeedCam
	static id;
	new vehicled = Vehicle_Nearest2(playerid), query[326];
	if ((id = SpeedCam_Nearest(playerid)) != -1 && GetPlayerSpeedCam(playerid) > CamData[id][CamLimit] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && pvData[vehicled][cOwner] == pData[playerid][pID] && GetEngineStatus(vehicled) && !pData[playerid][pSpeedTime])
	{
	    if (!IsACruiser(vehicled) && !IsABoat(vehicled) && !IsAPlane(vehicled) && !IsAHelicopter(vehicled))
	    {
	 		new price = 20 + floatround(GetPlayerSpeedCam(playerid) - CamData[id][CamLimit]);
			new str[500];
	   		format(str, sizeof(str), "Kecepatan (%.0f/%.0f mph)", GetPlayerSpeedCam(playerid), CamData[id][CamLimit]);
	        SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFFFFFF66));
    		format(str, sizeof(str), "{ff0000}[SpeedCam]: {ffffff}Kamu telah melebihi kecepatan dan mendapatkan denda sebesar {3BBD44}%s", FormatMoney(price));
     		SendClientMessage(playerid, -1, str);
			pvData[vehicled][cTicket] += price;

			mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicle SET ticket = '%d' WHERE id = '%d'", pvData[vehicled][cTicket], pvData[vehicled][cID]);
			mysql_tquery(g_SQL, query);
			pData[playerid][pSpeedTime] = 5;
		}
	}
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 15);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 200)
            {
               InfoMsg(GetVehicleDriver(i), "Kendaraan ingin habis bensin, Harap pergi ke SPBU terdekat. ( Gas Station )");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128], xuery[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);

				mysql_format(g_SQL, xuery, sizeof(xuery), "DELETE FROM vstorage WHERE owner = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, xuery);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}
public OnVehicleDeath(vehicleid, killerid)
{
	foreach(new i : PVehicles)
	{
		if(pvData[i][cVeh] == vehicleid)
		{
			pvData[i][cStolen] = gettime() + 15;
		}
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	//LoadedTrash[vehicleid] = 0;
	foreach(new ii : PVehicles)
	{
		if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cStolen] > gettime())
		{
			if(pvData[ii][cInsu] > 0)
    		{
				pvData[ii][cStolen] = 0;
				pvData[ii][cInsu]--;
				pvData[ii][cClaim] = 1;
				pvData[ii][cClaimTime] = gettime() + (1 * 600);
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
            		InfoMsg(pid, "Kendaraan anda telah hancur, silahkan ambil di kantor insurance setelah 10 minute.");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);

				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
			}
			else
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);

					pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            		InfoMsg(pid, "Kendaraan anda hancur dan tidak memiliki insuransi.");
					Iter_SafeRemove(PVehicles, ii, ii);
				}
				pvData[ii][cStolen] = 0;
			}
			return 1;
		}
	}
	return 1;
}
/*public OnVehicleSpawn(vehicleid)
{
	foreach(new ii : PVehicles)
	{
		if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cStolen] > gettime())
		{
			if(pvData[ii][cInsu] > 0)
    		{
				pvData[ii][cStolen] = 0;
				pvData[ii][cInsu]--;
				pvData[ii][cClaim] = 1;
				pvData[ii][cClaimTime] = gettime() + (1 * 120);
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
            		InfoMsg(pid, "Kendaraan anda telah hancur, silahkan ambil di kantor insuransi setelah 12 jam.");
					new str[150];
					format(str,sizeof(str),"[VEH]: Kendaraan %s telah masuk insu memek model %s!", GetRPName(pid), GetVehicleModelName(pvData[ii][cModel]));
					LogServer("Property", str);
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);
				
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
			}
			else
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);

					pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            		InfoMsg(pid, "Kendaraan anda hancur dan tidak memiliki insuransi.");
					new str[150];
					format(str,sizeof(str),"[VEH]: Kendaraan %s telah terhapus karena insu memek model %s!", GetRPName(pid), GetVehicleModelName(pvData[ii][cModel]));
					LogServer("Property", str);
					Iter_SafeRemove(PVehicles, ii, ii);
				}
			}
			return 1;
		}
	}
	//System Vehicle Admin
	if(AdminVehicle{vehicleid})
	{
	    DestroyVehicle(vehicleid);
	    AdminVehicle{vehicleid} = false;
	}
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    return 1;
}*/

ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{	
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 350.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				InfoTD_MSG(playerid, 2500, "~r~Totalled");
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
   		 		new Float:fDamage, fFuel, color1, color2;
   		 		new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);
				if(fDamage <= 350) fDamage = 0;
				else if(fDamage > 1000) fDamage = 1000;

				fFuel = GetVehicleFuel(vehicleid);

 				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;


				format(tstr, sizeof(tstr), "%d", fFuel);
				PlayerTextDrawSetString(playerid, Hbebaruv[playerid][1], tstr);

				format(tstr, sizeof(tstr), "%.1f", fDamage);
				PlayerTextDrawSetString(playerid, Hbebaruv[playerid][8], tstr);

				format(tstr, sizeof(tstr), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, Hbebaruv[playerid][3], tstr);
			}
			else
			{
			
			}
		}
	}
}

ptask PlayerUpdate[999](playerid)
{
    new StringF[50];
 	if(afk_tick[playerid] > 10000) afk_tick[playerid] = 1, afk_check[playerid] = 0;
 	if(afk_check[playerid] < afk_tick[playerid] && GetPlayerState(playerid)) afk_check[playerid] = afk_tick[playerid], afk_time[playerid] = 0;
 	if(afk_check[playerid] == afk_tick[playerid] && GetPlayerState(playerid))
  	{
   		afk_time[playerid]++;
     	if(afk_time[playerid] > 2)
      	{
       		format(StringF,sizeof(StringF), "Melamun Jorok");
			SetPlayerChatBubble(playerid, StringF, COLOR_YELLOW, 15.0, 1200);
    	}
    }
	//Anti-Cheat Vehicle health hack
	if(pData[playerid][pAdmin] < 2)
	{
		for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
		{
			new Float:health;
			GetVehicleHealth(v, health);
			if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
			{
				if(GetPlayerVehicleID(playerid) == v)
				{
					new playerState = GetPlayerState(playerid);
					if(playerState == PLAYER_STATE_DRIVER)
					{
						SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
						SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: "GREY2_E"%s have been auto kicked for vehicle health hack!", pData[playerid][pName]);
						KickEx(playerid);
					}
				}
			}
			if(VehicleHealthSecurity[v] == true)
			{
				VehicleHealthSecurity[v] = false;
			}
			VehicleHealthSecurityData[v] = health;
		}
	}
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	//Anti Armour Hacks
	new Float:A;
	GetPlayerArmour(playerid, A);
	if(pData[playerid][pAdmin] < 2)
	{
		if(A > 98)
		{
			SetPlayerArmourEx(playerid, 0);
			SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: "GREY2_E"%s(%i) has been auto kicked for armour hacks!", pData[playerid][pName], playerid);
			KickEx(playerid);
		}
	}
	//Weapon AC
	if(pData[playerid][pAdmin] < 2)
	{
		if(pData[playerid][pSpawned] == 1)
		{
			if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
			{
				pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

				if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 40 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
				{
					pData[playerid][pACWarns]++;

					if(pData[playerid][pACWarns] < MAX_ANTICHEAT_WARNINGS)
					{
						new dc[128];
						SendAnticheat(COLOR_RED, "%s(%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
						SetWeapons(playerid); 
						format(dc, sizeof(dc),  "```\n<!> %s kemungkinan Weapon hacks (%s) ```", ReturnName(playerid), ReturnWeaponName(pData[playerid][pWeapon]));
						SendDiscordMessage(3, dc);					
					}
					else
					{
						new dc[128], PlayerIP[16];
						SendClientMessageToAllEx(COLOR_RED, "[ANTICHEAT]: %s"WHITE_E" telah dibanned otomatis oleh %s, Alasan: Weapon hacks", pData[playerid][pName], SERVER_BOT);
						format(dc, sizeof(dc),  "```\n<!> %s telah diban oleh %s\nAlasan: Weapon Hack```", ReturnName(playerid), SERVER_BOT);
						SendDiscordMessage(3, dc);

						GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
						new query[300], tmp[40], ban_time = 0;
						format(tmp, sizeof (tmp), "Weapon Hack (%s)", ReturnWeaponName(pData[playerid][pWeapon]));
						mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', '%s', '%s', %i, %d)", pData[playerid][pUCP], PlayerIP, SERVER_BOT, tmp, gettime(), ban_time);
						mysql_tquery(g_SQL, query);
						KickEx(playerid);
					}
				}
			}
		}
	}	
	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;
 
		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;
		   
			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);
 
				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);
 
				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;
 
			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;
 
			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
	
	//Player Update Online Data
	//GetPlayerHealth(playerid, pData[playerid][pHealth]);
    //GetPlayerArmour(playerid, pData[playerid][pArmour]);
	
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
		if(pData[playerid][pStress] > 100)
		{
			pData[playerid][pStress] = 100;
		}
		if(pData[playerid][pStress] < 0)
		{
			pData[playerid][pStress] = 0;
		}
		/*if(pData[playerid][pHealth] > 100)
		{
			SetPlayerHealthEx(playerid, 100);
		}*/
	}
	
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
	//	SetPlayerProgressBarValue(playerid, pData[playerid][sphungrybar], pData[playerid][pHunger]);
	///	SetPlayerProgressBarColour(playerid, pData[playerid][sphungrybar], ConvertHBEColor(pData[playerid][pHunger]));
	//	SetPlayerProgressBarValue(playerid, pData[playerid][spenergybar], pData[playerid][pEnergy]);
	///	SetPlayerProgressBarColour(playerid, pData[playerid][spenergybar], ConvertHBEColor(pData[playerid][pEnergy]));
	//	new strings[64];
	//	format(strings, sizeof(strings), "%s", pData[playerid][pName]);
	////	PlayerTextDrawSetString(playerid, PNameStats[playerid], strings);
//		PlayerTextDrawShow(playerid, PNameStats[playerid]);
		/*PlayerTextDrawSetPreviewModel(playerid, PSkinStats[playerid], GetPlayerSkin(playerid));
		PlayerTextDrawShow(playerid, PSkinStats[playerid]);
		if(GetPlayerSkin(playerid) != GetPVarInt(playerid, "hbe_skin"))
		{
			PlayerTextDrawSetPreviewModel(playerid, DPskin[playerid], GetPlayerSkin(playerid));
			PlayerTextDrawShow(playerid, DPskin[playerid]);
			SetPVarInt(playerid, "hbe_skin", GetPlayerSkin(playerid));
		}*/
		
	}
	else
	{
	
	}
	
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);
			pData[playerid][pSpaTime] = gettime() + 18000;

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
			if(pData[playerid][pWeaponLic] != 1)
			{
				ResetPlayerWeaponsEx(playerid);
			}
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Terbangun... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 50;
			pData[playerid][pEnergy] = 50;
			pData[playerid][pStress] = 50;
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -150);
			SetPlayerHealthEx(playerid, 50);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar Rp.500,000 kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
			
			SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		pData[playerid][pSpaTime] = gettime() + 18000;
		new mstr[64], string[30];
        format(mstr, sizeof(mstr), "/death for spawn to hospital, /s for calling emergency");
		InfoTD_MSG(playerid, 1000, mstr);
		format(string, sizeof(string), "(( Pingsan ))");
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, string);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 10000)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 150)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 120)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
        if(++ pData[playerid][pStress] >= 150)
        {
            if(pData[playerid][pStress] > 0)
            {
                pData[playerid][pStress]--;
            }
            else if(pData[playerid][pStress] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pStressTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					SetPlayerDrunkLevel(playerid, 8000);
					ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1,1);
					InfoMsg(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					SetPlayerHealth(playerid, hp - 3);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	if (pData[playerid][pSpeedTime] > 0)
	{
	    pData[playerid][pSpeedTime]--;
	}
	if(pData[playerid][pLastChopTime] > 0)
    {
		pData[playerid][pLastChopTime]--;
		new mstr[64];
        format(mstr, sizeof(mstr), "Waktu Pencurian ~r~%d ~w~detik", pData[playerid][pLastChopTime]);
        InfoTD_MSG(playerid, 1000, mstr);
	}
	if(pData[playerid][pInsukelAstera] > 0)
    {
		pData[playerid][pInsukelAstera]--;
		new mstr[64];
        format(mstr, sizeof(mstr), "%d Detik", pData[playerid][pInsukelAstera]);
        //InfoTD_MSG(playerid, 1000, mstr);
		PlayerTextDrawSetString(playerid, AsterInsuKeliling[playerid][4], mstr);
	}
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~Kamu bisa keluar dari penjara dalam ~w~%d ~b~~h~detik.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);				
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1482.0356,-1724.5726,13.5469,750, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E" %s(%d) have been un-jailed by the server. (times up)", pData[playerid][pName], playerid);
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be released in ~w~%d ~b~~h~seconds.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);			
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1526.69, -1678.05, 5.89, 267.76, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			Info(playerid, "You have been auto release. (times up)");
		}
	}
}

forward AppuieJump(playerid);
public AppuieJump(playerid)
{
    AntiBHOP[playerid] = 0;
    ClearAnimations(playerid);
    return 1;
}
forward AppuiePasJump(playerid);
public AppuiePasJump(playerid)
{
    AntiBHOP[playerid] = 0;
    return 1;
}
/*
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 0) 
	{
        if (response) 
		{
            SetPlayerSkin(playerid, listitem);
            GameTextForPlayer(playerid, "~g~Skin Changed!", 3000, 3);
        }
    }
	if(dialogid == 1) 
	{
		if (response) 
		{
			if (GetPlayerMoney(playerid) < WEAPON_SHOP[listitem][WEAPON_PRICE]) 
			{
				SendClientMessage(playerid, 0xAA0000FF, "Not enough money to purchase this gun!");
				return callcmd::weapons(playerid);
			}
			
			GivePlayerMoney(playerid, -WEAPON_SHOP[listitem][WEAPON_PRICE]);
			GivePlayerWeapon(playerid, WEAPON_SHOP[listitem][WEAPON_ID], WEAPON_SHOP[listitem][WEAPON_AMMO]);
			
			GameTextForPlayer(playerid, "~g~Gun Purchased!", 3000, 3);
		}
	}
    return 1;
} */

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(pData[playerid][pDriveLicApp] > 0)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 602)
		{
		    DisablePlayerCheckpoint(playerid);
			DisablePlayerRaceCheckpoint(playerid);
		    Info(playerid, "Anda Dengan Sengaja Keluar Dari Mobil Latihan, Anda Telah "RED_E"DIDISKUALIFIKASI.");
		    RemovePlayerFromVehicle(playerid);
		    pData[playerid][pDriveLicApp] = 0;
		    SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		}
	}
	pData[playerid][pMarkTemp] = 0;
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    if (pData[playerid][pAdmin] >= 4 && pData[playerid][pAdminDuty] == 1)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
                SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
                SetPlayerPosFindZ(playerid, fX, fY, 999.0);
                SetPlayerVirtualWorld(playerid, 0);
                SetPlayerInterior(playerid, 0);
        }
        Info(playerid, "Kamu Telah Berhasil Teleport Ke Marker Di Peta di peta.");
    }
//	pData[playerid][pMarkTemp] ==
    foreach (new i : Player)
	{
		if(pData[i][pMarkTemp] == pData[playerid][pMarkTemp] && pData[playerid][pMarkTemp] != 0 && pData[i][pMarkTemp] != 0)
		{
			SetPlayerCheckpoint(i, fX, fY, fZ, 3.0);
			Info(i, "Waypoint Sharing, Lihat pada map.");
		}
    }
    return 1;
}

CMD:savepos(playerid, params[])
{
	if(!strlen(params))
		return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /savepos [judul]");

    extract params -> new string:message[1000]; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /savepos [judul]");

    new vehicleid = GetPlayerVehicleID(playerid);
	new Float:VPos[5];
	new Float:PPos[5];
	new msg[500];

    if(IsPlayerInAnyVehicle(playerid))
    {
        GetVehiclePos(vehicleid, VPos[0], VPos[1], VPos[2]);
		GetVehicleZAngle(vehicleid, VPos[3]);
		format(msg, sizeof(msg), "AddStaticVehicle(%d,%f,%f,%f,%f,%d,%d); // %s", GetVehicleModel(vehicleid), VPos[0], VPos[1], VPos[2], VPos[3], message);
		DCC_SendChannelMessage(SAVEPOS, msg);
		SendClientMessage(playerid, -1, "INFO: {FFFF00}Coordinat Kendaraan Anda Berhasil Di Save!");
    }
    else
    {
        GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
        GetPlayerFacingAngle(playerid, PPos[3]);
        format(msg, sizeof(msg), "SetPlayerPos(playerid, %f,%f,%f,%f);\nSetPlayerInterior(playerid, %d);\nSetPlayerVirtualWorld(playerid, %d);\n Judul : %s", PPos[0], PPos[1], PPos[2], PPos[3], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), message);
		DCC_SendChannelMessage(SAVEPOS, msg);
		SendClientMessage(playerid, -1, "INFO: {FFFF00}Coordinat Posisi Anda Berhasil Di Save!");
    }
    return 1;
}

stock SendDiscordMessage(channel, message[]) {
	new DCC_Channel:ChannelId;
	switch(channel)
	{
		//==[ Log Join & Leave ]
		case 0:
		{
			ChannelId = DCC_FindChannelById("963147349377548318");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Command ]
		case 1:
		{
			ChannelId = DCC_FindChannelById("909028193338544139");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Chat IC ]
		case 2:
		{
			ChannelId = DCC_FindChannelById("909028196291321856");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Warning & Banned ]
		case 3:
		{
			ChannelId = DCC_FindChannelById("972162661208961094");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Death ]
		case 4:
		{
			ChannelId = DCC_FindChannelById("927765834032640010");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Ucp ]
		case 5:
		{
			ChannelId = DCC_FindChannelById("1285601393754902608");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 6://Korup
		{
			ChannelId = DCC_FindChannelById("972162661208961094");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 7://Register
		{
			ChannelId = DCC_FindChannelById("1285601393754902608");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 8://Bot Admin
		{
			ChannelId = DCC_FindChannelById("909028257574301737");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Tanah) // TANAH MERAH
	{
		pData[playerid][PilihSpawn] = 2;
        SelectTextDraw(playerid, 0xFF0000FF);
	}
	if(clickedid == Terminal) // TERMINAL
	{
		pData[playerid][PilihSpawn] = 1;
        SelectTextDraw(playerid, 0xFF0000FF);
	}
	if(clickedid == Pasar) // PASBEK
	{
		pData[playerid][PilihSpawn] = 4;
        SelectTextDraw(playerid, 0xFF0000FF);
	}
	if(clickedid == Lokasi) // LOKASI TERAKHIR
	{
		pData[playerid][PilihSpawn] = 5;
        SelectTextDraw(playerid, 0xFF0000FF);
        for(new i = 0; i < 8; i++)
		{
			TextDrawHideForPlayer(playerid, Mewing[i]);
		}
		TextDrawHideForPlayer(playerid, Tanah);
		TextDrawHideForPlayer(playerid, Terminal);
		TextDrawHideForPlayer(playerid, Pasar);
		TextDrawHideForPlayer(playerid, Lokasi);
		TextDrawHideForPlayer(playerid, Spawn);
	}
	if(clickedid == Spawn) // MENDARAT
	{
		if(pData[playerid][PilihSpawn] == 0) // GAK MILIH
		return SCM(playerid, COLOR_GREY, "Kamu belum memilih tempat mendarat");

   		if(pData[playerid][PilihSpawn] == 1) // TERMINAL
   		{
			pData[playerid][PilihSpawn] = 0;
			SetPlayerPos(playerid, -603.799926, -472.635406, 25.323440);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
		else if(pData[playerid][PilihSpawn] == 2) // TANAH MERAH
		{
		    pData[playerid][PilihSpawn] = 0;
		    SetPlayerPos(playerid, 2806.392822, 915.266357, 10.350002);
		    SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
		else if(pData[playerid][PilihSpawn] == 3) // TERMINAL
   		{
			pData[playerid][PilihSpawn] = 0;
			SetPlayerPos(playerid, -603.799926, -472.635406, 25.323440);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
		else if(pData[playerid][PilihSpawn] == 4) // PASBEK
   		{
			pData[playerid][PilihSpawn] = 0;
			SetPlayerPos(playerid, 444.974182, -1796.701171, 8.028781);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
		}
	  else if(pData[playerid][PilihSpawn] == 5) // LOKASI TERAKHIR
		{
		    pData[playerid][PilihSpawn] = 0;
		    StopAudioStreamForPlayer(playerid);
			SetPlayerInterior(playerid, pData[playerid][pInt]);
			SetPlayerVirtualWorld(playerid , pData[playerid][pWorld]);
			SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			SetPlayerSpawn(playerid);
		}
        //SelectTextDraw(playerid, 0xFFA500FF);
        for(new i = 0; i < 8; i++)
		{
			TextDrawHideForPlayer(playerid, Mewing[i]);
		}
		TextDrawHideForPlayer(playerid, Tanah);
		TextDrawHideForPlayer(playerid, Terminal);
		TextDrawHideForPlayer(playerid, Pasar);
		TextDrawHideForPlayer(playerid, Lokasi);
		TextDrawHideForPlayer(playerid, Spawn);
		CancelSelectTextDraw(playerid);
	}
	
	//PANELTD
	if(clickedid == PublicTD[0])
	{
		callcmd::gps(playerid, "");
	}
	if(clickedid == PublicTD[4])
	{
		callcmd::stats(playerid, "");
	}
 	if(clickedid == PublicTD[1])
	{
		TextDrawHideForPlayer(playerid, PublicTD[0]);
		TextDrawHideForPlayer(playerid, PublicTD[1]);
		TextDrawHideForPlayer(playerid, PublicTD[2]);
		TextDrawHideForPlayer(playerid, PublicTD[3]);
		TextDrawHideForPlayer(playerid, PublicTD[4]);
		TextDrawHideForPlayer(playerid, PublicTD[5]);
		TextDrawHideForPlayer(playerid, PublicTD[6]);
		TextDrawHideForPlayer(playerid, PublicTD[7]);
		TextDrawHideForPlayer(playerid, PublicTD[8]);
		TextDrawHideForPlayer(playerid, PublicTD[9]);
		TextDrawHideForPlayer(playerid, PublicTD[10]);
		TextDrawHideForPlayer(playerid, PublicTD[11]);
		TextDrawHideForPlayer(playerid, PublicTD[12]);
		TextDrawHideForPlayer(playerid, PublicTD[13]);
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == PublicTD[2])
	{
		callcmd::i(playerid, "");
		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, PublicTD[i]);
		}
	}
	if(clickedid == PublicTD[3])
	{
		callcmd::ph(playerid, "");
	}
	
	//panelv
    if(clickedid == Mesin)
    {
        callcmd::en(playerid, "");
    }
    if(clickedid == Bagasi)
    {
        callcmd::trunk(playerid, "");
    }
    if(clickedid == Kunci)
    {
        callcmd::lock(playerid, "");
    }
    if(clickedid == Lampu)
    {
        callcmd::light(playerid, "");
    }
    if(clickedid == Tutup)
    {
        TextDrawHideForPlayer(playerid, PanelV[0]);
		TextDrawHideForPlayer(playerid, PanelV[1]);
		TextDrawHideForPlayer(playerid, PanelV[2]);
		TextDrawHideForPlayer(playerid, Mesin);
		TextDrawHideForPlayer(playerid, Kunci);
		TextDrawHideForPlayer(playerid, BEnsin);
		TextDrawHideForPlayer(playerid, Lampu);
		TextDrawHideForPlayer(playerid, Kap);
		TextDrawHideForPlayer(playerid, Bagasi);
		TextDrawHideForPlayer(playerid, Tutup);
		TextDrawHideForPlayer(playerid, PanelV[3]);
		TextDrawHideForPlayer(playerid, PanelV[4]);
		TextDrawHideForPlayer(playerid, PanelV[5]);
		TextDrawHideForPlayer(playerid, PanelV[6]);
		TextDrawHideForPlayer(playerid, PanelV[7]);
		TextDrawHideForPlayer(playerid, PanelV[8]);
		TextDrawHideForPlayer(playerid, PanelV[9]);
		CancelSelectTextDraw(playerid);
    }
    if(clickedid == BEnsin)
    {
        callcmd::fill(playerid, "");
    }
    if(clickedid == Kap)
    {
        callcmd::hood(playerid, "");
    }
	
	// PHONE  TEXTDRAWS
	if(clickedid == TUTUPHP)
	{
    	for(new i = 0; i < 21; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneTD[i]);
		}
		for(new i = 0; i < 13; i++)
		{
			TextDrawHideForPlayer(playerid, APKNAME[i]);
		}
		for(new i = 0; i < 13; i++)
		{
			TextDrawHideForPlayer(playerid, SpawnTD[i]);
		}
        TextDrawHideForPlayer(playerid, GPS);
	    TextDrawHideForPlayer(playerid, KONTAKTD);
		TextDrawHideForPlayer(playerid, AIRDROP);
		TextDrawHideForPlayer(playerid, GOJEK);
		TextDrawHideForPlayer(playerid, MBANKING);
		TextDrawHideForPlayer(playerid, TWITTER);
		TextDrawHideForPlayer(playerid, DARKWEB);
		TextDrawHideForPlayer(playerid, PLAYSTORE);
		TextDrawHideForPlayer(playerid, WHATSAPP);
		TextDrawHideForPlayer(playerid, CALL);
		TextDrawHideForPlayer(playerid, MUSIC);
		TextDrawHideForPlayer(playerid, SETTINGS);
		TextDrawHideForPlayer(playerid, KAMERA);
		TextDrawHideForPlayer(playerid, TUTUPHP);
		TextDrawHideForPlayer(playerid, JAMTD);
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == GPS)
	{
	    if(pData[playerid][pPhoneStatus] == 0)
		{
			return Error(playerid, "Handphone anda sedang dimatikan");
		}
  		callcmd::gps(playerid, "");
	}
	if(clickedid == MBANKING)
	{
  		ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, ""LB_E"I-Bank", "Masukan jumlah uang:", "Transfer", "Cancel");
	}
	if(clickedid == PLAYSTORE)
	{
		SCM(playerid, COLOR_RED, "INFORMASI: {00FFFF}Sistem ini telah di nonaktifkan oleh server.");
	}
	if(clickedid == SETTINGS)
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Setting", "Phone On\nPhone Off", "Select", "Back");
	}
	if(clickedid == KAMERA)
	{
		callcmd::selfie(playerid, "");
	}
	if(clickedid == MUSIC)
	{
		SCM(playerid, COLOR_RED, "INFORMASI: {00FFFF}Sistem ini telah di nonaktifkan oleh server.");
	}
	if(clickedid == GOJEK)
	{
	    if(pData[playerid][pPhoneStatus] == 0)
		{
			return Error(playerid, "Handphone anda sedang dimatikan");
		}
  		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		InfoMsg(playerid, "panggilan anda telah terkirim ke supir taksi.mohon menunggu respon !");
		pData[playerid][pCallTime] = gettime() + 60;
		foreach(new tx : Player)
		{
			if(pData[tx][pFaction] == 6)
			{
				SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "WHITE_E"%s calling the taxi for order! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
			}
		}
	}
	if(clickedid == DARKWEB)
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Setting", "Phone On\nPhone Off", "Select", "Back");
	}
	if(clickedid == TWITTER)
	{
		if(pData[playerid][pPhoneStatus] == 0)
			return Error(playerid, "Your phone must be powered on.");

		if(pData[playerid][pPhoneBook] == 0)
			return Error(playerid, "You dont have a phone book.");

		ShowContacts(playerid);
	}
	if(clickedid == KONTAKTD)
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_NEWCONTACT, DIALOG_STYLE_INPUT, "New Contact", "Please enter the name of thecontact below:", "Submit", "Back");
	}
	if(clickedid == WHATSAPP)
	{
	    if(pData[playerid][pPhoneStatus] == 0)
		{
			return Error(playerid, "Handphone anda sedang dimatikan");
		}
        ShowPlayerDialog(playerid, DIALOG_PHONE_SENDSMS, DIALOG_STYLE_INPUT, "Send Text Message", "Please enter the number that you wish to send a text message to:", "Dial", "Back");
	}
	if(clickedid == CALL)
	{
	    if(pData[playerid][pPhoneStatus] == 0)
		{
			return Error(playerid, "Handphone anda sedang dimatikan");
		}
  		ShowPlayerDialog(playerid, DIALOG_PHONE_DIALUMBER, DIALOG_STYLE_INPUT, "Dial Number", "Please enter the number that you wish to dial below:", "Dial", "Back");
	}
	return 1;
}

function SetPlayerCameraBehind(playerid)
{
	SetCameraBehindPlayer(playerid);
	//ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{7fffd4}Login Sukses - Kota Asia Pride", "{ffffff}Ingat ini adalah server Roleplay.\nMohon selalu beroleplay\n\nSilahkan Klik "YELLOW_E"SPAWN {ffffff} untuk mulai beroleplay\n\n\n"RED_E"Tambahan: {ffffff}server ini menggunakan "YELLOW_E"sistem voice only {ffffff} dilarang keras bisu atau tuli", "Spawn", "Tidak");
}

stock RefreshVModel(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, VModelTD[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, VModelTD[playerid]);
    return 1;
}

stock RefreshPSkin(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, PSkinStats[playerid], GetPlayerSkin(playerid));
	PlayerTextDrawShow(playerid, PSkinStats[playerid]);
    return 1;
}

//Paytax
GetBisnisPaytax(playerid)
{
	new tmpcount;
	foreach(new id : Bisnis)
	{
		if(!strcmp(pData[playerid][pName], bData[id][bOwner], true))
		{
	     	tmpcount++;
		}
	}
	return tmpcount;
}

ReturnBisnisPaytaxID(playerid, slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_BISNIS) return -1;
	foreach(new id : Bisnis)
	{
		if(!strcmp(pData[playerid][pName], bData[id][bOwner], true))
		{
		    tmpcount++;
		    if(tmpcount == slot)
		    {
		    	return id;
		  	}
		}
	}
	return -1;
}

GetHousesPaytax(playerid)
{
	new tmpcount;
	foreach(new hid : Houses)
	{
	    if(!strcmp(hData[hid][hOwner], pData[playerid][pName], true))
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnHousesPaytaxID(playerid, slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_HOUSES) return -1;
	foreach(new hid : Houses)
	{
		if(!strcmp(pData[playerid][pName], hData[hid][hOwner], true))
		{
		    tmpcount++;
		    if(tmpcount == slot)
		    {
		    	return hid;
		  	}
		}
	}
	return -1;
}

public OnPlayerSelectionMenuResponse(playerid, extraid, response, listitem, modelid)
{
	switch(extraid)
	{
		case SPAWN_SKIN_MALE:
		{
			if(response)
			{//tahap selanjutnya
				pData[playerid][pSkin] = modelid;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1.808619,32.384357,1199.593750, 270.0000, 0, 0, 0, 0, 0, 0);
				SetPlayerInterior(playerid, 1);
				SpawnPlayer(playerid);
				UpdatePlayerData(playerid);
				RefreshPSkin(playerid);
			}
		}
		case SPAWN_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pSkin] = modelid;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1.808619,32.384357,1199.593750, 270.0000, 0, 0, 0, 0, 0, 0);
				SetPlayerInterior(playerid, 1);
				SpawnPlayer(playerid);
				UpdatePlayerData(playerid);
				RefreshPSkin(playerid);
			}
		}
		case SHOP_SKIN_MALE:
	    {
	        if(response)
	        {
				new bizid = pData[playerid][pInBiz], price;
				price = bData[bizid][bP][0];
				pData[playerid][pSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				GivePlayerMoneyEx(playerid, -price);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
				bData[bizid][bProd]--;
				bData[bizid][bMoney] += Server_Percent(price);
				Server_AddPercent(price);
				
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
				mysql_tquery(g_SQL, query);

				Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
			else 
				return Servers(playerid, "Canceled buy skin");	
		}	
		case SHOP_SKIN_FEMALE:
	    {
			if(response)
			{
				new bizid = pData[playerid][pInBiz], price;
				price = bData[bizid][bP][0];
				pData[playerid][pSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				GivePlayerMoneyEx(playerid, -price);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
				bData[bizid][bProd]--;
				bData[bizid][bMoney] += Server_Percent(price);
				Server_AddPercent(price);
				
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
				mysql_tquery(g_SQL, query);

				Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
			else 
				return Servers(playerid, "Canceled buy skin");	
		}
		case VIP_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
				Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
			else 
				return Servers(playerid, "Canceled buy skin");
		}
		case VIP_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
				Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
			else 
				return Servers(playerid, "Canceled buy skin");
		}
		case SAPD_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAPD_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAPD_SKIN_WAR:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAGS_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAGS_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAMD_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SAMD_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SANA_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		case SANA_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}	
		}
		/*case TNI_SKIN_MALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
		}
		case TNI_SKIN_FEMALE:
		{
			if(response)
			{
				pData[playerid][pFacSkin] = modelid;
				SetPlayerSkin(playerid, modelid);
				Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
				RefreshPSkin(playerid);
			}
		}*/
		case TOYS_MODEL:
		{
			if(response)
			{
				new bizid = pData[playerid][pInBiz], price;
				price = bData[bizid][bP][1];
				
				GivePlayerMoneyEx(playerid, -price);
				if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
				pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
				pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
				new finstring[750];
				strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
				strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
				ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
				
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
				bData[bizid][bProd]--;
				bData[bizid][bMoney] += Server_Percent(price);
				Server_AddPercent(price);

				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
				mysql_tquery(g_SQL, query);
			}
			else 
				return Servers(playerid, "Canceled buy toys");
		}
		case VIPTOYS_MODEL:
		{
			if(response)
			{
				if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
				pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
				pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
				new finstring[750];
				strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
				strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
				ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
				
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
			}
			else
				return Servers(playerid, "Canceled toys");
		}
	}
	return 1;
}
;#### SAMP UDF R13 ####
; SAMP Version: 0.3.7
; Written by Chuck_Floyd 
; https://github.com/FrozenBrain
; Modified by Suchty112
; https://github.com/Suchty112
; Modified by: paul-phoenix
; https://github.com/paul-phoenix
; Modified by: Agrippa1994
; https://github.com/agrippa1994
; Modified by: Lezik and SCP
; Do not remove these lines.
; ####################

; ErrorLevels
global ERROR_OK                     := 0
global ERROR_PROCESS_NOT_FOUND      := 1
global ERROR_OPEN_PROCESS           := 2
global ERROR_INVALID_HANDLE         := 3
global ERROR_MODULE_NOT_FOUND       := 4
global ERROR_ENUM_PROCESS_MODULES   := 5
global ERROR_ZONE_NOT_FOUND         := 6
global ERROR_CITY_NOT_FOUND         := 7
global ERROR_READ_MEMORY            := 8
global ERROR_WRITE_MEMORY           := 9
global ERROR_ALLOC_MEMORY           := 10
global ERROR_FREE_MEMORY            := 11
global ERROR_WAIT_FOR_OBJECT        := 12
global ERROR_CREATE_THREAD          := 13

; GTA Addresses
global ADDR_ZONECODE                := 0xA49AD4      ;Player Zone
global ADDR_POSITION_X              := 0xB6F2E4      ;Player X Position
global ADDR_POSITION_Y              := 0xB6F2E8      ;Player Y Position
global ADDR_POSITION_Z              := 0xB6F2EC      ;Player Z Position
global ADDR_CPED_PTR                := 0xB6F5F0      ;Player CPED Pointer
global ADDR_CPED_HPOFF              := 0x540         ;Player Health
global ADDR_CPED_ARMOROFF           := 0x548         ;Player Armour
global ADDR_CPED_MONEY              := 0x0B7CE54     ;Player Money
global ADDR_CPED_INTID              := 0xA4ACE8      ;Player Interior-ID
global ADDR_CPED_SKINIDOFF          := 0x22          ;Player Skin-ID
;
global ADDR_VEHICLE_PTR             := 0xBA18FC      ;Vehicle CPED Pointer
global ADDR_VEHICLE_HPOFF           := 0x4C0         ;Vehicle Health
global ADDR_VEHICLE_DOORSTATE       := 0x4F8         ;Vehicle Door Status
global ADDR_VEHICLE_ENGINESTATE     := 0x428         ;Vehicle Engine Status
global ADDR_VEHICLE_LIGHTSTATE      := 0x584         ;Vehicle Light Status
global ADDR_VEHICLE_MODEL           := 0x22          ;Vehicle Car-ID & Car-Name
global ADDR_VEHICLE_TYPE            := 0x590         ;Vehicle Typ-ID (1 = Car)
global ADDR_VEHICLE_DRIVER          := 0x460         ;Vehicle Driver
global ADDR_VEHICLE_X               := 0x44          ;Vehicle Speed X
global ADDR_VEHICLE_Y               := 0x48          ;Vehicle Speed Y
global ADDR_VEHICLE_Z               := 0x4C          ;Vehicle Speed Z
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]

global ovehicleNames := ["а/м Landstalker","а/м Bravura","а/м Buffalo","а/м Linerunner","а/м Perrenial","а/м Sentinel","а/м Dumper","а/м Firetruck","а/м Trashmaster","а/м Stretch","а/м Manana","а/м Infernus","а/м Voodoo","Pony","Mool","а/м Cheetah","скорой","Левиафан","а/м Moonbeam","а/м Esperanto","такси","а/м Washington","а/м Bobcat","Хоуп","а/м BF Injection","Охотника","а/м Premier","Enforcer","Securicar","а/м Banshee","Predator","автобуса","танка","грузовика","а/м Hotknife","Trailer","а/м Previon","автобуса","такси","а/м Stallion","Rumpo","RC Bandit","а/м Romero","Packer","монстра","а/м Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","а/м Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","а/м Solair","Berkley'sRCVan","Skimmer","м/ц PCJ-600","мопеда","м/ц Freeway","RCBaron","RCRaider","а/м Glendale","а/м Oceanic","м/ц Sanchez","Sparrow","хаммера","квадроцикла","Coastguard","Dinghy","а/м Hermes","Sabre","Rustler","а/м ZR-350","а/м Walton","а/м Regina","а/м Comet","BMX","а/м Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","а/м Sandking","а/м Blista Compact","а/м Police Maverick","а/м Boxvillde","а/м Benson","а/м Mesa","RCGoblin","а/м Hotring Racer A","а/м Hotring Racer B","а/м Bloodring Banger","а/м Rancher","а/м Super GT","а/м Elegant","а/м Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","фуры","фуры","а/м Nebula","а/м Majestic","а/м Buccaneer","Shamal","Hydra","м/ц FCR-900","м/ц NRG-500","HPV1000","CementTruck","TowTruck","а/м Fortuna","а/м Cadrona","FBITruck","Willard","Forklift","Tractor","комбайна","а/м Feltzer","а/м Remington","а/м Slamvan","Blade","Freight","Streak","Vortex","а/м Vincent","а/м Bullet","а/м Clover","а/м Sadler","Firetruck","а/м Hustler","а/м Intruder","а/м Primo","а/м Cargobob","а/м Tampa","Sunrise","а/м Merit","Utility","а/м Nevada","а/м Yosemite","а/м Windsor","Монстра","Монстра","а/м Uranus","а/м Jester","а/м Sultan","а/м Stratum","а/м Elegy","Raindance","RCTiger","а/м Flash","а/м Tahoma","а/м Savanna","а/м Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","а/м Broadway","Tornado","AT-400","DFT-30","а/м Huntley","а/м Stafford","м/ц BF-400","фургона","Tug","Trailer","а/м Emperor","м/ц Wayfarer","а/м Euros","фургона-прилавка","а/м Club","FreightBox","а/м Trailer","а/м Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","а/м Picador","S.W.A.T","а/м Alpha","а/м Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]

global ovehicleNamesImpad := ["а/м Landstalker","а/м Bravura","а/м Buffalo","а/м Linerunner","а/м Perrenial","а/м Sentinel","а/м Dumper","а/м Firetruck","а/м Trashmaster","а/м Stretch","а/м Manana","а/м Infernus","а/м Voodoo","Pony","Mool","а/м Cheetah","скорой","Левиафан","а/м Moonbeam","а/м Esperanto","такси","а/м Washington","а/м Bobcat","Хоуп","а/м BF Injection","Охотник","а/м Premier","Enforcer","Securicar","а/м Banshee","Predator","автобус","танк","грузовик","а/м Hotknife","Trailer","а/м Previon","автобус","такси","а/м Stallion","Rumpo","RC Bandit","а/м Romero","Packer","монстр","а/м Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","а/м Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","а/м Solair","Berkley'sRCVan","Skimmer","м/ц PCJ-600","мопед","м/ц Freeway","RCBaron","RCRaider","а/м Glendale","а/м Oceanic","м/ц Sanchez","Sparrow","хаммер","квадроцикл","Coastguard","Dinghy","а/м Hermes","Sabre","Rustler","а/м ZR-350","а/м Walton","а/м Regina","а/м Comet","BMX","а/м Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","а/м Sandking","а/м Blista Compact","а/м Police Maverick","а/м Boxvillde","а/м Benson","а/м Mesa","RCGoblin","а/м Hotring Racer A","а/м Hotring Racer B","а/м Bloodring Banger","а/м Rancher","а/м Super GT","а/м Elegant","а/м Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","фура","фура","а/м Nebula","а/м Majestic","а/м Buccaneer","Shamal","Hydra","м/ц FCR-900","м/ц NRG-500","HPV1000","CementTruck","TowTruck","а/м Fortuna","а/м Cadrona","FBITruck","Willard","Forklift","Tractor","комбайн","а/м Feltzer","а/м Remington","а/м Slamvan","Blade","Freight","Streak","Vortex","а/м Vincent","а/м Bullet","а/м Clover","а/м Sadler","Firetruck","а/м Hustler","а/м Intruder","а/м Primo","а/м Cargobob","а/м Tampa","Sunrise","а/м Merit","Utility","а/м Nevada","а/м Yosemite","а/м Windsor","Монстра","Монстра","а/м Uranus","а/м Jester","а/м Sultan","а/м Stratum","а/м Elegy","Raindance","RCTiger","а/м Flash","а/м Tahoma","а/м Savanna","а/м Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","а/м Broadway","Tornado","AT-400","DFT-30","а/м Huntley","а/м Stafford","м/ц BF-400","фургон","Tug","Trailer","а/м Emperor","м/ц Wayfarer","а/м Euros","фургон-прилавок","а/м Club","FreightBox","а/м Trailer","а/м Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","а/м Picador","S.W.A.T","а/м Alpha","а/м Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]

global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]

global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]

global color11namecars :=["черно-", "бело-", "голубо-", "красно-", "серо-", "лилово-", "оранжево-", "голубо-", "серо-", "серо-", "сине-", "серо-", "голубо-", "серо-", "серо-", "серо-", "зелено-", "красно-", "красно-", "серо-", "сине-", "малиново-", "малиново-", "серо-", "серо-", "серо-", "серо-", "серо-", "сине-", "серо-", "коричнево-", "коричнево-", "голубо-", "серо-", "серо-", "серо-", "черно-", "черно-", "серо-", "голубо-", "коричнево-", "серо-", "красно-", "красно-", "зелено-", "красно-", "зелено-","серо-", "серо-", "серо-", "серо-", "зелено-", "серо-", "сине-", "сине-", "коричнево-", "серо-", "коричнево-", "красно-", "сине-", "серо-", "коричнево-", "красно-", "серо-", "серо-", "желто-", "коричнево-", "голубо-", "желто-", "розово-", "красно-", "голубо-", "серо-", "серо-", "коричнево-", "черно-", "серо-", "коричнево-", "красно-", "сине-", "красно-", "коричнево-", "красно-", "зелено-", "коричнево-", "красно-", "зелено-", "голубо-", "красно-", "серо-", "светло-серо-", "сине-", "серо-", "голубо-", "сине-", "сине-", "серо-", "серо-", "серо-", "коричнево-", "серо-", "сине-", "коричнево-", "сине-", "коричнево-", "серо-", "голубо-", "серо-", "голубо-", "серо-", "коричнево-", "серо-", "голубо-", "коричнево-", "зелено-", "малиново-", "сине-", "красно-", "серо-", "коричнево-", "коричнево-", "красно-", "серо-", "желто-", "малиново-", "сине-", "розово-"]

global color12namecars := ["салатовый", "шоколадный", "голубой", "горчичный", "кремово-розовый", "черный", "фиолетовый", "светло-голубой", "лиловый", "ярко-салатовый", "бежевый", "лилово-фиолетовый", "молочный", "кремовый", "желтый", "пудровый", "лилово-пудровый", "бледно-салатовый", "бледно-розовый", "розовый", "серый", "серо-коричневый", "серый", "серо-салатовый", "голубой", "хакки", "светло-салатовый", "серо-голубой", "песочный", "светло-серый", "кирпичный", "коричневый", "темно-зеленый", "персиково-розовый", "темно-голубой", "морская волна", "темно-серый", "серо-голубой", "бледно-голубой", "фиалковый", "светлый шоколад", "бледно-лиловый", "бледно-пурпурный", "пурпурный", "грязный зеленый", "светлый шоколад", "светло-коричневый", "яркий персиковый", "бледно-фиолетовый", "бледно-пудровый", "бледно-розовый", "ягодный", "светло-горчичный", "темный персиковый", "темный бежевый", "светло-кирпичный", "бледно-розовый", "светло-серый","темно-зеленый", "зеленый", "светло-зеленый", "серо-зеленый", "чайная роза", "бледно-салатовый", "молочный", "белый", "яркожелтый", "бледно-желтый", "белый", "яичный", "серо-голубой", "хакки", "кремовый", "серо-синий", "серо-зеленый", "темно-серый", "металлик", "черно-синий", "черно-серый", "серый", "сизый", "серо-голубой", "темный серо-голубой", "фиолетовый", "кирпичный", "молочный", "желто-зеленый", "темный зеленый", "бежевый", "светло-голубой", "персиковый", "светло-оранжевый", "истинный розовый", "светло-желтый", "персиково-оранжевый", "темно-синий", "светлый шоколад", "хакки", "салатовый", "темно-зеленый", "кремово-желтый", "зеленый", "сливовый", "грязно-желтый", "лилово-розовый", "светло-малиновый", "темно-зеленый", "серо-зеленый", "темно-серый", "пудровый", "песочный", "кирпичный", "голубой", "желто-салатовый", "темно-малиновый", "бледно-зеленый", "шоколадный", "темно-зеленый", "серо-голубой", "серый", "светлый шоколад", "вишневый", "молочный", "светло-серый", "серый", "слоновая кость", "кремово-серый", "серо-синий"]

global color21namecars :=["черный", "белый", "голубой", "красный", "темно-серый", "лиловый", "оранжевый", "серо-голубой", "светло-серый", "серый", "серо-синий", "серый", "серо-голубой", "серый", "светло-серый", "светло-серый", "зеленый", "вишневый", "темно-малиновый", "светло-серый", "серо-синий", "бледно малиновый", "темно-малиновый", "светло-серый", "серый", "темно-серый", "светло-серый", "серый", "серо-синий", "светло-серый", "темно-коричневый", "коричневый", "светло-голубой", "серый", "серый", "серый", "темно-серый", "серо-зеленый", "сизый", "серо-голубой", "темно-коричневый", "серый", "бледно вишневый", "вишневый", "темно-зеленый", "коричнево-вишневый", "светлый хаки","серый", "светло-серый", "светло-серый", "серый", "зелено-голубой", "серый", "синий", "бледносиний", "какао", "светло-серый", "светлый хаки", "темно-вишневый", "серо-голубой", "светло-серый", "темный песочный", "темно-малиновый", "серый", "серый", "бледно салатовый", "темно коричневый", "серо-голубой", "светлый хаки", "какао с молоком", "бледно вишневый", "голубой", "темно-серый", "светло-серый", "темно-коричневый", "темно-синий", "светло-серый", "светлый хакки", "бледный вишневый", "синий", "бледно-малиновый", "мокко", "темно-вишневый", "темно-зеленый", "молочный шоколад", "малиновый", "светло-зеленый", "голубой", "бледновишневый", "светлый хакки", "светло-серый", "серо-синий", "серый", "голубой", "светло-сииний", "синий", "светло-серый", "серый", "темно-серый", "светлый хакки", "голубой", "темно-синий", "светлый хакки", "синий", "мокко", "серый", "темно-голубой", "песочный", "голубой", "темно-серый", "какао", "светло-серый", "голубой", "шоколадный", "хакки", "малиновый", "синий", "вишневый", "светло-серый", "какао", "мокко", "темно-вишневый", "темно-серый", "горчичный", "темно-малиновый", "синий", "розовый"]

global color22namecars := ["салатовый", "шоколадный", "голубой", "горчичный", "кремово-розовый", "черный", "фиолетовый", "светло-голубой", "лиловый", "ярко-салатовый", "бежевый", "лилово-фиолетовый", "молочный", "кремовый", "желтый", "пудровый", "лилово-пудровый", "бледно-салатовый", "бледно-розовый", "розовый", "серый", "серо-коричневый", "серый", "серо-салатовый", "голубой", "хакки", "светло-салатовый", "серо-голубой", "песочный", "светло-серый", "кирпичный", "коричневый", "темно-зеленый", "персиково-розовый", "темно-голубой", "морская волна", "темно-серый", "серо-голубой", "бледно-голубой", "фиалковый", "светлый шоколад", "бледно-лиловый", "бледно-пурпурный", "пурпурный", "грязный зеленый", "светлый шоколад", "светло-коричневый", "яркий персиковый", "бледно-фиолетовый", "бледно-пудровый", "бледно-розовый", "ягодный", "светло-горчичный", "темный персиковый", "темный бежевый", "светло-кирпичный", "бледно-розовый", "светло-серый","темно-зеленый", "зеленый", "светло-зеленый", "серо-зеленый", "чайная роза", "бледно-салатовый", "молочный", "белый", "яркожелтый", "бледно-желтый", "белый", "яичный", "серо-голубой", "хакки", "кремовый", "серо-синий", "серо-зеленый", "темно-серый", "металлик", "черно-синий", "черно-серый", "серый", "сизый", "серо-голубой", "темный серо-голубой", "фиолетовый", "кирпичный", "молочный", "желто-зеленый", "темный зеленый", "бежевый", "светло-голубой", "персиковый", "светло-оранжевый", "истинный розовый", "светло-желтый", "персиково-оранжевый", "темно-синий", "светлый шоколад", "хакки", "салатовый", "темно-зеленый", "кремово-желтый", "зеленый", "сливовый", "грязно-желтый", "лилово-розовый", "светло-малиновый", "темно-зеленый", "серо-зеленый", "темно-серый", "пудровый", "песочный", "кирпичный", "голубой", "желто-салатовый", "темно-малиновый", "бледно-зеленый", "шоколадный", "темно-зеленый", "серо-голубой", "серый", "светлый шоколад", "вишневый", "молочный", "светло-серый", "серый", "слоновая кость", "кремово-серый", "серо-синий"]

global IdInCar := -1
global NumberPre := 0
global rejim :=1
global oVehiclePoolData := []
global rmaddrs := [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global CheckpointCheck := 0xC7DEEA

; SAMP Addresses
global ADDR_SAMP_INCHAT_PTR             := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF         := 0x55
global ADDR_SAMP_USERNAME               := 0x219A6F
global FUNC_SAMP_SENDCMD                := 0x65c60
global FUNC_SAMP_SENDSAY                := 0x57f0
global FUNC_SAMP_ADDTOCHATWND           := 0x64520
global ADDR_SAMP_CHATMSG_PTR            := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT           := 0x9c2c0
global FUNC_SAMP_SHOWDIALOG             := 0x6B9C0
global ADDR_SAMP_SHOWDLG_PTR            := 0x21a0b8
global FUNC_SAMP_PLAYAUDIOSTR           := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR           := 0x629a0
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004

; Sizes
global SIZE_SAMP_CHATMSG := 0xFC
; Internal
global hGTA := 0x0
global dwGTAPID := 0x0
global dwSAMP := 0x0
global pMemory := 0x0
global pParam1 := 0x0
global pParam2 := 0x0
global pParam3 := 0x0
global pParam4                         := 0x0
global pParam5                         := 0x0
global pInjectFunc := 0x0
global nZone := 1
global nCity := 1
global bInitZaC := 0
global bInitZaC2 := 0
global iRefreshScoreboard := 0
global oScoreboardData := ""
global iRefreshHandles := 0
global iUpdateTick := 2500 ;time in ms, used for getPlayerNameById etc. to refresh data


; ###############################################################################################################################
; # 														                                                                    #
; # SAMP-Funktionen:                                                                                                            #
; #     - IsSAMPAvailable()                         Pruft, ob man in den Chat schreiben kann & ob GTA geladen ist               #
; #     - isInChat()                                Pruft, ob der Spieler gerade chattet oder in einem Dialog ist               #
; #     - getUsername()                             Liest den Namen des Spielers aus                                            #
; #     - getId()                                   Liest die Id des Spielers aus                                               #
; #	    - getSkinID()   	                        Выдаёт ID Скина вашего персоажа                                             #
; #     - SendChat(wText)                           Sendet eine Nachricht od. einen Befehl direkt an den Server                 #
; #     - addChatMessage(wText)                     Fugt eine Zeile in den Chat ein (nur fur den Spieler sichtbar)              #
; #     - showGameText(wText, dwTime, dwTextsize)   Zeigt einen Text inmitten des Bildschirmes an  					            #
; #     - showDialog(dwStyle, wCaption, wInfo, wButton1) Zeigt einen Dialog an					 	                            #
; #     - playAudioStream(wUrl)                     Spielt einen "Audio Stream" ab                                              #
; #     - stopAudioStream()                         Stoppt den aktuellen Audio Stream                                           #
; #	    - GetChatLine(Line, Output)		            Liest die eingestellte Zeile aus,				                            #
; #						                            Optionale Parameter (timestamp=0, color=0)			                        #
; # 	- blockChatInput() 							Eine Funktion um Messages zum Server zu blockieren			                #
; # 	- unBlockChatInput() 						Eine Funktion um Messages zum Server zu entblockieren			            #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - getServerName()                           Ermittelt den Server-Namen (HostName)  										#
; #     - getServerIP()                             Ermittelt die IP des Servers  										        #
; #     - getServerPort()                           Ermittelt den Port des Servers  										    #
; #     - CountOnlinePlayers()                      Ermittelt wie viele Spieler auf dem Server Online sind.                     #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #	    - getWeatherID()			                Ermittelt ob der Spieler freezed ist                                        #
; #	    - getWeatherName()			                Ermittelt ob der Spieler freezed ist                                        #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - patchRadio() (interner stuff) 										                                                #
; #     - unPatchRadio() (interner stuff)											                                            #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Extra-Player-Funktionen:                                                                                                    #
; #	    - getTargetPed(dwPED)   			        Zeigt die PED-ID, des Spielers, auf den man zielt.                          #
; #     - getPedById(dwId)                          Zeigt die PED-Id zu der Id.                                                 #
; #     - getIdByPed(dwId)                          Zeigt die Id der PED-Id.                                                    #
; #     - getStreamedInPlayersInfo()                Zeigt Informationen uber die gestreamten Spieler.                           #
; #     - callFuncForAllStreamedInPlayers()         Fuhrt bestimmte Funktionen, fur die gestreamten Spieler aus.                #
; #	    - getDist(pos1,pos2)   			            Rechnet den Abstand zwischen zwei Positionen aus.                           #
; #     - getClosestPlayerPed()                     Zeigt die PED-ID, des Spielers, der am nahesten zu einem steht.             #
; #     - getClosestPlayerId()                      Zeigt die Id, des Spielers, der am nahesten zu einem steht.                 #
; #	    - getPedCoordinates(dwPED)   			    Zeigt die Koordinaten, der PED-ID.                                          #
; #     - getTargetPosById(dwId)                    Zeigt die Position, zu der angegebenen Id.                                  #
; #     - getTargetPlayerSkinIdByPed(dwPED)         Zeigt den Skin, zu der angegebenen PED-ID.                                  #
; #     - getTargetPlayerSkinIdById(dwId)           Zeigt den Skin, zu der angegebenen ID.                                      #
; #     - calcScreenCoors(fX,fY,fZ)                 > WordToScreen Funktion <                                                   #
; # 														                                                                    #
; # Extra-Player-Fahrzeug-Funktionen:                                                                                           #
; #	    - getVehiclePointerByPed(dwPED)   			Zeigt die PED-ID des Autos.                                                 #
; #	    - getVehiclePointerById(dwId)   			Zeigt die PED-ID des Autos.                                                 #
; #     - isTargetInAnyVehicleByPed(dwPED)          Zeigt ob der Spieler in einem Auto ist.                                     #
; #     - isTargetInAnyVehicleById(dwId)            Zeigt ob der Spieler in einem Auto ist.                                     #
; #     - getTargetVehicleHealthByPed(dwPED)        Zeigt ob der Spieler in einem Auto ist.                                     #
; #     - getTargetVehicleHealthById(dwId)          Zeigt ob der Spieler in einem Auto ist.                                     #
; #     - getTargetVehicleTypeByPed(dwPED)          Ermittelt den FahrzeugTyp (Auto, LKW etc.)                                  #
; #     - getTargetVehicleTypeById(dwId)            Ermittelt den FahrzeugTyp (Auto, LKW etc.)                                  #
; #     - getTargetVehicleModelIdByPed(dwPED)       Ermittelt die Fahrzeugmodell ID                                             #
; #     - getTargetVehicleModelIdById(dwId)         Ermittelt die Fahrzeugmodell ID                                             #
; #     - getTargetVehicleModelNameByPed(dwPED)     Ermittelt den Fahrzeugmodell Namen 				                            #
; #     - getTargetVehicleModelNameById(dwId)       Ermittelt den Fahrzeugmodell Namen 				                            #
; #     - getTargetVehicleLightStateByPed(dwPED)    Ermittelt den Lichtzustand des Autos 			                            #
; #     - getTargetVehicleLightStateById(dwId)      Ermittelt den Lichtzustand des Autos 			                            #
; #     - getTargetVehicleEngineStateByPed(dwPED)   Ermittelt den Motorzustand des Autos 			                            #
; #     - getTargetVehicleEngineStateById(dwId)     Ermittelt den Motorzustand des Autos 			                            #
; #     - getTargetVehicleLockStateByPed(dwPED)     Ermittelt ob das Auto auf oder zu ist 			                            #
; #     - getTargetVehicleLockStateById(dwId)       Ermittelt ob das Auto auf oder zu ist 			                            #
; #     - getTargetVehicleColor1ByPed(dwPED)        Ermittelt die 1. Color-ID des Autos 			                            #
; #     - getTargetVehicleColor1ById(dwId)          Ermittelt die 1. Color-ID des Autos 			                            #
; #     - getTargetVehicleColor2ByPed(dwPED)        Ermittelt die 2. Color-ID des Autos 			                            #
; #     - getTargetVehicleColor2ById(dwId)          Ermittelt die 2. Color-ID des Autos 			                            #
; #     - getTargetVehicleSpeedByPed(dwPED)         Ermittelt die Geschwindigkeit des Autos			                            #
; #     - getTargetVehicleSpeedById(dwId)           Ermittelt die Geschwindigkeit des Autos			                            #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Scoreboard-Funktionen:                                                                                                      #
; #     - getPlayerScoreById(dwId)                  Zeigt den Score zu der Id                                                   #
; #     - getPlayerPingById(dwId)                   Zeigt den Ping zu der Id                                                    #
; #     - getPlayerNameById(dwId)                   Zeigt den Namen zu der Id                                                   #
; #     - getPlayerIdByName(wName)                  Zeigt die Id zu dem Namen                                                   #
; #     - updateScoreboardDataEx()                  Aktualisiert Scoreboard Inhalte (wird implizit aufgerufen)                  #
; #     - updateOScoreboardData()                   Aktualisiert Scoreboard Inhalte (wird implizit aufgerufen)                  #
; #	    - isNPCById(dwId)   			            Zeigt an ob die ID ein NPC 						                            #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Spielerfunktionen:                                                                                                          #
; #     - getPlayerHealth()                         Ermittelt die HP des Spielers                                               #
; #     - getPlayerArmour()                         Ermittelt den Rustungswert des Spielers                                     #
; # 	- getPlayerInteriorId()			            Ermittelt die Interior ID wo der Spieler ist 		                        #
; # 	- getPlayerSkinId()			                Ermittelt die Skin ID des Spielers           		                        #
; # 	- getPlayerMoney() 			                Ermittelt den Kontostand des Spielers (nur GTA Intern)                      #
; #	    - getPlayerWanteds()			            Ermittelt die Wantedanzahl des Spielers (nur bis 6 Wanteds)                 #
; #	    - getPlayerWeaponId()			            Ermittelt die Waffen ID des Spielers                                        #
; #	    - getPlayerWeaponName()			            Ermittelt den Namen, der Waffe des Spielers                                 #
; #	    - getPlayerState()			                Ermittelt den "Status" des Spielers (Zu Fu?, Fahrer, Tot)                   #
; #	    - getPlayerMapPosX()			            Ermittelt die X-Position auf der Map im Menu                                #
; #	    - getPlayerMapPosY()			            Ermittelt die Y-Position auf der Map im Menu                                #
; #	    - getPlayerMapZoom()			            Ermittelt den Zoom auf der Map im Menu                                      #
; #	    - IsPlayerFreezed()			                Ermittelt ob der Spieler freezed ist                                        #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Fahrzeugfunktionen:                                                                                                         #
; #     - isPlayerInAnyVehicle()                    Ermittelt, ob sich der Spieler in einem Fahrzeug befindet                   #
; #     - getVehicleHealth()                        Ermittelt die HP des Fahrzeugs, in dem der Spieler sitzt                    #
; # 	- isPlayerDriver() 			                Ermittelt ob der Spieler Fahrer des Auto's ist		                        #
; # 	- getVehicleType() 			                Ermittelt den FahrzeugTyp (Auto, LKW etc.)                                  #
; # 	- getVehicleModelId()			            Ermittelt die Fahrzeugmodell ID 				                            #
; # 	- getVehicleModelName() 		            Ermittelt den Fahrzeugmodell Namen 				                            #
; # 	- getVehicleLightState() 		            Ermittelt den Lichtzustand des Autos 			                            #
; # 	- getVehicleEngineState() 		            Ermittelt den Motorzustand des Autos 			                            #
; # 	- getVehicleLockState() 		            Ermittelt ob das Auto auf oder zu ist 			                            #
; # 	- getVehicleColor1() 		                Ermittelt die 1. Farb ID des Autos   			                            #
; # 	- getVehicleColor2() 		                Ermittelt die 2. Farb ID des Autos   			                            #
; # 	- getVehicleSpeed() 		                Ermittelt die Geschwindigkeit des Autos   			                        #
; #     - getIdsInAnyVehicle()                      Выдает кто с вами в автомобиле                                              #
; # 	- getPlayerRadiostationID() 		        Ermittelt die Radiostation-ID des Autos   			                        #
; # 	- getPlayerRadiostationName() 		        Ermittelt den Radiostation-Namen des Autos   			                    #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Standpunktbestimmung:                                                                                                       #
; #     - getCoordinates()                          Ermittelt die aktuelle Position (Koordinaten)                               #
; #	    - getPlayerPos(X,Y,Z) 			            siehe oben druber 						                                    #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - initZonesAndCities()                      Initialisiert eine Liste aller Standartgebiete                              #
; #                                                 (Voraussetzung fur die folgenden Funktionen dieser Kategorie)               #
; #     - calculateZone(X, Y, Z)                    Bestimmt die Zone (= Stadtteil) aus den geg. Koordinaten                    #
; #     - calculateCity(X, Y, Z)                    Bestimmt die Stadt aus den geg. Koordinaten                                 #
; #     - getCurrentZonecode()                      Ermittelt die aktulle Zone in Kurzform                                      #
; #     - AddZone(Name, X1, Y1, Z1, X2, Y2, Z2)     Fugt eine Zone zum Index hinzu                                              #
; #     - AddCity(Name, X1, Y1, Z1, X2, Y2, Z2)	    Fugt eine Stadt zum Index hinzu 
; #	- AddPost(Name, X1, Y1, Z1, X2, Y2, Z2)     Fugt eine Post zum Index hinzu                                             
; #	    - IsPlayerInRangeOfPoint(X, Y, Z, Radius)   Bestimmt ob der Spieler in der Nahe der Koordinaten ist                     #
; #	    - IsIsPlayerInRangeOfPoint2D(X, Y, Radius)  Bestimmt ob der Spieler in der Nahe der Koordinaten ist                     #
; #	    - getPlayerZone()                   				                                                                    #
; #	    - getPlayerCity()                   					                                                                #
; # 														                                                                    #
; ###############################################################################################################################
; # Sonstiges:                                                                                                                  #
; #     - checkHandles()                                                                                                        #
; ###############################################################################################################################
; # Speicherfunktionen (intern genutzt):                                                                                        #
; # Memory Functions:                                                                                                           #
; # - checkHandles()                                                                                                            #
; # - refreshGTA()                                                                                                              #
; # - refreshSAMP()                                                                                                             #
; # - refreshMemory()                                                                                                           #
; # - getPID(szWindow)                                                                                                          #
; # - openProcess(dwPID, dwRights)                                                                                              #
; # - closeProcess(hProcess)                                                                                                    #
; # - getModuleBaseAddress(sModule, dwPID)                                                                                      #
; # - readString(hProcess, dwAddress, dwLen)                                                                                    #
; # - readFloat(hProcess, dwAddress)                                                                                            #
; # - readDWORD(hProcess, dwAddress)                                                                                            #
; # - readMem(hProcess, dwAddress, dwLen=4, type="UInt")                                                                        #
; # - writeString(hProcess, dwAddress, wString)                                                                                 #
; # - writeRaw(hProcess, dwAddress, data, dwLen)                                                                                #
; # - Memory_ReadByte(process_handle, address)                                                                                  #
; # - callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true)                                                           #
; # - virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect)                                                             #
; # - virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType)                                                                    #
; # - createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter,                                #
; # - dwCreationFlags, lpThreadId)                                                                                              #
; # - waitForSingleObject(hThread, dwMilliseconds)                                                                              #
; # - __ansiToUnicode(sString, nLen = 0)                                                                                        #
; # - __unicodeToAnsi(wString, nLen = 0)                                                                                        #
; ###############################################################################################################################

; ###############################################################################################################################
; # SAMP Dialog Funktionen (v0.3.7):																	                        #
; # --------------------------------------------------------------------------------------------------------------------------- #
; #     - setDialogIndex(index) - Выбрать пункт диалога
; #	- isDialogOpen() - PrГјft, ob gerade ein Dialog angezeigt wird (gibt true oder false zurГјck)	                       		#
; #	- getDialogStyle() - Liest den Typ des (zuletzt) angezeigten Dialogs aus (0-5)                      						#
; #	- getDialogID() - Liest die ID des (zuletzt) angezeigten Dialogs aus (auch vom Server)	                        			#
; #	- setDialogID(id) - Setzt die ID des (zuletzt) angezeigten Dialogs auf [id]				                        			#
; #	- getDialogIndex() - Liest die (zuletzt) ausgewГ¤hlte Zeile des Dialogs aus 				                        		#
; #	- getDialogCaption() - Liest die Гњberschrift des (zuletzt) angezeigten Dialogs aus 			                       		#
; #	- getDialogText() - Liest den Text des (zuletzt) angezeigten Dialogs aus (auch bei Listen)                              	#
; #	- getDialogLineCount() - Liest die Anzahl der Zeilen/Items des (zuletzt) angezeigten Dialogs aus                        	#
; #	- getDialogLine(index) - Liest die Zeile an der Stelle [index] mittels getDialogText aus 		                        	#
; #	- getDialogLines() - Liest die Zeilen mittels getDialogText aus (gibt ein Array zurГјck)			                      	#
; #	- isDialogButton1Selected() - Проверка, выбрана ли кнопка 1 диалога						                       	            #
; # - getDialogStructPtr() - Читает базовый указатель на структуру диалога (используется внутренне)                             #
; # - getDialogLineNumber() - Определяет выбраную строку в диалоге                                                              #
; #																									                        	#
; #	- showDialog(style, caption, text, button1, button2, id) - Zeigt einen Dialog an (nur lokal)	                        	#
; ###############################################################################################################################

; ##### SAMP-Funktionen #####

IsSAMPAvailable() {
    if(!checkHandles())
        return false
	
	dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
	
	if(dwChatInfo == 0 || dwChatInfo == "ERROR")
	{
		return false
	}
	else
	{
		return true
	}
}

isInChat() {
    if(!checkHandles())
        return -1
    
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}

getUsername() {
    if(!checkHandles())
        return ""
    
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return sUsername
}

getId() {
    s := getUsername()
    return getPlayerIdByName(s)
}


SendChat(wText) {
     wText := "" wText
    
    if(!checkHandles())
        return false
    
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    }
    
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    
    ErrorLevel := ERROR_OK
    return true
}

addChatMessage(wText) {
    wText := "" wText

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

showGameText(wText, dwTime, dwSize) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwSize += 0
    dwSize := Floor(dwSize)

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
    
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
    
    ErrorLevel := ERROR_OK
    return true
}

showDialog(dwStyle, wCaption, wInfo, wButton1 ) {
    dwStyle += 0
    dwStyle := Floor(dwStyle)
    wCaption := "" wCaption
    wInfo := "" wInfo
    wButton1 := "" wButton1
    
    if(dwStyle<0 || dwStyle>5 || StrLen(wCaption)>=64 || StrLen(wInfo)>=4096 || StrLen(wButton1)>10)
        return false

    if(!checkHandles())
        return false
    
    
    dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
    
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_SHOWDLG_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    writeString(hGTA, pParam5, wCaption)
    if(ErrorLevel)
        return false
    writeString(hGTA, pParam1, wInfo)
    if(ErrorLevel)
        return false
    writeString(hGTA, pParam5+512, wButton1)
    if(ErrorLevel)
        return false
    
    ;mov + 7*push + call + retn
    dwLen := 5 + 7*5 + 5 + 1
    
    
    VarSetCapacity(injectData, dwLen, 0)
    
    NumPut(0xB9, injectData, 0, "UChar")        ;0 + 1        ;mov ecx
    NumPut(dwAddress, injectData, 1, "UInt")    ;1 + 4
    NumPut(0x68, injectData, 5, "UChar")        ;5 + 1        ;push 0
    NumPut(0, injectData, 6, "UInt")            ;6 + 4
    NumPut(0x68, injectData, 10, "UChar")        ;10 + 1        ;push 0
    NumPut(pParam5+StrLen(wCaption), injectData, 11, "UInt")            ;11 + 4
    NumPut(0x68, injectData, 15, "UChar")        ;15 + 1        ;push button1
    NumPut(pParam5+512, injectData, 16, "UInt")        ;16 + 4
    NumPut(0x68, injectData, 20, "UChar")        ;20 + 1        ;push info
    NumPut(pParam1, injectData, 21, "UInt")        ;21 + 4
    NumPut(0x68, injectData, 25, "UChar")        ;25 + 1        ;push caption
    NumPut(pParam5, injectData, 26, "UInt")        ;26 + 4
    NumPut(0x68, injectData, 30, "UChar")        ;30 + 1        ;push style
    NumPut(dwStyle, injectData, 31, "UInt")        ;31 + 4
    NumPut(0x68, injectData, 35, "UChar")        ;35 + 1        ;push 1
    NumPut(1, injectData, 36, "UInt")            ;36 + 4
    
    NumPut(0xE8, injectData, 40, "UChar")        ;40 + 1     ;call
    offset := dwFunc - (pInjectFunc + 45)
    NumPut(offset, injectData, 41, "Int")        ;41 + 4
    NumPut(0xC3, injectData, 45, "UChar")        ;45 + 1        ;retn
    
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

playAudioStream(wUrl) {
    wUrl := "" wUrl
    
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    
    patchRadio()
    
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    
    unPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

stopAudioStream() {
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    
    patchRadio()
    
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    
    unPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

patchRadio()
{
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}

unPatchRadio()
{
    if(!checkHandles())
        return false
    
    VarSetCapacity(old, 4, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}

blockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

unBlockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

getServerName() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerName := readString(hGTA, dwAdress + 0x121, 200)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerName
}

getServerIP() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerIP := readString(hGTA, dwAdress + 0x20, 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerIP
}

getServerPort() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerPort
}

getWeatherID() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    WeatherID := readMem(hGTA, dwGTA + 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return WeatherID
}

getWeatherName() {
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}

; ##### Extra-Player-Funktionen #####

getTargetPed() {
	if(!checkHandles())
        return 0
	
	dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	if(!dwAddress)
		return 0
		
	dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	
	ErrorLevel := ERROR_OK
	return dwAddress
}

calcScreenCoors(fX,fY,fZ)
{
	if(!checkHandles())
		return false
	
	dwM := 0xB6FA2C
	
	m_11 := readFloat(hGTA, dwM + 0*4)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	m_12 := readFloat(hGTA, dwM + 1*4)
	m_13 := readFloat(hGTA, dwM + 2*4)
	m_21 := readFloat(hGTA, dwM + 4*4)
	m_22 := readFloat(hGTA, dwM + 5*4)
	m_23 := readFloat(hGTA, dwM + 6*4)
	m_31 := readFloat(hGTA, dwM + 8*4)
	m_32 := readFloat(hGTA, dwM + 9*4)
	m_33 := readFloat(hGTA, dwM + 10*4)
	m_41 := readFloat(hGTA, dwM + 12*4)
	m_42 := readFloat(hGTA, dwM + 13*4)
	m_43 := readFloat(hGTA, dwM + 14*4)
	
	dwLenX := readDWORD(hGTA, 0xC17044)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	dwLenY := readDWORD(hGTA, 0xC17048)
	
	frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
	frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
	frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
	
	fRecip := 1.0/frZ
	frX *= fRecip * dwLenX
	frY *= fRecip * dwLenY
    
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
        return [frX,frY,frZ]
}

getPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return 0
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
                return oScoreboardData[dwId].PED
        }
        return 0
    }
    
    if(!updateOScoreboardData())
        return 0
    
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
    }
    return 0
}

getIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
	if(!dwPed)
		return -1
	
	if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
		For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
				if(o.PED==dwPed)
					return i
            }
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
	For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
			if(o.PED==dwPed)
				return i
        }
    }
    return -1
}

getStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := getPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    
    if(!updateOScoreboardData())
        return ""
    
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := getPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}

callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
        return false
    p := getStreamedInPlayersInfo()
    if(!p)
        return false
    if(dist<0x7fffffff)
    {
        lpos := getCoordinates()
        if(!lpos)
            return false
        For i, o in p
        {
            if(dist>getDist(lpos,o.POS))
                %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
            %cfunc%(o)
    }
    return true
}

getDist(pos1,pos2) {
	if(!pos1 || !pos2)
		return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}

getClosestPlayerPed() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := getPedById(id)
    return PED
}

getClosestPlayerId() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {   

        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}


getClosestPlayerId1() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
       { 
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
}
    }
    return id
}




getClosestPlayerId2() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
       { 
        t:=getDist(lpos,o.POS)
        if(t<dist and t<100)
        {
            dist := t
            id := i
        }
}
    }
    return id
}





CountOnlinePlayers() {
if(!checkHandles())
return -1
dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwOnline + 0x4
OnlinePlayers := readDWORD(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return OnlinePlayers
}

getPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return ""
    
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
    
}

getTargetPos(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
			if(oScoreboardData[dwId].HasKey("PED"))
				return getPedCoordinates(oScoreboardData[dwId].PED)
			if(oScoreboardData[dwId].HasKey("MPOS"))
				return oScoreboardData[dwId].MPOS
		}
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
    {
		if(oScoreboardData[dwId].HasKey("PED"))
			return getPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
    return ""
}

; get the id of your skin
getSkinID() {
	if(!checkHandles())
		return -1

	dwAddress := readDWORD(hGTA, 0xB6F3B8)

	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	id := readMem(hGTA, dwAddress + 0x22, 2, "UShort")
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	ErrorLevel := ERROR_OK
	return id
}

getTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

getTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
        return -1
    
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

; ##### Extra-Player-Fahrzeug-Funktionenn #####

getVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return 0
	if(!checkHandles())
        return 0
	dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

getVehiclePointerById(dwId) {
    if(!dwId)
        return 0
	if(!checkHandles())
        return 0
    
    dwPed_By_Id := getPedById(dwId)
    
	dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

isTargetInAnyVehicleByPed(dwPED)
{
    if(!checkHandles())
        return -1
    
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

isTargetInAnyVehiclebyId(dwId)
{
    if(!checkHandles())
        return -1
    
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

getTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := getVehiclePointerByPed(dwPed)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getTargetVehicleHealthById(dwId) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := getVehiclePointerById(dwId)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getTargetVehicleTypeById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleModelNameByPed(dwPED) {
    id := getTargetVehicleModelIdByPed(dwPED)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

getTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

getTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

getTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

getTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

getTargetVehicleColor1byPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor1byId(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor2byPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor2byId(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleSpeedByPed(dwPED) {
    if(!checkHandles())
        return -1
 
    dwAddr := getVehiclePointerByPed(dwPED)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhoht bzw. verringert
 
	return fVehicleSpeed
}

getTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
        return -1
 
    dwAddr := getVehiclePointerById(dwId)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhoht bzw. verringert
 
	return fVehicleSpeed
}
; ##### Scoreboard-Funktionen #####

getPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].NAME
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
    return ""
}

getPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
                return i
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
            return i
    }
    return -1
}

getPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].SCORE
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
    return ""
}

getPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
        
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].PING
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
    return -1
}

isNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].ISNPC
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
    return -1
}

connect(IP) {
    setIP(IP)
    restartGameEx()
    disconnectEx()
    Sleep 1000
    setrestart()
    Return
}
; Смена Ip Сервера
setIP(IP) {
    if(!checkHandles())
        return False

    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }

    writeString(hGTA, dwAddress + SAMP_SZIP_OFFSET, IP)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }

    return True
}
restartGameEx() {

	if(!checkHandles())
		return -1

	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwFunc := dwSAMP + 0xA060

	VarSetCapacity(injectData, 11, 0) ;mov, call, retn

	NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(dwAddress, injectData, 1, "UInt")			;1+4
	NumPut(0xE8, injectData, 5, "UChar")	;call 		5+1
	offset := dwFunc - (pInjectFunc + 10)
	NumPut(offset, injectData, 6, "Int")	;			6+4
    NumPut(0xC3, injectData, 10, "UChar")	;		10+1

	writeRaw(hGTA, pInjectFunc, &injectData, 11)
	if(ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}
disconnectEx() {

	if(!checkHandles())
		return 0

	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)			;pRakClientInterface
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

    ecx := dwAddress        ;this

	dwAddress := readDWORD(hGTA, dwAddress)         ;vtable
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}



	VarSetCapacity(injectData, 24, 0) ;mov, call, retn

    NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(ecx, injectData, 1, "UInt")			;1+4

	NumPut(0xB8, injectData, 5, "UChar")	;mov eax 	5+1
	NumPut(dwAddress, injectData, 6, "UInt")			;6+4

	;NumPut(0x006A006A, injectData, 10, "UInt")  ; 2x push			10+4

    NumPut(0x68, injectData, 10, "UChar")		;10 + 1		;push style
	NumPut(0, injectData, 11, "UInt")		;11 + 4

    NumPut(0x68, injectData, 15, "UChar")		;15 + 1		;push style
	NumPut(500, injectData, 16, "UInt")		;16 + 4

    ;---

	NumPut(0x50FF, injectData, 20, "UShort")			;20 + 2
	NumPut(0x08, injectData, 22, "UChar")			;22 + 1

	NumPut(0xC3, injectData, 23, "UChar")	;retn		23+1

	writeRaw(hGTA, pInjectFunc, &injectData, 24)
	if(ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}
setrestart()
{
  VarSetCapacity(old, 4, 0)
  dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
    if(ErrorLevel || dwAddress==0) {
      ErrorLevel := ERROR_READ_MEMORY
      return 0
  }

  NumPut(9,old,0,"Int")
  writeRaw(hGTA, dwAddress + 957, &old, 4)
}



; internal stuff
updateScoreboardDataEx() {
    
    if(!checkHandles())
        return false
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)            ;g_SAMP
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    
    VarSetCapacity(injectData, 11, 0) ;mov + call + retn
    
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
    
}

; internal stuff
updateOScoreboardData() {
    if(!checkHandles())
        return 0
    
    oScoreboardData := []
    
    if(!updateScoreboardDataEx())
        return 0
    
    iRefreshScoreboard := A_TickCount
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")    ;sLocalPlayerID
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")    ;iStrlen_LocalPlayerName
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)       ;szLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)        ;pszLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)      ;pRemotePlayer
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        if(dwRemoteplayer==0)
            continue
        
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)                ;pPlayerData
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)		;this ever happen?
            continue
		
		dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)        ;iGlobalMarkerLoaded
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		if(dwAddress)
		{
			ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")        ;x map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")        ;y map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")        ;z map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			o.MPOS := [ix, iy, iz]
		}
        
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)                ;pSAMP_Actor
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)               ;not streamed in
            continue

        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)                ;pGTA_Ped_
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
            continue
        o.PED := dwPed
		
		fHP := readFloat(hGTA, dwRemoteplayerData + 444)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		o.HP := fHP
		o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}


; ##### Sonstiges #####
; written by David_Luchs %
; returns nth message of chatlog (beggining from bottom)
; -1 = error
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
	chatindex := 0
	FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	loop, Parse, file, `n, `r
	{
		if(A_LoopField)
			chatindex := A_Index
	}
	loop, Parse, file, `n, `r
	{
		if(A_Index = chatindex - line){
			output := A_LoopField
			break
		}
	}
	file := ""
	if(!timestamp)
		output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
	if(!color)
		output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
	return
} 

; ##### Spielerfunktionen #####
getPlayerHealth() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getPlayerArmor() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getPlayerInteriorId() {
    if(!checkHandles())
        return -1
    
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return iid
}

getPlayerSkinID() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

getPlayerMoney() {
    if(!checkHandles())
        return ""
    
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return money
}

getPlayerWanteds() {
    if(!checkHandles())
        return -1
 
    dwPtr := 0xB7CD9C
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    ErrorLevel := ERROR_OK
    return Wanteds
}

getPlayerWeaponId() {
    if(!checkHandles())
        return 0
    
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }

   return WaffenId
}

getPlayerWeaponName() {
    id := getPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}

getPlayerState() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return State
}

IsPlayerInMenu() {
    if(!checkHandles())
        return -1
    
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return IsInMenu
}

getPlayerMapPosX() {
    if(!checkHandles())
        return -1
    
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosX
}

getPlayerMapPosY() {
    if(!checkHandles())
        return -1
    
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosY
}

getPlayerColor(id)
{
    id += 0

    if(!checkHandles())
        return -1

    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*id)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return color
}

getPlayerMapZoom() {
    if(!checkHandles())
        return -1
    
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapZoom
}

IsPlayerFreezed() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return IPF
}

; ##### Fahrzeugfunktionen #####

isPlayerInAnyVehicle()
{
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return (dwVehPtr > 0)
}

isPlayerDriver() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}

getVehicleHealth() {
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getVehicleType() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getVehicleModelId() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleModelName() {
    id:=getVehicleModelId()
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

getVehicleLightState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}


getVehicleEngineState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}


getVehicleLockState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

getVehicleColor1() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleColor2() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleSpeed() {
    if(!checkHandles())
        return -1
 
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhoht bzw. verringert
 
	return fVehicleSpeed
}

getIdsInAnyVehicle()
{
	if (isPlayerInAnyVehicle())
	{
		cVeh := readDWORD(hGTA, 0xB79530)
		ids := []
		index := 0

		Loop, 8
		{
			playerId := getIdByPed(readDWORD(hGTA, cVeh + (1120 + index)))
			ids[A_Index] := playerId
            index := 4 * A_Index
		}

		return ids
	}
	return -1
}

getPlayerRadiostationID() {
    if(!checkHandles())
        return -1
    
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return RadioStationID
}

getPlayerRadiostationName() {
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    id := getPlayerRadiostationID()
    
    if(id == 0)
        return -1
    
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}

; ##### Positionsbestimmung #####
getCoordinates() {
    if(!checkHandles())
        return ""
    
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
        if(!checkHandles())
                return 0
 
        fX := readFloat(hGTA, ADDR_POSITION_X)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        fY := readFloat(hGTA, ADDR_POSITION_Y)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        fZ := readFloat(hGTA, ADDR_POSITION_Z)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        ErrorLevel := ERROR_OK
}

initZonesAndCities() {




    AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    

AddZone("A-1", -3000.000000,2750.000000,-500,-2750.000000,3000.000000,500)
AddZone("A-2", -2750.000000,2750.000000,-500,-2500.000000,3000.000000,500)
AddZone("A-3", -2500.000000,2750.000000,-500,-2250.000000,3000.000000,500)
AddZone("A-4", -2250.000000,2750.000000,-500,-2000.000000,3000.000000,500)
AddZone("A-5", -2000.000000,2750.000000,-500,-1750.000000,3000.000000,500)
AddZone("A-6", -1750.000000,2750.000000,-500,-1500.000000,3000.000000,500)
AddZone("A-7", -1500.000000,2750.000000,-500,-1250.000000,3000.000000,500)
AddZone("A-8", -1250.000000,2750.000000,-500,-1000.000000,3000.000000,500)
AddZone("A-9", -1000.000000,2750.000000,-500,-750.000000,3000.000000,500)
AddZone("A-10", -750.000000,2750.000000,-500,-500.000000,3000.000000,500)
AddZone("A-11", -500.000000,2750.000000,-500,-250.000000,3000.000000,500)
AddZone("A-12", -250.000000,2750.000000,-500,0.000000,3000.000000,500)
AddZone("A-13", 0.000000,2750.000000,-500,250.000000,3000.000000,500)
AddZone("A-14", 250.000000,2750.000000,-500,500.000000,3000.000000,500)
AddZone("A-15", 500.000000,2750.000000,-500,750.000000,3000.000000,500)
AddZone("A-16", 750.000000,2750.000000,-500,1000.000000,3000.000000,500)
AddZone("A-17", 1000.000000,2750.000000,-500,1250.000000,3000.000000,500)
AddZone("A-18", 1250.000000,2750.000000,-500,1500.000000,3000.000000,500)
AddZone("A-19", 1500.000000,2750.000000,-500,1750.000000,3000.000000,500)
AddZone("A-20", 1750.000000,2750.000000,-500,2000.000000,3000.000000,500)
AddZone("A-21", 2000.000000,2750.000000,-500,2250.000000,3000.000000,500)
AddZone("A-22", 2250.000000,2750.000000,-500,2500.000000,3000.000000,500)
AddZone("A-23", 2500.000000,2750.000000,-500,2750.000000,3000.000000,500)
AddZone("A-24", 2750.000000,2750.000000,-500,3000.000000,3000.000000,500)
AddZone("Б-1", -3000.000000,2500.000000,-500,-2750.000000,2750.000000,500)
AddZone("Б-2", -2750.000000,2500.000000,-500,-2500.000000,2750.000000,500)
AddZone("Б-3", -2500.000000,2500.000000,-500,-2250.000000,2750.000000,500)
AddZone("Б-4", -2250.000000,2500.000000,-500,-2000.000000,2750.000000,500)
AddZone("Б-5", -2000.000000,2500.000000,-500,-1750.000000,2750.000000,500)
AddZone("Б-6", -1750.000000,2500.000000,-500,-1500.000000,2750.000000,500)
AddZone("Б-7", -1500.000000,2500.000000,-500,-1250.000000,2750.000000,500)
AddZone("Б-8", -1250.000000,2500.000000,-500,-1000.000000,2750.000000,500)
AddZone("Б-9", -1000.000000,2500.000000,-500,-750.000000,2750.000000,500)
AddZone("Б-10", -750.000000,2500.000000,-500,-500.000000,2750.000000,500)
AddZone("Б-11", -500.000000,2500.000000,-500,-250.000000,2750.000000,500)
AddZone("Б-12", -250.000000,2500.000000,-500,0.000000,2750.000000,500)
AddZone("Б-13", 0.000000,2500.000000,-500,250.000000,2750.000000,500)
AddZone("Б-14", 250.000000,2500.000000,-500,500.000000,2750.000000,500)
AddZone("Б-15", 500.000000,2500.000000,-500,750.000000,2750.000000,500)
AddZone("Б-16", 750.000000,2500.000000,-500,1000.000000,2750.000000,500)
AddZone("Б-17", 1000.000000,2500.000000,-500,1250.000000,2750.000000,500)
AddZone("Б-18", 1250.000000,2500.000000,-500,1500.000000,2750.000000,500)
AddZone("Б-19", 1500.000000,2500.000000,-500,1750.000000,2750.000000,500)
AddZone("Б-20", 1750.000000,2500.000000,-500,2000.000000,2750.000000,500)
AddZone("Б-21", 2000.000000,2500.000000,-500,2250.000000,2750.000000,500)
AddZone("Б-22", 2250.000000,2500.000000,-500,2500.000000,2750.000000,500)
AddZone("Б-23", 2500.000000,2500.000000,-500,2750.000000,2750.000000,500)
AddZone("Б-24", 2750.000000,2500.000000,-500,3000.000000,2750.000000,500)
AddZone("В-1", -3000.000000,2250.000000,-500,-2750.000000,2500.000000,500)
AddZone("В-2", -2750.000000,2250.000000,-500,-2500.000000,2500.000000,500)
AddZone("В-3", -2500.000000,2250.000000,-500,-2250.000000,2500.000000,500)
AddZone("В-4", -2250.000000,2250.000000,-500,-2000.000000,2500.000000,500)
AddZone("В-5", -2000.000000,2250.000000,-500,-1750.000000,2500.000000,500)
AddZone("В-6", -1750.000000,2250.000000,-500,-1500.000000,2500.000000,500)
AddZone("В-7", -1500.000000,2250.000000,-500,-1250.000000,2500.000000,500)
AddZone("В-8", -1250.000000,2250.000000,-500,-1000.000000,2500.000000,500)
AddZone("В-9", -1000.000000,2250.000000,-500,-750.000000,2500.000000,500)
AddZone("В-10", -750.000000,2250.000000,-500,-500.000000,2500.000000,500)
AddZone("В-11", -500.000000,2250.000000,-500,-250.000000,2500.000000,500)
AddZone("В-12", -250.000000,2250.000000,-500,0.000000,2500.000000,500)
AddZone("В-13", 0.000000,2250.000000,-500,250.000000,2500.000000,500)
AddZone("В-14", 250.000000,2250.000000,-500,500.000000,2500.000000,500)
AddZone("В-15", 500.000000,2250.000000,-500,750.000000,2500.000000,500)
AddZone("В-16", 750.000000,2250.000000,-500,1000.000000,2500.000000,500)
AddZone("В-17", 1000.000000,2250.000000,-500,1250.000000,2500.000000,500)
AddZone("В-18", 1250.000000,2250.000000,-500,1500.000000,2500.000000,500)
AddZone("В-19", 1500.000000,2250.000000,-500,1750.000000,2500.000000,500)
AddZone("В-20", 1750.000000,2250.000000,-500,2000.000000,2500.000000,500)
AddZone("В-21", 2000.000000,2250.000000,-500,2250.000000,2500.000000,500)
AddZone("В-22", 2250.000000,2250.000000,-500,2500.000000,2500.000000,500)
AddZone("В-23", 2500.000000,2250.000000,-500,2750.000000,2500.000000,500)
AddZone("В-24", 2750.000000,2250.000000,-500,3000.000000,2500.000000,500)
AddZone("Г-1", -3000.000000,2000.000000,-500,-2750.000000,2250.000000,500)
AddZone("Г-2", -2750.000000,2000.000000,-500,-2500.000000,2250.000000,500)
AddZone("Г-3", -2500.000000,2000.000000,-500,-2250.000000,2250.000000,500)
AddZone("Г-4", -2250.000000,2000.000000,-500,-2000.000000,2250.000000,500)
AddZone("Г-5", -2000.000000,2000.000000,-500,-1750.000000,2250.000000,500)
AddZone("Г-6", -1750.000000,2000.000000,-500,-1500.000000,2250.000000,500)
AddZone("Г-7", -1500.000000,2000.000000,-500,-1250.000000,2250.000000,500)
AddZone("Г-8", -1250.000000,2000.000000,-500,-1000.000000,2250.000000,500)
AddZone("Г-9", -1000.000000,2000.000000,-500,-750.000000,2250.000000,500)
AddZone("Г-10", -750.000000,2000.000000,-500,-500.000000,2250.000000,500)
AddZone("Г-11", -500.000000,2000.000000,-500,-250.000000,2250.000000,500)
AddZone("Г-12", -250.000000,2000.000000,-500,0.000000,2250.000000,500)
AddZone("Г-13", 0.000000,2000.000000,-500,250.000000,2250.000000,500)
AddZone("Г-14", 250.000000,2000.000000,-500,500.000000,2250.000000,500)
AddZone("Г-15", 500.000000,2000.000000,-500,750.000000,2250.000000,500)
AddZone("Г-16", 750.000000,2000.000000,-500,1000.000000,2250.000000,500)
AddZone("Г-17", 1000.000000,2000.000000,-500,1250.000000,2250.000000,500)
AddZone("Г-18", 1250.000000,2000.000000,-500,1500.000000,2250.000000,500)
AddZone("Г-19", 1500.000000,2000.000000,-500,1750.000000,2250.000000,500)
AddZone("Г-20", 1750.000000,2000.000000,-500,2000.000000,2250.000000,500)
AddZone("Г-21", 2000.000000,2000.000000,-500,2250.000000,2250.000000,500)
AddZone("Г-22", 2250.000000,2000.000000,-500,2500.000000,2250.000000,500)
AddZone("Г-23", 2500.000000,2000.000000,-500,2750.000000,2250.000000,500)
AddZone("Г-24", 2750.000000,2000.000000,-500,3000.000000,2250.000000,500)
AddZone("Д-1", -3000.000000,1750.000000,-500,-2750.000000,2000.000000,500)
AddZone("Д-2", -2750.000000,1750.000000,-500,-2500.000000,2000.000000,500)
AddZone("Д-3", -2500.000000,1750.000000,-500,-2250.000000,2000.000000,500)
AddZone("Д-4", -2250.000000,1750.000000,-500,-2000.000000,2000.000000,500)
AddZone("Д-5", -2000.000000,1750.000000,-500,-1750.000000,2000.000000,500)
AddZone("Д-6", -1750.000000,1750.000000,-500,-1500.000000,2000.000000,500)
AddZone("Д-7", -1500.000000,1750.000000,-500,-1250.000000,2000.000000,500)
AddZone("Д-8", -1250.000000,1750.000000,-500,-1000.000000,2000.000000,500)
AddZone("Д-9", -1000.000000,1750.000000,-500,-750.000000,2000.000000,500)
AddZone("Д-10", -750.000000,1750.000000,-500,-500.000000,2000.000000,500)
AddZone("Д-11", -500.000000,1750.000000,-500,-250.000000,2000.000000,500)
AddZone("Д-12", -250.000000,1750.000000,-500,0.000000,2000.000000,500)
AddZone("Д-13", 0.000000,1750.000000,-500,250.000000,2000.000000,500)
AddZone("Д-14", 250.000000,1750.000000,-500,500.000000,2000.000000,500)
AddZone("Д-15", 500.000000,1750.000000,-500,750.000000,2000.000000,500)
AddZone("Д-16", 750.000000,1750.000000,-500,1000.000000,2000.000000,500)
AddZone("Д-17", 1000.000000,1750.000000,-500,1250.000000,2000.000000,500)
AddZone("Д-18", 1250.000000,1750.000000,-500,1500.000000,2000.000000,500)
AddZone("Д-19", 1500.000000,1750.000000,-500,1750.000000,2000.000000,500)
AddZone("Д-20", 1750.000000,1750.000000,-500,2000.000000,2000.000000,500)
AddZone("Д-21", 2000.000000,1750.000000,-500,2250.000000,2000.000000,500)
AddZone("Д-22", 2250.000000,1750.000000,-500,2500.000000,2000.000000,500)
AddZone("Д-23", 2500.000000,1750.000000,-500,2750.000000,2000.000000,500)
AddZone("Д-24", 2750.000000,1750.000000,-500,3000.000000,2000.000000,500)
AddZone("Ж-1", -3000.000000,1500.000000,-500,-2750.000000,1750.000000,500)
AddZone("Ж-2", -2750.000000,1500.000000,-500,-2500.000000,1750.000000,500)
AddZone("Ж-3", -2500.000000,1500.000000,-500,-2250.000000,1750.000000,500)
AddZone("Ж-4", -2250.000000,1500.000000,-500,-2000.000000,1750.000000,500)
AddZone("Ж-5", -2000.000000,1500.000000,-500,-1750.000000,1750.000000,500)
AddZone("Ж-6", -1750.000000,1500.000000,-500,-1500.000000,1750.000000,500)
AddZone("Ж-7", -1500.000000,1500.000000,-500,-1250.000000,1750.000000,500)
AddZone("Ж-8", -1250.000000,1500.000000,-500,-1000.000000,1750.000000,500)
AddZone("Ж-9", -1000.000000,1500.000000,-500,-750.000000,1750.000000,500)
AddZone("Ж-10", -750.000000,1500.000000,-500,-500.000000,1750.000000,500)
AddZone("Ж-11", -500.000000,1500.000000,-500,-250.000000,1750.000000,500)
AddZone("Ж-12", -250.000000,1500.000000,-500,0.000000,1750.000000,500)
AddZone("Ж-13", 0.000000,1500.000000,-500,250.000000,1750.000000,500)
AddZone("Ж-14", 250.000000,1500.000000,-500,500.000000,1750.000000,500)
AddZone("Ж-15", 500.000000,1500.000000,-500,750.000000,1750.000000,500)
AddZone("Ж-16", 750.000000,1500.000000,-500,1000.000000,1750.000000,500)
AddZone("Ж-17", 1000.000000,1500.000000,-500,1250.000000,1750.000000,500)
AddZone("Ж-18", 1250.000000,1500.000000,-500,1500.000000,1750.000000,500)
AddZone("Ж-19", 1500.000000,1500.000000,-500,1750.000000,1750.000000,500)
AddZone("Ж-20", 1750.000000,1500.000000,-500,2000.000000,1750.000000,500)
AddZone("Ж-21", 2000.000000,1500.000000,-500,2250.000000,1750.000000,500)
AddZone("Ж-22", 2250.000000,1500.000000,-500,2500.000000,1750.000000,500)
AddZone("Ж-23", 2500.000000,1500.000000,-500,2750.000000,1750.000000,500)
AddZone("Ж-24", 2750.000000,1500.000000,-500,3000.000000,1750.000000,500)
AddZone("З-1", -3000.000000,1250.000000,-500,-2750.000000,1500.000000,500)
AddZone("З-2", -2750.000000,1250.000000,-500,-2500.000000,1500.000000,500)
AddZone("З-3", -2500.000000,1250.000000,-500,-2250.000000,1500.000000,500)
AddZone("З-4", -2250.000000,1250.000000,-500,-2000.000000,1500.000000,500)
AddZone("З-5", -2000.000000,1250.000000,-500,-1750.000000,1500.000000,500)
AddZone("З-6", -1750.000000,1250.000000,-500,-1500.000000,1500.000000,500)
AddZone("З-7", -1500.000000,1250.000000,-500,-1250.000000,1500.000000,500)
AddZone("З-8", -1250.000000,1250.000000,-500,-1000.000000,1500.000000,500)
AddZone("З-9", -1000.000000,1250.000000,-500,-750.000000,1500.000000,500)
AddZone("З-10", -750.000000,1250.000000,-500,-500.000000,1500.000000,500)
AddZone("З-11", -500.000000,1250.000000,-500,-250.000000,1500.000000,500)
AddZone("З-12", -250.000000,1250.000000,-500,0.000000,1500.000000,500)
AddZone("З-13", 0.000000,1250.000000,-500,250.000000,1500.000000,500)
AddZone("З-14", 250.000000,1250.000000,-500,500.000000,1500.000000,500)
AddZone("З-15", 500.000000,1250.000000,-500,750.000000,1500.000000,500)
AddZone("З-16", 750.000000,1250.000000,-500,1000.000000,1500.000000,500)
AddZone("З-17", 1000.000000,1250.000000,-500,1250.000000,1500.000000,500)
AddZone("З-18", 1250.000000,1250.000000,-500,1500.000000,1500.000000,500)
AddZone("З-19", 1500.000000,1250.000000,-500,1750.000000,1500.000000,500)
AddZone("З-20", 1750.000000,1250.000000,-500,2000.000000,1500.000000,500)
AddZone("З-21", 2000.000000,1250.000000,-500,2250.000000,1500.000000,500)
AddZone("З-22", 2250.000000,1250.000000,-500,2500.000000,1500.000000,500)
AddZone("З-23", 2500.000000,1250.000000,-500,2750.000000,1500.000000,500)
AddZone("З-24", 2750.000000,1250.000000,-500,3000.000000,1500.000000,500)
AddZone("И-1", -3000.000000,1000.000000,-500,-2750.000000,1250.000000,500)
AddZone("И-2", -2750.000000,1000.000000,-500,-2500.000000,1250.000000,500)
AddZone("И-3", -2500.000000,1000.000000,-500,-2250.000000,1250.000000,500)
AddZone("И-4", -2250.000000,1000.000000,-500,-2000.000000,1250.000000,500)
AddZone("И-5", -2000.000000,1000.000000,-500,-1750.000000,1250.000000,500)
AddZone("И-6", -1750.000000,1000.000000,-500,-1500.000000,1250.000000,500)
AddZone("И-7", -1500.000000,1000.000000,-500,-1250.000000,1250.000000,500)
AddZone("И-8", -1250.000000,1000.000000,-500,-1000.000000,1250.000000,500)
AddZone("И-9", -1000.000000,1000.000000,-500,-750.000000,1250.000000,500)
AddZone("И-10", -750.000000,1000.000000,-500,-500.000000,1250.000000,500)
AddZone("И-11", -500.000000,1000.000000,-500,-250.000000,1250.000000,500)
AddZone("И-12", -250.000000,1000.000000,-500,0.000000,1250.000000,500)
AddZone("И-13", 0.000000,1000.000000,-500,250.000000,1250.000000,500)
AddZone("И-14", 250.000000,1000.000000,-500,500.000000,1250.000000,500)
AddZone("И-15", 500.000000,1000.000000,-500,750.000000,1250.000000,500)
AddZone("И-16", 750.000000,1000.000000,-500,1000.000000,1250.000000,500)
AddZone("И-17", 1000.000000,1000.000000,-500,1250.000000,1250.000000,500)
AddZone("И-18", 1250.000000,1000.000000,-500,1500.000000,1250.000000,500)
AddZone("И-19", 1500.000000,1000.000000,-500,1750.000000,1250.000000,500)
AddZone("И-20", 1750.000000,1000.000000,-500,2000.000000,1250.000000,500)
AddZone("И-21", 2000.000000,1000.000000,-500,2250.000000,1250.000000,500)
AddZone("И-22", 2250.000000,1000.000000,-500,2500.000000,1250.000000,500)
AddZone("И-23", 2500.000000,1000.000000,-500,2750.000000,1250.000000,500)
AddZone("И-24", 2750.000000,1000.000000,-500,3000.000000,1250.000000,500)
AddZone("К-1", -3000.000000,750.000000,-500,-2750.000000,1000.000000,500)
AddZone("К-2", -2750.000000,750.000000,-500,-2500.000000,1000.000000,500)
AddZone("К-3", -2500.000000,750.000000,-500,-2250.000000,1000.000000,500)
AddZone("К-4", -2250.000000,750.000000,-500,-2000.000000,1000.000000,500)
AddZone("К-5", -2000.000000,750.000000,-500,-1750.000000,1000.000000,500)
AddZone("К-6", -1750.000000,750.000000,-500,-1500.000000,1000.000000,500)
AddZone("К-7", -1500.000000,750.000000,-500,-1250.000000,1000.000000,500)
AddZone("К-8", -1250.000000,750.000000,-500,-1000.000000,1000.000000,500)
AddZone("К-9", -1000.000000,750.000000,-500,-750.000000,1000.000000,500)
AddZone("К-10", -750.000000,750.000000,-500,-500.000000,1000.000000,500)
AddZone("К-11", -500.000000,750.000000,-500,-250.000000,1000.000000,500)
AddZone("К-12", -250.000000,750.000000,-500,0.000000,1000.000000,500)
AddZone("К-13", 0.000000,750.000000,-500,250.000000,1000.000000,500)
AddZone("К-14", 250.000000,750.000000,-500,500.000000,1000.000000,500)
AddZone("К-15", 500.000000,750.000000,-500,750.000000,1000.000000,500)
AddZone("К-16", 750.000000,750.000000,-500,1000.000000,1000.000000,500)
AddZone("К-17", 1000.000000,750.000000,-500,1250.000000,1000.000000,500)
AddZone("К-18", 1250.000000,750.000000,-500,1500.000000,1000.000000,500)
AddZone("К-19", 1500.000000,750.000000,-500,1750.000000,1000.000000,500)
AddZone("К-20", 1750.000000,750.000000,-500,2000.000000,1000.000000,500)
AddZone("К-21", 2000.000000,750.000000,-500,2250.000000,1000.000000,500)
AddZone("К-22", 2250.000000,750.000000,-500,2500.000000,1000.000000,500)
AddZone("К-23", 2500.000000,750.000000,-500,2750.000000,1000.000000,500)
AddZone("К-24", 2750.000000,750.000000,-500,3000.000000,1000.000000,500)
AddZone("Л-1", -3000.000000,500.000000,-500,-2750.000000,750.000000,500)
AddZone("Л-2", -2750.000000,500.000000,-500,-2500.000000,750.000000,500)
AddZone("Л-3", -2500.000000,500.000000,-500,-2250.000000,750.000000,500)
AddZone("Л-4", -2250.000000,500.000000,-500,-2000.000000,750.000000,500)
AddZone("Л-5", -2000.000000,500.000000,-500,-1750.000000,750.000000,500)
AddZone("Л-6", -1750.000000,500.000000,-500,-1500.000000,750.000000,500)
AddZone("Л-7", -1500.000000,500.000000,-500,-1250.000000,750.000000,500)
AddZone("Л-8", -1250.000000,500.000000,-500,-1000.000000,750.000000,500)
AddZone("Л-9", -1000.000000,500.000000,-500,-750.000000,750.000000,500)
AddZone("Л-10", -750.000000,500.000000,-500,-500.000000,750.000000,500)
AddZone("Л-11", -500.000000,500.000000,-500,-250.000000,750.000000,500)
AddZone("Л-12", -250.000000,500.000000,-500,0.000000,750.000000,500)
AddZone("Л-13", 0.000000,500.000000,-500,250.000000,750.000000,500)
AddZone("Л-14", 250.000000,500.000000,-500,500.000000,750.000000,500)
AddZone("Л-15", 500.000000,500.000000,-500,750.000000,750.000000,500)
AddZone("Л-16", 750.000000,500.000000,-500,1000.000000,750.000000,500)
AddZone("Л-17", 1000.000000,500.000000,-500,1250.000000,750.000000,500)
AddZone("Л-18", 1250.000000,500.000000,-500,1500.000000,750.000000,500)
AddZone("Л-19", 1500.000000,500.000000,-500,1750.000000,750.000000,500)
AddZone("Л-20", 1750.000000,500.000000,-500,2000.000000,750.000000,500)
AddZone("Л-21", 2000.000000,500.000000,-500,2250.000000,750.000000,500)
AddZone("Л-22", 2250.000000,500.000000,-500,2500.000000,750.000000,500)
AddZone("Л-23", 2500.000000,500.000000,-500,2750.000000,750.000000,500)
AddZone("Л-24", 2750.000000,500.000000,-500,3000.000000,750.000000,500)
AddZone("М-1", -3000.000000,250.000000,-500,-2750.000000,500.000000,500)
AddZone("М-2", -2750.000000,250.000000,-500,-2500.000000,500.000000,500)
AddZone("М-3", -2500.000000,250.000000,-500,-2250.000000,500.000000,500)
AddZone("М-4", -2250.000000,250.000000,-500,-2000.000000,500.000000,500)
AddZone("М-5", -2000.000000,250.000000,-500,-1750.000000,500.000000,500)
AddZone("М-6", -1750.000000,250.000000,-500,-1500.000000,500.000000,500)
AddZone("М-7", -1500.000000,250.000000,-500,-1250.000000,500.000000,500)
AddZone("М-8", -1250.000000,250.000000,-500,-1000.000000,500.000000,500)
AddZone("М-9", -1000.000000,250.000000,-500,-750.000000,500.000000,500)
AddZone("М-10", -750.000000,250.000000,-500,-500.000000,500.000000,500)
AddZone("М-11", -500.000000,250.000000,-500,-250.000000,500.000000,500)
AddZone("М-12", -250.000000,250.000000,-500,0.000000,500.000000,500)
AddZone("М-13", 0.000000,250.000000,-500,250.000000,500.000000,500)
AddZone("М-14", 250.000000,250.000000,-500,500.000000,500.000000,500)
AddZone("М-15", 500.000000,250.000000,-500,750.000000,500.000000,500)
AddZone("М-16", 750.000000,250.000000,-500,1000.000000,500.000000,500)
AddZone("М-17", 1000.000000,250.000000,-500,1250.000000,500.000000,500)
AddZone("М-18", 1250.000000,250.000000,-500,1500.000000,500.000000,500)
AddZone("М-19", 1500.000000,250.000000,-500,1750.000000,500.000000,500)
AddZone("М-20", 1750.000000,250.000000,-500,2000.000000,500.000000,500)
AddZone("М-21", 2000.000000,250.000000,-500,2250.000000,500.000000,500)
AddZone("М-22", 2250.000000,250.000000,-500,2500.000000,500.000000,500)
AddZone("М-23", 2500.000000,250.000000,-500,2750.000000,500.000000,500)
AddZone("М-24", 2750.000000,250.000000,-500,3000.000000,500.000000,500)
AddZone("Н-1", -3000.000000,0.000000,-500,-2750.000000,250.000000,500)
AddZone("Н-2", -2750.000000,0.000000,-500,-2500.000000,250.000000,500)
AddZone("Н-3", -2500.000000,0.000000,-500,-2250.000000,250.000000,500)
AddZone("Н-4", -2250.000000,0.000000,-500,-2000.000000,250.000000,500)
AddZone("Н-5", -2000.000000,0.000000,-500,-1750.000000,250.000000,500)
AddZone("Н-6", -1750.000000,0.000000,-500,-1500.000000,250.000000,500)
AddZone("Н-7", -1500.000000,0.000000,-500,-1250.000000,250.000000,500)
AddZone("Н-8", -1250.000000,0.000000,-500,-1000.000000,250.000000,500)
AddZone("Н-9", -1000.000000,0.000000,-500,-750.000000,250.000000,500)
AddZone("Н-10", -750.000000,0.000000,-500,-500.000000,250.000000,500)
AddZone("Н-11", -500.000000,0.000000,-500,-250.000000,250.000000,500)
AddZone("Н-12", -250.000000,0.000000,-500,0.000000,250.000000,500)
AddZone("Н-13", 0.000000,0.000000,-500,250.000000,250.000000,500)
AddZone("Н-14", 250.000000,0.000000,-500,500.000000,250.000000,500)
AddZone("Н-15", 500.000000,0.000000,-500,750.000000,250.000000,500)
AddZone("Н-16", 750.000000,0.000000,-500,1000.000000,250.000000,500)
AddZone("Н-17", 1000.000000,0.000000,-500,1250.000000,250.000000,500)
AddZone("Н-18", 1250.000000,0.000000,-500,1500.000000,250.000000,500)
AddZone("Н-19", 1500.000000,0.000000,-500,1750.000000,250.000000,500)
AddZone("Н-20", 1750.000000,0.000000,-500,2000.000000,250.000000,500)
AddZone("Н-21", 2000.000000,0.000000,-500,2250.000000,250.000000,500)
AddZone("Н-22", 2250.000000,0.000000,-500,2500.000000,250.000000,500)
AddZone("Н-23", 2500.000000,0.000000,-500,2750.000000,250.000000,500)
AddZone("Н-24", 2750.000000,0.000000,-500,3000.000000,250.000000,500)
AddZone("О-1", -3000.000000,-250.000000,-500,-2750.000000,0.000000,500)
AddZone("О-2", -2750.000000,-250.000000,-500,-2500.000000,0.000000,500)
AddZone("О-3", -2500.000000,-250.000000,-500,-2250.000000,0.000000,500)
AddZone("О-4", -2250.000000,-250.000000,-500,-2000.000000,0.000000,500)
AddZone("О-5", -2000.000000,-250.000000,-500,-1750.000000,0.000000,500)
AddZone("О-6", -1750.000000,-250.000000,-500,-1500.000000,0.000000,500)
AddZone("О-7", -1500.000000,-250.000000,-500,-1250.000000,0.000000,500)
AddZone("О-8", -1250.000000,-250.000000,-500,-1000.000000,0.000000,500)
AddZone("О-9", -1000.000000,-250.000000,-500,-750.000000,0.000000,500)
AddZone("О-10", -750.000000,-250.000000,-500,-500.000000,0.000000,500)
AddZone("О-11", -500.000000,-250.000000,-500,-250.000000,0.000000,500)
AddZone("О-12", -250.000000,-250.000000,-500,0.000000,0.000000,500)
AddZone("О-13", 0.000000,-250.000000,-500,250.000000,0.000000,500)
AddZone("О-14", 250.000000,-250.000000,-500,500.000000,0.000000,500)
AddZone("О-15", 500.000000,-250.000000,-500,750.000000,0.000000,500)
AddZone("О-16", 750.000000,-250.000000,-500,1000.000000,0.000000,500)
AddZone("О-17", 1000.000000,-250.000000,-500,1250.000000,0.000000,500)
AddZone("О-18", 1250.000000,-250.000000,-500,1500.000000,0.000000,500)
AddZone("О-19", 1500.000000,-250.000000,-500,1750.000000,0.000000,500)
AddZone("О-20", 1750.000000,-250.000000,-500,2000.000000,0.000000,500)
AddZone("О-21", 2000.000000,-250.000000,-500,2250.000000,0.000000,500)
AddZone("О-22", 2250.000000,-250.000000,-500,2500.000000,0.000000,500)
AddZone("О-23", 2500.000000,-250.000000,-500,2750.000000,0.000000,500)
AddZone("О-24", 2750.000000,-250.000000,-500,3000.000000,0.000000,500)
AddZone("П-1", -3000.000000,-500.000000,-500,-2750.000000,-250.000000,500)
AddZone("П-2", -2750.000000,-500.000000,-500,-2500.000000,-250.000000,500)
AddZone("П-3", -2500.000000,-500.000000,-500,-2250.000000,-250.000000,500)
AddZone("П-4", -2250.000000,-500.000000,-500,-2000.000000,-250.000000,500)
AddZone("П-5", -2000.000000,-500.000000,-500,-1750.000000,-250.000000,500)
AddZone("П-6", -1750.000000,-500.000000,-500,-1500.000000,-250.000000,500)
AddZone("П-7", -1500.000000,-500.000000,-500,-1250.000000,-250.000000,500)
AddZone("П-8", -1250.000000,-500.000000,-500,-1000.000000,-250.000000,500)
AddZone("П-9", -1000.000000,-500.000000,-500,-750.000000,-250.000000,500)
AddZone("П-10", -750.000000,-500.000000,-500,-500.000000,-250.000000,500)
AddZone("П-11", -500.000000,-500.000000,-500,-250.000000,-250.000000,500)
AddZone("П-12", -250.000000,-500.000000,-500,0.000000,-250.000000,500)
AddZone("П-13", 0.000000,-500.000000,-500,250.000000,-250.000000,500)
AddZone("П-14", 250.000000,-500.000000,-500,500.000000,-250.000000,500)
AddZone("П-15", 500.000000,-500.000000,-500,750.000000,-250.000000,500)
AddZone("П-16", 750.000000,-500.000000,-500,1000.000000,-250.000000,500)
AddZone("П-17", 1000.000000,-500.000000,-500,1250.000000,-250.000000,500)
AddZone("П-18", 1250.000000,-500.000000,-500,1500.000000,-250.000000,500)
AddZone("П-19", 1500.000000,-500.000000,-500,1750.000000,-250.000000,500)
AddZone("П-20", 1750.000000,-500.000000,-500,2000.000000,-250.000000,500)
AddZone("П-21", 2000.000000,-500.000000,-500,2250.000000,-250.000000,500)
AddZone("П-22", 2250.000000,-500.000000,-500,2500.000000,-250.000000,500)
AddZone("П-23", 2500.000000,-500.000000,-500,2750.000000,-250.000000,500)
AddZone("П-24", 2750.000000,-500.000000,-500,3000.000000,-250.000000,500)
AddZone("Р-1", -3000.000000,-750.000000,-500,-2750.000000,-500.000000,500)
AddZone("Р-2", -2750.000000,-750.000000,-500,-2500.000000,-500.000000,500)
AddZone("Р-3", -2500.000000,-750.000000,-500,-2250.000000,-500.000000,500)
AddZone("Р-4", -2250.000000,-750.000000,-500,-2000.000000,-500.000000,500)
AddZone("Р-5", -2000.000000,-750.000000,-500,-1750.000000,-500.000000,500)
AddZone("Р-6", -1750.000000,-750.000000,-500,-1500.000000,-500.000000,500)
AddZone("Р-7", -1500.000000,-750.000000,-500,-1250.000000,-500.000000,500)
AddZone("Р-8", -1250.000000,-750.000000,-500,-1000.000000,-500.000000,500)
AddZone("Р-9", -1000.000000,-750.000000,-500,-750.000000,-500.000000,500)
AddZone("Р-10", -750.000000,-750.000000,-500,-500.000000,-500.000000,500)
AddZone("Р-11", -500.000000,-750.000000,-500,-250.000000,-500.000000,500)
AddZone("Р-12", -250.000000,-750.000000,-500,0.000000,-500.000000,500)
AddZone("Р-13", 0.000000,-750.000000,-500,250.000000,-500.000000,500)
AddZone("Р-14", 250.000000,-750.000000,-500,500.000000,-500.000000,500)
AddZone("Р-15", 500.000000,-750.000000,-500,750.000000,-500.000000,500)
AddZone("Р-16", 750.000000,-750.000000,-500,1000.000000,-500.000000,500)
AddZone("Р-17", 1000.000000,-750.000000,-500,1250.000000,-500.000000,500)
AddZone("Р-18", 1250.000000,-750.000000,-500,1500.000000,-500.000000,500)
AddZone("Р-19", 1500.000000,-750.000000,-500,1750.000000,-500.000000,500)
AddZone("Р-20", 1750.000000,-750.000000,-500,2000.000000,-500.000000,500)
AddZone("Р-21", 2000.000000,-750.000000,-500,2250.000000,-500.000000,500)
AddZone("Р-22", 2250.000000,-750.000000,-500,2500.000000,-500.000000,500)
AddZone("Р-23", 2500.000000,-750.000000,-500,2750.000000,-500.000000,500)
AddZone("Р-24", 2750.000000,-750.000000,-500,3000.000000,-500.000000,500)
AddZone("С-1", -3000.000000,-1000.000000,-500,-2750.000000,-750.000000,500)
AddZone("С-2", -2750.000000,-1000.000000,-500,-2500.000000,-750.000000,500)
AddZone("С-3", -2500.000000,-1000.000000,-500,-2250.000000,-750.000000,500)
AddZone("С-4", -2250.000000,-1000.000000,-500,-2000.000000,-750.000000,500)
AddZone("С-5", -2000.000000,-1000.000000,-500,-1750.000000,-750.000000,500)
AddZone("С-6", -1750.000000,-1000.000000,-500,-1500.000000,-750.000000,500)
AddZone("С-7", -1500.000000,-1000.000000,-500,-1250.000000,-750.000000,500)
AddZone("С-8", -1250.000000,-1000.000000,-500,-1000.000000,-750.000000,500)
AddZone("С-9", -1000.000000,-1000.000000,-500,-750.000000,-750.000000,500)
AddZone("С-10", -750.000000,-1000.000000,-500,-500.000000,-750.000000,500)
AddZone("С-11", -500.000000,-1000.000000,-500,-250.000000,-750.000000,500)
AddZone("С-12", -250.000000,-1000.000000,-500,0.000000,-750.000000,500)
AddZone("С-13", 0.000000,-1000.000000,-500,250.000000,-750.000000,500)
AddZone("С-14", 250.000000,-1000.000000,-500,500.000000,-750.000000,500)
AddZone("С-15", 500.000000,-1000.000000,-500,750.000000,-750.000000,500)
AddZone("С-16", 750.000000,-1000.000000,-500,1000.000000,-750.000000,500)
AddZone("С-17", 1000.000000,-1000.000000,-500,1250.000000,-750.000000,500)
AddZone("С-18", 1250.000000,-1000.000000,-500,1500.000000,-750.000000,500)
AddZone("С-19", 1500.000000,-1000.000000,-500,1750.000000,-750.000000,500)
AddZone("С-20", 1750.000000,-1000.000000,-500,2000.000000,-750.000000,500)
AddZone("С-21", 2000.000000,-1000.000000,-500,2250.000000,-750.000000,500)
AddZone("С-22", 2250.000000,-1000.000000,-500,2500.000000,-750.000000,500)
AddZone("С-23", 2500.000000,-1000.000000,-500,2750.000000,-750.000000,500)
AddZone("С-24", 2750.000000,-1000.000000,-500,3000.000000,-750.000000,500)
AddZone("Т-1", -3000.000000,-1250.000000,-500,-2750.000000,-1000.000000,500)
AddZone("Т-2", -2750.000000,-1250.000000,-500,-2500.000000,-1000.000000,500)
AddZone("Т-3", -2500.000000,-1250.000000,-500,-2250.000000,-1000.000000,500)
AddZone("Т-4", -2250.000000,-1250.000000,-500,-2000.000000,-1000.000000,500)
AddZone("Т-5", -2000.000000,-1250.000000,-500,-1750.000000,-1000.000000,500)
AddZone("Т-6", -1750.000000,-1250.000000,-500,-1500.000000,-1000.000000,500)
AddZone("Т-7", -1500.000000,-1250.000000,-500,-1250.000000,-1000.000000,500)
AddZone("Т-8", -1250.000000,-1250.000000,-500,-1000.000000,-1000.000000,500)
AddZone("Т-9", -1000.000000,-1250.000000,-500,-750.000000,-1000.000000,500)
AddZone("Т-10", -750.000000,-1250.000000,-500,-500.000000,-1000.000000,500)
AddZone("Т-11", -500.000000,-1250.000000,-500,-250.000000,-1000.000000,500)
AddZone("Т-12", -250.000000,-1250.000000,-500,0.000000,-1000.000000,500)
AddZone("Т-13", 0.000000,-1250.000000,-500,250.000000,-1000.000000,500)
AddZone("Т-14", 250.000000,-1250.000000,-500,500.000000,-1000.000000,500)
AddZone("Т-15", 500.000000,-1250.000000,-500,750.000000,-1000.000000,500)
AddZone("Т-16", 750.000000,-1250.000000,-500,1000.000000,-1000.000000,500)
AddZone("Т-17", 1000.000000,-1250.000000,-500,1250.000000,-1000.000000,500)
AddZone("Т-18", 1250.000000,-1250.000000,-500,1500.000000,-1000.000000,500)
AddZone("Т-19", 1500.000000,-1250.000000,-500,1750.000000,-1000.000000,500)
AddZone("Т-20", 1750.000000,-1250.000000,-500,2000.000000,-1000.000000,500)
AddZone("Т-21", 2000.000000,-1250.000000,-500,2250.000000,-1000.000000,500)
AddZone("Т-22", 2250.000000,-1250.000000,-500,2500.000000,-1000.000000,500)
AddZone("Т-23", 2500.000000,-1250.000000,-500,2750.000000,-1000.000000,500)
AddZone("Т-24", 2750.000000,-1250.000000,-500,3000.000000,-1000.000000,500)
AddZone("У-1", -3000.000000,-1500.000000,-500,-2750.000000,-1250.000000,500)
AddZone("У-2", -2750.000000,-1500.000000,-500,-2500.000000,-1250.000000,500)
AddZone("У-3", -2500.000000,-1500.000000,-500,-2250.000000,-1250.000000,500)
AddZone("У-4", -2250.000000,-1500.000000,-500,-2000.000000,-1250.000000,500)
AddZone("У-5", -2000.000000,-1500.000000,-500,-1750.000000,-1250.000000,500)
AddZone("У-6", -1750.000000,-1500.000000,-500,-1500.000000,-1250.000000,500)
AddZone("У-7", -1500.000000,-1500.000000,-500,-1250.000000,-1250.000000,500)
AddZone("У-8", -1250.000000,-1500.000000,-500,-1000.000000,-1250.000000,500)
AddZone("У-9", -1000.000000,-1500.000000,-500,-750.000000,-1250.000000,500)
AddZone("У-10", -750.000000,-1500.000000,-500,-500.000000,-1250.000000,500)
AddZone("У-11", -500.000000,-1500.000000,-500,-250.000000,-1250.000000,500)
AddZone("У-12", -250.000000,-1500.000000,-500,0.000000,-1250.000000,500)
AddZone("У-13", 0.000000,-1500.000000,-500,250.000000,-1250.000000,500)
AddZone("У-14", 250.000000,-1500.000000,-500,500.000000,-1250.000000,500)
AddZone("У-15", 500.000000,-1500.000000,-500,750.000000,-1250.000000,500)
AddZone("У-16", 750.000000,-1500.000000,-500,1000.000000,-1250.000000,500)
AddZone("У-17", 1000.000000,-1500.000000,-500,1250.000000,-1250.000000,500)
AddZone("У-18", 1250.000000,-1500.000000,-500,1500.000000,-1250.000000,500)
AddZone("У-19", 1500.000000,-1500.000000,-500,1750.000000,-1250.000000,500)
AddZone("У-20", 1750.000000,-1500.000000,-500,2000.000000,-1250.000000,500)
AddZone("У-21", 2000.000000,-1500.000000,-500,2250.000000,-1250.000000,500)
AddZone("У-22", 2250.000000,-1500.000000,-500,2500.000000,-1250.000000,500)
AddZone("У-23", 2500.000000,-1500.000000,-500,2750.000000,-1250.000000,500)
AddZone("У-24", 2750.000000,-1500.000000,-500,3000.000000,-1250.000000,500)
AddZone("Ф-1", -3000.000000,-1750.000000,-500,-2750.000000,-1500.000000,500)
AddZone("Ф-2", -2750.000000,-1750.000000,-500,-2500.000000,-1500.000000,500)
AddZone("Ф-3", -2500.000000,-1750.000000,-500,-2250.000000,-1500.000000,500)
AddZone("Ф-4", -2250.000000,-1750.000000,-500,-2000.000000,-1500.000000,500)
AddZone("Ф-5", -2000.000000,-1750.000000,-500,-1750.000000,-1500.000000,500)
AddZone("Ф-6", -1750.000000,-1750.000000,-500,-1500.000000,-1500.000000,500)
AddZone("Ф-7", -1500.000000,-1750.000000,-500,-1250.000000,-1500.000000,500)
AddZone("Ф-8", -1250.000000,-1750.000000,-500,-1000.000000,-1500.000000,500)
AddZone("Ф-9", -1000.000000,-1750.000000,-500,-750.000000,-1500.000000,500)
AddZone("Ф-10", -750.000000,-1750.000000,-500,-500.000000,-1500.000000,500)
AddZone("Ф-11", -500.000000,-1750.000000,-500,-250.000000,-1500.000000,500)
AddZone("Ф-12", -250.000000,-1750.000000,-500,0.000000,-1500.000000,500)
AddZone("Ф-13", 0.000000,-1750.000000,-500,250.000000,-1500.000000,500)
AddZone("Ф-14", 250.000000,-1750.000000,-500,500.000000,-1500.000000,500)
AddZone("Ф-15", 500.000000,-1750.000000,-500,750.000000,-1500.000000,500)
AddZone("Ф-16", 750.000000,-1750.000000,-500,1000.000000,-1500.000000,500)
AddZone("Ф-17", 1000.000000,-1750.000000,-500,1250.000000,-1500.000000,500)
AddZone("Ф-18", 1250.000000,-1750.000000,-500,1500.000000,-1500.000000,500)
AddZone("Ф-19", 1500.000000,-1750.000000,-500,1750.000000,-1500.000000,500)
AddZone("Ф-20", 1750.000000,-1750.000000,-500,2000.000000,-1500.000000,500)
AddZone("Ф-21", 2000.000000,-1750.000000,-500,2250.000000,-1500.000000,500)
AddZone("Ф-22", 2250.000000,-1750.000000,-500,2500.000000,-1500.000000,500)
AddZone("Ф-23", 2500.000000,-1750.000000,-500,2750.000000,-1500.000000,500)
AddZone("Ф-24", 2750.000000,-1750.000000,-500,3000.000000,-1500.000000,500)
AddZone("Х-1", -3000.000000,-2000.000000,-500,-2750.000000,-1750.000000,500)
AddZone("Х-2", -2750.000000,-2000.000000,-500,-2500.000000,-1750.000000,500)
AddZone("Х-3", -2500.000000,-2000.000000,-500,-2250.000000,-1750.000000,500)
AddZone("Х-4", -2250.000000,-2000.000000,-500,-2000.000000,-1750.000000,500)
AddZone("Х-5", -2000.000000,-2000.000000,-500,-1750.000000,-1750.000000,500)
AddZone("Х-6", -1750.000000,-2000.000000,-500,-1500.000000,-1750.000000,500)
AddZone("Х-7", -1500.000000,-2000.000000,-500,-1250.000000,-1750.000000,500)
AddZone("Х-8", -1250.000000,-2000.000000,-500,-1000.000000,-1750.000000,500)
AddZone("Х-9", -1000.000000,-2000.000000,-500,-750.000000,-1750.000000,500)
AddZone("Х-10", -750.000000,-2000.000000,-500,-500.000000,-1750.000000,500)
AddZone("Х-11", -500.000000,-2000.000000,-500,-250.000000,-1750.000000,500)
AddZone("Х-12", -250.000000,-2000.000000,-500,0.000000,-1750.000000,500)
AddZone("Х-13", 0.000000,-2000.000000,-500,250.000000,-1750.000000,500)
AddZone("Х-14", 250.000000,-2000.000000,-500,500.000000,-1750.000000,500)
AddZone("Х-15", 500.000000,-2000.000000,-500,750.000000,-1750.000000,500)
AddZone("Х-16", 750.000000,-2000.000000,-500,1000.000000,-1750.000000,500)
AddZone("Х-17", 1000.000000,-2000.000000,-500,1250.000000,-1750.000000,500)
AddZone("Х-18", 1250.000000,-2000.000000,-500,1500.000000,-1750.000000,500)
AddZone("Х-19", 1500.000000,-2000.000000,-500,1750.000000,-1750.000000,500)
AddZone("Х-20", 1750.000000,-2000.000000,-500,2000.000000,-1750.000000,500)
AddZone("Х-21", 2000.000000,-2000.000000,-500,2250.000000,-1750.000000,500)
AddZone("Х-22", 2250.000000,-2000.000000,-500,2500.000000,-1750.000000,500)
AddZone("Х-23", 2500.000000,-2000.000000,-500,2750.000000,-1750.000000,500)
AddZone("Х-24", 2750.000000,-2000.000000,-500,3000.000000,-1750.000000,500)
AddZone("Ц-1", -3000.000000,-2250.000000,-500,-2750.000000,-2000.000000,500)
AddZone("Ц-2", -2750.000000,-2250.000000,-500,-2500.000000,-2000.000000,500)
AddZone("Ц-3", -2500.000000,-2250.000000,-500,-2250.000000,-2000.000000,500)
AddZone("Ц-4", -2250.000000,-2250.000000,-500,-2000.000000,-2000.000000,500)
AddZone("Ц-5", -2000.000000,-2250.000000,-500,-1750.000000,-2000.000000,500)
AddZone("Ц-6", -1750.000000,-2250.000000,-500,-1500.000000,-2000.000000,500)
AddZone("Ц-7", -1500.000000,-2250.000000,-500,-1250.000000,-2000.000000,500)
AddZone("Ц-8", -1250.000000,-2250.000000,-500,-1000.000000,-2000.000000,500)
AddZone("Ц-9", -1000.000000,-2250.000000,-500,-750.000000,-2000.000000,500)
AddZone("Ц-10", -750.000000,-2250.000000,-500,-500.000000,-2000.000000,500)
AddZone("Ц-11", -500.000000,-2250.000000,-500,-250.000000,-2000.000000,500)
AddZone("Ц-12", -250.000000,-2250.000000,-500,0.000000,-2000.000000,500)
AddZone("Ц-13", 0.000000,-2250.000000,-500,250.000000,-2000.000000,500)
AddZone("Ц-14", 250.000000,-2250.000000,-500,500.000000,-2000.000000,500)
AddZone("Ц-15", 500.000000,-2250.000000,-500,750.000000,-2000.000000,500)
AddZone("Ц-16", 750.000000,-2250.000000,-500,1000.000000,-2000.000000,500)
AddZone("Ц-17", 1000.000000,-2250.000000,-500,1250.000000,-2000.000000,500)
AddZone("Ц-18", 1250.000000,-2250.000000,-500,1500.000000,-2000.000000,500)
AddZone("Ц-19", 1500.000000,-2250.000000,-500,1750.000000,-2000.000000,500)
AddZone("Ц-20", 1750.000000,-2250.000000,-500,2000.000000,-2000.000000,500)
AddZone("Ц-21", 2000.000000,-2250.000000,-500,2250.000000,-2000.000000,500)
AddZone("Ц-22", 2250.000000,-2250.000000,-500,2500.000000,-2000.000000,500)
AddZone("Ц-23", 2500.000000,-2250.000000,-500,2750.000000,-2000.000000,500)
AddZone("Ц-24", 2750.000000,-2250.000000,-500,3000.000000,-2000.000000,500)
AddZone("Ч-1", -3000.000000,-2500.000000,-500,-2750.000000,-2250.000000,500)
AddZone("Ч-2", -2750.000000,-2500.000000,-500,-2500.000000,-2250.000000,500)
AddZone("Ч-3", -2500.000000,-2500.000000,-500,-2250.000000,-2250.000000,500)
AddZone("Ч-4", -2250.000000,-2500.000000,-500,-2000.000000,-2250.000000,500)
AddZone("Ч-5", -2000.000000,-2500.000000,-500,-1750.000000,-2250.000000,500)
AddZone("Ч-6", -1750.000000,-2500.000000,-500,-1500.000000,-2250.000000,500)
AddZone("Ч-7", -1500.000000,-2500.000000,-500,-1250.000000,-2250.000000,500)
AddZone("Ч-8", -1250.000000,-2500.000000,-500,-1000.000000,-2250.000000,500)
AddZone("Ч-9", -1000.000000,-2500.000000,-500,-750.000000,-2250.000000,500)
AddZone("Ч-10", -750.000000,-2500.000000,-500,-500.000000,-2250.000000,500)
AddZone("Ч-11", -500.000000,-2500.000000,-500,-250.000000,-2250.000000,500)
AddZone("Ч-12", -250.000000,-2500.000000,-500,0.000000,-2250.000000,500)
AddZone("Ч-13", 0.000000,-2500.000000,-500,250.000000,-2250.000000,500)
AddZone("Ч-14", 250.000000,-2500.000000,-500,500.000000,-2250.000000,500)
AddZone("Ч-15", 500.000000,-2500.000000,-500,750.000000,-2250.000000,500)
AddZone("Ч-16", 750.000000,-2500.000000,-500,1000.000000,-2250.000000,500)
AddZone("Ч-17", 1000.000000,-2500.000000,-500,1250.000000,-2250.000000,500)
AddZone("Ч-18", 1250.000000,-2500.000000,-500,1500.000000,-2250.000000,500)
AddZone("Ч-19", 1500.000000,-2500.000000,-500,1750.000000,-2250.000000,500)
AddZone("Ч-20", 1750.000000,-2500.000000,-500,2000.000000,-2250.000000,500)
AddZone("Ч-21", 2000.000000,-2500.000000,-500,2250.000000,-2250.000000,500)
AddZone("Ч-22", 2250.000000,-2500.000000,-500,2500.000000,-2250.000000,500)
AddZone("Ч-23", 2500.000000,-2500.000000,-500,2750.000000,-2250.000000,500)
AddZone("Ч-24", 2750.000000,-2500.000000,-500,3000.000000,-2250.000000,500)
AddZone("Ш-1", -3000.000000,-2750.000000,-500,-2750.000000,-2500.000000,500)
AddZone("Ш-2", -2750.000000,-2750.000000,-500,-2500.000000,-2500.000000,500)
AddZone("Ш-3", -2500.000000,-2750.000000,-500,-2250.000000,-2500.000000,500)
AddZone("Ш-4", -2250.000000,-2750.000000,-500,-2000.000000,-2500.000000,500)
AddZone("Ш-5", -2000.000000,-2750.000000,-500,-1750.000000,-2500.000000,500)
AddZone("Ш-6", -1750.000000,-2750.000000,-500,-1500.000000,-2500.000000,500)
AddZone("Ш-7", -1500.000000,-2750.000000,-500,-1250.000000,-2500.000000,500)
AddZone("Ш-8", -1250.000000,-2750.000000,-500,-1000.000000,-2500.000000,500)
AddZone("Ш-9", -1000.000000,-2750.000000,-500,-750.000000,-2500.000000,500)
AddZone("Ш-10", -750.000000,-2750.000000,-500,-500.000000,-2500.000000,500)
AddZone("Ш-11", -500.000000,-2750.000000,-500,-250.000000,-2500.000000,500)
AddZone("Ш-12", -250.000000,-2750.000000,-500,0.000000,-2500.000000,500)
AddZone("Ш-13", 0.000000,-2750.000000,-500,250.000000,-2500.000000,500)
AddZone("Ш-14", 250.000000,-2750.000000,-500,500.000000,-2500.000000,500)
AddZone("Ш-15", 500.000000,-2750.000000,-500,750.000000,-2500.000000,500)
AddZone("Ш-16", 750.000000,-2750.000000,-500,1000.000000,-2500.000000,500)
AddZone("Ш-17", 1000.000000,-2750.000000,-500,1250.000000,-2500.000000,500)
AddZone("Ш-18", 1250.000000,-2750.000000,-500,1500.000000,-2500.000000,500)
AddZone("Ш-19", 1500.000000,-2750.000000,-500,1750.000000,-2500.000000,500)
AddZone("Ш-20", 1750.000000,-2750.000000,-500,2000.000000,-2500.000000,500)
AddZone("Ш-21", 2000.000000,-2750.000000,-500,2250.000000,-2500.000000,500)
AddZone("Ш-22", 2250.000000,-2750.000000,-500,2500.000000,-2500.000000,500)
AddZone("Ш-23", 2500.000000,-2750.000000,-500,2750.000000,-2500.000000,500)
AddZone("Ш-24", 2750.000000,-2750.000000,-500,3000.000000,-2500.000000,500)
AddZone("Я-1", -3000.000000,-3000.000000,-500,-2750.000000,-2750.000000,500)
AddZone("Я-2", -2750.000000,-3000.000000,-500,-2500.000000,-2750.000000,500)
AddZone("Я-3", -2500.000000,-3000.000000,-500,-2250.000000,-2750.000000,500)
AddZone("Я-4", -2250.000000,-3000.000000,-500,-2000.000000,-2750.000000,500)
AddZone("Я-5", -2000.000000,-3000.000000,-500,-1750.000000,-2750.000000,500)
AddZone("Я-6", -1750.000000,-3000.000000,-500,-1500.000000,-2750.000000,500)
AddZone("Я-7", -1500.000000,-3000.000000,-500,-1250.000000,-2750.000000,500)
AddZone("Я-8", -1250.000000,-3000.000000,-500,-1000.000000,-2750.000000,500)
AddZone("Я-9", -1000.000000,-3000.000000,-500,-750.000000,-2750.000000,500)
AddZone("Я-10", -750.000000,-3000.000000,-500,-500.000000,-2750.000000,500)
AddZone("Я-11", -500.000000,-3000.000000,-500,-250.000000,-2750.000000,500)
AddZone("Я-12", -250.000000,-3000.000000,-500,0.000000,-2750.000000,500)
AddZone("Я-13", 0.000000,-3000.000000,-500,250.000000,-2750.000000,500)
AddZone("Я-14", 250.000000,-3000.000000,-500,500.000000,-2750.000000,500)
AddZone("Я-15", 500.000000,-3000.000000,-500,750.000000,-2750.000000,500)
AddZone("Я-16", 750.000000,-3000.000000,-500,1000.000000,-2750.000000,500)
AddZone("Я-17", 1000.000000,-3000.000000,-500,1250.000000,-2750.000000,500)
AddZone("Я-18", 1250.000000,-3000.000000,-500,1500.000000,-2750.000000,500)
AddZone("Я-19", 1500.000000,-3000.000000,-500,1750.000000,-2750.000000,500)
AddZone("Я-20", 1750.000000,-3000.000000,-500,2000.000000,-2750.000000,500)
AddZone("Я-21", 2000.000000,-3000.000000,-500,2250.000000,-2750.000000,500)
AddZone("Я-22", 2250.000000,-3000.000000,-500,2500.000000,-2750.000000,500)
AddZone("Я-23", 2500.000000,-3000.000000,-500,2750.000000,-2750.000000,500)
AddZone("Я-24", 2750.000000,-3000.000000,-500,3000.000000,-2750.000000,500)



}


calculateZone(posX, posY, posZ) {
    
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
        
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unbekannt"
}






calculateCity(posX, posY, posZ) {
    
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unbekannt"
    currentCitySize := 0
    smallestCitySize := 0
    
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    
    if(smallestCity == "Unbekannt") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}

/*
;do not work?
getCurrentZonecode() {
    if(!checkHandles())
        return ""
    
    return readString(hGTA, ADDR_ZONECODE, 5)
}
*/

AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}



AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}

IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
	GetPlayerPos(posX, posY, posZ)
	X := posX -_posX
	Y := posY -_posY
	Z := posZ -_posZ
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
		return TRUE
	return FALSE
}
 
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
 
	GetPlayerPos(posX, posY, posZ)
	X := posX - _posX
	Y := posY - _posY
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
		return TRUE
	return FALSE
}

getPlayerZone()
{
	aktPos := getCoordinates()
	return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}

getPlayerCity()
{
	aktPos := getCoordinates()
	return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}

; ##### Sonstiges #####
checkHandles() {
    if(iRefreshHandles+500>A_TickCount)
        return true
    iRefreshHandles:=A_TickCount
    if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
        return false
    } else {
        return true
    }
    
    return true
}

; internal stuff
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {                            ; GTA not found
        if(hGTA) {                            ; open handle
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    
    if(!hGTA || (dwGTAPID != newPID)) {        ; changed PID, closed handle
        hGTA := openProcess(newPID)
        if(ErrorLevel) {                    ; openProcess fail
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}

; internal stuff
refreshSAMP() {
    if(dwSAMP)
        return true
    
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
        return false
    
    return true
}

; internal stuff
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
    return true
}

; internal stuff
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}

; internal stuff
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
                        , "UInt", dwRights
                        , "int",  0
                        , "UInt", dwPID
                        , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return hProcess
}

; internal stuff
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CloseHandle"
                        , "Uint", hProcess
                        , "UInt")
    ErrorLevel := ERROR_OK
}

; internal stuff
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwSize = 1024*4                    ; 1024 * sizeof(HMODULE = 4)
    VarSetCapacity(hMods, dwSize)    
    VarSetCapacity(cbNeeded, 4)        ; DWORD = 4
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
                        , "UInt", hProcess
                        , "UInt", &hMods
                        , "UInt", dwSize
                        , "UInt*", cbNeeded
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    
    dwMods := cbNeeded / 4            ; cbNeeded / sizeof(HMDOULE = 4)
    i := 0
    VarSetCapacity(hModule, 4)        ; HMODULE = 4
    VarSetCapacity(sCurModule, 260)    ; MAX_PATH = 260
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
                , "UInt", hProcess
                , "UInt", hModule
                , "Str", sCurModule
                , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}

; internal stuff
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sRead
                        , "UInt", dwLen
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if A_IsUnicode
        return __ansiToUnicode(sRead)
    return sRead
}

; internal stuff
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; float = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}

; internal stuff
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; DWORD = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}

; internal stuff
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  dwLen
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}

; internal stuff
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    sString := wString
    if A_IsUnicode
        sString := __unicodeToAnsi(wString)
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sString
                        , "UInt", StrLen(wString) + 1
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

; internal stuff
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt", pBuffer
                        , "UInt", dwLen
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

; internal stuff
Memory_ReadByte(process_handle, address) {
	VarSetCapacity(value, 1, 0)
	DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
	return, NumGet(value, 0, "Byte")
}

; internal stuff
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    
    i := aParams.MaxIndex()
    
    ;         i * PUSH + CALL + RETN
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
        dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                    return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                    return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

; internal stuff
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualAllocEx"
                        , "UInt", hProcess
                        , "UInt", 0
                        , "UInt", dwSize
                        , "UInt", flAllocationType
                        , "UInt", flProtect
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualFreeEx"
                        , "UInt", hProcess
                        , "UInt", lpAddress
                        , "UInt", dwSize
                        , "UInt", dwFreeType
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CreateRemoteThread"
                        , "UInt", hProcess
                        , "UInt", lpThreadAttributes
                        , "UInt", dwStackSize
                        , "UInt", lpStartAddress
                        , "UInt", lpParameter
                        , "UInt", dwCreationFlags
                        , "UInt", lpThreadId
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "WaitForSingleObject"
                        , "UInt", hThread
                        , "UInt", dwMilliseconds
                        , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
__ansiToUnicode(sString, nLen = 0) {
   If !nLen
   {
      nLen := DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", 0
      , "int",  0)
   }

   VarSetCapacity(wString, nLen * 2)

   DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", &wString
      , "int",  nLen)
      
    return wString
}

; internal stuff
__unicodeToAnsi(wString, nLen = 0) {
   pString := wString + 1 > 65536 ? wString : &wString

   If !nLen
   {
      nLen := DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "Uint", 0
      , "int",  0
      , "Uint", 0
      , "Uint", 0)
   }

   VarSetCapacity(sString, nLen)

   DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "str",  sString
      , "int",  nLen
      , "Uint", 0
      , "Uint", 0)
    return sString
}


GetZona()
{
o:=Object()     
o:=GetCoordinates() 
Zona:=CalculateZone(o[1],o[2],o[3])
if(Zona=="Unbekannt")
{
o[1]:=o[1]-30
if(Zona=="Unbekannt")
{
o:=GetCoordinates()
o[1]:=o[1]+60
if(Zona=="Unbekannt")
{
o:=GetCoordinates()
o[1]:=o[1]-30
o[2]:=o[2]-30
if(Zona=="Unbekannt")
{
o:=GetCoordinates()
o[2]:=o[2]+60
Zona:=CalculateZone(o[1],o[2],o[3])

}
}
}
}
return Zona
}


in_car_not_cop(id)
{
if(getTargetVehicleModelNameById(id)!="PoliceCar" and getTargetVehicleModelNameById(id)!="HPV1000" and getTargetVehicleModelNameById(id)!="Enforcer" and getTargetVehicleModelNameById(id)!="")
return 1
else
return 0
}


person_passenger(id,id2)
{
 
        t:=getDist(getPedCoordinates(getPedById(id)),getPedCoordinates(getPedById(id2)))
        if(1.2>t)
        	   
         	return 1
        	
        else
		return -1
}

addMessageToChatWindow(wText) {
    wText := "" wText

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

getClosestPlayerIdUnitByCar() {
    dist := 2
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
if (isTargetInAnyVehiclebyIdMod(i)!=-1) and (getTargetPlayerSkinIdById(i)!="76") and (getTargetPlayerSkinIdById(i)!="265") and (getTargetPlayerSkinIdById(i)!="266") and (getTargetPlayerSkinIdById(i)!="267") and (getTargetPlayerSkinIdById(i)!="280") and (getTargetPlayerSkinIdById(i)!="281") and (getTargetPlayerSkinIdById(i)!="282") and (getTargetPlayerSkinIdById(i)!="283") and (getTargetPlayerSkinIdById(i)!="284") and (getTargetPlayerSkinIdById(i)!="285") and (getTargetPlayerSkinIdById(i)!="288") and (getTargetPlayerSkinIdById(i)!="306") and (getTargetPlayerSkinIdById(i)!="307") and (getTargetPlayerSkinIdById(i)!="309") and (getTargetPlayerSkinIdById(i)!="141") and (getTargetPlayerSkinIdById(i)!="163") and (getTargetPlayerSkinIdById(i)!="164") and (getTargetPlayerSkinIdById(i)!="165") and (getTargetPlayerSkinIdById(i)!="166") and (getTargetPlayerSkinIdById(i)!="286")
       { 
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
}
    return id
}


getClosestPlayerIdUnit() {
    dist := 4
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
if (getTargetPlayerSkinIdById(i)!="76") and (getTargetPlayerSkinIdById(i)!="265") and (getTargetPlayerSkinIdById(i)!="266") and (getTargetPlayerSkinIdById(i)!="267") and (getTargetPlayerSkinIdById(i)!="280") and (getTargetPlayerSkinIdById(i)!="281") and (getTargetPlayerSkinIdById(i)!="282") and (getTargetPlayerSkinIdById(i)!="283") and (getTargetPlayerSkinIdById(i)!="284") and (getTargetPlayerSkinIdById(i)!="285") and (getTargetPlayerSkinIdById(i)!="288") and (getTargetPlayerSkinIdById(i)!="306") and (getTargetPlayerSkinIdById(i)!="307") and (getTargetPlayerSkinIdById(i)!="309") and (getTargetPlayerSkinIdById(i)!="141") and (getTargetPlayerSkinIdById(i)!="163") and (getTargetPlayerSkinIdById(i)!="164") and (getTargetPlayerSkinIdById(i)!="165") and (getTargetPlayerSkinIdById(i)!="166") and (getTargetPlayerSkinIdById(i)!="286")
       { 
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
}
    return id
}

isPlayerDriverMod() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1

    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    t:=0
    if (dwVal==dwCPedPtr)
    {
    t:=1
    }
    return t
}

getClosestPlayerIdCar() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
       { 
        t:=getDist(lpos,o.POS)
        if (isTargetInAnyVehiclebyIdMod(i)==1)
        {
        ;AddMessageToChatWindow(t ", " i ", " k)
        if(t<dist)
        {
            dist := t
            id := i
        }
        }
        }
    }
    return id
}

isTargetInAnyVehiclebyIdMod(dwId)
{
    if(!checkHandles())
        return -1
    
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    ;AddMessageToChatWindow(dwVehiclePointer)
    dwVal := readDWORD(hGTA, dwVehiclePointer + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    if(dwPedPointer == dwVal)
    {
        return 1
    }
    else if(dwPedPointer != dwVal)
    {
        return 0
    }
    else
    {
        return -1
    }
}

getTargetVehicleColor1NameById(dwId) {
    id := getTargetVehicleColor1ById(dwId)
    AddMessageToChatWindow(id)
    if ((id > "-1") and (id < "127"))
    {
        return color11namecars[id+1]
    }
    if ((id > "127") and (id < "256"))
    {
        return color12namecars[id-127]
    }
    return ""
}

getTargetVehicleColor2NameById(dwId) {
    id := getTargetVehicleColor2ById(dwId)
    AddMessageToChatWindow(id)
    if ((id > "-1") and (id < "127"))
    {
        return color21namecars[id+1]
    }
    if ((id > "127") and (id < "256"))
    {
        return color22namecars[id-127]
    }
    return ""
}

TriZnakaVNomereId(dwId) {
if (dwId<0 and dwId>999)
   return -1
if (dwId>-1 and dwId<10)
   {
   k:= "00" dwId
   return k
   }
if (dwId>9 and dwId<100)
   {
   k:= "0" dwId
   return k
   }
if (dwId>99 and dwId<1000)
   return dwId
}

isTargetInAnyVehiclebyIdModV2(dwId)
{
    if(!checkHandles())
        return -1
    
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    ;AddMessageToChatWindow(dwVehiclePointer)
    dwVal := readDWORD(hGTA, dwVehiclePointer + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    AddMessageToChatWindow("dwVehiclePointer=" dwVehiclePointer ", dwVal=" dwVal ", dwPedPointer=" dwPedPointer)
    AddMessageToChatWindow(getDist(getPedCoordinates(dwPedPointer),getPedCoordinates(dwVal)))
    if(dwPedPointer == dwVal)
    {
        return 1
    }
    else if(dwVal == "0")
    {
        return -1
    }
    else if (getDist(getPedCoordinates(dwPedPointer),getPedCoordinates(dwVal))>"1.5")
    {
        return -1
    }
    else if(dwPedPointer != dwVal)
    {
        return 0
    }
    else
    {
        return -1
    }
}

getClosestPlayerIdCarNotCopFBIandNotMyDriver() {
dist := 10            ;max int32
p := getStreamedInPlayersInfo()
if(!p)
   return -1
lpos := getCoordinates()
if(!lpos)
   return -1
id := -1
For i, o in p
   if (getTargetPlayerSkinIdById(i)!="76" and getTargetPlayerSkinIdById(i)!="265" and getTargetPlayerSkinIdById(i)!="266" and getTargetPlayerSkinIdById(i)!="267" and getTargetPlayerSkinIdById(i)!="280" and getTargetPlayerSkinIdById(i)!="281" and getTargetPlayerSkinIdById(i)!="282" and getTargetPlayerSkinIdById(i)!="283" and getTargetPlayerSkinIdById(i)!="284" and getTargetPlayerSkinIdById(i)!="285" and getTargetPlayerSkinIdById(i)!="288" and getTargetPlayerSkinIdById(i)!="306" and getTargetPlayerSkinIdById(i)!="307" and getTargetPlayerSkinIdById(i)!="309" and getTargetPlayerSkinIdById(i)!="141" and getTargetPlayerSkinIdById(i)!="163" and getTargetPlayerSkinIdById(i)!="164" and getTargetPlayerSkinIdById(i)!="165" and getTargetPlayerSkinIdById(i)!="166" and getTargetPlayerSkinIdById(i)!="286")
      { 
      t:=getDist(lpos,o.POS)
      ;AddMessageToChatWindow(t ", " i ", " k)
      if(t<dist)
         {
         dist := t
         id := i
         }
      }
return id
}

Preference() {
    if(!checkHandles())
        return -1
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    myCarId := readMem(hGTA, dwVehPtr + 0x13C298, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return myCarId
}

isDialogOpen() {
    if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return false
	}
    dwPointer := readDWORD(hGTA, dwSAMP + 0x21A0B8)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	if (ErrorLevel || !dwPointer)
	return false

	dwIsOpen := readMem(hGTA, dwPointer + 0x28, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	ErrorLevel := ERROR_OK
	return dwIsOpen ? true : false
}

getDialogStructPtr() {
	if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return false
	}

	dwPointer := readDWORD(hGTA, dwSAMP + 0x21A0B8)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return dwPointer
}

getDialogLineNumber() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return 0

    dwPointer := readDWORD(hGTA, dwPointer + 0x20)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + 0x140, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    return count//16777216+1
}

getDialogStyle() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	style := readMem(hGTA, dwPointer + 0x2C, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return style
}

getDialogID() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	id := readMem(hGTA, dwPointer + 0x30, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return id
}

setDialogID(id) {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	writeMemory(hGTA, dwPointer + 0x30, id, "UInt", 4)
	if (ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return true
}
setDialogIndex(index)
{
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return false

    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel)
    {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    writeMemory(hGTA, dwPointer + 0x143, index - 1, 1, "Byte")
    sleep, 100
    Send, {ENTER}
}
getDialogIndex() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return 0

	dwPointer := readDWORD(hGTA, dwPointer + 0x1C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	index := readMem(hGTA, dwPointer + 0x443, 1, "Byte")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return index + 1
}

getDialogCaption() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	text := readString(hGTA, dwPointer + 0x40, 64)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	ErrorLevel := ERROR_OK
	return text
}

getDialogTextSize(dwAddress) {
	i := 0
	Loop, 4096 {
		i := A_Index - 1
		byte := Memory_ReadByte(hGTA, dwAddress + i)
		if (!byte)
			break
	}

	return i
}

getDialogText() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + 0x34)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	text := readString(hGTA, dwPointer, 4096)
	if (ErrorLevel) {
		text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
		if (ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
			return ""
		}
	}

	ErrorLevel := ERROR_OK
	return text
}

getDialogLineCount() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return 0

	dwPointer := readDWORD(hGTA, dwPointer + 0x20)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	count := readMem(hGTA, dwPointer + 0x150, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return count
}

getDialogLine__(index) {
	if (getDialogLineCount > index)
		return ""

	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + 0x1C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwPointer := readDWORD(hGTA, dwPointer + 0x44C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
	line := readString(hGTA, dwLineAddress, 128)

	ErrorLevel := ERROR_OK
	return line
}

getDialogLine(index) {
	lines := getDialogLines()
	if (index > lines.Length())
		return ""

	if (getDialogStyle() == 5)
		index++

	return lines[index]
}

getDialogLines() {
	text := getDialogText()
	if (text == "")
		return -1

	lines := StrSplit(text, "`n")
	return lines
}

isDialogButton1Selected() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	dwPointer := readDWORD(hGTA, dwPointer + 0x1C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	selected := readMem(hGTA, dwPointer + 0x465, 1, "Byte")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return selected
}

getDialogLines__() {
	count := getDialogLineCount()

	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	dwPointer := readDWORD(hGTA, dwPointer + 0x1C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwPointer := readDWORD(hGTA, dwPointer + 0x44C)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	lines := []
	Loop %count% {
		dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
		lines[A_Index] := readString(hGTA, dwLineAddress, 128)
	}

	ErrorLevel := ERROR_OK
	return lines
}

writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
  if(!hProcess) {
    ErrorLevel := ERROR_INVALID_HANDLE
    return false
  }
}

getMyPassengerId(dwPlace) {
    if(!checkHandles())
        return -1
    if(dwPlace < 0 || dwPlace > 8)
        return 0
    dwPlacePoint := [0x460, 0x464, 0x468, 0x46C, 0x470, 0x474, 0x478, 0x47C, 0x480]
    dwPlaceAdr := dwPlacePoint[dwPlace + 1]
    dwVehPtr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := readDWORD(hGTA, dwVehPtr+dwPlaceAdr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    pasID := getIdByPed(dwAddr)
    return pasID
}

AvtoIndexDialog(dwIndex) {
while isDialogOpen()==0
   sleep 0
while (getDialogIndex()>dwIndex)
   {
   Send {Up}
   sleep 10
   }
sleep 0
while (getDialogIndex()<dwIndex)
   {
   Send {Down}
   sleep 10
   }
sleep 50
Send {Enter down}
sleep 200
Send {Enter Up}
}

getMyCarId() {
	if (!checkHandles())
		return -1
	dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
	if (ErrorLevel || !dwVehPtr)
		return -1
	if (!updateOVehicleData())
		return -1
	for i, o in oVehiclePoolData {
		if (o.PTR == dwVehPtr)
			return o.ID
	}
	return -1
}

updateOVehicleData() {
	RefreshVeh := 0
	if (!checkHandles())
		return -1
	if (RefreshVeh + 1000 > A_TickCount)
		return true
	dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
	dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
	stVehiclePool := readDWORD(hGTA, dwAddress + 0x1C)
	if (!stVehiclePool)
		return -1
	vehicleCount := readDWORD(hGTA, stVehiclePool + 0x0)
	Loop, % 2000 
	{
		if (!readDWORD(hGTA, stVehiclePool + 0x3074 + (A_Index - 1) * 0x4))
			continue
		vehPtr := readDWORD(hGTA, stVehiclePool + 0x4FB4 + (A_Index - 1) * 0x4)
		if (!vehPtr)
			continue
		oVehiclePoolData.Push(Object("ID", A_Index - 1, "PTR", vehPTR))
		vehicleCount := vehicleCount-1
		if (vehicleCount < 1)
			break
	}
	RefreshVeh := A_TickCount
	return true
}

getMyCarIdPoslednyy() {
    if(!checkHandles())
        return -1
    dwGTA := getModuleBaseAddress("samp.dll", hGTA)
    myCarId := readMem(hGTA, dwGTA + 0x13C298, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return myCarId
}

setCheckpoint(fX, fY, fZ, fSize ) {
    if(!checkHandles())
        return false
    dwFunc := dwSAMP + 0x9D340
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    writeRaw(hGTA, pParam1, &buf, 16)
    dwLen := 31
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(pParam1+12, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam1, injectData, 11, "UInt")
    NumPut(0xE8, injectData, 15, "UChar")
    offset := dwFunc - (pInjectFunc + 20)
    NumPut(offset, injectData, 16, "Int")
    NumPut(0x05C7, injectData, 20, "UShort")
    NumPut(dwAddress+0x24, injectData, 22, "UInt")
    NumPut(1, injectData, 26, "UInt")
    NumPut(0xC3, injectData, 30, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    ErrorLevel := ERROR_OK
    return true
}

disableCheckpoint()
{
    if(!checkHandles())
        return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}

IsMarkerCreated(){
    If(!checkHandles())
        return false
    active := readMem(hGTA, CheckpointCheck, 1, "byte")
    If(!active)
        return 0
    else return 1
}

CoordsFromRedmarker(){
    if(!checkhandles())
        return false
    for i, v in rmaddrs
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}

getMarkZone() {
 aktPos := CoordsFromRedmarker()
 return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}

GetChatText() {
    if (isInChat())
    {
        sleep 200
        dwAddress := dwSAMP + 0x12D8F8
        lastLine := readString(hGTA, dwAddress, 256)
        return lastLine
    }
    else return -1
}

GetDialogStringText() {
    sleep 200
    dwAddress := dwSAMP + 0x12D8F8
    lastLine := readString(hGTA, dwAddress, 256)
    return lastLine
}

getIdCarById(dwid) {
	if (!checkHandles())
		return -1
        dwPedPointer := getPedById(dwid) 
	dwVehPtr := getVehiclePointerByPed(dwPedPointer)
	if (ErrorLevel || !dwVehPtr)
		return -1
	if (!updateOVehicleData())
		return -1
	for i, o in oVehiclePoolData {
		if (o.PTR == dwVehPtr)
			return o.ID
	}
	return -1
}

GetClassVehicleById(dwid) {
   if (!checkHandles())
      return -1
   dwPedPointer := getPedById(dwid)
   dwVehPtr := getVehiclePointerByPed(dwPedPointer)
   dwVehCl := readDWORD(hGTA, dwVehPtr + 0x594)
   if(ErrorLevel) {
      ErrorLevel := ERROR_READ_MEMORY
         return -1
      }
return dwVehCl
}

AvtoIndexDialogV2(dwIndex) {
while isDialogOpen()==0
   sleep 0
i:=1
while (i<dwIndex)
   {
   Send {Down}
   i++
   sleep 10
   }
sleep 50
Send {Enter}
}

initZonesAndCities2() {
AddZone("Гараж ЛВПД", 2237.359619, 2429.931152, -500, 2303.589844, 2504.138916,500)
AddZone("Казино Калигула", 2087.214844, 1585.840820, -500, 2229.512451, 1750.749634, 500)
AddZone("Казино 4 дракона", 1983.351563, 940.171021, -500, 2056.114990, 1088.261108, 500)
AddZone("АММО ЛВ", 2137.748047, 902.641113, -500, 2217.405273, 967.786072, 500)
AddZone("Пост «Т» ЛВПД", 2433.535889, 1319.261719, -500, 2477.268555, 1363.125488, 500)
AddZone("АВЛВ", 2757.773193, 1223.326416, -500, 2861.079102, 1383.010376, 500)
AddZone("Завод КАСС", 2496.262451, 2689.259033, -500, 2750.239502, 2858.325928, 500)
AddZone("Гольф-клуб", 1163.973389, 2723.331543, -500, 1534.211304, 2882.718018, 500)
AddZone("Больница ЛВ", 1577.442017, 1723.249512, -500, 1637.141113, 1863.095703, 500)
AddZone("Холм ЛВА", 340.921234, 1605.346802, -500, 427.482483, 1759.415161, 500)
AddZone("Главный склад ЛВА", 299.500519, 1915.550415, -500, 372.655334, 1985.177734, 500)
AddZone("Сетка ЛВА", 324.645691, 1764.545288, -500, 355.489319, 1818.751831, 500)
AddZone("Бункер ЛВА", 201.445007, 1841.716431, -500, 267.881561, 1874.382935, 500)
AddZone("Спортзал ЛВ", 2037.458496, 2463.217041, -500, 2156.506348, 2511.380371, 500)
AddZone("Пост «ЛС» ЛВПД", 1814.202026, 758.725586, -500, 1890.710938, 828.032410, 500)
AddZone("Похоронное бюро", 1397.517578, 663.350525, -500, 1557.269409, 797.620728, 500)
AddZone("Пост «СФ» ЛВПД", 1093.369019, 762.536194, -500, 1231.365234, 870.445251, 500)
AddZone("Карьер", 419.788635, 775.888489, -500, 774.135071, 1092.706055, 500)
AddZone("Закуска ФК", 128.297897, 1167.079224, -500, 220.949478, 1197.581055, 500)
AddZone("Нефтезавод", 110.754135, 1335.447021, -500, 364.136169, 1484.873657, 500)
AddZone("КПП ЛВА", 77.166168, 1890.080688, -500, 112.306168, 1940.977417, 500)
AddZone("Бар НЛО", -120.701927, 1331.624878, -500, -56.826542, 1394.800415, 500)
AddZone("Больница ФК", -351.494110, 1021.631165, -500, -290.131104, 1093.352905, 500)
AddZone("Мост СФ-ЛВ", -1481.743164, 760.484253, -500, -980.337341, 1121.047119, 500)
AddZone("Мост СФ-ЛВ", -1678.122437, 559.070190, 38, -1441.903076, 760.586853, 500)
AddZone("ЧОП Медведь", 917.588440, 1623.329956, -500, 1002.323303, 1843.104980, 500)
AddZone("Грузчики", 2091.469238, -2331.111328, -500, 2268.778076, -2176.788330, 500)
AddZone("Порт ЛС", 2666.302979, -2565.655518, -500, 2810.641113, -2330.391113, 500)
AddZone("Пост «ЛС-СФ» ЛСПД", 29.092413, -1542.750488, -500, 77.452187, -1521.072388, 500)
AddZone("Пост «S» ЛСПД", 1280.098877, -1880.211792, -500, 1323.710083, -1841.231934, 500)
AddZone("Авторынок", 1210.324585, -2072.505859, -500, 1284.175415, -2002.721191, 500)
AddZone("Площадь мэрии", 1435.254272, -1755.555298, -500, 1524.238770, -1597.571533, 500)
AddZone("Ферма 0", -383.776855, -1460.834839, -500, -158.551285, -1298.095947, 500)
AddZone("Ферма 1", -286.762451, -104.227715, -500, -76.164528, 176.790634, 500)
AddZone("Ферма 2", -1214.419678, -1297.021729, -500, -1001.580811, -908.501770, 500)
AddZone("Ферма 3", -67.897026, -138.007233, -500, 87.825890, 143.335648, 500)
AddZone("Ферма 4", 1890.960693, 163.143585, -500, 2009.940308, 240.584824, 500)
AddZone("Алкозавод", -254.342331, -392.736694, -500, 11.514775, -210.912216, 500)
AddZone("Лодочная", 666.033752, -1742.853027, -500, 772.486206, -1591.582153, 500)
AddZone("Заправка возле фермы 0", -119.893707, -1194.388672, -500, -55.886837, -1159.107300, 500)
AddZone("Закуска под Vinewood", 1169.023315, -932.535767, -500, 1225.589111, -866.171082, 500)
AddZone("Заправка под Vinewood", 978.316406, -955.316284, -500, 1018.149475, -888.249878, 500)
AddZone("Пост «R» ЛСПД", 1562.924927, -899.428650, -500, 1666.647095, -812.215088, 500)
AddZone("ASGH", 1149.697876, -1385.308105, -500, 1216.348877, -1290.885620, 500)
AddZone("АММО ЛС", 1333.246704, -1311.696899, -500, 1369.630249, -1250.483521, 500)
AddZone("АВЛС", 1058.042603, -1786.053467, -500, 1188.374146, -1717.552490, 500)
AddZone("АВСФ", -2001.280884, 77.551384, -500, -1946.460815, 213.515747, 500)
AddZone("АММО СФ", -2646.473877, 207.437927, -500, -2616.312500, 227.103119, 500)
AddZone("LS News", 1624.925171, -1727.460205, -500, 1679.923584, -1597.294434, 500)
AddZone("SF News", -2062.480713, 443.024261, -500, -2011.318970, 498.885010, 500)
AddZone("LV News", 2612.675293, 1162.743408, -500, 2677.248535, 1243.127563, 500)
AddZone("Банк", 1385.551147, -1722.501099, 13, 1423.699829, -1655.456787, 500)
}

calculateZone2(posX, posY, posZ) {
    
    if ( bInitZaC2 == 0 )
    {
        initZonesAndCities2()
        bInitZaC2 := 1
    }
        
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unbekannt"
}

getPlayerLocation() {
	aktPos := getCoordinates()
	return calculateZone2(aktPos[1], aktPos[2], aktPos[3])
}

getColorById(dwId) {
    dwId += 0
    if(!checkHandles())
        return -1
    if(getPlayerNameById(dwId)=="")
        return -1
    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*dwId)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if(StrLen(color)==5)
        color:="0" color
    return color
}

showDialog2(style, caption, text, button1, button2 := "", id := 1) {
	style += 0
	style := Floor(style)
	id += 0
	id := Floor(id)
	caption := "" caption
	text := "" text
	button1 := "" button1
	button2 := "" button2

	if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
		return false

	if (!checkHandles())
		return false

	dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG

    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_SHOWDLG_PTR)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }

	writeString(hGTA, pParam5, caption)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam1, text)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam5 + 512, button1)
	if (ErrorLevel)
		return false
    
	writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
	if (ErrorLevel)
		return false
    
    Button1Global:=StrLen(caption)

	;mov + 7 * push + call + retn
	dwLen := 5 + 7 * 5 + 5 + 1
	VarSetCapacity(injectData, dwLen, 0)

	NumPut(0xB9, injectData, 0, "UChar")							;0 + 1	;mov ecx
	NumPut(dwAddress, injectData, 1, "UInt")						;1 + 4
	NumPut(0x68, injectData, 5, "UChar")							;5 + 1	;push send
	NumPut(1, injectData, 6, "UInt")								;6 + 4
	NumPut(0x68, injectData, 10, "UChar")							;10 + 1	;push button2
	NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")	;11 + 4
	NumPut(0x68, injectData, 15, "UChar")							;15 + 1	;push button1
	NumPut(pParam5 + 512, injectData, 16, "UInt")					;16 + 4
	NumPut(0x68, injectData, 20, "UChar")							;20 + 1	;push text
	NumPut(pParam1, injectData, 21, "UInt")							;21 + 4
	NumPut(0x68, injectData, 25, "UChar")							;25 + 1	;push caption
	NumPut(pParam5, injectData, 26, "UInt")							;26 + 4
	NumPut(0x68, injectData, 30, "UChar")							;30 + 1	;push style
	NumPut(style, injectData, 31, "UInt")							;31 + 4
	NumPut(0x68, injectData, 35, "UChar")							;35 + 1	;push id
	NumPut(id, injectData, 36, "UInt")								;36 + 4

	NumPut(0xE8, injectData, 40, "UChar")							;40 + 1 ;call
	offset := dwFunc - (pInjectFunc + 45)
	NumPut(offset, injectData, 41, "Int")							;41 + 4
	NumPut(0xC3, injectData, 45, "UChar")							;45 + 1	;retn

	writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)

	return true
}

getColorById2(dwId) 
{
    dwId += 0
    if(!checkHandles())
        return -1
    if(getPlayerNameById(dwId)=="")
        return -1
    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*dwId)
    if(ErrorLevel) 
{
        ErrorLevel := ERROR_READ_MEMORY
        return -1
}
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if(StrLen(color)==5)
        color:="0" color
    return color
}

writeFloat(hProcess, dwAddress, wFloat) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }

    wFloat := FloatToHex(wFloat)

    dwRet := DllCall(   "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt *", wFloat
                        , "UInt", 4
                        , "UInt *", 0)

    ErrorLevel := ERROR_OK
    return true
}

writeByte(hProcess, dwAddress, wInt) {
  if(!hProcess) {
      ErrorLevel := ERROR_INVALID_HANDLE
      return false
  }

  wInt := IntToHex(wInt)

	dwRet := DllCall(     "WriteProcessMemory"
	                      , "UInt", hProcess
	                      , "UInt", dwAddress
	                      , "UInt *", wInt
	                      , "UInt", 1
	                      , "UInt *", 0)
}

FloatToHex(value) {
   format := A_FormatInteger
   SetFormat, Integer, H
   result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
   SetFormat, Integer, %format%
   return, result
}

IntToHex(int)
{
	CurrentFormat := A_FormatInteger
	SetFormat, integer, hex
	int += 0
	SetFormat, integer, %CurrentFormat%
	return int
}

/* addChatMessageWithColor(wColor, wText) {
    wText := "{" wColor "}" wText
    if(!checkHandles())
        return false
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    return true
} 
*/

isDialogButtonSelected(btn := 1) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return false
    
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    offset := (btn == 1 ? 0x165 : 0x2C5)
    sel := readMem(hGTA, dwPointer + offset, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return sel
}

WaitForChooseInDialog(id) {
    ;~ SetTimer, CMDPROC, off
    capt := getDialogCaption()
    if (id = 3) {
        Loop {
             if (isDialogOpen()) and (capt = getDialogCaption()) {
                  LButton := GetKeyState("vk01", P)
                  Enter := GetKeyState("vk0D", P)
                  
                  if (LButton = 1) {
                    if (isDialogButtonSelected(1) == 1) {
                        while (isDialogOpen() = 0)
                            return, % "Close"
                    }
                       sleep 200
                       num := getDialogLineNumber()
                       if (!isDialogOpen()) {
                            return, %num%
                       } else {
                            continue
                       }
                  }
                  
                  if (Enter = 1) {
                       num := getDialogLineNumber()
                       sleep 200
                       if (!isDialogOpen()) { ;
                            ;~ SetTimer, CMDPROC, on
                            return, %num%
                       } else if (isDialogOpen()) and (capt = getDialogCaption()) {
                            continue
                       } else if (isDialogOpen()) and (capt != getDialogCaption()) {
                            continue
                       } else {
                            ;~ SetTimer, CMDPROC, on
                            return, Error
                       }
                  }
             } else {
                ;~ SetTimer, CMDPROC, on
                return, % "Close"
             }
        }
    } else if (id = 1) {
        Loop {
            if (isDialogOpen()) and (capt = getDialogCaption()) {
                LButton := GetKeyState("vk01", P)
                Enter := GetKeyState("vk0D", P)
                
                if (LButton = 1) {
                    if (isDialogButtonSelected(1) == 1) {
                        while (isDialogOpen() = 0)
                            return, % "Close"
                    }
                    sleep 200
                    if (!isDialogOpen()) {
                        chat := readString(hGTA, dwSAMP + 0x12D8F8, 256)
                        ;~ SetTimer, CMDPROC, on
                        return, %chat%
                    } else {
                            continue
                    }
                }
                
                if (Enter = 1) {
                    sleep 200
                    if (!isDialogOpen()) { ; 
                        chat := readString(hGTA, dwSAMP + 0x12D8F8, 256)
                        ;~ SetTimer, CMDPROC, on
                        return, %chat%
                    } else if (isDialogOpen()) and (capt = getDialogCaption()) {
                        continue
                    } else if (isDialogOpen()) and (capt != getDialogCaption()) {
                        continue
                    } else {
                        ;~ SetTimer, CMDPROC, on
                        return, Error
                    }
                }
            } else {
                ;~ SetTimer, CMDPROC, on
                return, % "Close"
            }
        }
    }
}

HexToDec(str)
{   
   local newStr := ""
   static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
   StringLower, str, str
   str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
   Loop, % StrLen(str)
       newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
   newStr := StrSplit(newStr, "")
   local ret := 0
   for i,char in newStr
       ret += comp[char]*(16**(i-1))
   return ret
}

HexToDecOne(Hex)
{
    if (InStr(Hex, "0x") != 1)
    Hex := "0x" Hex
    return, Hex + 0
}

HexToDecTwo(hex)
{
    VarSetCapacity(dec, 66, 0)
    , val := DllCall("msvcrt.dll\_wcstoui64", "Str", hex, "UInt", 0, "UInt", 16, "CDECL Int64")
    , DllCall("msvcrt.dll\_i64tow", "Int64", val, "Str", dec, "UInt", 10, "CDECL")
    return dec
}
hex2rgb(CR)
{
    NumPut((InStr(CR, "#") ? "0x" SubStr(CR, 2) : "0x") SubStr(CR, -5), (V := "000000"))
    return NumGet(V, 2, "UChar") "," NumGet(V, 1, "UChar") "," NumGet(V, 0, "UChar")
}
rgb2hex(R, G, B, H := 1)
{
    static U := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static V := A_IsUnicode ? "_i64tow"    : "_i64toa"
    rgb := ((R << 16) + (G << 8) + B)
    H := ((H = 1) ? "#" : ((H = 2) ? "0x" : ""))
    VarSetCapacity(S, 66, 0)
    value := DllCall("msvcrt.dll\" U, "Str", rgb , "UInt", 0, "UInt", 10, "CDECL Int64")
    DllCall("msvcrt.dll\" V, "Int64", value, "Str", S, "UInt", 16, "CDECL")
    return H S
}

addMessageToChatWindow2(Color, wText) {
    wText := "" wText

    if(!checkHandles())
        return false
    
    VarSetCapacity(data2, 4, 0)
    NumPut(HexToDec(Color),data2,0,"Int")
    VarSetCapacity(data1, 4, 0)
    NumPut(4289316068,data1,0,"Int") 
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    Addrr := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    ErrorLevel := ERROR_OK
    WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
    return true
}

GetCursourPos(ByRef x, Byref y, mode) { ; Возвращает координаты курсора в окне SAMP для overlay
    kx := mode = "image" ? 320 : 800
    ky := mode = "image" ? 320 : 600
    MouseGetPos, Mx, My
    x := kx * Mx/XResolution
    y := ky * My/YResolution
    return, True
}

 ; show cursor
cursorShow() { 
    if(!checkHandles()) 
      return -1 
    byte := Memory_ReadByte(hGTA, dwSAMP + 0x69529)
    writeBytes(hGTA, dwSAMP + 0x69529, "909090909090") 
    sleep 50 
    writeBytes(hGTA, dwSAMP + 0x69529, "0F84AE000000") 
    return true
  }

cursorHide() {
    SendInput, {F6}
    sleep 50
    SendInput {F6}
    return
}

writeBytes(handle, address, bytes)
{
    length := strlen(bytes) / 2
    VarSetCapacity(toInject, length, 0)
    Loop %length%
    {
        byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
        NumPut(byte, toInject, A_Index - 1, "uchar")
    }
    return writeRaw(handle, address, &toInject, length)
}

HttpRequest(HttpRequestUrl) { ; выполняет HTTP запрос
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", HttpRequestUrl, true)
	whr.Send()
	whr.WaitForResponse()
	return, % whr.ResponseText
}
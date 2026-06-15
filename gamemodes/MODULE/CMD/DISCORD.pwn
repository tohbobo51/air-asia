forward DCC_DM(str[]);
public DCC_DM(str[])
{
    new DCC_Channel:PM;
	PM = DCC_GetCreatedPrivateChannel();
	DCC_SendChannelMessage(PM, str);
	return 1;
}

forward DCC_DM_EMBED(str[], pin, id[]);
public DCC_DM_EMBED(str[], pin, id[])
{
    new DCC_Channel:PM, query[200];
	PM = DCC_GetCreatedPrivateChannel();

	new DCC_Embed:embed = DCC_CreateEmbed(.title="Asia Pride Roleplay", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[100], str2[100];

	format(str1, sizeof str1, "```\nHalo!\nUCP kamu berhasil terverifikasi,\nGunakan PIN dibawah ini untuk login ke Game```");
	DCC_SetEmbedDescription(embed, str1);
	format(str1, sizeof str1, "UCP");
	format(str2, sizeof str2, "\n```%s```", str);
	DCC_AddEmbedField(embed, str1, str2, bool:1);
	format(str1, sizeof str1, "PIN");
	format(str2, sizeof str2, "\n```%d```", pin);
	DCC_AddEmbedField(embed, str1, str2, bool:1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);

	DCC_SendChannelEmbedMessage(PM, embed);

	mysql_format(g_SQL, query, sizeof query, "INSERT INTO `playerucp` (`ucp`, `verifycode`, `DiscordID`) VALUES ('%e', '%d', '%e')", str, pin, id);
	mysql_tquery(g_SQL, query);
	return 1;
}

forward DCC_DM_REFF(str[], pin, id[]);
public DCC_DM_REFF(str[], pin, id[])
{
    new DCC_Channel:PM;
	PM = DCC_GetCreatedPrivateChannel();

	new DCC_Embed:embed = DCC_CreateEmbed(.title="Asia Pride Roleplay", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[100], str2[100];

	format(str1, sizeof str1, "```\nHalo!\nROLE kamu berhasil terreffund,\nMaafkan kami yang lalai dalam menganalisi Administrator```");
	DCC_SetEmbedDescription(embed, str1);
	format(str1, sizeof str1, "ROLE");
	format(str2, sizeof str2, "\n```CITIZEN```");
	DCC_AddEmbedField(embed, str1, str2, bool:1);
	format(str1, sizeof str1, "PROBLEM");
	format(str2, sizeof str2, "\n```RAID```");
	DCC_AddEmbedField(embed, str1, str2, bool:1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);

	DCC_SendChannelEmbedMessage(PM, embed);
	return 1;
}

forward CheckDiscordUCP(DiscordID[], params[]);
public CheckDiscordUCP(DiscordID[], params[])
{
	new rows = cache_num_rows();
	new DCC_Role: WARGA, DCC_Guild: guild, DCC_User: user;
	new verifycode = RandomEx(111111, 988888);
	if(rows > 0)
	{
  		new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP DENIED");
		new str1[1000];

		format(str1, sizeof str1, "\n[ERROR]: Nama UCP account tersebut sudah terdaftar\nSilahkan gunakan UCP yang lain!");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}
	else
	{
		new ns[32];
	    guild = DCC_FindGuildById("958262446383042570");
		WARGA = DCC_FindRoleById("958262446383042572");
		user = DCC_FindUserById(DiscordID);
		format(ns, sizeof(ns), "Warga Asia Pride | %s ", params);
		DCC_SetGuildMemberNickname(guild, user, ns);
		DCC_AddGuildMemberRole(guild, user, WARGA);

        new DCC_Channel:ASU;
        ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP VERIFY");
		new str1[1000];

		format(str1, sizeof str1, "\nUCP %s berhasil terverifikasi\nSilahkan Check message kamu...!", params);
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		DCC_CreatePrivateChannel(user, "DCC_DM_EMBED", "sds", params, verifycode, DiscordID);
	}
	return 1;
}

forward CheckDiscordID(DiscordID[], params[]);
public CheckDiscordID(DiscordID[], params[])
{
	new rows = cache_num_rows(), ucp[200], DCC_User:user, DCC_Guild:guild, DCC_Role:WARGA;
	if(rows > 0)
	{
		new ns[32];
	    cache_get_value_name(0, "ucp", ucp);
		guild = DCC_FindGuildById("958262446383042570");
		WARGA = DCC_FindRoleById("958262446383042572");
		user = DCC_FindUserById(DiscordID);
		format(ns, sizeof(ns), "Warga Asia Pride | %s ", ucp);
		DCC_SetGuildMemberNickname(guild, user, ns);
		DCC_AddGuildMemberRole(guild, user, WARGA);

	    new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP DENIED");
		new str1[1000];

		format(str1, sizeof str1, "\n[ERROR]: Kamu sudah mendaftar UCP dengan nama %s", ucp);
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}
	else
	{
		new characterQuery[178];
		mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `ucp` = '%s'", params);
		mysql_tquery(g_SQL, characterQuery, "CheckDiscordUCP", "ss", DiscordID, params);
	}
	return 1;
}

forward ReffundUcp(DiscordID[], params[]);
public ReffundUcp(DiscordID[], params[])
{
	new rows = cache_num_rows(), ucp[200], DCC_User:user, DCC_Guild:guild, DCC_Role:WARGA;
	if(rows > 0)
	{
		new ns[32];
	    cache_get_value_name(0, "ucp", ucp);
		guild = DCC_FindGuildById("958262446383042570");
		WARGA = DCC_FindRoleById("958262446383042572");
		user = DCC_FindUserById(DiscordID);
		format(ns, sizeof(ns), "Warga Asia Pride | %s ", ucp);
		DCC_SetGuildMemberNickname(guild, user, ns);
		DCC_AddGuildMemberRole(guild, user, WARGA);

	    new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="ROLE REFFUND");
		new str1[1000];

		format(str1, sizeof str1, "\n[ROLE]: Halo **%s** Role citizen kamu saat ini sudah kembali\nMohon maaf atas ketidaknyamanannya\n\nTerima kasih.", ucp);
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		DCC_CreatePrivateChannel(user, "DCC_DM_REFF", "sds", ucp, DiscordID);
		return 1;
	}
	else
	{
	    cache_get_value_name(0, "ucp", ucp);
		guild = DCC_FindGuildById("958262446383042570");
		WARGA = DCC_FindRoleById("958262446383042572");

	    new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="ROLE DENIED");
		new str1[1000];

		format(str1, sizeof str1, "\n[ERROR]: Kamu belum pernah mendaftar diserver ini\nGunakan !register untuk mendaftar");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
	}
	return 1;
}

DCMD:on(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;
    if(isnull(params))
		return DCC_SendChannelMessage(channel, "```\n[USAGE]: !on [tag]```");

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981197233393721");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="Server Online OBT", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[1000];

	format(str1, sizeof str1, "\nUntuk warga yang ingin memasuki kota\nHarap req ulang ucp di %s\nKami para Administrator butuh bantuan kalian\nSilahkan melakukan pencarian BUG\nDan lapor BUG tersebut ke channel yang sudah kami sediakan\nSaat ini server sedang dalam tahap **OBT**\nYang dimana tahap ini adalah bukan tahap roleplay serius\ntapi tahap pencarian BUG yang membuat kalian tidak nyaman\n\nJadi harap tunggu sampai proses OBT selesai\nTERIMA KASIH!", params);
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:reffon(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981200102297684");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="REFFUND OPEN");
	new str1[1000];

	format(str1, sizeof str1, "\n1. Silahkan /report di ingame\n2. Yang di reffund yang sudah di acc\n3. ooc lie = banned permanent no unban\n4. Wajib jujur dalam melakukan REQUEST reffund\n\n**TERIMA KASIH!**");
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:reffoff(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981200102297684");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="REFFUND CLOSE");
	new str1[1000];

	format(str1, sizeof str1, "\n1. nanti lagi di open\n2. mau reffund?\n3. berikut langkah - langkah reffund\n4. kumpulkan bukti screenshot/lainnya\n5. buat list reffund\n6. di periksa administrator\n7. di acc\n8. datang ke tempat reffund ingame\n8. harap jujur tanpa adanya editing foto\n9. ooc lie = banned permanent no unban\n\n**TERIMA KASIH!**");
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:ip(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981197468532818");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="Asia Pride Statistic", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[1000];

	format(str1, sizeof str1, "\n**Hostname**\nAsia Pride Roleplay | OBT\n\n**Address**\n128.199.151.181:3014\n\n**Ping**\nMenyesuaikan Internetmu\n\n**Player**\n0/60\n\n**Language**\nBahasa Indonesia");
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:up(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981197233393719");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="Server Full Rilis", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[1000];

	format(str1, sizeof str1, "\n- Perubahan Berbagai Fitur\n- Fix bug Warga\n- Add Inventory system\n- Fix bug BOT discord\n- Fix Inventory\n- Add scripting inventory\n- Add cellphone\n- Change /stats\n- Change textdraw spawn\n- Fix bug textdraw spawn\n- Semua pekerjaan dari cityhall ( kecuali sidejob )\n- Fix bug job ayam\n- Add Job penambang\n- /ahide ( khusus admin )\n- Fix bug EMS\n- Add CMD /prm\n- Add CMD /vrm\n- Add panel SAMD & SAPD ( OTOT Y )\n- Perubahan pada fitur Give Inventory\n- Fix kendaraan tidak menyala\n- Fix radio sistem\n- Fix Phone Voice\n- Remove format normal teriak bisik pada layar kiri\n- Semua uang player menjadi 10K\n- /sp bisa digunakan kembali\n- Spawn menjadi lebih cepat\n- Add batu in database\n- Fix bug job penambang\n- Fix cuci batu penambang\n- Add lokasi pekerjaan dalam GPS\n- Add batu in invetory\n- Pengembangan fitur handphone\n- Add fitur Airdrop (pengembangan)\n- Fix close uang mengurang\n- Fix character CJ\n- Remove health di locker SAPD\n- Remove fitur diberbagai locker Faction\n\n**TERIMA KASIH TELAH MENUNGGU!**");
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:says(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;
    if(isnull(params))
		return DCC_SendChannelMessage(channel, "```\n[USAGE]: !says [text]```");

    if(strlen(params) > 255)
	{
		new str[72];
		format(str, sizeof(str), "tidak bisa mengetik sampai lebih 255 character!");
		DCC_SendChannelMessage(channel, str);
		return 1;
	}

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981197233393718");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="PENGUMUMAN");
	new str1[1000];

	format(str1, sizeof str1, "\n%s", params);
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}
DCMD:off(user, channel, params[])
{
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

    new DCC_Channel:ASU;
    ASU = DCC_FindChannelById("1406981197233393718");
    new DCC_Embed:embed = DCC_CreateEmbed(.title="PENGUMUMAN", .image_url="https://media.discordapp.net/attachments/1259151614061711422/1310469989815549982/Picsart_24-11-24_21-49-49-045_1_1.jpg");
	new str1[1000];

	format(str1, sizeof str1, "\nKOTA SEDANG TERJADI BADAI HARIAN, UNTUK SELURUH WARGA ASIA PRIDE DISARANKAN MENCARI TEMPAT BERTEDUH SAMPAI BADAI MEREDA...!");
	DCC_SetEmbedDescription(embed, str1);
	DCC_SetEmbedColor(embed, 0x004BFFFF);
	new y, m, d, timestamp[20];
   	getdate(y, m , d);
    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
    DCC_SetEmbedTimestamp(embed, timestamp);
    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
	DCC_SendChannelEmbedMessage(ASU, embed, "@everyone");

	return 1;
}

DCMD:register(user, channel, params[])
{
	new id[21];
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;
    if(isnull(params))
    {
		new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP NAME");
		new str1[1000];

		format(str1, sizeof str1, "\n!register [UCP NAME]");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}
	if(!IsValidNameUCP(params))
	{
		new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP DENIED");
		new str1[1000];

		format(str1, sizeof str1, "\n[ERROR]: Gunakan nama UCP bukan nama IC!");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}

    if(strlen(params) < 3)
	{
  		new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP DENIED");
		new str1[1000];

		format(str1, sizeof str1, "\n[ERROR]: Nama tidak bisa kurang dari 3 karakter!");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}

	DCC_GetUserId(user, id, sizeof id);

	new characterQuery[178];
	mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
	mysql_tquery(g_SQL, characterQuery, "CheckDiscordID", "ss", id, params);
	return 1;
}

DCMD:reffund(user, channel, params[])
{
	new id[21];
    if(channel != DCC_FindChannelById("958262449524572217"))
		return 1;

	if(isnull(params))
    {
		new DCC_Channel:ASU;
	    ASU = DCC_FindChannelById("958262449524572217");
	    new DCC_Embed:embed = DCC_CreateEmbed(.title="UCP SYNTX");
		new str1[1000];

		format(str1, sizeof str1, "\nGunakan !reffund role");
		DCC_SetEmbedDescription(embed, str1);
		DCC_SetEmbedColor(embed, 0x004BFFFF);
		new y, m, d, timestamp[20];
	   	getdate(y, m , d);
	    format(timestamp, sizeof(timestamp), "%02i%02i%02i", y, m, d);
	    DCC_SetEmbedTimestamp(embed, timestamp);
	    DCC_SetEmbedFooter(embed, "Asia Pride Roleplay");
		DCC_SendChannelEmbedMessage(ASU, embed);
		return 1;
	}

	DCC_GetUserId(user, id, sizeof id);

	new characterQuery[178];
	mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
	mysql_tquery(g_SQL, characterQuery, "ReffundUcp", "ss", id, params);
	return 1;
}

--#################################################################################--
--##################### The dog shit code writing by Friskes. #####################--
--#################################################################################--

LOCKOUT_ANCHOR_TO_BLIZZARD = "Anchor to\nBlizzard"

--local CreateFrame = CreateFrame
--local SetPortraitToTexture = SetPortraitToTexture
--local GetTime = GetTime
--local UnitGUID = UnitGUID
local floor = math.floor
local format = string.format

local lockout = CreateFrame("Frame", "lockout", UIParent)

local lockoutpla = CreateFrame("Frame", "lockoutpla", lockout)
local lockoutplayerpet = CreateFrame("Frame", "lockoutplayerpet", lockout)
local lockouttar = CreateFrame("Frame", "lockouttar", lockout)
local lockoutfoc = CreateFrame("Frame", "lockoutfoc", lockout)
local lockoutparty1 = CreateFrame("Frame", "lockoutparty1", lockout)
local lockoutpartypet1 = CreateFrame("Frame", "lockoutpartypet1", lockout)
local lockoutparty2 = CreateFrame("Frame", "lockoutparty2", lockout)
local lockoutpartypet2 = CreateFrame("Frame", "lockoutpartypet2", lockout)
local lockoutarena1 = CreateFrame("Frame", "lockoutarena1", lockout)
local lockoutarenapet1 = CreateFrame("Frame", "lockoutarenapet1", lockout)
local lockoutarena2 = CreateFrame("Frame", "lockoutarena2", lockout)
local lockoutarenapet2 = CreateFrame("Frame", "lockoutarenapet2", lockout)
local lockoutarena3 = CreateFrame("Frame", "lockoutarena3", lockout)
local lockoutarenapet3 = CreateFrame("Frame", "lockoutarenapet3", lockout)

LockoutDB = {
	defaults = {
		lockout_hideborders = false,
		lockout_hidecooldowntext = false,

		lockout_showplayer = true,
		lockout_showplayerpet = false,
		lockout_showtarget = true,
		lockout_showfocus = true,
		lockout_showparty1 = true,
		lockout_showpartypet1 = false,
		lockout_showparty2 = true,
		lockout_showpartypet2 = false,
		lockout_showarena1 = true,
		lockout_showarenapet1 = false,
		lockout_showarena2 = true,
		lockout_showarenapet2 = false,
		lockout_showarena3 = true,
		lockout_showarenapet3 = false,

		lockout_player_anchor = false,
		lockout_playerpet_anchor = false,
		lockout_target_anchor = false,
		lockout_focus_anchor = false,
		lockout_party1_anchor = false,
		lockout_partypet1_anchor = false,
		lockout_party2_anchor = false,
		lockout_partypet2_anchor = false,
		lockout_arena1_anchor = false,
		lockout_arenapet1_anchor = false,
		lockout_arena2_anchor = false,
		lockout_arenapet2_anchor = false,
		lockout_arena3_anchor = false,
		lockout_arenapet3_anchor = false,
	},
	positions = {
		lockout_playerxoffset = 701.1067667737315, -- 178.4803745377621
		lockout_playeryoffset = 362.9036155034145, -- 424.8814934624193
		lockout_playerpetxoffset = 252,
		lockout_playerpetyoffset = 753.2,
		lockout_targetxoffset = 424.9985811699429,
		lockout_targetyoffset = 424.9194839416846,
		lockout_focusxoffset = 425.1684353772387,
		lockout_focusyoffset = 257.7627757450431,
		lockout_party1xoffset = 166.1139658300423,
		lockout_party1yoffset = 364.6158131403482,
		lockout_partypet1xoffset = 225,
		lockout_partypet1yoffset = 637.6,
		lockout_party2xoffset = 166.2766771269509,
		lockout_party2yoffset = 266.9491537455247,
		lockout_partypet2xoffset = 225,
		lockout_partypet2yoffset = 470.9,
		lockout_arena1xoffset = 858.4299983087835,
		lockout_arena1yoffset = 431.7351159789452,
		lockout_arenapet1xoffset = 1270,
		lockout_arenapet1yoffset = 678.9,
		lockout_arena2xoffset = 858.2378400136611,
		lockout_arena2yoffset = 364.4525766294406,
		lockout_arenapet2xoffset = 1270,
		lockout_arenapet2yoffset = 575.2,
		lockout_arena3xoffset = 857.9449106592523,
		lockout_arena3yoffset = 297.2397506847443,
		lockout_arenapet3xoffset = 1270,
		lockout_arenapet3yoffset = 472.5,
	},
	scale = {
		lockout_player_scale = 1.05, -- 1.3
		lockout_playerpet_scale = 0.43,
		lockout_target_scale = 1.3,
		lockout_focus_scale = 1.3,
		lockout_party1_scale = 1.28,
		lockout_partypet1_scale = 0.43,
		lockout_party2_scale = 1.28,
		lockout_partypet2_scale = 0.43,
		lockout_arena1_scale = 1.16,
		lockout_arenapet1_scale = 0.43,
		lockout_arena2_scale = 1.16,
		lockout_arenapet2_scale = 0.43,
		lockout_arena3_scale = 1.16,
		lockout_arenapet3_scale = 0.43,

		lockout_cdtext_scale = 2.1,
	},
}

local table = {
	lockoutpla_ANCHOR_POINT,
	lockoutplayerpet_ANCHOR_POINT,
	lockouttar_ANCHOR_POINT,
	lockoutfoc_ANCHOR_POINT,
	lockoutparty1_ANCHOR_POINT,
	lockoutpartypet1_ANCHOR_POINT,
	lockoutparty2_ANCHOR_POINT,
	lockoutpartypet2_ANCHOR_POINT,
	lockoutarena1_ANCHOR_POINT,
	lockoutarenapet1_ANCHOR_POINT,
	lockoutarena2_ANCHOR_POINT,
	lockoutarenapet2_ANCHOR_POINT,
	lockoutarena3_ANCHOR_POINT,
	lockoutarenapet3_ANCHOR_POINT,

	lockoutpla_RELATIVE_TO,
	lockoutplayerpet_RELATIVE_TO,
	lockouttar_RELATIVE_TO,
	lockoutfoc_RELATIVE_TO,
	lockoutparty1_RELATIVE_TO,
	lockoutpartypet1_RELATIVE_TO,
	lockoutparty2_RELATIVE_TO,
	lockoutpartypet2_RELATIVE_TO,
	lockoutarena1_RELATIVE_TO,
	lockoutarenapet1_RELATIVE_TO,
	lockoutarena2_RELATIVE_TO,
	lockoutarenapet2_RELATIVE_TO,
	lockoutarena3_RELATIVE_TO,
	lockoutarenapet3_RELATIVE_TO,

	FRAME_STRATA = "MEDIUM",
	FRAME_LEVEL = 35,

	FrameSize = 42,
	Text_Alpha,

	--FONT_TEXT = "Fonts\\FRIZQT__.TTF",
	--FONT_TEXT = "Interface\\AddOns\\Lockout\\Media\\PTSansNarrow.TTF",
	FONT_TEXT = "Interface\\AddOns\\Lockout\\Media\\LiberationSans.TTF",
	--FONT_TEXT = "Interface\\AddOns\\Lockout\\Media\\eriqfame.TTF",

	--FONT_OUTLINE = "NORMAL",
	--FONT_OUTLINE = "OUTLINE",
	FONT_OUTLINE = "THICKOUTLINE",

	Coord_L,
	Coord_R,
	Coord_T,
	Coord_B,

	Player_CircleTexture,
	PlayerPet_CircleTexture,
	Target_CircleTexture,
	Focus_CircleTexture,
	Party1_CircleTexture,
	PartyPet1_CircleTexture,
	Party2_CircleTexture,
	PartyPet2_CircleTexture,
	Arena1_CircleTexture,
	ArenaPet1_CircleTexture,
	Arena2_CircleTexture,
	ArenaPet2_CircleTexture,
	Arena3_CircleTexture,
	ArenaPet3_CircleTexture,

	lastUpdate = 0,
	counter = 0,
	text,
	-- Player
	plaschool1,
	plaschool2,
	plaschool3,
	plaschool1free = true, -- indicator, icon1 isn't used yet
	plaschool2free = true,
	plaschool3free = true,
	plaschool1time, -- time when interrupt happened, GetTime() format
	plaschool2time,
	plaschool3time,
	plaschool1dur, -- duration of interrupt
	plaschool2dur,
	plaschool3dur,
	platemp1,
	platemp2,
	platemp3,
	placaster, -- caster whom's interrupted cast is displayed in icon1
	pla1school, -- locked out spellschool displayed in icon1
	pla2school,
	pla3school,
	pla1icon,
	pla2icon,
	pla3icon,
	-- PlayerPet
	playerpetschool1,
	playerpetschool2,
	playerpetschool3,
	playerpetschool1free = true,
	playerpetschool2free = true,
	playerpetschool3free = true,
	playerpetschool1time,
	playerpetschool2time,
	playerpetschool3time,
	playerpetschool1dur,
	playerpetschool2dur,
	playerpetschool3dur,
	playerpettemp1,
	playerpettemp2,
	playerpettemp3,
	playerpetcaster,
	playerpet1school,
	playerpet2school,
	playerpet3school,
	playerpet1icon,
	playerpet2icon,
	playerpet3icon,
	-- Target
	tarschool1,
	tarschool2,
	tarschool3,
	tarschool1free = true,
	tarschool2free = true,
	tarschool3free = true,
	tarschool1time,
	tarschool2time,
	tarschool3time,
	tarschool1dur,
	tarschool2dur,
	tarschool3dur,
	tartemp1,
	tartemp2,
	tartemp3,
	tarcaster,
	tar1school,
	tar2school,
	tar3school,
	tar1icon,
	tar2icon,
	tar3icon,
	-- Focus
	focschool1,
	focschool2,
	focschool3,
	focschool1free = true,
	focschool2free = true,
	focschool3free = true,
	focschool1time,
	focschool2time,
	focschool3time,
	focschool1dur,
	focschool2dur,
	focschool3dur,
	foctemp1,
	foctemp2,
	foctemp3,
	foccaster,
	foc1school,
	foc2school,
	foc3school,
	foc1icon,
	foc2icon,
	foc3icon,
	-- Party1
	party1school1,
	party1school2,
	party1school3,
	party1school1free = true,
	party1school2free = true,
	party1school3free = true,
	party1school1time,
	party1school2time,
	party1school3time,
	party1school1dur,
	party1school2dur,
	party1school3dur,
	party1temp1,
	party1temp2,
	party1temp3,
	party1caster,
	party11school,
	party12school,
	party13school,
	party11icon,
	party12icon,
	party13icon,
	-- PartyPet1
	partypet1school1,
	partypet1school2,
	partypet1school3,
	partypet1school1free = true,
	partypet1school2free = true,
	partypet1school3free = true,
	partypet1school1time,
	partypet1school2time,
	partypet1school3time,
	partypet1school1dur,
	partypet1school2dur,
	partypet1school3dur,
	partypet1temp1,
	partypet1temp2,
	partypet1temp3,
	partypet1caster,
	partypet11school,
	partypet12school,
	partypet13school,
	partypet11icon,
	partypet12icon,
	partypet13icon,
	-- Party2
	party2school1,
	party2school2,
	party2school3,
	party2school1free = true,
	party2school2free = true,
	party2school3free = true,
	party2school1time,
	party2school2time,
	party2school3time,
	party2school1dur,
	party2school2dur,
	party2school3dur,
	party2temp1,
	party2temp2,
	party2temp3,
	party2caster,
	party21school,
	party22school,
	party23school,
	party21icon,
	party22icon,
	party23icon,
	-- PartyPet2
	partypet2school1,
	partypet2school2,
	partypet2school3,
	partypet2school1free = true,
	partypet2school2free = true,
	partypet2school3free = true,
	partypet2school1time,
	partypet2school2time,
	partypet2school3time,
	partypet2school1dur,
	partypet2school2dur,
	partypet2school3dur,
	partypet2temp1,
	partypet2temp2,
	partypet2temp3,
	partypet2caster,
	partypet21school,
	partypet22school,
	partypet23school,
	partypet21icon,
	partypet22icon,
	partypet23icon,
	-- Arena1
	arena1school1,
	arena1school2,
	arena1school3,
	arena1school1free = true,
	arena1school2free = true,
	arena1school3free = true,
	arena1school1time,
	arena1school2time,
	arena1school3time,
	arena1school1dur,
	arena1school2dur,
	arena1school3dur,
	arena1temp1,
	arena1temp2,
	arena1temp3,
	arena1caster,
	arena11school,
	arena12school,
	arena13school,
	arena11icon,
	arena12icon,
	arena13icon,
	-- ArenaPet1
	arenapet1school1,
	arenapet1school2,
	arenapet1school3,
	arenapet1school1free = true,
	arenapet1school2free = true,
	arenapet1school3free = true,
	arenapet1school1time,
	arenapet1school2time,
	arenapet1school3time,
	arenapet1school1dur,
	arenapet1school2dur,
	arenapet1school3dur,
	arenapet1temp1,
	arenapet1temp2,
	arenapet1temp3,
	arenapet1caster,
	arenapet11school,
	arenapet12school,
	arenapet13school,
	arenapet11icon,
	arenapet12icon,
	arenapet13icon,
	-- Arena2
	arena2school1,
	arena2school2,
	arena2school3,
	arena2school1free = true,
	arena2school2free = true,
	arena2school3free = true,
	arena2school1time,
	arena2school2time,
	arena2school3time,
	arena2school1dur,
	arena2school2dur,
	arena2school3dur,
	arena2temp1,
	arena2temp2,
	arena2temp3,
	arena2caster,
	arena21school,
	arena22school,
	arena23school,
	arena21icon,
	arena22icon,
	arena23icon,
	-- ArenaPet2
	arenapet2school1,
	arenapet2school2,
	arenapet2school3,
	arenapet2school1free = true,
	arenapet2school2free = true,
	arenapet2school3free = true,
	arenapet2school1time,
	arenapet2school2time,
	arenapet2school3time,
	arenapet2school1dur,
	arenapet2school2dur,
	arenapet2school3dur,
	arenapet2temp1,
	arenapet2temp2,
	arenapet2temp3,
	arenapet2caster,
	arenapet21school,
	arenapet22school,
	arenapet23school,
	arenapet21icon,
	arenapet22icon,
	arenapet23icon,
	-- Arena3
	arena3school1,
	arena3school2,
	arena3school3,
	arena3school1free = true,
	arena3school2free = true,
	arena3school3free = true,
	arena3school1time,
	arena3school2time,
	arena3school3time,
	arena3school1dur,
	arena3school2dur,
	arena3school3dur,
	arena3temp1,
	arena3temp2,
	arena3temp3,
	arena3caster,
	arena31school,
	arena32school,
	arena33school,
	arena31icon,
	arena32icon,
	arena33icon,
	-- ArenaPet3
	arenapet3school1,
	arenapet3school2,
	arenapet3school3,
	arenapet3school1free = true,
	arenapet3school2free = true,
	arenapet3school3free = true,
	arenapet3school1time,
	arenapet3school2time,
	arenapet3school3time,
	arenapet3school1dur,
	arenapet3school2dur,
	arenapet3school3dur,
	arenapet3temp1,
	arenapet3temp2,
	arenapet3temp3,
	arenapet3caster,
	arenapet31school,
	arenapet32school,
	arenapet33school,
	arenapet31icon,
	arenapet32icon,
	arenapet33icon,
}

local time1list = {}
local time2list = {}
local time3list = {}
local dur1list = {}
local dur2list = {}
local dur3list = {}
local icon1list = {}
local icon2list = {}
local icon3list = {}
local school1list = {}
local school2list = {}
local school3list = {}
local guidlist = {}
local cleartimelist = {}
local hpally = {} -- List of Holy Paladins found
local rshaman = {} -- List of Resto Shamans found

table.lockoutpla_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutpla_RELATIVE_TO = UIParent

local function Player_Anchor()
	PlayerHitIndicator.Show = function() end -- Отключает цифры хила/урона на портрете игрока при закреплении на фрейме
	table.lockoutpla_ANCHOR_POINT = "CENTER"
	table.lockoutpla_RELATIVE_TO = PlayerPortrait
	lockoutpla:SetParent(PlayerPortrait:GetParent())
	lockoutpla:SetFrameLevel(PlayerPortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_playerxoffset = 0.5
	LockoutDB.positions.lockout_playeryoffset = -0.3
end

table.lockoutplayerpet_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutplayerpet_RELATIVE_TO = UIParent

local function PlayerPet_Anchor()
	PetHitIndicator.Show = function() end -- Отключает цифры хила/урона на портрете питомца при закреплении на фрейме
	table.lockoutplayerpet_ANCHOR_POINT = "CENTER"
	table.lockoutplayerpet_RELATIVE_TO = PetPortrait
	lockoutplayerpet:SetParent(PetPortrait:GetParent())
	lockoutplayerpet:SetFrameLevel(PetPortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_playerpetxoffset = -1.7
	LockoutDB.positions.lockout_playerpetyoffset = -0.5
end

table.lockouttar_ANCHOR_POINT = "BOTTOMLEFT"
table.lockouttar_RELATIVE_TO = UIParent

local function Target_Anchor()
	table.lockouttar_ANCHOR_POINT = "CENTER"
	table.lockouttar_RELATIVE_TO = TargetFramePortrait
	lockouttar:SetParent(TargetFramePortrait:GetParent())
	lockouttar:SetFrameLevel(TargetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_targetxoffset = -0.4
	LockoutDB.positions.lockout_targetyoffset = -0.3
end

table.lockoutfoc_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutfoc_RELATIVE_TO = UIParent

local function Focus_Anchor()
	table.lockoutfoc_ANCHOR_POINT = "CENTER"
	table.lockoutfoc_RELATIVE_TO = FocusFramePortrait
	lockoutfoc:SetParent(FocusFramePortrait:GetParent())
	lockoutfoc:SetFrameLevel(FocusFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_focusxoffset = -0.4
	LockoutDB.positions.lockout_focusyoffset = -0.3
end

table.lockoutparty1_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutparty1_RELATIVE_TO = UIParent

local function Party1_Anchor()
	table.lockoutparty1_ANCHOR_POINT = "CENTER"
	table.lockoutparty1_RELATIVE_TO = PartyMemberFrame1Portrait
	lockoutparty1:SetParent(PartyMemberFrame1Portrait:GetParent())
	lockoutparty1:SetFrameLevel(PartyMemberFrame1Portrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_party1xoffset = -0.7
	LockoutDB.positions.lockout_party1yoffset = -1.6
end

table.lockoutpartypet1_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutpartypet1_RELATIVE_TO = UIParent

local function PartyPet1_Anchor()
	table.lockoutpartypet1_ANCHOR_POINT = "CENTER"
	table.lockoutpartypet1_RELATIVE_TO = PartyMemberFrame1PetFramePortrait
	lockoutpartypet1:SetParent(PartyMemberFrame1PetFramePortrait:GetParent())
	lockoutpartypet1:SetFrameLevel(PartyMemberFrame1PetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_partypet1xoffset = 1.1
	LockoutDB.positions.lockout_partypet1yoffset = -2.3
end

table.lockoutparty2_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutparty2_RELATIVE_TO = UIParent

local function Party2_Anchor()
	table.lockoutparty2_ANCHOR_POINT = "CENTER"
	table.lockoutparty2_RELATIVE_TO = PartyMemberFrame2Portrait
	lockoutparty2:SetParent(PartyMemberFrame2Portrait:GetParent())
	lockoutparty2:SetFrameLevel(PartyMemberFrame2Portrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_party2xoffset = -0.7
	LockoutDB.positions.lockout_party2yoffset = -1.6
end

table.lockoutpartypet2_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutpartypet2_RELATIVE_TO = UIParent

local function PartyPet2_Anchor()
	table.lockoutpartypet2_ANCHOR_POINT = "CENTER"
	table.lockoutpartypet2_RELATIVE_TO = PartyMemberFrame2PetFramePortrait
	lockoutpartypet2:SetParent(PartyMemberFrame2PetFramePortrait:GetParent())
	lockoutpartypet2:SetFrameLevel(PartyMemberFrame2PetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_partypet2xoffset = 1.1
	LockoutDB.positions.lockout_partypet2yoffset = -2.3
end

table.lockoutarena1_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarena1_RELATIVE_TO = UIParent

local function Arena1_Anchor()
	table.lockoutarena1_ANCHOR_POINT = "CENTER"
	table.lockoutarena1_RELATIVE_TO = ArenaEnemyFrame1ClassPortrait
	lockoutarena1:SetParent(ArenaEnemyFrame1ClassPortrait:GetParent())
	lockoutarena1:SetFrameLevel(ArenaEnemyFrame1ClassPortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arena1xoffset = 0.7
	LockoutDB.positions.lockout_arena1yoffset = 2.2
end

table.lockoutarenapet1_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarenapet1_RELATIVE_TO = UIParent

local function ArenaPet1_Anchor()
	table.lockoutarenapet1_ANCHOR_POINT = "CENTER"
	table.lockoutarenapet1_RELATIVE_TO = ArenaEnemyFrame1PetFramePortrait
	lockoutarenapet1:SetParent(ArenaEnemyFrame1PetFramePortrait:GetParent())
	lockoutarenapet1:SetFrameLevel(ArenaEnemyFrame1PetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arenapet1xoffset = -1.9
	LockoutDB.positions.lockout_arenapet1yoffset = -2.4
end

table.lockoutarena2_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarena2_RELATIVE_TO = UIParent

local function Arena2_Anchor()
	table.lockoutarena2_ANCHOR_POINT = "CENTER"
	table.lockoutarena2_RELATIVE_TO = ArenaEnemyFrame2ClassPortrait
	lockoutarena2:SetParent(ArenaEnemyFrame2ClassPortrait:GetParent())
	lockoutarena2:SetFrameLevel(ArenaEnemyFrame2ClassPortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arena2xoffset = 0.7
	LockoutDB.positions.lockout_arena2yoffset = 2.2
end

table.lockoutarenapet2_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarenapet2_RELATIVE_TO = UIParent

local function ArenaPet2_Anchor()
	table.lockoutarenapet2_ANCHOR_POINT = "CENTER"
	table.lockoutarenapet2_RELATIVE_TO = ArenaEnemyFrame2PetFramePortrait
	lockoutarenapet2:SetParent(ArenaEnemyFrame2PetFramePortrait:GetParent())
	lockoutarenapet2:SetFrameLevel(ArenaEnemyFrame2PetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arenapet2xoffset = -1.9
	LockoutDB.positions.lockout_arenapet2yoffset = -2.4
end

table.lockoutarena3_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarena3_RELATIVE_TO = UIParent

local function Arena3_Anchor()
	table.lockoutarena3_ANCHOR_POINT = "CENTER"
	table.lockoutarena3_RELATIVE_TO = ArenaEnemyFrame3ClassPortrait
	lockoutarena3:SetParent(ArenaEnemyFrame3ClassPortrait:GetParent())
	lockoutarena3:SetFrameLevel(ArenaEnemyFrame3ClassPortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arena3xoffset = 0.7
	LockoutDB.positions.lockout_arena3yoffset = 2.2
end

table.lockoutarenapet3_ANCHOR_POINT = "BOTTOMLEFT"
table.lockoutarenapet3_RELATIVE_TO = UIParent

local function ArenaPet3_Anchor()
	table.lockoutarenapet3_ANCHOR_POINT = "CENTER"
	table.lockoutarenapet3_RELATIVE_TO = ArenaEnemyFrame3PetFramePortrait
	lockoutarenapet3:SetParent(ArenaEnemyFrame3PetFramePortrait:GetParent())
	lockoutarenapet3:SetFrameLevel(ArenaEnemyFrame3PetFramePortrait:GetParent():GetFrameLevel())
	LockoutDB.positions.lockout_arenapet3xoffset = -1.9
	LockoutDB.positions.lockout_arenapet3yoffset = -2.4
end

lockout:SetFrameStrata(table.FRAME_STRATA)
lockout:SetFrameLevel(table.FRAME_LEVEL)

lockoutpla:SetFrameStrata(table.FRAME_STRATA)
lockoutpla:SetFrameLevel(table.FRAME_LEVEL)
lockoutpla:SetClampedToScreen(true)
lockoutpla:SetWidth(table.FrameSize)
lockoutpla:SetHeight(table.FrameSize)

lockoutplayerpet:SetFrameStrata(table.FRAME_STRATA)
lockoutplayerpet:SetFrameLevel(table.FRAME_LEVEL)
lockoutplayerpet:SetClampedToScreen(true)
lockoutplayerpet:SetWidth(table.FrameSize)
lockoutplayerpet:SetHeight(table.FrameSize)

lockouttar:SetFrameStrata(table.FRAME_STRATA)
lockouttar:SetFrameLevel(table.FRAME_LEVEL)
lockouttar:SetClampedToScreen(true)
lockouttar:SetWidth(table.FrameSize)
lockouttar:SetHeight(table.FrameSize)

lockoutfoc:SetFrameStrata(table.FRAME_STRATA)
lockoutfoc:SetFrameLevel(table.FRAME_LEVEL)
lockoutfoc:SetClampedToScreen(true)
lockoutfoc:SetWidth(table.FrameSize)
lockoutfoc:SetHeight(table.FrameSize)

lockoutparty1:SetFrameStrata(table.FRAME_STRATA)
lockoutparty1:SetFrameLevel(table.FRAME_LEVEL)
lockoutparty1:SetClampedToScreen(true)
lockoutparty1:SetWidth(table.FrameSize)
lockoutparty1:SetHeight(table.FrameSize)

lockoutpartypet1:SetFrameStrata(table.FRAME_STRATA)
lockoutpartypet1:SetFrameLevel(table.FRAME_LEVEL)
lockoutpartypet1:SetClampedToScreen(true)
lockoutpartypet1:SetWidth(table.FrameSize)
lockoutpartypet1:SetHeight(table.FrameSize)

lockoutparty2:SetFrameStrata(table.FRAME_STRATA)
lockoutparty2:SetFrameLevel(table.FRAME_LEVEL)
lockoutparty2:SetClampedToScreen(true)
lockoutparty2:SetWidth(table.FrameSize)
lockoutparty2:SetHeight(table.FrameSize)

lockoutpartypet2:SetFrameStrata(table.FRAME_STRATA)
lockoutpartypet2:SetFrameLevel(table.FRAME_LEVEL)
lockoutpartypet2:SetClampedToScreen(true)
lockoutpartypet2:SetWidth(table.FrameSize)
lockoutpartypet2:SetHeight(table.FrameSize)

lockoutarena1:SetFrameStrata(table.FRAME_STRATA)
lockoutarena1:SetFrameLevel(table.FRAME_LEVEL)
lockoutarena1:SetClampedToScreen(true)
lockoutarena1:SetWidth(table.FrameSize)
lockoutarena1:SetHeight(table.FrameSize)

lockoutarenapet1:SetFrameStrata(table.FRAME_STRATA)
lockoutarenapet1:SetFrameLevel(table.FRAME_LEVEL)
lockoutarenapet1:SetClampedToScreen(true)
lockoutarenapet1:SetWidth(table.FrameSize)
lockoutarenapet1:SetHeight(table.FrameSize)

lockoutarena2:SetFrameStrata(table.FRAME_STRATA)
lockoutarena2:SetFrameLevel(table.FRAME_LEVEL)
lockoutarena2:SetClampedToScreen(true)
lockoutarena2:SetWidth(table.FrameSize)
lockoutarena2:SetHeight(table.FrameSize)

lockoutarenapet2:SetFrameStrata(table.FRAME_STRATA)
lockoutarenapet2:SetFrameLevel(table.FRAME_LEVEL)
lockoutarenapet2:SetClampedToScreen(true)
lockoutarenapet2:SetWidth(table.FrameSize)
lockoutarenapet2:SetHeight(table.FrameSize)

lockoutarena3:SetFrameStrata(table.FRAME_STRATA)
lockoutarena3:SetFrameLevel(table.FRAME_LEVEL)
lockoutarena3:SetClampedToScreen(true)
lockoutarena3:SetWidth(table.FrameSize)
lockoutarena3:SetHeight(table.FrameSize)

lockoutarenapet3:SetFrameStrata(table.FRAME_STRATA)
lockoutarenapet3:SetFrameLevel(table.FRAME_LEVEL)
lockoutarenapet3:SetClampedToScreen(true)
lockoutarenapet3:SetWidth(table.FrameSize)
lockoutarenapet3:SetHeight(table.FrameSize)

table.plaschool1 = CreateFrame("Frame", "plaschool1", lockoutpla)
table.plaschool2 = CreateFrame("Frame", "plaschool2", lockoutpla)
table.plaschool3 = CreateFrame("Frame", "plaschool3", lockoutpla)

table.playerpetschool1 = CreateFrame("Frame", "playerpetschool1", lockoutplayerpet)
table.playerpetschool2 = CreateFrame("Frame", "playerpetschool2", lockoutplayerpet)
table.playerpetschool3 = CreateFrame("Frame", "playerpetschool3", lockoutplayerpet)

table.tarschool1 = CreateFrame("Frame", "tarschool1", lockouttar)
table.tarschool2 = CreateFrame("Frame", "tarschool2", lockouttar)
table.tarschool3 = CreateFrame("Frame", "tarschool3", lockouttar)

table.focschool1 = CreateFrame("Frame", "focschool1", lockoutfoc)
table.focschool2 = CreateFrame("Frame", "focschool2", lockoutfoc)
table.focschool3 = CreateFrame("Frame", "focschool3", lockoutfoc)

table.party1school1 = CreateFrame("Frame", "party1school1", lockoutparty1)
table.party1school2 = CreateFrame("Frame", "party1school2", lockoutparty1)
table.party1school3 = CreateFrame("Frame", "party1school3", lockoutparty1)

table.partypet1school1 = CreateFrame("Frame", "partypet1school1", lockoutpartypet1)
table.partypet1school2 = CreateFrame("Frame", "partypet1school2", lockoutpartypet1)
table.partypet1school3 = CreateFrame("Frame", "partypet1school3", lockoutpartypet1)

table.party2school1 = CreateFrame("Frame", "party2school1", lockoutparty2)
table.party2school2 = CreateFrame("Frame", "party2school2", lockoutparty2)
table.party2school3 = CreateFrame("Frame", "party2school3", lockoutparty2)

table.partypet2school1 = CreateFrame("Frame", "partypet2school1", lockoutpartypet2)
table.partypet2school2 = CreateFrame("Frame", "partypet2school2", lockoutpartypet2)
table.partypet2school3 = CreateFrame("Frame", "partypet2school3", lockoutpartypet2)

table.arena1school1 = CreateFrame("Frame", "arena1school1", lockoutarena1)
table.arena1school2 = CreateFrame("Frame", "arena1school2", lockoutarena1)
table.arena1school3 = CreateFrame("Frame", "arena1school3", lockoutarena1)

table.arenapet1school1 = CreateFrame("Frame", "arenapet1school1", lockoutarenapet1)
table.arenapet1school2 = CreateFrame("Frame", "arenapet1school2", lockoutarenapet1)
table.arenapet1school3 = CreateFrame("Frame", "arenapet1school3", lockoutarenapet1)

table.arena2school1 = CreateFrame("Frame", "arena2school1", lockoutarena2)
table.arena2school2 = CreateFrame("Frame", "arena2school2", lockoutarena2)
table.arena2school3 = CreateFrame("Frame", "arena2school3", lockoutarena2)

table.arenapet2school1 = CreateFrame("Frame", "arenapet2school1", lockoutarenapet2)
table.arenapet2school2 = CreateFrame("Frame", "arenapet2school2", lockoutarenapet2)
table.arenapet2school3 = CreateFrame("Frame", "arenapet2school3", lockoutarenapet2)

table.arena3school1 = CreateFrame("Frame", "arena3school1", lockoutarena3)
table.arena3school2 = CreateFrame("Frame", "arena3school2", lockoutarena3)
table.arena3school3 = CreateFrame("Frame", "arena3school3", lockoutarena3)

table.arenapet3school1 = CreateFrame("Frame", "arenapet3school1", lockoutarenapet3)
table.arenapet3school2 = CreateFrame("Frame", "arenapet3school2", lockoutarenapet3)
table.arenapet3school3 = CreateFrame("Frame", "arenapet3school3", lockoutarenapet3)

table.plaschool1:SetFrameLevel(lockoutpla:GetFrameLevel())
table.plaschool2:SetFrameLevel(lockoutpla:GetFrameLevel())
table.plaschool3:SetFrameLevel(lockoutpla:GetFrameLevel())

table.playerpetschool1:SetFrameLevel(lockoutplayerpet:GetFrameLevel())
table.playerpetschool2:SetFrameLevel(lockoutplayerpet:GetFrameLevel())
table.playerpetschool3:SetFrameLevel(lockoutplayerpet:GetFrameLevel())

table.tarschool1:SetFrameLevel(lockouttar:GetFrameLevel())
table.tarschool2:SetFrameLevel(lockouttar:GetFrameLevel())
table.tarschool3:SetFrameLevel(lockouttar:GetFrameLevel())

table.focschool1:SetFrameLevel(lockoutfoc:GetFrameLevel())
table.focschool2:SetFrameLevel(lockoutfoc:GetFrameLevel())
table.focschool3:SetFrameLevel(lockoutfoc:GetFrameLevel())

table.party1school1:SetFrameLevel(lockoutparty1:GetFrameLevel())
table.party1school2:SetFrameLevel(lockoutparty1:GetFrameLevel())
table.party1school3:SetFrameLevel(lockoutparty1:GetFrameLevel())

table.partypet1school1:SetFrameLevel(lockoutpartypet1:GetFrameLevel())
table.partypet1school2:SetFrameLevel(lockoutpartypet1:GetFrameLevel())
table.partypet1school3:SetFrameLevel(lockoutpartypet1:GetFrameLevel())

table.party2school1:SetFrameLevel(lockoutparty2:GetFrameLevel())
table.party2school2:SetFrameLevel(lockoutparty2:GetFrameLevel())
table.party2school3:SetFrameLevel(lockoutparty2:GetFrameLevel())

table.partypet2school1:SetFrameLevel(lockoutpartypet2:GetFrameLevel())
table.partypet2school2:SetFrameLevel(lockoutpartypet2:GetFrameLevel())
table.partypet2school3:SetFrameLevel(lockoutpartypet2:GetFrameLevel())

table.arena1school1:SetFrameLevel(lockoutarena1:GetFrameLevel())
table.arena1school2:SetFrameLevel(lockoutarena1:GetFrameLevel())
table.arena1school3:SetFrameLevel(lockoutarena1:GetFrameLevel())

table.arenapet1school1:SetFrameLevel(lockoutarenapet1:GetFrameLevel())
table.arenapet1school2:SetFrameLevel(lockoutarenapet1:GetFrameLevel())
table.arenapet1school3:SetFrameLevel(lockoutarenapet1:GetFrameLevel())

table.arena2school1:SetFrameLevel(lockoutarena2:GetFrameLevel())
table.arena2school2:SetFrameLevel(lockoutarena2:GetFrameLevel())
table.arena2school3:SetFrameLevel(lockoutarena2:GetFrameLevel())

table.arenapet2school1:SetFrameLevel(lockoutarenapet2:GetFrameLevel())
table.arenapet2school2:SetFrameLevel(lockoutarenapet2:GetFrameLevel())
table.arenapet2school3:SetFrameLevel(lockoutarenapet2:GetFrameLevel())

table.arena3school1:SetFrameLevel(lockoutarena3:GetFrameLevel())
table.arena3school2:SetFrameLevel(lockoutarena3:GetFrameLevel())
table.arena3school3:SetFrameLevel(lockoutarena3:GetFrameLevel())

table.arenapet3school1:SetFrameLevel(lockoutarenapet3:GetFrameLevel())
table.arenapet3school2:SetFrameLevel(lockoutarenapet3:GetFrameLevel())
table.arenapet3school3:SetFrameLevel(lockoutarenapet3:GetFrameLevel())

local function School_Frame_Level()
	if LockoutDB.defaults.lockout_player_anchor == false then
		table.plaschool2:SetFrameLevel(lockoutpla:GetFrameLevel() + 1)
		table.plaschool3:SetFrameLevel(lockoutpla:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_playerpet_anchor == false then
		table.playerpetschool2:SetFrameLevel(lockoutplayerpet:GetFrameLevel() + 1)
		table.playerpetschool3:SetFrameLevel(lockoutplayerpet:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_target_anchor == false then
		table.tarschool2:SetFrameLevel(lockouttar:GetFrameLevel() + 1)
		table.tarschool3:SetFrameLevel(lockouttar:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_focus_anchor == false then
		table.focschool2:SetFrameLevel(lockoutfoc:GetFrameLevel() + 1)
		table.focschool3:SetFrameLevel(lockoutfoc:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_party1_anchor == false then
		table.party1school2:SetFrameLevel(lockoutparty1:GetFrameLevel() + 1)
		table.party1school3:SetFrameLevel(lockoutparty1:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_partypet1_anchor == false then
		table.partypet1school2:SetFrameLevel(lockoutpartypet1:GetFrameLevel() + 1)
		table.partypet1school3:SetFrameLevel(lockoutpartypet1:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_party2_anchor == false then
		table.party2school2:SetFrameLevel(lockoutparty2:GetFrameLevel() + 1)
		table.party2school3:SetFrameLevel(lockoutparty2:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_partypet2_anchor == false then
		table.partypet2school2:SetFrameLevel(lockoutpartypet2:GetFrameLevel() + 1)
		table.partypet2school3:SetFrameLevel(lockoutpartypet2:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arena1_anchor == false then
		table.arena1school2:SetFrameLevel(lockoutarena1:GetFrameLevel() + 1)
		table.arena1school3:SetFrameLevel(lockoutarena1:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arenapet1_anchor == false then
		table.arenapet1school2:SetFrameLevel(lockoutarenapet1:GetFrameLevel() + 1)
		table.arenapet1school3:SetFrameLevel(lockoutarenapet1:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arena2_anchor == false then
		table.arena2school2:SetFrameLevel(lockoutarena2:GetFrameLevel() + 1)
		table.arena2school3:SetFrameLevel(lockoutarena2:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arenapet2_anchor == false then
		table.arenapet2school2:SetFrameLevel(lockoutarenapet2:GetFrameLevel() + 1)
		table.arenapet2school3:SetFrameLevel(lockoutarenapet2:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arena3_anchor == false then
		table.arena3school2:SetFrameLevel(lockoutarena3:GetFrameLevel() + 1)
		table.arena3school3:SetFrameLevel(lockoutarena3:GetFrameLevel() + 2)
	end
	if LockoutDB.defaults.lockout_arenapet3_anchor == false then
		table.arenapet3school2:SetFrameLevel(lockoutarenapet3:GetFrameLevel() + 1)
		table.arenapet3school3:SetFrameLevel(lockoutarenapet3:GetFrameLevel() + 2)
	end
end

local plaschool1text = table.plaschool1:CreateFontString("plaschool1text", "OVERLAY")
local plaschool2text = table.plaschool2:CreateFontString("plaschool2text", "OVERLAY")
local plaschool3text = table.plaschool3:CreateFontString("plaschool3text", "OVERLAY")

local playerpetschool1text = table.playerpetschool1:CreateFontString("playerpetschool1text", "OVERLAY")
local playerpetschool2text = table.playerpetschool2:CreateFontString("playerpetschool2text", "OVERLAY")
local playerpetschool3text = table.playerpetschool3:CreateFontString("playerpetschool3text", "OVERLAY")

local tarschool1text = table.tarschool1:CreateFontString("tarschool1text", "OVERLAY")
local tarschool2text = table.tarschool2:CreateFontString("tarschool2text", "OVERLAY")
local tarschool3text = table.tarschool3:CreateFontString("tarschool3text", "OVERLAY")

local focschool1text = table.focschool1:CreateFontString("focschool1text", "OVERLAY")
local focschool2text = table.focschool2:CreateFontString("focschool2text", "OVERLAY")
local focschool3text = table.focschool3:CreateFontString("focschool3text", "OVERLAY")

local party1school1text = table.party1school1:CreateFontString("party1school1text", "OVERLAY")
local party1school2text = table.party1school2:CreateFontString("party1school2text", "OVERLAY")
local party1school3text = table.party1school3:CreateFontString("party1school3text", "OVERLAY")

local partypet1school1text = table.partypet1school1:CreateFontString("partypet1school1text", "OVERLAY")
local partypet1school2text = table.partypet1school2:CreateFontString("partypet1school2text", "OVERLAY")
local partypet1school3text = table.partypet1school3:CreateFontString("partypet1school3text", "OVERLAY")

local party2school1text = table.party2school1:CreateFontString("party2school1text", "OVERLAY")
local party2school2text = table.party2school2:CreateFontString("party2school2text", "OVERLAY")
local party2school3text = table.party2school3:CreateFontString("party2school3text", "OVERLAY")

local partypet2school1text = table.partypet2school1:CreateFontString("partypet2school1text", "OVERLAY")
local partypet2school2text = table.partypet2school2:CreateFontString("partypet2school2text", "OVERLAY")
local partypet2school3text = table.partypet2school3:CreateFontString("partypet2school3text", "OVERLAY")

local arena1school1text = table.arena1school1:CreateFontString("arena1school1text", "OVERLAY")
local arena1school2text = table.arena1school2:CreateFontString("arena1school2text", "OVERLAY")
local arena1school3text = table.arena1school3:CreateFontString("arena1school3text", "OVERLAY")

local arenapet1school1text = table.arenapet1school1:CreateFontString("arenapet1school1text", "OVERLAY")
local arenapet1school2text = table.arenapet1school2:CreateFontString("arenapet1school2text", "OVERLAY")
local arenapet1school3text = table.arenapet1school3:CreateFontString("arenapet1school3text", "OVERLAY")

local arena2school1text = table.arena2school1:CreateFontString("arena2school1text", "OVERLAY")
local arena2school2text = table.arena2school2:CreateFontString("arena2school2text", "OVERLAY")
local arena2school3text = table.arena2school3:CreateFontString("arena2school3text", "OVERLAY")

local arenapet2school1text = table.arenapet2school1:CreateFontString("arenapet2school1text", "OVERLAY")
local arenapet2school2text = table.arenapet2school2:CreateFontString("arenapet2school2text", "OVERLAY")
local arenapet2school3text = table.arenapet2school3:CreateFontString("arenapet2school3text", "OVERLAY")

local arena3school1text = table.arena3school1:CreateFontString("arena3school1text", "OVERLAY")
local arena3school2text = table.arena3school2:CreateFontString("arena3school2text", "OVERLAY")
local arena3school3text = table.arena3school3:CreateFontString("arena3school3text", "OVERLAY")

local arenapet3school1text = table.arenapet3school1:CreateFontString("arenapet3school1text", "OVERLAY")
local arenapet3school2text = table.arenapet3school2:CreateFontString("arenapet3school2text", "OVERLAY")
local arenapet3school3text = table.arenapet3school3:CreateFontString("arenapet3school3text", "OVERLAY")

local function Lockout_Text_Alpha()
	plaschool1text:SetAlpha(table.Text_Alpha)
	plaschool2text:SetAlpha(table.Text_Alpha)
	plaschool3text:SetAlpha(table.Text_Alpha)

	playerpetschool1text:SetAlpha(table.Text_Alpha)
	playerpetschool2text:SetAlpha(table.Text_Alpha)
	playerpetschool3text:SetAlpha(table.Text_Alpha)

	tarschool1text:SetAlpha(table.Text_Alpha)
	tarschool2text:SetAlpha(table.Text_Alpha)
	tarschool3text:SetAlpha(table.Text_Alpha)

	focschool1text:SetAlpha(table.Text_Alpha)
	focschool2text:SetAlpha(table.Text_Alpha)
	focschool3text:SetAlpha(table.Text_Alpha)

	party1school1text:SetAlpha(table.Text_Alpha)
	party1school2text:SetAlpha(table.Text_Alpha)
	party1school3text:SetAlpha(table.Text_Alpha)

	partypet1school1text:SetAlpha(table.Text_Alpha)
	partypet1school2text:SetAlpha(table.Text_Alpha)
	partypet1school3text:SetAlpha(table.Text_Alpha)

	party2school1text:SetAlpha(table.Text_Alpha)
	party2school2text:SetAlpha(table.Text_Alpha)
	party2school3text:SetAlpha(table.Text_Alpha)

	partypet2school1text:SetAlpha(table.Text_Alpha)
	partypet2school2text:SetAlpha(table.Text_Alpha)
	partypet2school3text:SetAlpha(table.Text_Alpha)

	arena1school1text:SetAlpha(table.Text_Alpha)
	arena1school2text:SetAlpha(table.Text_Alpha)
	arena1school3text:SetAlpha(table.Text_Alpha)

	arenapet1school1text:SetAlpha(table.Text_Alpha)
	arenapet1school2text:SetAlpha(table.Text_Alpha)
	arenapet1school3text:SetAlpha(table.Text_Alpha)

	arena2school1text:SetAlpha(table.Text_Alpha)
	arena2school2text:SetAlpha(table.Text_Alpha)
	arena2school3text:SetAlpha(table.Text_Alpha)

	arenapet2school1text:SetAlpha(table.Text_Alpha)
	arenapet2school2text:SetAlpha(table.Text_Alpha)
	arenapet2school3text:SetAlpha(table.Text_Alpha)

	arena3school1text:SetAlpha(table.Text_Alpha)
	arena3school2text:SetAlpha(table.Text_Alpha)
	arena3school3text:SetAlpha(table.Text_Alpha)

	arenapet3school1text:SetAlpha(table.Text_Alpha)
	arenapet3school2text:SetAlpha(table.Text_Alpha)
	arenapet3school3text:SetAlpha(table.Text_Alpha)
end

local function SetCooldownTextSize()
	plaschool1text:SetFont(table.FONT_TEXT, lockoutpla:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	plaschool1text:SetPoint("CENTER", table.plaschool1, "CENTER")
	table.plaschool1:SetWidth(table.FrameSize)
	table.plaschool1:SetHeight(table.FrameSize)

	plaschool2text:SetFont(table.FONT_TEXT, lockoutpla:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	plaschool2text:SetPoint("CENTER", table.plaschool2, "CENTER")
	table.plaschool2:SetWidth(table.FrameSize)
	table.plaschool2:SetHeight(table.FrameSize)

	plaschool3text:SetFont(table.FONT_TEXT, lockoutpla:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	plaschool3text:SetPoint("CENTER", table.plaschool3, "CENTER")
	table.plaschool3:SetWidth(table.FrameSize)
	table.plaschool3:SetHeight(table.FrameSize)

	playerpetschool1text:SetFont(table.FONT_TEXT, lockoutplayerpet:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	playerpetschool1text:SetPoint("CENTER", table.playerpetschool1, "CENTER")
	table.playerpetschool1:SetWidth(table.FrameSize)
	table.playerpetschool1:SetHeight(table.FrameSize)

	playerpetschool2text:SetFont(table.FONT_TEXT, lockoutplayerpet:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	playerpetschool2text:SetPoint("CENTER", table.playerpetschool2, "CENTER")
	table.playerpetschool2:SetWidth(table.FrameSize)
	table.playerpetschool2:SetHeight(table.FrameSize)

	playerpetschool3text:SetFont(table.FONT_TEXT, lockoutplayerpet:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	playerpetschool3text:SetPoint("CENTER", table.playerpetschool3, "CENTER")
	table.playerpetschool3:SetWidth(table.FrameSize)
	table.playerpetschool3:SetHeight(table.FrameSize)

	tarschool1text:SetFont(table.FONT_TEXT, lockouttar:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	tarschool1text:SetPoint("CENTER", table.tarschool1, "CENTER")
	table.tarschool1:SetWidth(table.FrameSize)
	table.tarschool1:SetHeight(table.FrameSize)

	tarschool2text:SetFont(table.FONT_TEXT, lockouttar:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	tarschool2text:SetPoint("CENTER", table.tarschool2, "CENTER")
	table.tarschool2:SetWidth(table.FrameSize)
	table.tarschool2:SetHeight(table.FrameSize)

	tarschool3text:SetFont(table.FONT_TEXT, lockouttar:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	tarschool3text:SetPoint("CENTER", table.tarschool3, "CENTER")
	table.tarschool3:SetWidth(table.FrameSize)
	table.tarschool3:SetHeight(table.FrameSize)

	focschool1text:SetFont(table.FONT_TEXT, lockoutfoc:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	focschool1text:SetPoint("CENTER", table.focschool1, "CENTER")
	table.focschool1:SetWidth(table.FrameSize)
	table.focschool1:SetHeight(table.FrameSize)

	focschool2text:SetFont(table.FONT_TEXT, lockoutfoc:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	focschool2text:SetPoint("CENTER", table.focschool2, "CENTER")
	table.focschool2:SetWidth(table.FrameSize)
	table.focschool2:SetHeight(table.FrameSize)

	focschool3text:SetFont(table.FONT_TEXT, lockoutfoc:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	focschool3text:SetPoint("CENTER", table.focschool3, "CENTER")
	table.focschool3:SetWidth(table.FrameSize)
	table.focschool3:SetHeight(table.FrameSize)

	party1school1text:SetFont(table.FONT_TEXT, lockoutparty1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party1school1text:SetPoint("CENTER", table.party1school1, "CENTER")
	table.party1school1:SetWidth(table.FrameSize)
	table.party1school1:SetHeight(table.FrameSize)

	party1school2text:SetFont(table.FONT_TEXT, lockoutparty1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party1school2text:SetPoint("CENTER", table.party1school2, "CENTER")
	table.party1school2:SetWidth(table.FrameSize)
	table.party1school2:SetHeight(table.FrameSize)

	party1school3text:SetFont(table.FONT_TEXT, lockoutparty1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party1school3text:SetPoint("CENTER", table.party1school3, "CENTER")
	table.party1school3:SetWidth(table.FrameSize)
	table.party1school3:SetHeight(table.FrameSize)

	partypet1school1text:SetFont(table.FONT_TEXT, lockoutpartypet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet1school1text:SetPoint("CENTER", table.partypet1school1, "CENTER")
	table.partypet1school1:SetWidth(table.FrameSize)
	table.partypet1school1:SetHeight(table.FrameSize)

	partypet1school2text:SetFont(table.FONT_TEXT, lockoutpartypet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet1school2text:SetPoint("CENTER", table.partypet1school2, "CENTER")
	table.partypet1school2:SetWidth(table.FrameSize)
	table.partypet1school2:SetHeight(table.FrameSize)

	partypet1school3text:SetFont(table.FONT_TEXT, lockoutpartypet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet1school3text:SetPoint("CENTER", table.partypet1school3, "CENTER")
	table.partypet1school3:SetWidth(table.FrameSize)
	table.partypet1school3:SetHeight(table.FrameSize)

	party2school1text:SetFont(table.FONT_TEXT, lockoutparty2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party2school1text:SetPoint("CENTER", table.party2school1, "CENTER")
	table.party2school1:SetWidth(table.FrameSize)
	table.party2school1:SetHeight(table.FrameSize)

	party2school2text:SetFont(table.FONT_TEXT, lockoutparty2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party2school2text:SetPoint("CENTER", table.party2school2, "CENTER")
	table.party2school2:SetWidth(table.FrameSize)
	table.party2school2:SetHeight(table.FrameSize)

	party2school3text:SetFont(table.FONT_TEXT, lockoutparty2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	party2school3text:SetPoint("CENTER", table.party2school3, "CENTER")
	table.party2school3:SetWidth(table.FrameSize)
	table.party2school3:SetHeight(table.FrameSize)

	partypet2school1text:SetFont(table.FONT_TEXT, lockoutpartypet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet2school1text:SetPoint("CENTER", table.partypet2school1, "CENTER")
	table.partypet2school1:SetWidth(table.FrameSize)
	table.partypet2school1:SetHeight(table.FrameSize)

	partypet2school2text:SetFont(table.FONT_TEXT, lockoutpartypet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet2school2text:SetPoint("CENTER", table.partypet2school2, "CENTER")
	table.partypet2school2:SetWidth(table.FrameSize)
	table.partypet2school2:SetHeight(table.FrameSize)

	partypet2school3text:SetFont(table.FONT_TEXT, lockoutpartypet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	partypet2school3text:SetPoint("CENTER", table.partypet2school3, "CENTER")
	table.partypet2school3:SetWidth(table.FrameSize)
	table.partypet2school3:SetHeight(table.FrameSize)

	arena1school1text:SetFont(table.FONT_TEXT, lockoutarena1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena1school1text:SetPoint("CENTER", table.arena1school1, "CENTER")
	table.arena1school1:SetWidth(table.FrameSize)
	table.arena1school1:SetHeight(table.FrameSize)

	arena1school2text:SetFont(table.FONT_TEXT, lockoutarena1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena1school2text:SetPoint("CENTER", table.arena1school2, "CENTER")
	table.arena1school2:SetWidth(table.FrameSize)
	table.arena1school2:SetHeight(table.FrameSize)

	arena1school3text:SetFont(table.FONT_TEXT, lockoutarena1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena1school3text:SetPoint("CENTER", table.arena1school3, "CENTER")
	table.arena1school3:SetWidth(table.FrameSize)
	table.arena1school3:SetHeight(table.FrameSize)

	arenapet1school1text:SetFont(table.FONT_TEXT, lockoutarenapet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet1school1text:SetPoint("CENTER", table.arenapet1school1, "CENTER")
	table.arenapet1school1:SetWidth(table.FrameSize)
	table.arenapet1school1:SetHeight(table.FrameSize)

	arenapet1school2text:SetFont(table.FONT_TEXT, lockoutarenapet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet1school2text:SetPoint("CENTER", table.arenapet1school2, "CENTER")
	table.arenapet1school2:SetWidth(table.FrameSize)
	table.arenapet1school2:SetHeight(table.FrameSize)

	arenapet1school3text:SetFont(table.FONT_TEXT, lockoutarenapet1:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet1school3text:SetPoint("CENTER", table.arenapet1school3, "CENTER")
	table.arenapet1school3:SetWidth(table.FrameSize)
	table.arenapet1school3:SetHeight(table.FrameSize)

	arena2school1text:SetFont(table.FONT_TEXT, lockoutarena2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena2school1text:SetPoint("CENTER", table.arena2school1, "CENTER")
	table.arena2school1:SetWidth(table.FrameSize)
	table.arena2school1:SetHeight(table.FrameSize)

	arena2school2text:SetFont(table.FONT_TEXT, lockoutarena2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena2school2text:SetPoint("CENTER", table.arena2school2, "CENTER")
	table.arena2school2:SetWidth(table.FrameSize)
	table.arena2school2:SetHeight(table.FrameSize)

	arena2school3text:SetFont(table.FONT_TEXT, lockoutarena2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena2school3text:SetPoint("CENTER", table.arena2school3, "CENTER")
	table.arena2school3:SetWidth(table.FrameSize)
	table.arena2school3:SetHeight(table.FrameSize)

	arenapet2school1text:SetFont(table.FONT_TEXT, lockoutarenapet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet2school1text:SetPoint("CENTER", table.arenapet2school1, "CENTER")
	table.arenapet2school1:SetWidth(table.FrameSize)
	table.arenapet2school1:SetHeight(table.FrameSize)

	arenapet2school2text:SetFont(table.FONT_TEXT, lockoutarenapet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet2school2text:SetPoint("CENTER", table.arenapet2school2, "CENTER")
	table.arenapet2school2:SetWidth(table.FrameSize)
	table.arenapet2school2:SetHeight(table.FrameSize)

	arenapet2school3text:SetFont(table.FONT_TEXT, lockoutarenapet2:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet2school3text:SetPoint("CENTER", table.arenapet2school3, "CENTER")
	table.arenapet2school3:SetWidth(table.FrameSize)
	table.arenapet2school3:SetHeight(table.FrameSize)

	arena3school1text:SetFont(table.FONT_TEXT, lockoutarena3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena3school1text:SetPoint("CENTER", table.arena3school1, "CENTER")
	table.arena3school1:SetWidth(table.FrameSize)
	table.arena3school1:SetHeight(table.FrameSize)

	arena3school2text:SetFont(table.FONT_TEXT, lockoutarena3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena3school2text:SetPoint("CENTER", table.arena3school2, "CENTER")
	table.arena3school2:SetWidth(table.FrameSize)
	table.arena3school2:SetHeight(table.FrameSize)

	arena3school3text:SetFont(table.FONT_TEXT, lockoutarena3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arena3school3text:SetPoint("CENTER", table.arena3school3, "CENTER")
	table.arena3school3:SetWidth(table.FrameSize)
	table.arena3school3:SetHeight(table.FrameSize)

	arenapet3school1text:SetFont(table.FONT_TEXT, lockoutarenapet3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet3school1text:SetPoint("CENTER", table.arenapet3school1, "CENTER")
	table.arenapet3school1:SetWidth(table.FrameSize)
	table.arenapet3school1:SetHeight(table.FrameSize)

	arenapet3school2text:SetFont(table.FONT_TEXT, lockoutarenapet3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet3school2text:SetPoint("CENTER", table.arenapet3school2, "CENTER")
	table.arenapet3school2:SetWidth(table.FrameSize)
	table.arenapet3school2:SetHeight(table.FrameSize)

	arenapet3school3text:SetFont(table.FONT_TEXT, lockoutarenapet3:GetHeight() / LockoutDB.scale.lockout_cdtext_scale, table.FONT_OUTLINE)
	arenapet3school3text:SetPoint("CENTER", table.arenapet3school3, "CENTER")
	table.arenapet3school3:SetWidth(table.FrameSize)
	table.arenapet3school3:SetHeight(table.FrameSize)
end

local framedummytextpla = CreateFrame("Frame", "framedummytextpla", lockoutpla)
framedummytextpla:SetSize(1, 1)
framedummytextpla:SetPoint("CENTER")
framedummytextpla:SetFrameStrata("MEDIUM")

local framedummytextplayerpet = CreateFrame("Frame", "framedummytextplayerpet", lockoutplayerpet)
framedummytextplayerpet:SetSize(1, 1)
framedummytextplayerpet:SetPoint("CENTER")
framedummytextplayerpet:SetFrameStrata("MEDIUM")

local framedummytexttar = CreateFrame("Frame", "framedummytexttar", lockouttar)
framedummytexttar:SetSize(1, 1)
framedummytexttar:SetPoint("CENTER")
framedummytexttar:SetFrameStrata("MEDIUM")

local framedummytextfoc = CreateFrame("Frame", "framedummytextfoc", lockoutfoc)
framedummytextfoc:SetSize(1, 1)
framedummytextfoc:SetPoint("CENTER")
framedummytextfoc:SetFrameStrata("MEDIUM")

local framedummytextparty1 = CreateFrame("Frame", "framedummytextparty1", lockoutparty1)
framedummytextparty1:SetSize(1, 1)
framedummytextparty1:SetPoint("CENTER")
framedummytextparty1:SetFrameStrata("MEDIUM")

local framedummytextpartypet1 = CreateFrame("Frame", "framedummytextpartypet1", lockoutpartypet1)
framedummytextpartypet1:SetSize(1, 1)
framedummytextpartypet1:SetPoint("CENTER")
framedummytextpartypet1:SetFrameStrata("MEDIUM")

local framedummytextparty2 = CreateFrame("Frame", "framedummytextparty2", lockoutparty2)
framedummytextparty2:SetSize(1, 1)
framedummytextparty2:SetPoint("CENTER")
framedummytextparty2:SetFrameStrata("MEDIUM")

local framedummytextpartypet2 = CreateFrame("Frame", "framedummytextpartypet2", lockoutpartypet2)
framedummytextpartypet2:SetSize(1, 1)
framedummytextpartypet2:SetPoint("CENTER")
framedummytextpartypet2:SetFrameStrata("MEDIUM")

local framedummytextarena1 = CreateFrame("Frame", "framedummytextarena1", lockoutarena1)
framedummytextarena1:SetSize(1, 1)
framedummytextarena1:SetPoint("CENTER")
framedummytextarena1:SetFrameStrata("MEDIUM")

local framedummytextarenapet1 = CreateFrame("Frame", "framedummytextarenapet1", lockoutarenapet1)
framedummytextarenapet1:SetSize(1, 1)
framedummytextarenapet1:SetPoint("CENTER")
framedummytextarenapet1:SetFrameStrata("MEDIUM")

local framedummytextarena2 = CreateFrame("Frame", "framedummytextarena2", lockoutarena2)
framedummytextarena2:SetSize(1, 1)
framedummytextarena2:SetPoint("CENTER")
framedummytextarena2:SetFrameStrata("MEDIUM")

local framedummytextarenapet2 = CreateFrame("Frame", "framedummytextarenapet2", lockoutarenapet2)
framedummytextarenapet2:SetSize(1, 1)
framedummytextarenapet2:SetPoint("CENTER")
framedummytextarenapet2:SetFrameStrata("MEDIUM")

local framedummytextarena3 = CreateFrame("Frame", "framedummytextarena3", lockoutarena3)
framedummytextarena3:SetSize(1, 1)
framedummytextarena3:SetPoint("CENTER")
framedummytextarena3:SetFrameStrata("MEDIUM")

local framedummytextarenapet3 = CreateFrame("Frame", "framedummytextarenapet3", lockoutarenapet3)
framedummytextarenapet3:SetSize(1, 1)
framedummytextarenapet3:SetPoint("CENTER")
framedummytextarenapet3:SetFrameStrata("MEDIUM")

local dummytextpla = framedummytextpla:CreateFontString("dummytextpla", "OVERLAY")
dummytextpla:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextpla:SetPoint("CENTER", framedummytextpla, "CENTER")
dummytextpla:SetText("Player")

local dummytextplayerpet = framedummytextplayerpet:CreateFontString("dummytextplayerpet", "OVERLAY")
dummytextplayerpet:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextplayerpet:SetPoint("CENTER", framedummytextplayerpet, "CENTER")
dummytextplayerpet:SetText("Player\nPet")

local dummytexttar = framedummytexttar:CreateFontString("dummytexttar", "OVERLAY")
dummytexttar:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytexttar:SetPoint("CENTER", framedummytexttar, "CENTER")
dummytexttar:SetText("Target")

local dummytextfoc = framedummytextfoc:CreateFontString("dummytextfoc", "OVERLAY")
dummytextfoc:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextfoc:SetPoint("CENTER", framedummytextfoc, "CENTER")
dummytextfoc:SetText("Focus")

local dummytextparty1 = framedummytextparty1:CreateFontString("dummytextparty1", "OVERLAY")
dummytextparty1:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextparty1:SetPoint("CENTER", framedummytextparty1, "CENTER")
dummytextparty1:SetText("Party1")

local dummytextpartypet1 = framedummytextpartypet1:CreateFontString("dummytextpartypet1", "OVERLAY")
dummytextpartypet1:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextpartypet1:SetPoint("CENTER", framedummytextpartypet1, "CENTER")
dummytextpartypet1:SetText("Party\nPet1")

local dummytextparty2 = framedummytextparty2:CreateFontString("dummytextparty2", "OVERLAY")
dummytextparty2:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextparty2:SetPoint("CENTER", framedummytextparty2, "CENTER")
dummytextparty2:SetText("Party2")

local dummytextpartypet2 = framedummytextpartypet2:CreateFontString("dummytextpartypet2", "OVERLAY")
dummytextpartypet2:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextpartypet2:SetPoint("CENTER", framedummytextpartypet2, "CENTER")
dummytextpartypet2:SetText("Party\nPet2")

local dummytextarena1 = framedummytextarena1:CreateFontString("dummytextarena1", "OVERLAY")
dummytextarena1:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarena1:SetPoint("CENTER", framedummytextarena1, "CENTER")
dummytextarena1:SetText("Arena1")

local dummytextarenapet1 = framedummytextarenapet1:CreateFontString("dummytextarenapet1", "OVERLAY")
dummytextarenapet1:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarenapet1:SetPoint("CENTER", framedummytextarenapet1, "CENTER")
dummytextarenapet1:SetText("Arena\nPet1")

local dummytextarena2 = framedummytextarena2:CreateFontString("dummytextarena2", "OVERLAY")
dummytextarena2:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarena2:SetPoint("CENTER", framedummytextarena2, "CENTER")
dummytextarena2:SetText("Arena2")

local dummytextarenapet2 = framedummytextarenapet2:CreateFontString("dummytextarenapet2", "OVERLAY")
dummytextarenapet2:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarenapet2:SetPoint("CENTER", framedummytextarenapet2, "CENTER")
dummytextarenapet2:SetText("Arena\nPet2")

local dummytextarena3 = framedummytextarena3:CreateFontString("dummytextarena3", "OVERLAY")
dummytextarena3:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarena3:SetPoint("CENTER", framedummytextarena3, "CENTER")
dummytextarena3:SetText("Arena3")

local dummytextarenapet3 = framedummytextarenapet3:CreateFontString("dummytextarenapet3", "OVERLAY")
dummytextarenapet3:SetFont(table.FONT_TEXT, 11, table.FONT_OUTLINE)
dummytextarenapet3:SetPoint("CENTER", framedummytextarenapet3, "CENTER")
dummytextarenapet3:SetText("Arena\nPet3")

local texplaschool1 = table.plaschool1:CreateTexture()
local texplaschool2 = table.plaschool2:CreateTexture()
local texplaschool3 = table.plaschool3:CreateTexture()

local texplayerpetschool1 = table.playerpetschool1:CreateTexture()
local texplayerpetschool2 = table.playerpetschool2:CreateTexture()
local texplayerpetschool3 = table.playerpetschool3:CreateTexture()

local textarschool1 = table.tarschool1:CreateTexture()
local textarschool2 = table.tarschool2:CreateTexture()
local textarschool3 = table.tarschool3:CreateTexture()

local texfocschool1 = table.focschool1:CreateTexture()
local texfocschool2 = table.focschool2:CreateTexture()
local texfocschool3 = table.focschool3:CreateTexture()

local texparty1school1 = table.party1school1:CreateTexture()
local texparty1school2 = table.party1school2:CreateTexture()
local texparty1school3 = table.party1school3:CreateTexture()

local texpartypet1school1 = table.partypet1school1:CreateTexture()
local texpartypet1school2 = table.partypet1school2:CreateTexture()
local texpartypet1school3 = table.partypet1school3:CreateTexture()

local texparty2school1 = table.party2school1:CreateTexture()
local texparty2school2 = table.party2school2:CreateTexture()
local texparty2school3 = table.party2school3:CreateTexture()

local texpartypet2school1 = table.partypet2school1:CreateTexture()
local texpartypet2school2 = table.partypet2school2:CreateTexture()
local texpartypet2school3 = table.partypet2school3:CreateTexture()

local texarena1school1 = table.arena1school1:CreateTexture()
local texarena1school2 = table.arena1school2:CreateTexture()
local texarena1school3 = table.arena1school3:CreateTexture()

local texarenapet1school1 = table.arenapet1school1:CreateTexture()
local texarenapet1school2 = table.arenapet1school2:CreateTexture()
local texarenapet1school3 = table.arenapet1school3:CreateTexture()

local texarena2school1 = table.arena2school1:CreateTexture()
local texarena2school2 = table.arena2school2:CreateTexture()
local texarena2school3 = table.arena2school3:CreateTexture()

local texarenapet2school1 = table.arenapet2school1:CreateTexture()
local texarenapet2school2 = table.arenapet2school2:CreateTexture()
local texarenapet2school3 = table.arenapet2school3:CreateTexture()

local texarena3school1 = table.arena3school1:CreateTexture()
local texarena3school2 = table.arena3school2:CreateTexture()
local texarena3school3 = table.arena3school3:CreateTexture()

local texarenapet3school1 = table.arenapet3school1:CreateTexture()
local texarenapet3school2 = table.arenapet3school2:CreateTexture()
local texarenapet3school3 = table.arenapet3school3:CreateTexture()

texplaschool1:SetDrawLayer("OVERLAY")
texplaschool2:SetDrawLayer("OVERLAY")
texplaschool3:SetDrawLayer("OVERLAY")

texplayerpetschool1:SetDrawLayer("OVERLAY")
texplayerpetschool2:SetDrawLayer("OVERLAY")
texplayerpetschool3:SetDrawLayer("OVERLAY")

textarschool1:SetDrawLayer("OVERLAY")
textarschool2:SetDrawLayer("OVERLAY")
textarschool3:SetDrawLayer("OVERLAY")

texfocschool1:SetDrawLayer("OVERLAY")
texfocschool2:SetDrawLayer("OVERLAY")
texfocschool3:SetDrawLayer("OVERLAY")

texparty1school1:SetDrawLayer("OVERLAY")
texparty1school2:SetDrawLayer("OVERLAY")
texparty1school3:SetDrawLayer("OVERLAY")

texpartypet1school1:SetDrawLayer("OVERLAY")
texpartypet1school2:SetDrawLayer("OVERLAY")
texpartypet1school3:SetDrawLayer("OVERLAY")

texparty2school1:SetDrawLayer("OVERLAY")
texparty2school2:SetDrawLayer("OVERLAY")
texparty2school3:SetDrawLayer("OVERLAY")

texpartypet2school1:SetDrawLayer("OVERLAY")
texpartypet2school2:SetDrawLayer("OVERLAY")
texpartypet2school3:SetDrawLayer("OVERLAY")

texarena1school1:SetDrawLayer("OVERLAY")
texarena1school2:SetDrawLayer("OVERLAY")
texarena1school3:SetDrawLayer("OVERLAY")

texarenapet1school1:SetDrawLayer("OVERLAY")
texarenapet1school2:SetDrawLayer("OVERLAY")
texarenapet1school3:SetDrawLayer("OVERLAY")

texarena2school1:SetDrawLayer("OVERLAY")
texarena2school2:SetDrawLayer("OVERLAY")
texarena2school3:SetDrawLayer("OVERLAY")

texarenapet2school1:SetDrawLayer("OVERLAY")
texarenapet2school2:SetDrawLayer("OVERLAY")
texarenapet2school3:SetDrawLayer("OVERLAY")

texarena3school1:SetDrawLayer("OVERLAY")
texarena3school2:SetDrawLayer("OVERLAY")
texarena3school3:SetDrawLayer("OVERLAY")

texarenapet3school1:SetDrawLayer("OVERLAY")
texarenapet3school2:SetDrawLayer("OVERLAY")
texarenapet3school3:SetDrawLayer("OVERLAY")

local texdummypla = lockout:CreateTexture("texdummypla")
local texdummyplayerpet = lockout:CreateTexture("texdummyplayerpet")
local texdummytar = lockout:CreateTexture("texdummytar")
local texdummyfoc = lockout:CreateTexture("texdummyfoc")
local texdummyparty1 = lockout:CreateTexture("texdummyparty1")
local texdummypartypet1 = lockout:CreateTexture("texdummypartypet1")
local texdummyparty2 = lockout:CreateTexture("texdummyparty2")
local texdummypartypet2 = lockout:CreateTexture("texdummypartypet2")
local texdummyarena1 = lockout:CreateTexture("texdummyarena1")
local texdummyarenapet1 = lockout:CreateTexture("texdummyarenapet1")
local texdummyarena2 = lockout:CreateTexture("texdummyarena2")
local texdummyarenapet2 = lockout:CreateTexture("texdummyarenapet2")
local texdummyarena3 = lockout:CreateTexture("texdummyarena3")
local texdummyarenapet3 = lockout:CreateTexture("texdummyarenapet3")

local function Lockout_TexCoord()
	if LockoutDB.defaults.lockout_player_anchor == false then
		texplaschool1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texplaschool2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texplaschool3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummypla:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_playerpet_anchor == false then
		texplayerpetschool1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texplayerpetschool2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texplayerpetschool3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyplayerpet:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_target_anchor == false then
		textarschool1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		textarschool2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		textarschool3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummytar:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_focus_anchor == false then
		texfocschool1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texfocschool2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texfocschool3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyfoc:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_party1_anchor == false then
		texparty1school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texparty1school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texparty1school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyparty1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_partypet1_anchor == false then
		texpartypet1school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texpartypet1school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texpartypet1school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummypartypet1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_party2_anchor == false then
		texparty2school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texparty2school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texparty2school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyparty2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_partypet2_anchor == false then
		texpartypet2school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texpartypet2school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texpartypet2school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummypartypet2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arena1_anchor == false then
		texarena1school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena1school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena1school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarena1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arenapet1_anchor == false then
		texarenapet1school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet1school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet1school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarenapet1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arena2_anchor == false then
		texarena2school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena2school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena2school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarena2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arenapet2_anchor == false then
		texarenapet2school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet2school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet2school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarenapet2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arena3_anchor == false then
		texarena3school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena3school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarena3school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarena3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end

	if LockoutDB.defaults.lockout_arenapet3_anchor == false then
		texarenapet3school1:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet3school2:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texarenapet3school3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
		texdummyarenapet3:SetTexCoord(table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B)
	end
end

table.plaschool1:SetPoint("CENTER", lockoutpla, "CENTER")
table.plaschool2:SetPoint("CENTER", lockoutpla, "CENTER")
table.plaschool3:SetPoint("CENTER", lockoutpla, "CENTER")

table.playerpetschool1:SetPoint("CENTER", lockoutplayerpet, "CENTER")
table.playerpetschool2:SetPoint("CENTER", lockoutplayerpet, "CENTER")
table.playerpetschool3:SetPoint("CENTER", lockoutplayerpet, "CENTER")

table.tarschool1:SetPoint("CENTER", lockouttar, "CENTER")
table.tarschool2:SetPoint("CENTER", lockouttar, "CENTER")
table.tarschool3:SetPoint("CENTER", lockouttar, "CENTER")

table.focschool1:SetPoint("CENTER", lockoutfoc, "CENTER")
table.focschool2:SetPoint("CENTER", lockoutfoc, "CENTER")
table.focschool3:SetPoint("CENTER", lockoutfoc, "CENTER")

table.party1school1:SetPoint("CENTER", lockoutparty1, "CENTER")
table.party1school2:SetPoint("CENTER", lockoutparty1, "CENTER")
table.party1school3:SetPoint("CENTER", lockoutparty1, "CENTER")

table.partypet1school1:SetPoint("CENTER", lockoutpartypet1, "CENTER")
table.partypet1school2:SetPoint("CENTER", lockoutpartypet1, "CENTER")
table.partypet1school3:SetPoint("CENTER", lockoutpartypet1, "CENTER")

table.party2school1:SetPoint("CENTER", lockoutparty2, "CENTER")
table.party2school2:SetPoint("CENTER", lockoutparty2, "CENTER")
table.party2school3:SetPoint("CENTER", lockoutparty2, "CENTER")

table.partypet2school1:SetPoint("CENTER", lockoutpartypet2, "CENTER")
table.partypet2school2:SetPoint("CENTER", lockoutpartypet2, "CENTER")
table.partypet2school3:SetPoint("CENTER", lockoutpartypet2, "CENTER")

table.arena1school1:SetPoint("CENTER", lockoutarena1, "CENTER")
table.arena1school2:SetPoint("CENTER", lockoutarena1, "CENTER")
table.arena1school3:SetPoint("CENTER", lockoutarena1, "CENTER")

table.arenapet1school1:SetPoint("CENTER", lockoutarenapet1, "CENTER")
table.arenapet1school2:SetPoint("CENTER", lockoutarenapet1, "CENTER")
table.arenapet1school3:SetPoint("CENTER", lockoutarenapet1, "CENTER")

table.arena2school1:SetPoint("CENTER", lockoutarena2, "CENTER")
table.arena2school2:SetPoint("CENTER", lockoutarena2, "CENTER")
table.arena2school3:SetPoint("CENTER", lockoutarena2, "CENTER")

table.arenapet2school1:SetPoint("CENTER", lockoutarenapet2, "CENTER")
table.arenapet2school2:SetPoint("CENTER", lockoutarenapet2, "CENTER")
table.arenapet2school3:SetPoint("CENTER", lockoutarenapet2, "CENTER")

table.arena3school1:SetPoint("CENTER", lockoutarena3, "CENTER")
table.arena3school2:SetPoint("CENTER", lockoutarena3, "CENTER")
table.arena3school3:SetPoint("CENTER", lockoutarena3, "CENTER")

table.arenapet3school1:SetPoint("CENTER", lockoutarenapet3, "CENTER")
table.arenapet3school2:SetPoint("CENTER", lockoutarenapet3, "CENTER")
table.arenapet3school3:SetPoint("CENTER", lockoutarenapet3, "CENTER")

texdummypla:SetTexture("Interface\\Icons\\Trade_Engineering")

texdummyplayerpet:SetTexture("Interface\\Icons\\Trade_Engineering")

texdummytar:SetTexture("Interface\\Icons\\Trade_Engineering")

texdummyfoc:SetTexture("Interface\\Icons\\Trade_Engineering")

for i = 1, 2 do
	_G["texdummyparty" .. i]:SetTexture("Interface\\Icons\\Trade_Engineering")
	_G["texdummypartypet" .. i]:SetTexture("Interface\\Icons\\Trade_Engineering")
end

for i = 1, 3 do
	_G["texdummyarena" .. i]:SetTexture("Interface\\Icons\\Trade_Engineering")
	_G["texdummyarenapet" .. i]:SetTexture("Interface\\Icons\\Trade_Engineering")
end

local function Player_CircleTexture()
	SetPortraitToTexture(texdummypla, "Interface\\Icons\\Trade_Engineering")
	texdummypla:SetParent(PlayerPortrait:GetParent())
	texdummypla:SetDrawLayer("OVERLAY")
end
local function PlayerPet_CircleTexture()
	SetPortraitToTexture(texdummyplayerpet, "Interface\\Icons\\Trade_Engineering")
	texdummyplayerpet:SetParent(PetPortrait:GetParent())
	texdummyplayerpet:SetDrawLayer("OVERLAY")
end
local function Target_CircleTexture()
	SetPortraitToTexture(texdummytar, "Interface\\Icons\\Trade_Engineering")
	texdummytar:SetParent(TargetFramePortrait:GetParent())
	texdummytar:SetDrawLayer("OVERLAY")
end
local function Focus_CircleTexture()
	SetPortraitToTexture(texdummyfoc, "Interface\\Icons\\Trade_Engineering")
	texdummyfoc:SetParent(FocusFramePortrait:GetParent())
	texdummyfoc:SetDrawLayer("OVERLAY")
end
local function Party1_CircleTexture()
	SetPortraitToTexture(texdummyparty1, "Interface\\Icons\\Trade_Engineering")
	texdummyparty1:SetParent(PartyMemberFrame1Portrait:GetParent())
	texdummyparty1:SetDrawLayer("OVERLAY")
end
local function PartyPet1_CircleTexture()
	SetPortraitToTexture(texdummypartypet1, "Interface\\Icons\\Trade_Engineering")
	texdummypartypet1:SetParent(PartyMemberFrame1PetFramePortrait:GetParent())
	texdummypartypet1:SetDrawLayer("OVERLAY")
end
local function Party2_CircleTexture()
	SetPortraitToTexture(texdummyparty2, "Interface\\Icons\\Trade_Engineering")
	texdummyparty2:SetParent(PartyMemberFrame1Portrait:GetParent())
	texdummyparty2:SetDrawLayer("OVERLAY")
end
local function PartyPet2_CircleTexture()
	SetPortraitToTexture(texdummypartypet2, "Interface\\Icons\\Trade_Engineering")
	texdummypartypet2:SetParent(PartyMemberFrame2PetFramePortrait:GetParent())
	texdummypartypet2:SetDrawLayer("OVERLAY")
end
local function Arena1_CircleTexture()
	SetPortraitToTexture(texdummyarena1, "Interface\\Icons\\Trade_Engineering")
	texdummyarena1:SetParent(ArenaEnemyFrame1ClassPortrait:GetParent())
	texdummyarena1:SetDrawLayer("OVERLAY")
end
local function ArenaPet1_CircleTexture()
	SetPortraitToTexture(texdummyarenapet1, "Interface\\Icons\\Trade_Engineering")
	texdummyarenapet1:SetParent(ArenaEnemyFrame1PetFramePortrait:GetParent())
	texdummyarenapet1:SetDrawLayer("OVERLAY")
end
local function Arena2_CircleTexture()
	SetPortraitToTexture(texdummyarena2, "Interface\\Icons\\Trade_Engineering")
	texdummyarena2:SetParent(ArenaEnemyFrame2ClassPortrait:GetParent())
	texdummyarena2:SetDrawLayer("OVERLAY")
end
local function ArenaPet2_CircleTexture()
	SetPortraitToTexture(texdummyarenapet2, "Interface\\Icons\\Trade_Engineering")
	texdummyarenapet2:SetParent(ArenaEnemyFrame2PetFramePortrait:GetParent())
	texdummyarenapet2:SetDrawLayer("OVERLAY")
end
local function Arena3_CircleTexture()
	SetPortraitToTexture(texdummyarena3, "Interface\\Icons\\Trade_Engineering")
	texdummyarena3:SetParent(ArenaEnemyFrame3ClassPortrait:GetParent())
	texdummyarena3:SetDrawLayer("OVERLAY")
end
local function ArenaPet3_CircleTexture()
	SetPortraitToTexture(texdummyarenapet3, "Interface\\Icons\\Trade_Engineering")
	texdummyarenapet3:SetParent(ArenaEnemyFrame3PetFramePortrait:GetParent())
	texdummyarenapet3:SetDrawLayer("OVERLAY")
end

texdummypla:SetAllPoints(lockoutpla)

texdummyplayerpet:SetAllPoints(lockoutplayerpet)

texdummytar:SetAllPoints(lockouttar)

texdummyfoc:SetAllPoints(lockoutfoc)

texdummyparty1:SetAllPoints(lockoutparty1)
texdummypartypet1:SetAllPoints(lockoutpartypet1)

texdummyparty2:SetAllPoints(lockoutparty2)
texdummypartypet2:SetAllPoints(lockoutpartypet2)

texdummyarena1:SetAllPoints(lockoutarena1)
texdummyarenapet1:SetAllPoints(lockoutarenapet1)

texdummyarena2:SetAllPoints(lockoutarena2)
texdummyarenapet2:SetAllPoints(lockoutarenapet2)

texdummyarena3:SetAllPoints(lockoutarena3)
texdummyarenapet3:SetAllPoints(lockoutarenapet3)

texplaschool1:SetAllPoints(table.plaschool1)
texplaschool2:SetAllPoints(table.plaschool2)
texplaschool3:SetAllPoints(table.plaschool3)

texplayerpetschool1:SetAllPoints(table.playerpetschool1)
texplayerpetschool2:SetAllPoints(table.playerpetschool2)
texplayerpetschool3:SetAllPoints(table.playerpetschool3)

textarschool1:SetAllPoints(table.tarschool1)
textarschool2:SetAllPoints(table.tarschool2)
textarschool3:SetAllPoints(table.tarschool3)

texfocschool1:SetAllPoints(table.focschool1)
texfocschool2:SetAllPoints(table.focschool2)
texfocschool3:SetAllPoints(table.focschool3)

texparty1school1:SetAllPoints(table.party1school1)
texparty1school2:SetAllPoints(table.party1school2)
texparty1school3:SetAllPoints(table.party1school3)

texpartypet1school1:SetAllPoints(table.partypet1school1)
texpartypet1school2:SetAllPoints(table.partypet1school2)
texpartypet1school3:SetAllPoints(table.partypet1school3)

texparty2school1:SetAllPoints(table.party2school1)
texparty2school2:SetAllPoints(table.party2school2)
texparty2school3:SetAllPoints(table.party2school3)

texpartypet2school1:SetAllPoints(table.partypet2school1)
texpartypet2school2:SetAllPoints(table.partypet2school2)
texpartypet2school3:SetAllPoints(table.partypet2school3)

texarena1school1:SetAllPoints(table.arena1school1)
texarena1school2:SetAllPoints(table.arena1school2)
texarena1school3:SetAllPoints(table.arena1school3)

texarenapet1school1:SetAllPoints(table.arenapet1school1)
texarenapet1school2:SetAllPoints(table.arenapet1school2)
texarenapet1school3:SetAllPoints(table.arenapet1school3)

texarena2school1:SetAllPoints(table.arena2school1)
texarena2school2:SetAllPoints(table.arena2school2)
texarena2school3:SetAllPoints(table.arena2school3)

texarenapet2school1:SetAllPoints(table.arenapet2school1)
texarenapet2school2:SetAllPoints(table.arenapet2school2)
texarenapet2school3:SetAllPoints(table.arenapet2school3)

texarena3school1:SetAllPoints(table.arena3school1)
texarena3school2:SetAllPoints(table.arena3school2)
texarena3school3:SetAllPoints(table.arena3school3)

texarenapet3school1:SetAllPoints(table.arenapet3school1)
texarenapet3school2:SetAllPoints(table.arenapet3school2)
texarenapet3school3:SetAllPoints(table.arenapet3school3)

lockoutpla.texture = texdummypla
lockoutplayerpet.texture = texdummyplayerpet
lockouttar.texture = texdummytar
lockoutfoc.texture = texdummyfoc
lockoutparty1.texture = texdummyparty1
lockoutpartypet1.texture = texdummypartypet1
lockoutparty2.texture = texdummyparty2
lockoutpartypet2.texture = texdummypartypet2
lockoutarena1.texture = texdummyarena1
lockoutarenapet1.texture = texdummyarenapet1
lockoutarena2.texture = texdummyarena2
lockoutarenapet2.texture = texdummyarenapet2
lockoutarena3.texture = texdummyarena3
lockoutarenapet3.texture = texdummyarenapet3

table.plaschool1.texture = texplaschool1
table.plaschool2.texture = texplaschool2
table.plaschool3.texture = texplaschool3

table.playerpetschool1.texture = texplayerpetschool1
table.playerpetschool2.texture = texplayerpetschool2
table.playerpetschool3.texture = texplayerpetschool3

table.tarschool1.texture = textarschool1
table.tarschool2.texture = textarschool2
table.tarschool3.texture = textarschool3

table.focschool1.texture = texfocschool1
table.focschool2.texture = texfocschool2
table.focschool3.texture = texfocschool3

table.party1school1.texture = texparty1school1
table.party1school2.texture = texparty1school2
table.party1school3.texture = texparty1school3

table.partypet1school1.texture = texpartypet1school1
table.partypet1school2.texture = texpartypet1school2
table.partypet1school3.texture = texpartypet1school3

table.party2school1.texture = texparty2school1
table.party2school2.texture = texparty2school2
table.party2school3.texture = texparty2school3

table.partypet2school1.texture = texpartypet2school1
table.partypet2school2.texture = texpartypet2school2
table.partypet2school3.texture = texpartypet2school3

table.arena1school1.texture = texarena1school1
table.arena1school2.texture = texarena1school2
table.arena1school3.texture = texarena1school3

table.arenapet1school1.texture = texarenapet1school1
table.arenapet1school2.texture = texarenapet1school2
table.arenapet1school3.texture = texarenapet1school3

table.arena2school1.texture = texarena2school1
table.arena2school2.texture = texarena2school2
table.arena2school3.texture = texarena2school3

table.arenapet2school1.texture = texarenapet2school1
table.arenapet2school2.texture = texarenapet2school2
table.arenapet2school3.texture = texarenapet2school3

table.arena3school1.texture = texarena3school1
table.arena3school2.texture = texarena3school2
table.arena3school3.texture = texarena3school3

table.arenapet3school1.texture = texarenapet3school1
table.arenapet3school2.texture = texarenapet3school2
table.arenapet3school3.texture = texarenapet3school3

table.plaschool1:Hide()
table.plaschool2:Hide()
table.plaschool3:Hide()

table.playerpetschool1:Hide()
table.playerpetschool2:Hide()
table.playerpetschool3:Hide()

table.tarschool1:Hide()
table.tarschool2:Hide()
table.tarschool3:Hide()

table.focschool1:Hide()
table.focschool2:Hide()
table.focschool3:Hide()

table.party1school1:Hide()
table.party1school2:Hide()
table.party1school3:Hide()

table.partypet1school1:Hide()
table.partypet1school2:Hide()
table.partypet1school3:Hide()

table.party2school1:Hide()
table.party2school2:Hide()
table.party2school3:Hide()

table.partypet2school1:Hide()
table.partypet2school2:Hide()
table.partypet2school3:Hide()

table.arena1school1:Hide()
table.arena1school2:Hide()
table.arena1school3:Hide()

table.arenapet1school1:Hide()
table.arenapet1school2:Hide()
table.arenapet1school3:Hide()

table.arena2school1:Hide()
table.arena2school2:Hide()
table.arena2school3:Hide()

table.arenapet2school1:Hide()
table.arenapet2school2:Hide()
table.arenapet2school3:Hide()

table.arena3school1:Hide()
table.arena3school2:Hide()
table.arena3school3:Hide()

table.arenapet3school1:Hide()
table.arenapet3school2:Hide()
table.arenapet3school3:Hide()

texdummypla:Hide()
dummytextpla:Hide()

texdummyplayerpet:Hide()
dummytextplayerpet:Hide()

texdummytar:Hide()
dummytexttar:Hide()

texdummyfoc:Hide()
dummytextfoc:Hide()

for i = 1, 2 do
	_G["texdummyparty" .. i]:Hide()
	_G["texdummypartypet" .. i]:Hide()

	_G["dummytextparty" .. i]:Hide()
	_G["dummytextpartypet" .. i]:Hide()
end

for i = 1, 3 do
	_G["texdummyarena" .. i]:Hide()
	_G["texdummyarenapet" .. i]:Hide()

	_G["dummytextarena" .. i]:Hide()
	_G["dummytextarenapet" .. i]:Hide()
end

lockout:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
lockout:RegisterEvent("PLAYER_TARGET_CHANGED")
lockout:RegisterEvent("PLAYER_FOCUS_CHANGED")
lockout:RegisterEvent("ADDON_LOADED")

function lockout:OnEvent(event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, subEvent = ...
		if subEvent == "SPELL_INTERRUPT" then --       кик                  что кикнули         номер школы кика (учитывается вкладка "Общие")
			local _, _, _, _, _, unitGUID, _, _, InterruptSpellID, _, _, InterruptedSpellID, _, InterruptSchool = ...
			local duration
			local _, _, icon = GetSpellInfo(InterruptedSpellID)

			duration = lockout.getdur(InterruptSpellID, unitGUID) -- Estimate Interrupt Duration

			lockout.interrupt(InterruptSchool, unitGUID, icon, GetTime(), duration) -- Determine interrupted Spellschool, set Icon and show it

		elseif subEvent == "SPELL_CAST_START" or subEvent == "SPELL_CAST_SUCCESS" then
			local _, _, guid, name, _, _, _, _, spellId, _, school = ...
			-- Detect Restoration Shaman according to used Spells (Riptide & Earth Shield & Mana Tide Totem)
			if spellId == 61295 or spellId == 61299 or spellId == 61300 or spellId == 61301 or spellId == 974 or spellId == 32593 or spellId == 32594 or spellId == 49283 or spellId == 49284 or spellId == 16190 then
				for i = 0, 1000 do
					if rshaman[i] == name then -- Check whether Shaman has already been detected
						break
					elseif rshaman[i] == nil then -- Reached end of the List, adding Shaman
						rshaman[i] = name
						break
					end
				end
			-- Detect Holy Paladin according to used Spells (Holy Shock & Beacon of Light)
			elseif spellId == 20473 or spellId == 48825 or spellId == 48824 or spellId == 33072 or spellId == 27174 or spellId == 20930 or spellId == 20929 or spellId == 53563 then
				for i = 0, 1000 do
					if hpally[i] == name then -- Check whether Paladin has already been detected
						break
					elseif hpally[i] == nil then -- Reached end of the List, adding Paladin
						hpally[i] = name
						break
					end
				end
			end
			lockout.checkfailedinterrupts(guid, school)
		end
	elseif event == "PLAYER_TARGET_CHANGED" then
		lockout.changedtar()
	elseif event == "PLAYER_FOCUS_CHANGED" then
		lockout.changedfoc()
	elseif event == "ADDON_LOADED" then
		local name = ...
		if name == "Lockout" then

			if LockoutDB.defaults.lockout_player_anchor then
				Player_Anchor()
			end
			if LockoutDB.defaults.lockout_playerpet_anchor then
				PlayerPet_Anchor()
			end
			if LockoutDB.defaults.lockout_target_anchor then
				Target_Anchor()
			end
			if LockoutDB.defaults.lockout_focus_anchor then
				Focus_Anchor()
			end
			if LockoutDB.defaults.lockout_party1_anchor then
				Party1_Anchor()
			end
			if LockoutDB.defaults.lockout_partypet1_anchor then
				PartyPet1_Anchor()
			end
			if LockoutDB.defaults.lockout_party2_anchor then
				Party2_Anchor()
			end
			if LockoutDB.defaults.lockout_partypet2_anchor then
				PartyPet2_Anchor()
			end
			if LockoutDB.defaults.lockout_arena1_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				Arena1_Anchor()
			end
			if LockoutDB.defaults.lockout_arenapet1_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				ArenaPet1_Anchor()
			end
			if LockoutDB.defaults.lockout_arena2_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				Arena2_Anchor()
			end
			if LockoutDB.defaults.lockout_arenapet2_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				ArenaPet2_Anchor()
			end
			if LockoutDB.defaults.lockout_arena3_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				Arena3_Anchor()
			end
			if LockoutDB.defaults.lockout_arenapet3_anchor then
				if ( not IsAddOnLoaded("Blizzard_ArenaUI") ) then
					LoadAddOn("Blizzard_ArenaUI")
				end
				ArenaPet3_Anchor()
			end

			School_Frame_Level()

			lockoutpla:SetPoint(table.lockoutpla_ANCHOR_POINT, table.lockoutpla_RELATIVE_TO, table.lockoutpla_ANCHOR_POINT, LockoutDB.positions.lockout_playerxoffset, LockoutDB.positions.lockout_playeryoffset)
			lockoutplayerpet:SetPoint(table.lockoutplayerpet_ANCHOR_POINT, table.lockoutplayerpet_RELATIVE_TO, table.lockoutplayerpet_ANCHOR_POINT, LockoutDB.positions.lockout_playerpetxoffset, LockoutDB.positions.lockout_playerpetyoffset)
			lockouttar:SetPoint(table.lockouttar_ANCHOR_POINT, table.lockouttar_RELATIVE_TO, table.lockouttar_ANCHOR_POINT, LockoutDB.positions.lockout_targetxoffset, LockoutDB.positions.lockout_targetyoffset)
			lockoutfoc:SetPoint(table.lockoutfoc_ANCHOR_POINT, table.lockoutfoc_RELATIVE_TO, table.lockoutfoc_ANCHOR_POINT, LockoutDB.positions.lockout_focusxoffset, LockoutDB.positions.lockout_focusyoffset)
			lockoutparty1:SetPoint(table.lockoutparty1_ANCHOR_POINT, table.lockoutparty1_RELATIVE_TO, table.lockoutparty1_ANCHOR_POINT, LockoutDB.positions.lockout_party1xoffset, LockoutDB.positions.lockout_party1yoffset)
			lockoutpartypet1:SetPoint(table.lockoutpartypet1_ANCHOR_POINT, table.lockoutpartypet1_RELATIVE_TO, table.lockoutpartypet1_ANCHOR_POINT, LockoutDB.positions.lockout_partypet1xoffset, LockoutDB.positions.lockout_partypet1yoffset)
			lockoutparty2:SetPoint(table.lockoutparty2_ANCHOR_POINT, table.lockoutparty2_RELATIVE_TO, table.lockoutparty2_ANCHOR_POINT, LockoutDB.positions.lockout_party2xoffset, LockoutDB.positions.lockout_party2yoffset)
			lockoutpartypet2:SetPoint(table.lockoutpartypet2_ANCHOR_POINT, table.lockoutpartypet2_RELATIVE_TO, table.lockoutpartypet2_ANCHOR_POINT, LockoutDB.positions.lockout_partypet2xoffset, LockoutDB.positions.lockout_partypet2yoffset)
			lockoutarena1:SetPoint(table.lockoutarena1_ANCHOR_POINT, table.lockoutarena1_RELATIVE_TO, table.lockoutarena1_ANCHOR_POINT, LockoutDB.positions.lockout_arena1xoffset, LockoutDB.positions.lockout_arena1yoffset)
			lockoutarenapet1:SetPoint(table.lockoutarenapet1_ANCHOR_POINT, table.lockoutarenapet1_RELATIVE_TO, table.lockoutarenapet1_ANCHOR_POINT, LockoutDB.positions.lockout_arenapet1xoffset, LockoutDB.positions.lockout_arenapet1yoffset)
			lockoutarena2:SetPoint(table.lockoutarena2_ANCHOR_POINT, table.lockoutarena2_RELATIVE_TO, table.lockoutarena2_ANCHOR_POINT, LockoutDB.positions.lockout_arena2xoffset, LockoutDB.positions.lockout_arena2yoffset)
			lockoutarenapet2:SetPoint(table.lockoutarenapet2_ANCHOR_POINT, table.lockoutarenapet2_RELATIVE_TO, table.lockoutarenapet2_ANCHOR_POINT, LockoutDB.positions.lockout_arenapet2xoffset, LockoutDB.positions.lockout_arenapet2yoffset)
			lockoutarena3:SetPoint(table.lockoutarena3_ANCHOR_POINT, table.lockoutarena3_RELATIVE_TO, table.lockoutarena3_ANCHOR_POINT, LockoutDB.positions.lockout_arena3xoffset, LockoutDB.positions.lockout_arena3yoffset)
			lockoutarenapet3:SetPoint(table.lockoutarenapet3_ANCHOR_POINT, table.lockoutarenapet3_RELATIVE_TO, table.lockoutarenapet3_ANCHOR_POINT, LockoutDB.positions.lockout_arenapet3xoffset, LockoutDB.positions.lockout_arenapet3yoffset)

			Lockout_HideBorders_Check:SetChecked(LockoutDB.defaults.lockout_hideborders)
			lockout.hideborders()
			Lockout_HideCooldownText_Check:SetChecked(LockoutDB.defaults.lockout_hidecooldowntext)
			lockout.hidecooldowntext()

			Lockout_Player_Check:SetChecked(LockoutDB.defaults.lockout_showplayer)
			lockout.showplayer()
			Lockout_PlayerPet_Check:SetChecked(LockoutDB.defaults.lockout_showplayerpet)
			lockout.showplayerpet()
			Lockout_Target_Check:SetChecked(LockoutDB.defaults.lockout_showtarget)
			lockout.showtarget()
			Lockout_Focus_Check:SetChecked(LockoutDB.defaults.lockout_showfocus)
			lockout.showfocus()
			Lockout_Party1_Check:SetChecked(LockoutDB.defaults.lockout_showparty1)
			lockout.showparty1()
			Lockout_PartyPet1_Check:SetChecked(LockoutDB.defaults.lockout_showpartypet1)
			lockout.showpartypet1()
			Lockout_Party2_Check:SetChecked(LockoutDB.defaults.lockout_showparty2)
			lockout.showparty2()
			Lockout_PartyPet2_Check:SetChecked(LockoutDB.defaults.lockout_showpartypet2)
			lockout.showpartypet2()
			Lockout_Arena1_Check:SetChecked(LockoutDB.defaults.lockout_showarena1)
			lockout.showarena1()
			Lockout_ArenaPet1_Check:SetChecked(LockoutDB.defaults.lockout_showarenapet1)
			lockout.showarenapet1()
			Lockout_Arena2_Check:SetChecked(LockoutDB.defaults.lockout_showarena2)
			lockout.showarena2()
			Lockout_ArenaPet2_Check:SetChecked(LockoutDB.defaults.lockout_showarenapet2)
			lockout.showarenapet2()
			Lockout_Arena3_Check:SetChecked(LockoutDB.defaults.lockout_showarena3)
			lockout.showarena3()
			Lockout_ArenaPet3_Check:SetChecked(LockoutDB.defaults.lockout_showarenapet3)
			lockout.showarenapet3()

			Lockout_Player_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_player_anchor)
			lockout.playeranchor()
			Lockout_PlayerPet_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_playerpet_anchor)
			lockout.playerpetanchor()
			Lockout_Target_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_target_anchor)
			lockout.targetanchor()
			Lockout_Focus_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_focus_anchor)
			lockout.focusanchor()
			Lockout_Party1_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_party1_anchor)
			lockout.party1anchor()
			Lockout_PartyPet1_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_partypet1_anchor)
			lockout.partypet1anchor()
			Lockout_Party2_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_party2_anchor)
			lockout.party2anchor()
			Lockout_PartyPet2_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_partypet2_anchor)
			lockout.partypet2anchor()
			Lockout_Arena1_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arena1_anchor)
			lockout.arena1anchor()
			Lockout_ArenaPet1_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arenapet1_anchor)
			lockout.arenapet1anchor()
			Lockout_Arena2_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arena2_anchor)
			lockout.arena2anchor()
			Lockout_ArenaPet2_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arenapet2_anchor)
			lockout.arenapet2anchor()
			Lockout_Arena3_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arena3_anchor)
			lockout.arena3anchor()
			Lockout_ArenaPet3_Anchor_Check:SetChecked(LockoutDB.defaults.lockout_arenapet3_anchor)
			lockout.arenapet3anchor()

			Lockout_Player_Scale_Slider:SetValue(LockoutDB.scale.lockout_player_scale)
			lockoutpla:SetScale(LockoutDB.scale.lockout_player_scale)
			Lockout_PlayerPet_Scale_Slider:SetValue(LockoutDB.scale.lockout_playerpet_scale)
			lockoutplayerpet:SetScale(LockoutDB.scale.lockout_playerpet_scale)
			Lockout_Target_Scale_Slider:SetValue(LockoutDB.scale.lockout_target_scale)
			lockouttar:SetScale(LockoutDB.scale.lockout_target_scale)
			Lockout_Focus_Scale_Slider:SetValue(LockoutDB.scale.lockout_focus_scale)
			lockoutfoc:SetScale(LockoutDB.scale.lockout_focus_scale)
			Lockout_Party1_Scale_Slider:SetValue(LockoutDB.scale.lockout_party1_scale)
			lockoutparty1:SetScale(LockoutDB.scale.lockout_party1_scale)
			Lockout_PartyPet1_Scale_Slider:SetValue(LockoutDB.scale.lockout_partypet1_scale)
			lockoutpartypet1:SetScale(LockoutDB.scale.lockout_partypet1_scale)
			Lockout_Party2_Scale_Slider:SetValue(LockoutDB.scale.lockout_party2_scale)
			lockoutparty2:SetScale(LockoutDB.scale.lockout_party2_scale)
			Lockout_PartyPet2_Scale_Slider:SetValue(LockoutDB.scale.lockout_partypet2_scale)
			lockoutpartypet2:SetScale(LockoutDB.scale.lockout_partypet2_scale)
			Lockout_Arena1_Scale_Slider:SetValue(LockoutDB.scale.lockout_arena1_scale)
			lockoutarena1:SetScale(LockoutDB.scale.lockout_arena1_scale)
			Lockout_ArenaPet1_Scale_Slider:SetValue(LockoutDB.scale.lockout_arenapet1_scale)
			lockoutarenapet1:SetScale(LockoutDB.scale.lockout_arenapet1_scale)
			Lockout_Arena2_Scale_Slider:SetValue(LockoutDB.scale.lockout_arena2_scale)
			lockoutarena2:SetScale(LockoutDB.scale.lockout_arena2_scale)
			Lockout_ArenaPet2_Scale_Slider:SetValue(LockoutDB.scale.lockout_arenapet2_scale)
			lockoutarenapet2:SetScale(LockoutDB.scale.lockout_arenapet2_scale)
			Lockout_Arena3_Scale_Slider:SetValue(LockoutDB.scale.lockout_arena3_scale)
			lockoutarena3:SetScale(LockoutDB.scale.lockout_arena3_scale)
			Lockout_ArenaPet3_Scale_Slider:SetValue(LockoutDB.scale.lockout_arenapet3_scale)
			lockoutarenapet3:SetScale(LockoutDB.scale.lockout_arenapet3_scale)

			Lockout_CDText_Scale_Slider:SetValue(LockoutDB.scale.lockout_cdtext_scale)
			SetCooldownTextSize()
		end
	end
end
lockout:SetScript("OnEvent", lockout.OnEvent)

function lockout:OnUpdate(elapsed)

	table.lastUpdate = table.lastUpdate + elapsed

	if (table.lastUpdate > 0.01) then
		table.lastUpdate = 0
		table.counter = table.counter + 1
		if table.counter >= 1000 then
			lockout.cleanlists()
		end

		if table.plaschool1free == false then -- First School locked
			table.platemp1 = table.plaschool1time + table.plaschool1dur
			table.text = ((floor((table.platemp1 - GetTime()) * 10)) / 10)
			plaschool1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.platemp1 then -- Check Time
				table.plaschool1free = true -- If Interrupt Duration is exceeded, Hide Icon again
				table.plaschool1:Hide()
			end
		end
		if table.plaschool2free == false then
			table.platemp2 = table.plaschool2time + table.plaschool2dur
			table.text = ((floor((table.platemp2 - GetTime()) * 10)) / 10)
			plaschool2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.platemp2 then
				table.plaschool2free = true
				table.plaschool2:Hide()
			end
		end
		if table.plaschool3free == false then
			table.platemp3 = table.plaschool3time + table.plaschool3dur
			table.text = ((floor((table.platemp3 - GetTime()) * 10)) / 10)
			plaschool3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.platemp3 then
				table.plaschool3free = true
				table.plaschool3:Hide()
			end
		end
		if table.playerpetschool1free == false then
			table.playerpettemp1 = table.playerpetschool1time + table.playerpetschool1dur
			table.text = ((floor((table.playerpettemp1 - GetTime()) * 10)) / 10)
			playerpetschool1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.playerpettemp1 then
				table.playerpetschool1free = true
				table.playerpetschool1:Hide()
			end
		end
		if table.playerpetschool2free == false then
			table.playerpettemp2 = table.playerpetschool2time + table.playerpetschool2dur
			table.text = ((floor((table.playerpettemp2 - GetTime()) * 10)) / 10)
			playerpetschool2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.playerpettemp2 then
				table.playerpetschool2free = true
				table.playerpetschool2:Hide()
			end
		end
		if table.playerpetschool3free == false then
			table.playerpettemp3 = table.playerpetschool3time + table.playerpetschool3dur
			table.text = ((floor((table.playerpettemp3 - GetTime()) * 10)) / 10)
			playerpetschool3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.playerpettemp3 then
				table.playerpetschool3free = true
				table.playerpetschool3:Hide()
			end
		end
		if table.tarschool1free == false then
			table.tartemp1 = table.tarschool1time + table.tarschool1dur
			table.text = ((floor((table.tartemp1 - GetTime()) * 10)) / 10)
			tarschool1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.tartemp1 then
				table.tarschool1free = true
				table.tarschool1:Hide()
			end
		end
		if table.tarschool2free == false then
			table.tartemp2 = table.tarschool2time + table.tarschool2dur
			table.text = ((floor((table.tartemp2 - GetTime()) * 10)) / 10)
			tarschool2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.tartemp2 then
				table.tarschool2free = true
				table.tarschool2:Hide()
			end
		end
		if table.tarschool3free == false then
			table.tartemp3 = table.tarschool3time + table.tarschool3dur
			table.text = ((floor((table.tartemp3 - GetTime()) * 10)) / 10)
			tarschool3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.tartemp3 then
				table.tarschool3free = true
				table.tarschool3:Hide()
			end
		end
		if table.focschool1free == false then
			table.foctemp1 = table.focschool1time + table.focschool1dur
			table.text = ((floor((table.foctemp1 - GetTime()) * 10)) / 10)
			focschool1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.foctemp1 then
				table.focschool1free = true
				table.focschool1:Hide()
			end
		end
		if table.focschool2free == false then
			table.foctemp2 = table.focschool2time + table.focschool2dur
			table.text = ((floor((table.foctemp2 - GetTime()) * 10)) / 10)
			focschool2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.foctemp2 then
				table.focschool2free = true
				table.focschool2:Hide()
			end
		end
		if table.focschool3free == false then
			table.foctemp3 = table.focschool3time + table.focschool3dur
			table.text = ((floor((table.foctemp3 - GetTime()) * 10)) / 10)
			focschool3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.foctemp3 then
				table.focschool3free = true
				table.focschool3:Hide()
			end
		end
		if table.party1school1free == false then
			table.party1temp1 = table.party1school1time + table.party1school1dur
			table.text = ((floor((table.party1temp1 - GetTime()) * 10)) / 10)
			party1school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party1temp1 then
				table.party1school1free = true
				table.party1school1:Hide()
			end
		end
		if table.party1school2free == false then
			table.party1temp2 = table.party1school2time + table.party1school2dur
			table.text = ((floor((table.party1temp2 - GetTime()) * 10)) / 10)
			party1school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party1temp2 then
				table.party1school2free = true
				table.party1school2:Hide()
			end
		end
		if table.party1school3free == false then
			table.party1temp3 = table.party1school3time + table.party1school3dur
			table.text = ((floor((table.party1temp3 - GetTime()) * 10)) / 10)
			party1school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party1temp3 then
				table.party1school3free = true
				table.party1school3:Hide()
			end
		end
		if table.partypet1school1free == false then
			table.partypet1temp1 = table.partypet1school1time + table.partypet1school1dur
			table.text = ((floor((table.partypet1temp1 - GetTime()) * 10)) / 10)
			partypet1school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet1temp1 then
				table.partypet1school1free = true
				table.partypet1school1:Hide()
			end
		end
		if table.partypet1school2free == false then
			table.partypet1temp2 = table.partypet1school2time + table.partypet1school2dur
			table.text = ((floor((table.partypet1temp2 - GetTime()) * 10)) / 10)
			partypet1school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet1temp2 then
				table.partypet1school2free = true
				table.partypet1school2:Hide()
			end
		end
		if table.partypet1school3free == false then
			table.partypet1temp3 = table.partypet1school3time + table.partypet1school3dur
			table.text = ((floor((table.partypet1temp3 - GetTime()) * 10)) / 10)
			partypet1school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet1temp3 then
				table.partypet1school3free = true
				table.partypet1school3:Hide()
			end
		end
		if table.party2school1free == false then
			table.party2temp1 = table.party2school1time + table.party2school1dur
			table.text = ((floor((table.party2temp1 - GetTime()) * 10)) / 10)
			party2school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party2temp1 then
				table.party2school1free = true
				table.party2school1:Hide()
			end
		end
		if table.party2school2free == false then
			table.party2temp2 = table.party2school2time + table.party2school2dur
			table.text = ((floor((table.party2temp2 - GetTime()) * 10)) / 10)
			party2school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party2temp2 then
				table.party2school2free = true
				table.party2school2:Hide()
			end
		end
		if table.party2school3free == false then
			table.party2temp3 = table.party2school3time + table.party2school3dur
			table.text = ((floor((table.party2temp3 - GetTime()) * 10)) / 10)
			party2school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.party2temp3 then
				table.party2school3free = true
				table.party2school3:Hide()
			end
		end
		if table.partypet2school1free == false then
			table.partypet2temp1 = table.partypet2school1time + table.partypet2school1dur
			table.text = ((floor((table.partypet2temp1 - GetTime()) * 10)) / 10)
			partypet2school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet2temp1 then
				table.partypet2school1free = true
				table.partypet2school1:Hide()
			end
		end
		if table.partypet2school2free == false then
			table.partypet2temp2 = table.partypet2school2time + table.partypet2school2dur
			table.text = ((floor((table.partypet2temp2 - GetTime()) * 10)) / 10)
			partypet2school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet2temp2 then
				table.partypet2school2free = true
				table.partypet2school2:Hide()
			end
		end
		if table.partypet2school3free == false then
			table.partypet2temp3 = table.partypet2school3time + table.partypet2school3dur
			table.text = ((floor((table.partypet2temp3 - GetTime()) * 10)) / 10)
			partypet2school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.partypet2temp3 then
				table.partypet2school3free = true
				table.partypet2school3:Hide()
			end
		end
		if table.arena1school1free == false then
			table.arena1temp1 = table.arena1school1time + table.arena1school1dur
			table.text = ((floor((table.arena1temp1 - GetTime()) * 10)) / 10)
			arena1school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena1temp1 then
				table.arena1school1free = true
				table.arena1school1:Hide()
			end
		end
		if table.arena1school2free == false then
			table.arena1temp2 = table.arena1school2time + table.arena1school2dur
			table.text = ((floor((table.arena1temp2 - GetTime()) * 10)) / 10)
			arena1school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena1temp2 then
				table.arena1school2free = true
				table.arena1school2:Hide()
			end
		end
		if table.arena1school3free == false then
			table.arena1temp3 = table.arena1school3time + table.arena1school3dur
			table.text = ((floor((table.arena1temp3 - GetTime()) * 10)) / 10)
			arena1school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena1temp3 then
				table.arena1school3free = true
				table.arena1school3:Hide()
			end
		end
		if table.arenapet1school1free == false then
			table.arenapet1temp1 = table.arenapet1school1time + table.arenapet1school1dur
			table.text = ((floor((table.arenapet1temp1 - GetTime()) * 10)) / 10)
			arenapet1school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet1temp1 then
				table.arenapet1school1free = true
				table.arenapet1school1:Hide()
			end
		end
		if table.arenapet1school2free == false then
			table.arenapet1temp2 = table.arenapet1school2time + table.arenapet1school2dur
			table.text = ((floor((table.arenapet1temp2 - GetTime()) * 10)) / 10)
			arenapet1school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet1temp2 then
				table.arenapet1school2free = true
				table.arenapet1school2:Hide()
			end
		end
		if table.arenapet1school3free == false then
			table.arenapet1temp3 = table.arenapet1school3time + table.arenapet1school3dur
			table.text = ((floor((table.arenapet1temp3 - GetTime()) * 10)) / 10)
			arenapet1school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet1temp3 then
				table.arenapet1school3free = true
				table.arenapet1school3:Hide()
			end
		end
		if table.arena2school1free == false then
			table.arena2temp1 = table.arena2school1time + table.arena2school1dur
			table.text = ((floor((table.arena2temp1 - GetTime()) * 10)) / 10)
			arena2school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena2temp1 then
				table.arena2school1free = true
				table.arena2school1:Hide()
			end
		end
		if table.arena2school2free == false then
			table.arena2temp2 = table.arena2school2time + table.arena2school2dur
			table.text = ((floor((table.arena2temp2 - GetTime()) * 10)) / 10)
			arena2school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena2temp2 then
				table.arena2school2free = true
				table.arena2school2:Hide()
			end
		end
		if table.arena2school3free == false then
			table.arena2temp3 = table.arena2school3time + table.arena2school3dur
			table.text = ((floor((table.arena2temp3 - GetTime()) * 10)) / 10)
			arena2school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena2temp3 then
				table.arena2school3free = true
				table.arena2school3:Hide()
			end
		end
		if table.arenapet2school1free == false then
			table.arenapet2temp1 = table.arenapet2school1time + table.arenapet2school1dur
			table.text = ((floor((table.arenapet2temp1 - GetTime()) * 10)) / 10)
			arenapet2school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet2temp1 then
				table.arenapet2school1free = true
				table.arenapet2school1:Hide()
			end
		end
		if table.arenapet2school2free == false then
			table.arenapet2temp2 = table.arenapet2school2time + table.arenapet2school2dur
			table.text = ((floor((table.arenapet2temp2 - GetTime()) * 10)) / 10)
			arenapet2school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet2temp2 then
				table.arenapet2school2free = true
				table.arenapet2school2:Hide()
			end
		end
		if table.arenapet2school3free == false then
			table.arenapet2temp3 = table.arenapet2school3time + table.arenapet2school3dur
			table.text = ((floor((table.arenapet2temp3 - GetTime()) * 10)) / 10)
			arenapet2school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet2temp3 then
				table.arenapet2school3free = true
				table.arenapet2school3:Hide()
			end
		end
		if table.arena3school1free == false then
			table.arena3temp1 = table.arena3school1time + table.arena3school1dur
			table.text = ((floor((table.arena3temp1 - GetTime()) * 10)) / 10)
			arena3school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena3temp1 then
				table.arena3school1free = true
				table.arena3school1:Hide()
			end
		end
		if table.arena3school2free == false then
			table.arena3temp2 = table.arena3school2time + table.arena3school2dur
			table.text = ((floor((table.arena3temp2 - GetTime()) * 10)) / 10)
			arena3school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena3temp2 then
				table.arena3school2free = true
				table.arena3school2:Hide()
			end
		end
		if table.arena3school3free == false then
			table.arena3temp3 = table.arena3school3time + table.arena3school3dur
			table.text = ((floor((table.arena3temp3 - GetTime()) * 10)) / 10)
			arena3school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arena3temp3 then
				table.arena3school3free = true
				table.arena3school3:Hide()
			end
		end
		if table.arenapet3school1free == false then
			table.arenapet3temp1 = table.arenapet3school1time + table.arenapet3school1dur
			table.text = ((floor((table.arenapet3temp1 - GetTime()) * 10)) / 10)
			arenapet3school1text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet3temp1 then
				table.arenapet3school1free = true
				table.arenapet3school1:Hide()
			end
		end
		if table.arenapet3school2free == false then
			table.arenapet3temp2 = table.arenapet3school2time + table.arenapet3school2dur
			table.text = ((floor((table.arenapet3temp2 - GetTime()) * 10)) / 10)
			arenapet3school2text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet3temp2 then
				table.arenapet3school2free = true
				table.arenapet3school2:Hide()
			end
		end
		if table.arenapet3school3free == false then
			table.arenapet3temp3 = table.arenapet3school3time + table.arenapet3school3dur
			table.text = ((floor((table.arenapet3temp3 - GetTime()) * 10)) / 10)
			arenapet3school3text:SetText(lockout.formattext(table.text))
			if GetTime() >= table.arenapet3temp3 then
				table.arenapet3school3free = true
				table.arenapet3school3:Hide()
			end
		end
	end
end
lockout:SetScript("OnUpdate", lockout.OnUpdate)

function lockout.formattext(text)
	if text %2 == 0 or text %2 == 1 then -- text is integer
		text = (tostring(text) .. ".0")
	end
	return tostring(text)
end

function lockout.cleanlists()
	for i = 0, 1000 do
		if cleartimelist[i] and GetTime() > cleartimelist[i] then
			time1list[i] = nil
			time2list[i] = nil
			time3list[i] = nil
			dur1list[i] = nil
			dur2list[i] = nil
			dur3list[i] = nil
			icon1list[i] = nil
			icon2list[i] = nil
			icon3list[i] = nil
			school1list[i] = nil
			school2list[i] = nil
			school3list[i] = nil
			guidlist[i] = nil
			cleartimelist[i] = nil
		end
	end
end

function lockout.interrupt(school, unitGUID, icon, t, d)
lockout.insertinlists(t, d, icon, school, unitGUID)
    if UnitGUID("player") == unitGUID and LockoutDB.defaults.lockout_showplayer == true then
	    table.placaster = unitGUID

	    if table.plaschool1free == true then
			if table.Player_CircleTexture then
				SetPortraitToTexture(texplaschool1, icon)
			else
				texplaschool1:SetTexture(icon)
			end
		    table.pla1icon = icon
		    table.plaschool1time = t -- pass over time of interrupt
		    table.plaschool1dur = d -- pass over duration of interrupt
		    table.plaschool1:Show()
		    table.pla1school = school
		    table.plaschool1free = false
	    elseif table.plaschool2free == true then
			if table.Player_CircleTexture then
				SetPortraitToTexture(texplaschool2, icon)
			else
				texplaschool2:SetTexture(icon)
			end
		    table.plaschool2time = t
		    table.plaschool2dur = d
		    table.plaschool2:Show()
		    table.pla2school = school
		    table.plaschool2free = false
	    elseif table.plaschool3free == true then
			if table.Player_CircleTexture then
				SetPortraitToTexture(texplaschool3, icon)
			else
				texplaschool3:SetTexture(icon)
			end
		    table.plaschool3time = t
		    table.plaschool3dur = d
		    table.plaschool3:Show()
		    table.pla3school = school
		    table.plaschool3free = false
	    end
    end
	if UnitGUID("pet") == unitGUID and LockoutDB.defaults.lockout_showplayerpet == true then
	    table.playerpetcaster = unitGUID
	    if table.playerpetschool1free == true then
			if table.PlayerPet_CircleTexture then
				SetPortraitToTexture(texplayerpetschool1, icon)
			else
				texplayerpetschool1:SetTexture(icon)
			end
		    table.playerpet1icon = icon
		    table.playerpetschool1time = t
		    table.playerpetschool1dur = d
		    table.playerpetschool1:Show()
		    table.playerpet1school = school
		    table.playerpetschool1free = false
	    elseif table.playerpetschool2free == true then
			if table.PlayerPet_CircleTexture then
				SetPortraitToTexture(texplayerpetschool2, icon)
			else
				texplayerpetschool2:SetTexture(icon)
			end
		    table.playerpetschool2time = t
		    table.playerpetschool2dur = d
		    table.playerpetschool2:Show()
		    table.playerpet2school = school
		    table.playerpetschool2free = false
	    elseif table.playerpetschool3free == true then
			if table.PlayerPet_CircleTexture then
				SetPortraitToTexture(texplayerpetschool3, icon)
			else
				texplayerpetschool3:SetTexture(icon)
			end
		    table.playerpetschool3time = t
		    table.playerpetschool3dur = d
		    table.playerpetschool3:Show()
		    table.playerpet3school = school
		    table.playerpetschool3free = false
	    end
    end
    if UnitGUID("target") == unitGUID and LockoutDB.defaults.lockout_showtarget == true then
		table.tarcaster = unitGUID
		if table.tarschool1free == true then
			if table.Target_CircleTexture then
				SetPortraitToTexture(textarschool1, icon)
			else
				textarschool1:SetTexture(icon)
			end
			table.tar1icon = icon
			table.tarschool1time = t
			table.tarschool1dur = d
			table.tarschool1:Show()
			table.tar1school = school
			table.tarschool1free = false
		elseif table.tarschool2free == true then
			if table.Target_CircleTexture then
				SetPortraitToTexture(textarschool2, icon)
			else
				textarschool2:SetTexture(icon)
			end
			table.tarschool2time = t
			table.tarschool2dur = d
			table.tarschool2:Show()
			table.tar2school = school
			table.tarschool2free = false
		elseif table.tarschool3free == true then
			if table.Target_CircleTexture then
				SetPortraitToTexture(textarschool3, icon)
			else
				textarschool3:SetTexture(icon)
			end
			table.tarschool3time = t
			table.tarschool3dur = d
			table.tarschool3:Show()
			table.tar3school = school
			table.tarschool3free = false
		end
	end
	if UnitGUID("focus") == unitGUID and LockoutDB.defaults.lockout_showfocus == true then
		table.foccaster = unitGUID
		if table.focschool1free == true then
			if table.Focus_CircleTexture then
				SetPortraitToTexture(texfocschool1, icon)
			else
				texfocschool1:SetTexture(icon)
			end
			table.foc1icon = icon
			table.focschool1time = t
			table.focschool1dur = d
			table.focschool1:Show()
			table.foc1school = school
			table.focschool1free = false
		elseif table.focschool2free == true then
			if table.Focus_CircleTexture then
				SetPortraitToTexture(texfocschool2, icon)
			else
				texfocschool2:SetTexture(icon)
			end
			table.focschool2time = t
			table.focschool2dur = d
			table.focschool2:Show()
			table.foc2school = school
			table.focschool2free = false
		elseif table.focschool3free == true then
			if table.Focus_CircleTexture then
				SetPortraitToTexture(texfocschool3, icon)
			else
				texfocschool3:SetTexture(icon)
			end
			table.focschool3time = t
			table.focschool3dur = d
			table.focschool3:Show()
			table.foc3school = school
			table.focschool3free = false
		end
	end
	if UnitGUID("party1") == unitGUID and LockoutDB.defaults.lockout_showparty1 == true then
		table.party1caster = unitGUID
		if table.party1school1free == true then
			if table.Party1_CircleTexture then
				SetPortraitToTexture(texparty1school1, icon)
			else
				texparty1school1:SetTexture(icon)
			end
			table.party11icon = icon
			table.party1school1time = t
			table.party1school1dur = d
			table.party1school1:Show()
			table.party11school = school
			table.party1school1free = false
		elseif table.party1school2free == true then
			if table.Party1_CircleTexture then
				SetPortraitToTexture(texparty1school2, icon)
			else
				texparty1school2:SetTexture(icon)
			end
			table.party1school2time = t
			table.party1school2dur = d
			table.party1school2:Show()
			table.party12school = school
			table.party1school2free = false
		elseif table.party1school3free == true then
			if table.Party1_CircleTexture then
				SetPortraitToTexture(texparty1school3, icon)
			else
				texparty1school3:SetTexture(icon)
			end
			table.party1school3time = t
			table.party1school3dur = d
			table.party1school3:Show()
			table.party13school = school
			table.party1school3free = false
		end
	end
	if UnitGUID("partypet1") == unitGUID and LockoutDB.defaults.lockout_showpartypet1 == true then
		table.partypet1caster = unitGUID
		if table.partypet1school1free == true then
			if table.PartyPet1_CircleTexture then
				SetPortraitToTexture(texpartypet1school1, icon)
			else
				texpartypet1school1:SetTexture(icon)
			end
			table.partypet11icon = icon
			table.partypet1school1time = t
			table.partypet1school1dur = d
			table.partypet1school1:Show()
			table.partypet11school = school
			table.partypet1school1free = false
		elseif table.partypet1school2free == true then
			if table.PartyPet1_CircleTexture then
				SetPortraitToTexture(texpartypet1school2, icon)
			else
				texpartypet1school2:SetTexture(icon)
			end
			table.partypet1school2time = t
			table.partypet1school2dur = d
			table.partypet1school2:Show()
			table.partypet12school = school
			table.partypet1school2free = false
		elseif table.partypet1school3free == true then
			if table.PartyPet1_CircleTexture then
				SetPortraitToTexture(texpartypet1school3, icon)
			else
				texpartypet1school3:SetTexture(icon)
			end
			table.partypet1school3time = t
			table.partypet1school3dur = d
			table.partypet1school3:Show()
			table.partypet13school = school
			table.partypet1school3free = false
		end
	end
	if UnitGUID("party2") == unitGUID and LockoutDB.defaults.lockout_showparty2 == true then
		table.party2caster = unitGUID
		if table.party2school1free == true then
			if table.Party2_CircleTexture then
				SetPortraitToTexture(texparty2school1, icon)
			else
				texparty2school1:SetTexture(icon)
			end
			table.party21icon = icon
			table.party2school1time = t
			table.party2school1dur = d
			table.party2school1:Show()
			table.party21school = school
			table.party2school1free = false
		elseif table.party2school2free == true then
			if table.Party2_CircleTexture then
				SetPortraitToTexture(texparty2school2, icon)
			else
				texparty2school2:SetTexture(icon)
			end
			table.party2school2time = t
			table.party2school2dur = d
			table.party2school2:Show()
			table.party22school = school
			table.party2school2free = false
		elseif table.party2school3free == true then
			if table.Party2_CircleTexture then
				SetPortraitToTexture(texparty2school3, icon)
			else
				texparty2school3:SetTexture(icon)
			end
			table.party2school3time = t
			table.party2school3dur = d
			table.party2school3:Show()
			table.party23school = school
			table.party2school3free = false
		end
	end
	if UnitGUID("partypet2") == unitGUID and LockoutDB.defaults.lockout_showpartypet2 == true then
		table.partypet2caster = unitGUID
		if table.partypet2school1free == true then
			if table.PartyPet2_CircleTexture then
				SetPortraitToTexture(texpartypet2school1, icon)
			else
				texpartypet2school1:SetTexture(icon)
			end
			table.partypet21icon = icon
			table.partypet2school1time = t
			table.partypet2school1dur = d
			table.partypet2school1:Show()
			table.partypet21school = school
			table.partypet2school1free = false
		elseif table.partypet2school2free == true then
			if table.PartyPet2_CircleTexture then
				SetPortraitToTexture(texpartypet2school2, icon)
			else
				texpartypet2school2:SetTexture(icon)
			end
			table.partypet2school2time = t
			table.partypet2school2dur = d
			table.partypet2school2:Show()
			table.partypet22school = school
			table.partypet2school2free = false
		elseif table.partypet2school3free == true then
			if table.PartyPet2_CircleTexture then
				SetPortraitToTexture(texpartypet2school3, icon)
			else
				texpartypet2school3:SetTexture(icon)
			end
			table.partypet2school3time = t
			table.partypet2school3dur = d
			table.partypet2school3:Show()
			table.partypet23school = school
			table.partypet2school3free = false
		end
	end
	if UnitGUID("arena1") == unitGUID and LockoutDB.defaults.lockout_showarena1 == true then
		table.arena1caster = unitGUID
		if table.arena1school1free == true then
			if table.Arena1_CircleTexture then
				SetPortraitToTexture(texarena1school1, icon)
			else
				texarena1school1:SetTexture(icon)
			end
			table.arena11icon = icon
			table.arena1school1time = t
			table.arena1school1dur = d
			table.arena1school1:Show()
			table.arena11school = school
			table.arena1school1free = false
		elseif table.arena1school2free == true then
			if table.Arena1_CircleTexture then
				SetPortraitToTexture(texarena1school2, icon)
			else
				texarena1school2:SetTexture(icon)
			end
			table.arena1school2time = t
			table.arena1school2dur = d
			table.arena1school2:Show()
			table.arena12school = school
			table.arena1school2free = false
		elseif table.arena1school3free == true then
			if table.Arena1_CircleTexture then
				SetPortraitToTexture(texarena1school3, icon)
			else
				texarena1school3:SetTexture(icon)
			end
			table.arena1school3time = t
			table.arena1school3dur = d
			table.arena1school3:Show()
			table.arena13school = school
			table.arena1school3free = false
		end
	end
	if UnitGUID("arenapet1") == unitGUID and LockoutDB.defaults.lockout_showarenapet1 == true then
		table.arenapet1caster = unitGUID
		if table.arenapet1school1free == true then
			if table.ArenaPet1_CircleTexture then
				SetPortraitToTexture(texarenapet1school1, icon)
			else
				texarenapet1school1:SetTexture(icon)
			end
			table.arenapet11icon = icon
			table.arenapet1school1time = t
			table.arenapet1school1dur = d
			table.arenapet1school1:Show()
			table.arenapet11school = school
			table.arenapet1school1free = false
		elseif table.arenapet1school2free == true then
			if table.ArenaPet1_CircleTexture then
				SetPortraitToTexture(texarenapet1school2, icon)
			else
				texarenapet1school2:SetTexture(icon)
			end
			table.arenapet1school2time = t
			table.arenapet1school2dur = d
			table.arenapet1school2:Show()
			table.arenapet12school = school
			table.arenapet1school2free = false
		elseif table.arenapet1school3free == true then
			if table.ArenaPet1_CircleTexture then
				SetPortraitToTexture(texarenapet1school3, icon)
			else
				texarenapet1school3:SetTexture(icon)
			end
			table.arenapet1school3time = t
			table.arenapet1school3dur = d
			table.arenapet1school3:Show()
			table.arenapet13school = school
			table.arenapet1school3free = false
		end
	end
	if UnitGUID("arena2") == unitGUID and LockoutDB.defaults.lockout_showarena2 == true then
		table.arena2caster = unitGUID
		if table.arena2school1free == true then
			if table.Arena2_CircleTexture then
				SetPortraitToTexture(texarena2school1, icon)
			else
				texarena2school1:SetTexture(icon)
			end
			table.arena21icon = icon
			table.arena2school1time = t
			table.arena2school1dur = d
			table.arena2school1:Show()
			table.arena21school = school
			table.arena2school1free = false
		elseif table.arena2school2free == true then
			if table.Arena2_CircleTexture then
				SetPortraitToTexture(texarena2school2, icon)
			else
				texarena2school2:SetTexture(icon)
			end
			table.arena2school2time = t
			table.arena2school2dur = d
			table.arena2school2:Show()
			table.arena22school = school
			table.arena2school2free = false
		elseif table.arena2school3free == true then
			if table.Arena2_CircleTexture then
				SetPortraitToTexture(texarena2school3, icon)
			else
				texarena2school3:SetTexture(icon)
			end
			table.arena2school3time = t
			table.arena2school3dur = d
			table.arena2school3:Show()
			table.arena23school = school
			table.arena2school3free = false
		end
	end
	if UnitGUID("arenapet2") == unitGUID and LockoutDB.defaults.lockout_showarenapet2 == true then
		table.arenapet2caster = unitGUID
		if table.arenapet2school1free == true then
			if table.ArenaPet2_CircleTexture then
				SetPortraitToTexture(texarenapet2school1, icon)
			else
				texarenapet2school1:SetTexture(icon)
			end
			table.arenapet21icon = icon
			table.arenapet2school1time = t
			table.arenapet2school1dur = d
			table.arenapet2school1:Show()
			table.arenapet21school = school
			table.arenapet2school1free = false
		elseif table.arenapet2school2free == true then
			if table.ArenaPet2_CircleTexture then
				SetPortraitToTexture(texarenapet2school2, icon)
			else
				texarenapet2school2:SetTexture(icon)
			end
			table.arenapet2school2time = t
			table.arenapet2school2dur = d
			table.arenapet2school2:Show()
			table.arenapet22school = school
			table.arenapet2school2free = false
		elseif table.arenapet2school3free == true then
			if table.ArenaPet2_CircleTexture then
				SetPortraitToTexture(texarenapet2school3, icon)
			else
				texarenapet2school3:SetTexture(icon)
			end
			table.arenapet2school3time = t
			table.arenapet2school3dur = d
			table.arenapet2school3:Show()
			table.arenapet23school = school
			table.arenapet2school3free = false
		end
	end
	if UnitGUID("arena3") == unitGUID and LockoutDB.defaults.lockout_showarena3 == true then
		table.arena3caster = unitGUID
		if table.arena3school1free == true then
			if table.Arena3_CircleTexture then
				SetPortraitToTexture(texarena3school1, icon)
			else
				texarena3school1:SetTexture(icon)
			end
			table.arena31icon = icon
			table.arena3school1time = t
			table.arena3school1dur = d
			table.arena3school1:Show()
			table.arena31school = school
			table.arena3school1free = false
		elseif table.arena3school2free == true then
			if table.Arena3_CircleTexture then
				SetPortraitToTexture(texarena3school2, icon)
			else
				texarena3school2:SetTexture(icon)
			end
			table.arena3school2time = t
			table.arena3school2dur = d
			table.arena3school2:Show()
			table.arena32school = school
			table.arena3school2free = false
		elseif table.arena3school3free == true then
			if table.Arena3_CircleTexture then
				SetPortraitToTexture(texarena3school3, icon)
			else
				texarena3school3:SetTexture(icon)
			end
			table.arena3school3time = t
			table.arena3school3dur = d
			table.arena3school3:Show()
			table.arena33school = school
			table.arena3school3free = false
		end
	end
	if UnitGUID("arenapet3") == unitGUID and LockoutDB.defaults.lockout_showarenapet3 == true then
		table.arenapet3caster = unitGUID
		if table.arenapet3school1free == true then
			if table.ArenaPet3_CircleTexture then
				SetPortraitToTexture(texarenapet3school1, icon)
			else
				texarenapet3school1:SetTexture(icon)
			end
			table.arenapet31icon = icon
			table.arenapet3school1time = t
			table.arenapet3school1dur = d
			table.arenapet3school1:Show()
			table.arenapet31school = school
			table.arenapet3school1free = false
		elseif table.arenapet3school2free == true then
			if table.ArenaPet3_CircleTexture then
				SetPortraitToTexture(texarenapet3school2, icon)
			else
				texarenapet3school2:SetTexture(icon)
			end
			table.arenapet3school2time = t
			table.arenapet3school2dur = d
			table.arenapet3school2:Show()
			table.arenapet32school = school
			table.arenapet3school2free = false
		elseif table.arenapet3school3free == true then
			if table.ArenaPet3_CircleTexture then
				SetPortraitToTexture(texarenapet3school3, icon)
			else
				texarenapet3school3:SetTexture(icon)
			end
			table.arenapet3school3time = t
			table.arenapet3school3dur = d
			table.arenapet3school3:Show()
			table.arenapet33school = school
			table.arenapet3school3free = false
		end
	end
end

function lockout.insertinlists(t, duration, icon, school, guid)
	local j = -1
	local lon

	for i = 0, 1000 do
		if guidlist[i] == guid then -- Checker whether the interrupted target already is in the List
			j = i
			break
		end
	end
	if j == -1 then -- interrupted target is not in the list yet.
		for i = 0, 1000 do
			if guidlist[i] == nil then -- Find the first free listlost
				j = i
				break
			end
		end
	end

	guidlist[j] = guid

	if time1list[j] == nil then
		time1list[j] = t
		dur1list[j] = duration
		icon1list[j] = icon
		school1list[j] = school
	elseif time2list[j] == nil then
		time2list[j] = t
		dur2list[j] = duration
		icon2list[j] = icon
		school2list[j] = school
	elseif time3list[j] == nil then
		time3list[j] = t
		dur3list[j] = duration
		icon3list[j] = icon
		school3list[j] = school
	end

	lon = t + duration

	if cleartimelist[j] and cleartimelist[j] < lon then
		cleartimelist[j] = lon
	elseif cleartimelist[j] == nil then
		cleartimelist[j] = lon
	end
end

function lockout.getdur(id, guid)
	local basedur
	if id == 72 then        -- Shield Bash
		basedur = 6
	elseif id == 1766 then  -- Kick
		basedur = 5
	elseif id == 2139 then  -- Counterspell
		basedur = 8
	elseif id == 6552 then  -- Pummel
		basedur = 4
	elseif id == 16979 then -- Feral Charge - Bear
		basedur = 4
	elseif id == 19244 then -- Spell Lock Rank1
		basedur = 5
	elseif id == 19647 then -- Spell Lock Rank2
		basedur = 6
	elseif id == 26090 then -- Pummel (Pet)
		basedur = 2
	elseif id == 47528 then -- Mind Freeze
		basedur = 4
	elseif id == 57994 then -- Wind Shear
		basedur = 2
	else
		basedur = 3
		if not id == 15487 and not id == 10308 and not id == 5589 and not id == 5588 and not id == 853 and not id == 34490 and not id == 25046 and not id == 28730 and not id == 50613 then
			print("[Lockout] Unknown Interrupt: " .. GetSpellInfo(id))
		end
	end

	local plaguid = UnitGUID("player")
	local playerpetguid = UnitGUID("pet")
	local targuid = UnitGUID("target")
	local focguid = UnitGUID("focus")
	local party1guid = UnitGUID("party1")
	local partypet1guid = UnitGUID("partypet1")
	local party2guid = UnitGUID("party2")
	local partypet2guid = UnitGUID("partypet2")
	local arena1guid = UnitGUID("arena1")
	local arenapet1guid = UnitGUID("arenapet1")
	local arena2guid = UnitGUID("arena2")
	local arenapet2guid = UnitGUID("arenapet2")
	local arena3guid = UnitGUID("arena3")
	local arenapet3guid = UnitGUID("arenapet3")

	local enable = true

	if enable and guid == plaguid then
		enable = false
		basedur = basedur * lockout.getdurmod("player") -- Determine possible Duration-Reduces
	end

	if enable and guid == playerpetguid then
		enable = false
		basedur = basedur * lockout.getdurmod("pet")
	end

	if enable and guid == targuid then
		enable = false
		basedur = basedur * lockout.getdurmod("target")
	end

	if enable and guid == focguid then
		enable = false
		basedur = basedur * lockout.getdurmod("focus")
	end

	if enable and guid == party1guid then
		enable = false
		basedur = basedur * lockout.getdurmod("party1")
	end

	if enable and guid == partypet1guid then
		enable = false
		basedur = basedur * lockout.getdurmod("partypet1")
	end

	if enable and guid == party2guid then
		enable = false
		basedur = basedur * lockout.getdurmod("party2")
	end

	if enable and guid == partypet2guid then
		enable = false
		basedur = basedur * lockout.getdurmod("partypet2")
	end

	if enable and guid == arena1guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arena1")
	end

	if enable and guid == arenapet1guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arenapet1")
	end

	if enable and guid == arena2guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arena2")
	end

	if enable and guid == arenapet2guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arenapet2")
	end

	if enable and guid == arena3guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arena3")
	end

	if enable and guid == arenapet3guid then
		enable = false
		basedur = basedur * lockout.getdurmod("arenapet3")
	end

	return basedur -- Interrupt Duration Estimated as well as possible depending on Buffs, Talents and Interrupt Ability
end

function lockout.changedpla()

	table.plaschool1free = true
	table.plaschool2free = true
	table.plaschool3free = true
	table.plaschool1:Hide()
	table.plaschool2:Hide()
	table.plaschool3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("player") and LockoutDB.defaults.lockout_showplayer == true then --search current target in List
			table.plaschool1time = time1list[i]
			table.plaschool2time = time2list[i]
			table.plaschool3time = time3list[i]
			table.plaschool1dur = dur1list[i]
			table.plaschool2dur = dur2list[i]
			table.plaschool3dur = dur3list[i]
			table.pla1icon = icon1list[i]
			table.pla2icon = icon2list[i]
			table.pla3icon = icon3list[i]
			table.pla1school = school1list[i]
			table.pla2school = school2list[i]
			table.pla3school = school3list[i]
			table.placaster = guidlist[i]
			if table.plaschool1time then
				if table.Player_CircleTexture then
					SetPortraitToTexture(texplaschool1, table.pla1icon)
				else
					texplaschool1:SetTexture(table.pla1icon)
				end
				table.plaschool1:Show()
				table.plaschool1free = false
			end
			if table.plaschool2time then
				if table.Player_CircleTexture then
					SetPortraitToTexture(texplaschool2, table.pla2icon)
				else
					texplaschool2:SetTexture(table.pla2icon)
				end
				table.plaschool2:Show()
				table.plaschool2free = false
			end
			if table.plaschool3time then
				if table.Player_CircleTexture then
					SetPortraitToTexture(texplaschool3, table.pla3icon)
				else
					texplaschool3:SetTexture(table.pla3icon)
				end
				table.plaschool3:Show()
				table.plaschool3free = false
			end
			break
		end
	end
end

function lockout.changedplayerpet()

	table.playerpetschool1free = true
	table.playerpetschool2free = true
	table.playerpetschool3free = true
	table.playerpetschool1:Hide()
	table.playerpetschool2:Hide()
	table.playerpetschool3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("pet") and LockoutDB.defaults.lockout_showplayerpet == true then
			table.playerpetschool1time = time1list[i]
			table.playerpetschool2time = time2list[i]
			table.playerpetschool3time = time3list[i]
			table.playerpetschool1dur = dur1list[i]
			table.playerpetschool2dur = dur2list[i]
			table.playerpetschool3dur = dur3list[i]
			table.playerpet1icon = icon1list[i]
			table.playerpet2icon = icon2list[i]
			table.playerpet3icon = icon3list[i]
			table.playerpet1school = school1list[i]
			table.playerpet2school = school2list[i]
			table.playerpet3school = school3list[i]
			table.playerpetcaster = guidlist[i]
			if table.playerpetschool1time then
				if table.PlayerPet_CircleTexture then
					SetPortraitToTexture(texplayerpetschool1, table.playerpet1icon)
				else
					texplayerpetschool1:SetTexture(table.playerpet1icon)
				end
				table.playerpetschool1:Show()
				table.playerpetschool1free = false
			end
			if table.playerpetschool2time then
				if table.PlayerPet_CircleTexture then
					SetPortraitToTexture(texplayerpetschool2, table.playerpet2icon)
				else
					texplayerpetschool2:SetTexture(table.playerpet2icon)
				end
				table.playerpetschool2:Show()
				table.playerpetschool2free = false
			end
			if table.playerpetschool3time then
				if table.PlayerPet_CircleTexture then
					SetPortraitToTexture(texplayerpetschool3, table.playerpet3icon)
				else
					texplayerpetschool3:SetTexture(table.playerpet3icon)
				end
				table.playerpetschool3:Show()
				table.playerpetschool3free = false
			end
			break
		end
	end
end

function lockout.changedtar()
	table.tarschool1free = true
	table.tarschool2free = true
	table.tarschool3free = true
	table.tarschool1:Hide()
	table.tarschool2:Hide()
	table.tarschool3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("target") and LockoutDB.defaults.lockout_showtarget == true then
			table.tarschool1time = time1list[i]
			table.tarschool2time = time2list[i]
			table.tarschool3time = time3list[i]
			table.tarschool1dur = dur1list[i]
			table.tarschool2dur = dur2list[i]
			table.tarschool3dur = dur3list[i]
			table.tar1icon = icon1list[i]
			table.tar2icon = icon2list[i]
			table.tar3icon = icon3list[i]
			table.tar1school = school1list[i]
			table.tar2school = school2list[i]
			table.tar3school = school3list[i]
			table.tarcaster = guidlist[i]
			if table.tarschool1time then
				if table.Target_CircleTexture then
					SetPortraitToTexture(textarschool1, table.tar1icon)
				else
					textarschool1:SetTexture(table.tar1icon)
				end
				table.tarschool1:Show()
				table.tarschool1free = false
			end
			if table.tarschool2time then
				if table.Target_CircleTexture then
					SetPortraitToTexture(textarschool2, table.tar2icon)
				else
					textarschool2:SetTexture(table.tar2icon)
				end
				table.tarschool2:Show()
				table.tarschool2free = false
			end
			if table.tarschool3time then
				if table.Target_CircleTexture then
					SetPortraitToTexture(textarschool3, table.tar3icon)
				else
					textarschool3:SetTexture(table.tar3icon)
				end
				table.tarschool3:Show()
				table.tarschool3free = false
			end
			break
		end
	end
end

function lockout.changedfoc()

	table.focschool1free = true
	table.focschool2free = true
	table.focschool3free = true
	table.focschool1:Hide()
	table.focschool2:Hide()
	table.focschool3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("focus") and LockoutDB.defaults.lockout_showfocus == true then
			table.focschool1time = time1list[i]
			table.focschool2time = time2list[i]
			table.focschool3time = time3list[i]
			table.focschool1dur = dur1list[i]
			table.focschool2dur = dur2list[i]
			table.focschool3dur = dur3list[i]
			table.foc1icon = icon1list[i]
			table.foc2icon = icon2list[i]
			table.foc3icon = icon3list[i]
			table.foc1school = school1list[i]
			table.foc2school = school2list[i]
			table.foc3school = school3list[i]
			table.foccaster = guidlist[i]
			if table.focschool1time then
				if table.Focus_CircleTexture then
					SetPortraitToTexture(texfocschool1, table.foc1icon)
				else
					texfocschool1:SetTexture(table.foc1icon)
				end
				table.focschool1:Show()
				table.focschool1free = false
			end
			if table.focschool2time then
				if table.Focus_CircleTexture then
					SetPortraitToTexture(texfocschool2, table.foc2icon)
				else
					texfocschool2:SetTexture(table.foc2icon)
				end
				table.focschool2:Show()
				table.focschool2free = false
			end
			if table.focschool3time then
				if table.Focus_CircleTexture then
					SetPortraitToTexture(texfocschool3, table.foc3icon)
				else
					texfocschool3:SetTexture(table.foc3icon)
				end
				table.focschool3:Show()
				table.focschool3free = false
			end
			break
		end
	end
end

function lockout.changedparty1()

	table.party1school1free = true
	table.party1school2free = true
	table.party1school3free = true
	table.party1school1:Hide()
	table.party1school2:Hide()
	table.party1school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("party1") and LockoutDB.defaults.lockout_showparty1 == true then
			table.party1school1time = time1list[i]
			table.party1school2time = time2list[i]
			table.party1school3time = time3list[i]
			table.party1school1dur = dur1list[i]
			table.party1school2dur = dur2list[i]
			table.party1school3dur = dur3list[i]
			table.party11icon = icon1list[i]
			table.party12icon = icon2list[i]
			table.party13icon = icon3list[i]
			table.party11school = school1list[i]
			table.party12school = school2list[i]
			table.party13school = school3list[i]
			table.party1caster = guidlist[i]
			if table.party1school1time then
				if table.Party1_CircleTexture then
					SetPortraitToTexture(texparty1school1, table.party11icon)
				else
					texparty1school1:SetTexture(table.party11icon)
				end
				table.party1school1:Show()
				table.party1school1free = false
			end
			if table.party1school2time then
				if table.Party1_CircleTexture then
					SetPortraitToTexture(texparty1school2, table.party12icon)
				else
					texparty1school2:SetTexture(table.party12icon)
				end
				table.party1school2:Show()
				table.party1school2free = false
			end
			if table.party1school3time then
				if table.Party1_CircleTexture then
					SetPortraitToTexture(texparty1school3, table.party13icon)
				else
					texparty1school3:SetTexture(table.party13icon)
				end
				table.party1school3:Show()
				table.party1school3free = false
			end
			break
		end
	end
end

function lockout.changedpartypet1()

	table.partypet1school1free = true
	table.partypet1school2free = true
	table.partypet1school3free = true
	table.partypet1school1:Hide()
	table.partypet1school2:Hide()
	table.partypet1school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("partypet1") and LockoutDB.defaults.lockout_showpartypet1 == true then
			table.partypet1school1time = time1list[i]
			table.partypet1school2time = time2list[i]
			table.partypet1school3time = time3list[i]
			table.partypet1school1dur = dur1list[i]
			table.partypet1school2dur = dur2list[i]
			table.partypet1school3dur = dur3list[i]
			table.partypet11icon = icon1list[i]
			table.partypet12icon = icon2list[i]
			table.partypet13icon = icon3list[i]
			table.partypet11school = school1list[i]
			table.partypet12school = school2list[i]
			table.partypet13school = school3list[i]
			table.partypet1caster = guidlist[i]
			if table.partypet1school1time then
				if table.PartyPet1_CircleTexture then
					SetPortraitToTexture(texpartypet1school1, table.partypet11icon)
				else
					texpartypet1school1:SetTexture(table.partypet11icon)
				end
				table.partypet1school1:Show()
				table.partypet1school1free = false
			end
			if table.partypet1school2time then
				if table.PartyPet1_CircleTexture then
					SetPortraitToTexture(texpartypet1school2, table.partypet12icon)
				else
					texpartypet1school2:SetTexture(table.partypet12icon)
				end
				table.partypet1school2:Show()
				table.partypet1school2free = false
			end
			if table.partypet1school3time then
				if table.PartyPet1_CircleTexture then
					SetPortraitToTexture(texpartypet1school3, table.partypet13icon)
				else
					texpartypet1school3:SetTexture(table.partypet13icon)
				end
				table.partypet1school3:Show()
				table.partypet1school3free = false
			end
			break
		end
	end
end

function lockout.changedparty2()

	table.party2school1free = true
	table.party2school2free = true
	table.party2school3free = true
	table.party2school1:Hide()
	table.party2school2:Hide()
	table.party2school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("party2") and LockoutDB.defaults.lockout_showparty2 == true then
			table.party2school1time = time1list[i]
			table.party2school2time = time2list[i]
			table.party2school3time = time3list[i]
			table.party2school1dur = dur1list[i]
			table.party2school2dur = dur2list[i]
			table.party2school3dur = dur3list[i]
			table.party21icon = icon1list[i]
			table.party22icon = icon2list[i]
			table.party23icon = icon3list[i]
			table.party21school = school1list[i]
			table.party22school = school2list[i]
			table.party23school = school3list[i]
			table.party2caster = guidlist[i]
			if table.party2school1time then
				if table.Party2_CircleTexture then
					SetPortraitToTexture(texparty2school1, table.party21icon)
				else
					texparty2school1:SetTexture(table.party21icon)
				end
				table.party2school1:Show()
				table.party2school1free = false
			end
			if table.party2school2time then
				if table.Party2_CircleTexture then
					SetPortraitToTexture(texparty2school2, table.party22icon)
				else
					texparty2school2:SetTexture(table.party22icon)
				end
				table.party2school2:Show()
				table.party2school2free = false
			end
			if table.party2school3time then
				if table.Party2_CircleTexture then
					SetPortraitToTexture(texparty2school3, table.party23icon)
				else
					texparty2school3:SetTexture(table.party23icon)
				end
				table.party2school3:Show()
				table.party2school3free = false
			end
			break
		end
	end
end

function lockout.changedpartypet2()

	table.partypet2school1free = true
	table.partypet2school2free = true
	table.partypet2school3free = true
	table.partypet2school1:Hide()
	table.partypet2school2:Hide()
	table.partypet2school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("partypet2") and LockoutDB.defaults.lockout_showpartypet2 == true then
			table.partypet2school1time = time1list[i]
			table.partypet2school2time = time2list[i]
			table.partypet2school3time = time3list[i]
			table.partypet2school1dur = dur1list[i]
			table.partypet2school2dur = dur2list[i]
			table.partypet2school3dur = dur3list[i]
			table.partypet21icon = icon1list[i]
			table.partypet22icon = icon2list[i]
			table.partypet23icon = icon3list[i]
			table.partypet21school = school1list[i]
			table.partypet22school = school2list[i]
			table.partypet23school = school3list[i]
			table.partypet2caster = guidlist[i]
			if table.partypet2school1time then
				if table.PartyPet2_CircleTexture then
					SetPortraitToTexture(texpartypet2school1, table.partypet21icon)
				else
					texpartypet2school1:SetTexture(table.partypet21icon)
				end
				table.partypet2school1:Show()
				table.partypet2school1free = false
			end
			if table.partypet2school2time then
				if table.PartyPet2_CircleTexture then
					SetPortraitToTexture(texpartypet2school2, table.partypet22icon)
				else
					texpartypet2school2:SetTexture(table.partypet22icon)
				end
				table.partypet2school2:Show()
				table.partypet2school2free = false
			end
			if table.partypet2school3time then
				if table.PartyPet2_CircleTexture then
					SetPortraitToTexture(texpartypet2school3, table.partypet23icon)
				else
					texpartypet2school3:SetTexture(table.partypet23icon)
				end
				table.partypet2school3:Show()
				table.partypet2school3free = false
			end
			break
		end
	end
end

function lockout.changedarena1()

	table.arena1school1free = true
	table.arena1school2free = true
	table.arena1school3free = true
	table.arena1school1:Hide()
	table.arena1school2:Hide()
	table.arena1school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arena1") and LockoutDB.defaults.lockout_showarena1 == true then
			table.arena1school1time = time1list[i]
			table.arena1school2time = time2list[i]
			table.arena1school3time = time3list[i]
			table.arena1school1dur = dur1list[i]
			table.arena1school2dur = dur2list[i]
			table.arena1school3dur = dur3list[i]
			table.arena11icon = icon1list[i]
			table.arena12icon = icon2list[i]
			table.arena13icon = icon3list[i]
			table.arena11school = school1list[i]
			table.arena12school = school2list[i]
			table.arena13school = school3list[i]
			table.arena1caster = guidlist[i]
			if table.arena1school1time then
				if table.Arena1_CircleTexture then
					SetPortraitToTexture(texarena1school1, table.arena11icon)
				else
					texarena1school1:SetTexture(table.arena11icon)
				end
				table.arena1school1:Show()
				table.arena1school1free = false
			end
			if table.arena1school2time then
				if table.Arena1_CircleTexture then
					SetPortraitToTexture(texarena1school2, table.arena12icon)
				else
					texarena1school2:SetTexture(table.arena12icon)
				end
				table.arena1school2:Show()
				table.arena1school2free = false
			end
			if table.arena1school3time then
				if table.Arena1_CircleTexture then
					SetPortraitToTexture(texarena1school3, table.arena13icon)
				else
					texarena1school3:SetTexture(table.arena13icon)
				end
				table.arena1school3:Show()
				table.arena1school3free = false
			end
			break
		end
	end
end

function lockout.changedarenapet1()

	table.arenapet1school1free = true
	table.arenapet1school2free = true
	table.arenapet1school3free = true
	table.arenapet1school1:Hide()
	table.arenapet1school2:Hide()
	table.arenapet1school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arenapet1") and LockoutDB.defaults.lockout_showarenapet1 == true then
			table.arenapet1school1time = time1list[i]
			table.arenapet1school2time = time2list[i]
			table.arenapet1school3time = time3list[i]
			table.arenapet1school1dur = dur1list[i]
			table.arenapet1school2dur = dur2list[i]
			table.arenapet1school3dur = dur3list[i]
			table.arenapet11icon = icon1list[i]
			table.arenapet12icon = icon2list[i]
			table.arenapet13icon = icon3list[i]
			table.arenapet11school = school1list[i]
			table.arenapet12school = school2list[i]
			table.arenapet13school = school3list[i]
			table.arenapet1caster = guidlist[i]
			if table.arenapet1school1time then
				if table.ArenaPet1_CircleTexture then
					SetPortraitToTexture(texarenapet1school1, table.arenapet11icon)
				else
					texarenapet1school1:SetTexture(table.arenapet11icon)
				end
				table.arenapet1school1:Show()
				table.arenapet1school1free = false
			end
			if table.arenapet1school2time then
				if table.ArenaPet1_CircleTexture then
					SetPortraitToTexture(texarenapet1school2, table.arenapet12icon)
				else
					texarenapet1school2:SetTexture(table.arenapet12icon)
				end
				table.arenapet1school2:Show()
				table.arenapet1school2free = false
			end
			if table.arenapet1school3time then
				if table.ArenaPet1_CircleTexture then
					SetPortraitToTexture(texarenapet1school3, table.arenapet13icon)
				else
					texarenapet1school3:SetTexture(table.arenapet13icon)
				end
				table.arenapet1school3:Show()
				table.arenapet1school3free = false
			end
			break
		end
	end
end

function lockout.changedarena2()

	table.arena2school1free = true
	table.arena2school2free = true
	table.arena2school3free = true
	table.arena2school1:Hide()
	table.arena2school2:Hide()
	table.arena2school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arena2") and LockoutDB.defaults.lockout_showarena2 == true then
			table.arena2school1time = time1list[i]
			table.arena2school2time = time2list[i]
			table.arena2school3time = time3list[i]
			table.arena2school1dur = dur1list[i]
			table.arena2school2dur = dur2list[i]
			table.arena2school3dur = dur3list[i]
			table.arena21icon = icon1list[i]
			table.arena22icon = icon2list[i]
			table.arena23icon = icon3list[i]
			table.arena21school = school1list[i]
			table.arena22school = school2list[i]
			table.arena23school = school3list[i]
			table.arena2caster = guidlist[i]
			if table.arena2school1time then
				if table.Arena2_CircleTexture then
					SetPortraitToTexture(texarena2school1, table.arena21icon)
				else
					texarena2school1:SetTexture(table.arena21icon)
				end
				table.arena2school1:Show()
				table.arena2school1free = false
			end
			if table.arena2school2time then
				if table.Arena2_CircleTexture then
					SetPortraitToTexture(texarena2school2, table.arena22icon)
				else
					texarena2school2:SetTexture(table.arena22icon)
				end
				table.arena2school2:Show()
				table.arena2school2free = false
			end
			if table.arena2school3time then
				if table.Arena2_CircleTexture then
					SetPortraitToTexture(texarena2school3, table.arena23icon)
				else
					texarena2school3:SetTexture(table.arena23icon)
				end
				table.arena2school3:Show()
				table.arena2school3free = false
			end
			break
		end
	end
end

function lockout.changedarenapet2()

	table.arenapet2school1free = true
	table.arenapet2school2free = true
	table.arenapet2school3free = true
	table.arenapet2school1:Hide()
	table.arenapet2school2:Hide()
	table.arenapet2school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arenapet2") and LockoutDB.defaults.lockout_showarenapet2 == true then
			table.arenapet2school1time = time1list[i]
			table.arenapet2school2time = time2list[i]
			table.arenapet2school3time = time3list[i]
			table.arenapet2school1dur = dur1list[i]
			table.arenapet2school2dur = dur2list[i]
			table.arenapet2school3dur = dur3list[i]
			table.arenapet21icon = icon1list[i]
			table.arenapet22icon = icon2list[i]
			table.arenapet23icon = icon3list[i]
			table.arenapet21school = school1list[i]
			table.arenapet22school = school2list[i]
			table.arenapet23school = school3list[i]
			table.arenapet2caster = guidlist[i]
			if table.arenapet2school1time then
				if table.ArenaPet2_CircleTexture then
					SetPortraitToTexture(texarenapet2school1, table.arenapet21icon)
				else
					texarenapet2school1:SetTexture(table.arenapet21icon)
				end
				table.arenapet2school1:Show()
				table.arenapet2school1free = false
			end
			if table.arenapet2school2time then
				if table.ArenaPet2_CircleTexture then
					SetPortraitToTexture(texarenapet2school2, table.arenapet22icon)
				else
					texarenapet2school2:SetTexture(table.arenapet22icon)
				end
				table.arenapet2school2:Show()
				table.arenapet2school2free = false
			end
			if table.arenapet2school3time then
				if table.ArenaPet2_CircleTexture then
					SetPortraitToTexture(texarenapet2school3, table.arenapet23icon)
				else
					texarenapet2school3:SetTexture(table.arenapet23icon)
				end
				table.arenapet2school3:Show()
				table.arenapet2school3free = false
			end
			break
		end
	end
end

function lockout.changedarena3()

	table.arena3school1free = true
	table.arena3school2free = true
	table.arena3school3free = true
	table.arena3school1:Hide()
	table.arena3school2:Hide()
	table.arena3school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arena3") and LockoutDB.defaults.lockout_showarena3 == true then
			table.arena3school1time = time1list[i]
			table.arena3school2time = time2list[i]
			table.arena3school3time = time3list[i]
			table.arena3school1dur = dur1list[i]
			table.arena3school2dur = dur2list[i]
			table.arena3school3dur = dur3list[i]
			table.arena31icon = icon1list[i]
			table.arena32icon = icon2list[i]
			table.arena33icon = icon3list[i]
			table.arena31school = school1list[i]
			table.arena32school = school2list[i]
			table.arena33school = school3list[i]
			table.arena3caster = guidlist[i]
			if table.arena3school1time then
				if table.Arena3_CircleTexture then
					SetPortraitToTexture(texarena3school1, table.arena31icon)
				else
					texarena3school1:SetTexture(table.arena31icon)
				end
				table.arena3school1:Show()
				table.arena3school1free = false
			end
			if table.arena3school2time then
				if table.Arena3_CircleTexture then
					SetPortraitToTexture(texarena3school2, table.arena32icon)
				else
					texarena3school2:SetTexture(table.arena32icon)
				end
				table.arena3school2:Show()
				table.arena3school2free = false
			end
			if table.arena3school3time then
				if table.Arena3_CircleTexture then
					SetPortraitToTexture(texarena3school3, table.arena33icon)
				else
					texarena3school3:SetTexture(table.arena33icon)
				end
				table.arena3school3:Show()
				table.arena3school3free = false
			end
			break
		end
	end
end

function lockout.changedarenapet3()

	table.arenapet3school1free = true
	table.arenapet3school2free = true
	table.arenapet3school3free = true
	table.arenapet3school1:Hide()
	table.arenapet3school2:Hide()
	table.arenapet3school3:Hide()

	for i = 0, 1000 do
		if guidlist[i] and guidlist[i] == UnitGUID("arenapet3") and LockoutDB.defaults.lockout_showarenapet3 == true then
			table.arenapet3school1time = time1list[i]
			table.arenapet3school2time = time2list[i]
			table.arenapet3school3time = time3list[i]
			table.arenapet3school1dur = dur1list[i]
			table.arenapet3school2dur = dur2list[i]
			table.arenapet3school3dur = dur3list[i]
			table.arenapet31icon = icon1list[i]
			table.arenapet32icon = icon2list[i]
			table.arenapet33icon = icon3list[i]
			table.arenapet31school = school1list[i]
			table.arenapet32school = school2list[i]
			table.arenapet33school = school3list[i]
			table.arenapet3caster = guidlist[i]
			if table.arenapet3school1time then
				if table.ArenaPet3_CircleTexture then
					SetPortraitToTexture(texarenapet3school1, table.arenapet31icon)
				else
					texarenapet3school1:SetTexture(table.arenapet31icon)
				end
				table.arenapet3school1:Show()
				table.arenapet3school1free = false
			end
			if table.arenapet3school2time then
				if table.ArenaPet3_CircleTexture then
					SetPortraitToTexture(texarenapet3school2, table.arenapet32icon)
				else
					texarenapet3school2:SetTexture(table.arenapet32icon)
				end
				table.arenapet3school2:Show()
				table.arenapet3school2free = false
			end
			if table.arenapet3school3time then
				if table.ArenaPet3_CircleTexture then
					SetPortraitToTexture(texarenapet3school3, table.arenapet33icon)
				else
					texarenapet3school3:SetTexture(table.arenapet33icon)
				end
				table.arenapet3school3:Show()
				table.arenapet3school3free = false
			end
			break
		end
	end
end

function lockout.getdurmod(unitid)
	local modifier = 1
	for i = 1, 40 do
		local _, _, _, _, _, _, _, unitCaster, _, _, spellId = UnitAura(unitid, i)
		-- all Paladin Auras max Rank
		if spellId == 19746 or spellId == 48942 or spellId == 48947 or spellId == 48945 or spellId == 48943 or spellId == 54043 or spellId == 32223 then
			for index = 0, 1000 do
				if hpally[index] == GetUnitName(unitCaster) then -- Probably imp. Concentration Aura
					if modifier > 0.7 then
						modifier = 0.7
					end
					break
				elseif hpally[index] == nil then -- The Paladin casting the Aura hasn't been detected as a Holy Paladin, so probably no imp. Concentration Aura
					break
				end
			end
		elseif spellId == 14743 then -- Matyrdom Rank1
			if modifier > 0.9 then
				modifier = 0.9
			end
		elseif spellId == 27828 then -- Matyrdom Rank2
			if modifier > 0.8 then
				modifier = 0.8
			end
		end
	end
	for index = 0, 1000 do
		if GetUnitName(unitid) == rshaman[index] then -- Interrupted Target is a Resto Shaman, so probably has 3/3 Focused Mind
			if modifier > 0.7 then
				modifier = 0.7
			end
		end
	end
	return modifier
end

function lockout.checkfailedinterrupts(guid, school)

	local j = -1

	-- A cast has been recognized, that should have been locked out. Interrupt either never happened, or school isn't locked out anymore.

	-- Player
	if guid == table.placaster and school == table.pla1school then
		table.plaschool1free = true
		table.plaschool1:Hide()
		table.pla1school = nil
	end
	if guid == table.placaster and school == table.pla2school then
		table.plaschool2free = true
		table.plaschool2:Hide()
		table.pla2school = nil
	end
	if guid == table.placaster and school == table.pla3school then
		table.plaschool3free = true
		table.plaschool3:Hide()
		table.pla3school = nil
	end
	-- PlayerPet
	if guid == table.playerpetcaster and school == table.playerpet1school then
		table.playerpetschool1free = true
		table.playerpetschool1:Hide()
		table.playerpet1school = nil
	end
	if guid == table.playerpetcaster and school == table.playerpet2school then
		table.playerpetschool2free = true
		table.playerpetschool2:Hide()
		table.playerpet2school = nil
	end
	if guid == table.playerpetcaster and school == table.playerpet3school then
		table.playerpetschool3free = true
		table.playerpetschool3:Hide()
		table.playerpet3school = nil
	end
	-- Target
	if guid == table.tarcaster and school == table.tar1school then
		table.tarschool1free = true
		table.tarschool1:Hide()
		table.tar1school = nil
	end
	if guid == table.tarcaster and school == table.tar2school then
		table.tarschool2free = true
		table.tarschool2:Hide()
		table.tar2school = nil
	end
	if guid == table.tarcaster and school == table.tar3school then
		table.tarschool3free = true
		table.tarschool3:Hide()
		table.tar3school = nil
	end
	-- Focus
	if guid == table.foccaster and school == table.foc1school then
		table.focschool1free = true
		table.focschool1:Hide()
		table.foc1school = nil
	end
	if guid == table.foccaster and school == table.foc2school then
		table.focschool2free = true
		table.focschool2:Hide()
		table.foc2school = nil
	end
	if guid == table.foccaster and school == table.foc3school then
		table.focschool3free = true
		table.focschool3:Hide()
		table.foc3school = nil
	end
	-- Party1
	if guid == table.party1caster and school == table.party11school then
		table.party1school1free = true
		table.party1school1:Hide()
		table.party11school = nil
	end
	if guid == table.party1caster and school == table.party12school then
		table.party1school2free = true
		table.party1school2:Hide()
		table.party12school = nil
	end
	if guid == table.party1caster and school == table.party13school then
		table.party1school3free = true
		table.party1school3:Hide()
		table.party13school = nil
	end
	-- PartyPet1
	if guid == table.partypet1caster and school == table.partypet11school then
		table.partypet1school1free = true
		table.partypet1school1:Hide()
		table.partypet11school = nil
	end
	if guid == table.partypet1caster and school == table.partypet12school then
		table.partypet1school2free = true
		table.partypet1school2:Hide()
		table.partypet12school = nil
	end
	if guid == table.partypet1caster and school == table.partypet13school then
		table.partypet1school3free = true
		table.partypet1school3:Hide()
		table.partypet13school = nil
	end
	-- Party2
	if guid == table.party2caster and school == table.party21school then
		table.party2school1free = true
		table.party2school1:Hide()
		table.party21school = nil
	end
	if guid == table.party2caster and school == table.party22school then
		table.party2school2free = true
		table.party2school2:Hide()
		table.party22school = nil
	end
	if guid == table.party2caster and school == table.party23school then
		table.party2school3free = true
		table.party2school3:Hide()
		table.party23school = nil
	end
	-- PartyPet2
	if guid == table.partypet2caster and school == table.partypet21school then
		table.partypet2school1free = true
		table.partypet2school1:Hide()
		table.partypet21school = nil
	end
	if guid == table.partypet2caster and school == table.partypet22school then
		table.partypet2school2free = true
		table.partypet2school2:Hide()
		table.partypet22school = nil
	end
	if guid == table.partypet2caster and school == table.partypet23school then
		table.partypet2school3free = true
		table.partypet2school3:Hide()
		table.partypet23school = nil
	end
	-- Arena1
	if guid == table.arena1caster and school == table.arena11school then
		table.arena1school1free = true
		table.arena1school1:Hide()
		table.arena11school = nil
	end
	if guid == table.arena1caster and school == table.arena12school then
		table.arena1school2free = true
		table.arena1school2:Hide()
		table.arena12school = nil
	end
	if guid == table.arena1caster and school == table.arena13school then
		table.arena1school3free = true
		table.arena1school3:Hide()
		table.arena13school = nil
	end
	-- ArenaPet1
	if guid == table.arenapet1caster and school == table.arenapet11school then
		table.arenapet1school1free = true
		table.arenapet1school1:Hide()
		table.arenapet11school = nil
	end
	if guid == table.arenapet1caster and school == table.arenapet12school then
		table.arenapet1school2free = true
		table.arenapet1school2:Hide()
		table.arenapet12school = nil
	end
	if guid == table.arenapet1caster and school == table.arenapet13school then
		table.arenapet1school3free = true
		table.arenapet1school3:Hide()
		table.arenapet13school = nil
	end
	-- Arena2
	if guid == table.arena2caster and school == table.arena21school then
		table.arena2school1free = true
		table.arena2school1:Hide()
		table.arena21school = nil
	end
	if guid == table.arena2caster and school == table.arena22school then
		table.arena2school2free = true
		table.arena2school2:Hide()
		table.arena22school = nil
	end
	if guid == table.arena2caster and school == table.arena23school then
		table.arena2school3free = true
		table.arena2school3:Hide()
		table.arena23school = nil
	end
	-- ArenaPet2
	if guid == table.arenapet2caster and school == table.arenapet21school then
		table.arenapet2school1free = true
		table.arenapet2school1:Hide()
		table.arenapet21school = nil
	end
	if guid == table.arenapet2caster and school == table.arenapet22school then
		table.arenapet2school2free = true
		table.arenapet2school2:Hide()
		table.arenapet22school = nil
	end
	if guid == table.arenapet2caster and school == table.arenapet23school then
		table.arenapet2school3free = true
		table.arenapet2school3:Hide()
		table.arenapet23school = nil
	end
	-- Arena3
	if guid == table.arena3caster and school == table.arena31school then
		table.arena3school1free = true
		table.arena3school1:Hide()
		table.arena31school = nil
	end
	if guid == table.arena3caster and school == table.arena32school then
		table.arena3school2free = true
		table.arena3school2:Hide()
		table.arena32school = nil
	end
	if guid == table.arena3caster and school == table.arena33school then
		table.arena3school3free = true
		table.arena3school3:Hide()
		table.arena33school = nil
	end
	-- ArenaPet3
	if guid == table.arenapet3caster and school == table.arenapet31school then
		table.arenapet3school1free = true
		table.arenapet3school1:Hide()
		table.arenapet31school = nil
	end
	if guid == table.arenapet3caster and school == table.arenapet32school then
		table.arenapet3school2free = true
		table.arenapet3school2:Hide()
		table.arenapet32school = nil
	end
	if guid == table.arenapet3caster and school == table.arenapet33school then
		table.arenapet3school3free = true
		table.arenapet3school3:Hide()
		table.arenapet33school = nil
	end

	for i = 0, 1000 do
		if guidlist[i] == guid then
			j = i
			break
		end
	end

	if j > -1 then -- Remove any false list entries
		if school1list[j] == school then
			time1list[j] = nil
			dur1list[j] = nil
			icon1list[j] = nil
			school1list[j] = nil
		elseif school2list[j] == school then
			time2list[j] = nil
			dur2list[j] = nil
			icon2list[j] = nil
			school2list[j] = nil
		elseif school3list[j] == school then
			time3list[j] = nil
			dur3list[j] = nil
			icon3list[j] = nil
			school3list[j] = nil
		end
	end
end

------------------------------------------------------------------------------------
------------------------------ Graphic User Interface ------------------------------
------------------------------------------------------------------------------------

function lockout.hideborders()
	if LockoutDB.defaults.lockout_hideborders == true then
		table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B = 0.075, 0.925, 0.075, 0.925
		Lockout_TexCoord()
	else
		table.Coord_L, table.Coord_R, table.Coord_T, table.Coord_B = 0, 1, 0, 1
		Lockout_TexCoord()
	end
end

function Lockout_HideBorders()
	if Lockout_HideBorders_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_hideborders = true
		lockout.hideborders()
	else
		LockoutDB.defaults.lockout_hideborders = false
		lockout.hideborders()
	end
end

function lockout.hidecooldowntext()
	if LockoutDB.defaults.lockout_hidecooldowntext == true then
		table.Text_Alpha = 0
		Lockout_Text_Alpha()
		Lockout_CDText_Scale_Slider:Disable()
		Lockout_CDText_Scale_Slider_Text:SetFontObject(GameFontDisable)
	else
		table.Text_Alpha = 1
		Lockout_Text_Alpha()
	end
end

function Lockout_HideCooldownText()
	if Lockout_HideCooldownText_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_hidecooldowntext = true
		lockout.hidecooldowntext()
		Lockout_CDText_Scale_Slider:Disable()
		Lockout_CDText_Scale_Slider_Text:SetFontObject(GameFontDisable)
	else
		LockoutDB.defaults.lockout_hidecooldowntext = false
		lockout.hidecooldowntext()
		Lockout_CDText_Scale_Slider:Enable()
		Lockout_CDText_Scale_Slider_Text:SetFontObject(GameFontNormal)
	end
end

function lockout.showplayer()
	if LockoutDB.defaults.lockout_showplayer == false then
		lockoutpla:Hide()
		Lockout_Player_Scale_Slider:Disable()
		Lockout_Player_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Player_Anchor_Check:Disable()
	end
end

function Lockout_Player()
	if Lockout_Player_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showplayer = true
		lockoutpla:Show()
		dummytextpla:Show()
		texdummypla:Show()
		Lockout_Player_Scale_Slider:Enable()
		Lockout_Player_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Player_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showplayer = false
		lockoutpla:Hide()
		texdummypla:Hide()
		Lockout_Player_Scale_Slider:Disable()
		Lockout_Player_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Player_Anchor_Check:Disable()
	end
end

function lockout.showplayerpet()
	if LockoutDB.defaults.lockout_showplayerpet == false then
		lockoutplayerpet:Hide()
		Lockout_PlayerPet_Scale_Slider:Disable()
		Lockout_PlayerPet_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PlayerPet_Anchor_Check:Disable()
	end
end

function Lockout_PlayerPet()
	if Lockout_PlayerPet_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showplayerpet = true
		lockoutplayerpet:Show()
		dummytextplayerpet:Show()
		texdummyplayerpet:Show()
		Lockout_PlayerPet_Scale_Slider:Enable()
		Lockout_PlayerPet_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_PlayerPet_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showplayerpet = false
		lockoutplayerpet:Hide()
		texdummyplayerpet:Hide()
		Lockout_PlayerPet_Scale_Slider:Disable()
		Lockout_PlayerPet_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PlayerPet_Anchor_Check:Disable()
	end
end

function lockout.showtarget()
	if LockoutDB.defaults.lockout_showtarget == false then
		lockouttar:Hide()
		Lockout_Target_Scale_Slider:Disable()
		Lockout_Target_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Target_Anchor_Check:Disable()
	end
end

function Lockout_Target()
	if Lockout_Target_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showtarget = true
		lockouttar:Show()
		dummytexttar:Show()
		texdummytar:Show()
		Lockout_Target_Scale_Slider:Enable()
		Lockout_Target_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Target_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showtarget = false
		lockouttar:Hide()
		texdummytar:Hide()
		Lockout_Target_Scale_Slider:Disable()
		Lockout_Target_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Target_Anchor_Check:Disable()
	end
end

function lockout.showfocus()
	if LockoutDB.defaults.lockout_showfocus == false then
		lockoutfoc:Hide()
		Lockout_Focus_Scale_Slider:Disable()
		Lockout_Focus_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Focus_Anchor_Check:Disable()
	end
end

function Lockout_Focus()
	if Lockout_Focus_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showfocus = true
		lockoutfoc:Show()
		dummytextfoc:Show()
		texdummyfoc:Show()
		Lockout_Focus_Scale_Slider:Enable()
		Lockout_Focus_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Focus_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showfocus = false
		lockoutfoc:Hide()
		texdummyfoc:Hide()
		Lockout_Focus_Scale_Slider:Disable()
		Lockout_Focus_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Focus_Anchor_Check:Disable()
	end
end

function lockout.showparty1()
	if LockoutDB.defaults.lockout_showparty1 == false then
		lockoutparty1:Hide()
		Lockout_Party1_Scale_Slider:Disable()
		Lockout_Party1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Party1_Anchor_Check:Disable()
	end
end

function Lockout_Party1()
	if Lockout_Party1_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showparty1 = true
		lockoutparty1:Show()
		dummytextparty1:Show()
		texdummyparty1:Show()
		Lockout_Party1_Scale_Slider:Enable()
		Lockout_Party1_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Party1_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showparty1 = false
		lockoutparty1:Hide()
		texdummyparty1:Hide()
		Lockout_Party1_Scale_Slider:Disable()
		Lockout_Party1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Party1_Anchor_Check:Disable()
	end
end

function lockout.showpartypet1()
	if LockoutDB.defaults.lockout_showpartypet1 == false then
		lockoutpartypet1:Hide()
		Lockout_PartyPet1_Scale_Slider:Disable()
		Lockout_PartyPet1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PartyPet1_Anchor_Check:Disable()
	end
end

function Lockout_PartyPet1()
	if Lockout_PartyPet1_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showpartypet1 = true
		lockoutpartypet1:Show()
		dummytextpartypet1:Show()
		texdummypartypet1:Show()
		Lockout_PartyPet1_Scale_Slider:Enable()
		Lockout_PartyPet1_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_PartyPet1_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showpartypet1 = false
		lockoutpartypet1:Hide()
		texdummypartypet1:Hide()
		Lockout_PartyPet1_Scale_Slider:Disable()
		Lockout_PartyPet1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PartyPet1_Anchor_Check:Disable()
	end
end

function lockout.showparty2()
	if LockoutDB.defaults.lockout_showparty2 == false then
		lockoutparty2:Hide()
		Lockout_Party2_Scale_Slider:Disable()
		Lockout_Party2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Party2_Anchor_Check:Disable()
	end
end

function Lockout_Party2()
	if Lockout_Party2_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showparty2 = true
		lockoutparty2:Show()
		dummytextparty2:Show()
		texdummyparty2:Show()
		Lockout_Party2_Scale_Slider:Enable()
		Lockout_Party2_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Party2_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showparty2 = false
		lockoutparty2:Hide()
		texdummyparty2:Hide()
		Lockout_Party2_Scale_Slider:Disable()
		Lockout_Party2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Party2_Anchor_Check:Disable()
	end
end

function lockout.showpartypet2()
	if LockoutDB.defaults.lockout_showpartypet2 == false then
		lockoutpartypet2:Hide()
		Lockout_PartyPet2_Scale_Slider:Disable()
		Lockout_PartyPet2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PartyPet2_Anchor_Check:Disable()
	end
end

function Lockout_PartyPet2()
	if Lockout_PartyPet2_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showpartypet2 = true
		lockoutpartypet2:Show()
		dummytextpartypet2:Show()
		texdummypartypet2:Show()
		Lockout_PartyPet2_Scale_Slider:Enable()
		Lockout_PartyPet2_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_PartyPet2_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showpartypet2 = false
		lockoutpartypet2:Hide()
		texdummypartypet2:Hide()
		Lockout_PartyPet2_Scale_Slider:Disable()
		Lockout_PartyPet2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_PartyPet2_Anchor_Check:Disable()
	end
end

function lockout.showarena1()
	if LockoutDB.defaults.lockout_showarena1 == false then
		lockoutarena1:Hide()
		Lockout_Arena1_Scale_Slider:Disable()
		Lockout_Arena1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena1_Anchor_Check:Disable()
	end
end

function Lockout_Arena1()
	if Lockout_Arena1_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarena1 = true
		lockoutarena1:Show()
		dummytextarena1:Show()
		texdummyarena1:Show()
		Lockout_Arena1_Scale_Slider:Enable()
		Lockout_Arena1_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Arena1_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarena1 = false
		lockoutarena1:Hide()
		texdummyarena1:Hide()
		Lockout_Arena1_Scale_Slider:Disable()
		Lockout_Arena1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena1_Anchor_Check:Disable()
	end
end

function lockout.showarenapet1()
	if LockoutDB.defaults.lockout_showarenapet1 == false then
		lockoutarenapet1:Hide()
		Lockout_ArenaPet1_Scale_Slider:Disable()
		Lockout_ArenaPet1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet1_Anchor_Check:Disable()
	end
end

function Lockout_ArenaPet1()
	if Lockout_ArenaPet1_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarenapet1 = true
		lockoutarenapet1:Show()
		dummytextarenapet1:Show()
		texdummyarenapet1:Show()
		Lockout_ArenaPet1_Scale_Slider:Enable()
		Lockout_ArenaPet1_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_ArenaPet1_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarenapet1 = false
		lockoutarenapet1:Hide()
		texdummyarenapet1:Hide()
		Lockout_ArenaPet1_Scale_Slider:Disable()
		Lockout_ArenaPet1_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet1_Anchor_Check:Disable()
	end
end

function lockout.showarena2()
	if LockoutDB.defaults.lockout_showarena2 == false then
		lockoutarena2:Hide()
		Lockout_Arena2_Scale_Slider:Disable()
		Lockout_Arena2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena2_Anchor_Check:Disable()
	end
end

function Lockout_Arena2()
	if Lockout_Arena2_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarena2 = true
		lockoutarena2:Show()
		dummytextarena2:Show()
		texdummyarena2:Show()
		Lockout_Arena2_Scale_Slider:Enable()
		Lockout_Arena2_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Arena2_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarena2 = false
		lockoutarena2:Hide()
		texdummyarena2:Hide()
		Lockout_Arena2_Scale_Slider:Disable()
		Lockout_Arena2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena2_Anchor_Check:Disable()
	end
end

function lockout.showarenapet2()
	if LockoutDB.defaults.lockout_showarenapet2 == false then
		lockoutarenapet2:Hide()
		Lockout_ArenaPet2_Scale_Slider:Disable()
		Lockout_ArenaPet2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet2_Anchor_Check:Disable()
	end
end

function Lockout_ArenaPet2()
	if Lockout_ArenaPet2_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarenapet2 = true
		lockoutarenapet2:Show()
		dummytextarenapet2:Show()
		texdummyarenapet2:Show()
		Lockout_ArenaPet2_Scale_Slider:Enable()
		Lockout_ArenaPet2_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_ArenaPet2_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarenapet2 = false
		lockoutarenapet2:Hide()
		texdummyarenapet2:Hide()
		Lockout_ArenaPet2_Scale_Slider:Disable()
		Lockout_ArenaPet2_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet2_Anchor_Check:Disable()
	end
end

function lockout.showarena3()
	if LockoutDB.defaults.lockout_showarena3 == false then
		lockoutarena3:Hide()
		Lockout_Arena3_Scale_Slider:Disable()
		Lockout_Arena3_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena3_Anchor_Check:Disable()
	end
end

function Lockout_Arena3()
	if Lockout_Arena3_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarena3 = true
		lockoutarena3:Show()
		dummytextarena3:Show()
		texdummyarena3:Show()
		Lockout_Arena3_Scale_Slider:Enable()
		Lockout_Arena3_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_Arena3_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarena3 = false
		lockoutarena3:Hide()
		texdummyarena3:Hide()
		Lockout_Arena3_Scale_Slider:Disable()
		Lockout_Arena3_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_Arena3_Anchor_Check:Disable()
	end
end

function lockout.showarenapet3()
	if LockoutDB.defaults.lockout_showarenapet3 == false then
		lockoutarenapet3:Hide()
		Lockout_ArenaPet3_Scale_Slider:Disable()
		Lockout_ArenaPet3_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet3_Anchor_Check:Disable()
	end
end

function Lockout_ArenaPet3()
	if Lockout_ArenaPet3_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_showarenapet3 = true
		lockoutarenapet3:Show()
		dummytextarenapet3:Show()
		texdummyarenapet3:Show()
		Lockout_ArenaPet3_Scale_Slider:Enable()
		Lockout_ArenaPet3_Scale_Slider_Text:SetFontObject(GameFontNormal)
		Lockout_ArenaPet3_Anchor_Check:Enable()
	else
		LockoutDB.defaults.lockout_showarenapet3 = false
		lockoutarenapet3:Hide()
		texdummyarenapet3:Hide()
		Lockout_ArenaPet3_Scale_Slider:Disable()
		Lockout_ArenaPet3_Scale_Slider_Text:SetFontObject(GameFontDisable)
		Lockout_ArenaPet3_Anchor_Check:Disable()
	end
end

function lockout.playeranchor()
	if LockoutDB.defaults.lockout_player_anchor == true then
		table.Player_CircleTexture = true
		Player_CircleTexture()
	end
end

function Lockout_Player_Anchor()
	if Lockout_Player_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_player_anchor = true
	else
		LockoutDB.defaults.lockout_player_anchor = false
	end
end

function lockout.playerpetanchor()
	if LockoutDB.defaults.lockout_playerpet_anchor == true then
		table.PlayerPet_CircleTexture = true
		PlayerPet_CircleTexture()
	end
end

function Lockout_PlayerPet_Anchor()
	if Lockout_PlayerPet_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_playerpet_anchor = true
	else
		LockoutDB.defaults.lockout_playerpet_anchor = false
	end
end

function lockout.targetanchor()
	if LockoutDB.defaults.lockout_target_anchor == true then
		table.Target_CircleTexture = true
		Target_CircleTexture()
	end
end

function Lockout_Target_Anchor()
	if Lockout_Target_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_target_anchor = true
	else
		LockoutDB.defaults.lockout_target_anchor = false
	end
end

function lockout.focusanchor()
	if LockoutDB.defaults.lockout_focus_anchor == true then
		table.Focus_CircleTexture = true
		Focus_CircleTexture()
	end
end

function Lockout_Focus_Anchor()
	if Lockout_Focus_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_focus_anchor = true
	else
		LockoutDB.defaults.lockout_focus_anchor = false
	end
end

function lockout.party1anchor()
	if LockoutDB.defaults.lockout_party1_anchor == true then
		table.Party1_CircleTexture = true
		Party1_CircleTexture()
	end
end

function Lockout_Party1_Anchor()
	if Lockout_Party1_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_party1_anchor = true
	else
		LockoutDB.defaults.lockout_party1_anchor = false
	end
end

function lockout.partypet1anchor()
	if LockoutDB.defaults.lockout_partypet1_anchor == true then
		table.PartyPet1_CircleTexture = true
		PartyPet1_CircleTexture()
	end
end

function Lockout_PartyPet1_Anchor()
	if Lockout_PartyPet1_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_partypet1_anchor = true
	else
		LockoutDB.defaults.lockout_partypet1_anchor = false
	end
end

function lockout.party2anchor()
	if LockoutDB.defaults.lockout_party2_anchor == true then
		table.Party2_CircleTexture = true
		Party2_CircleTexture()
	end
end

function Lockout_Party2_Anchor()
	if Lockout_Party2_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_party2_anchor = true
	else
		LockoutDB.defaults.lockout_party2_anchor = false
	end
end

function lockout.partypet2anchor()
	if LockoutDB.defaults.lockout_partypet2_anchor == true then
		table.PartyPet2_CircleTexture = true
		PartyPet2_CircleTexture()
	end
end

function Lockout_PartyPet2_Anchor()
	if Lockout_PartyPet2_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_partypet2_anchor = true
	else
		LockoutDB.defaults.lockout_partypet2_anchor = false
	end
end

function lockout.arena1anchor()
	if LockoutDB.defaults.lockout_arena1_anchor == true then
		table.Arena1_CircleTexture = true
		Arena1_CircleTexture()
	end
end

function Lockout_Arena1_Anchor()
	if Lockout_Arena1_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arena1_anchor = true
	else
		LockoutDB.defaults.lockout_arena1_anchor = false
	end
end

function lockout.arenapet1anchor()
	if LockoutDB.defaults.lockout_arenapet1_anchor == true then
		table.ArenaPet1_CircleTexture = true
		ArenaPet1_CircleTexture()
	end
end

function Lockout_ArenaPet1_Anchor()
	if Lockout_ArenaPet1_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arenapet1_anchor = true
	else
		LockoutDB.defaults.lockout_arenapet1_anchor = false
	end
end

function lockout.arena2anchor()
	if LockoutDB.defaults.lockout_arena2_anchor == true then
		table.Arena2_CircleTexture = true
		Arena2_CircleTexture()
	end
end

function Lockout_Arena2_Anchor()
	if Lockout_Arena2_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arena2_anchor = true
	else
		LockoutDB.defaults.lockout_arena2_anchor = false
	end
end

function lockout.arenapet2anchor()
	if LockoutDB.defaults.lockout_arenapet2_anchor == true then
		table.ArenaPet2_CircleTexture = true
		ArenaPet2_CircleTexture()
	end
end

function Lockout_ArenaPet2_Anchor()
	if Lockout_ArenaPet2_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arenapet2_anchor = true
	else
		LockoutDB.defaults.lockout_arenapet2_anchor = false
	end
end

function lockout.arena3anchor()
	if LockoutDB.defaults.lockout_arena3_anchor == true then
		table.Arena3_CircleTexture = true
		Arena3_CircleTexture()
	end
end

function Lockout_Arena3_Anchor()
	if Lockout_Arena3_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arena3_anchor = true
	else
		LockoutDB.defaults.lockout_arena3_anchor = false
	end
end

function lockout.arenapet3anchor()
	if LockoutDB.defaults.lockout_arenapet3_anchor == true then
		table.ArenaPet3_CircleTexture = true
		ArenaPet3_CircleTexture()
	end
end

function Lockout_ArenaPet3_Anchor()
	if Lockout_ArenaPet3_Anchor_Check:GetChecked() == 1 then
		LockoutDB.defaults.lockout_arenapet3_anchor = true
	else
		LockoutDB.defaults.lockout_arenapet3_anchor = false
	end
end

function Lockout_Player_UpdateScale(value)
	LockoutDB.scale.lockout_player_scale = Lockout_Player_Scale_Slider:GetValue()
	lockoutpla:SetScale(LockoutDB.scale.lockout_player_scale)
	Lockout_Player_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_PlayerPet_UpdateScale(value)
	LockoutDB.scale.lockout_playerpet_scale = Lockout_PlayerPet_Scale_Slider:GetValue()
	lockoutplayerpet:SetScale(LockoutDB.scale.lockout_playerpet_scale)
	Lockout_PlayerPet_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Target_UpdateScale(value)
	LockoutDB.scale.lockout_target_scale = Lockout_Target_Scale_Slider:GetValue()
	lockouttar:SetScale(LockoutDB.scale.lockout_target_scale)
	Lockout_Target_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Focus_UpdateScale(value)
	LockoutDB.scale.lockout_focus_scale = Lockout_Focus_Scale_Slider:GetValue()
	lockoutfoc:SetScale(LockoutDB.scale.lockout_focus_scale)
	Lockout_Focus_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Party1_UpdateScale(value)
	LockoutDB.scale.lockout_party1_scale = Lockout_Party1_Scale_Slider:GetValue()
	lockoutparty1:SetScale(LockoutDB.scale.lockout_party1_scale)
	Lockout_Party1_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_PartyPet1_UpdateScale(value)
	LockoutDB.scale.lockout_partypet1_scale = Lockout_PartyPet1_Scale_Slider:GetValue()
	lockoutpartypet1:SetScale(LockoutDB.scale.lockout_partypet1_scale)
	Lockout_PartyPet1_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Party2_UpdateScale(value)
	LockoutDB.scale.lockout_party2_scale = Lockout_Party2_Scale_Slider:GetValue()
	lockoutparty2:SetScale(LockoutDB.scale.lockout_party2_scale)
	Lockout_Party2_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_PartyPet2_UpdateScale(value)
	LockoutDB.scale.lockout_partypet2_scale = Lockout_PartyPet2_Scale_Slider:GetValue()
	lockoutpartypet2:SetScale(LockoutDB.scale.lockout_partypet2_scale)
	Lockout_PartyPet2_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Arena1_UpdateScale(value)
	LockoutDB.scale.lockout_arena1_scale = Lockout_Arena1_Scale_Slider:GetValue()
	lockoutarena1:SetScale(LockoutDB.scale.lockout_arena1_scale)
	Lockout_Arena1_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_ArenaPet1_UpdateScale(value)
	LockoutDB.scale.lockout_arenapet1_scale = Lockout_ArenaPet1_Scale_Slider:GetValue()
	lockoutarenapet1:SetScale(LockoutDB.scale.lockout_arenapet1_scale)
	Lockout_ArenaPet1_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Arena2_UpdateScale(value)
	LockoutDB.scale.lockout_arena2_scale = Lockout_Arena2_Scale_Slider:GetValue()
	lockoutarena2:SetScale(LockoutDB.scale.lockout_arena2_scale)
	Lockout_Arena2_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_ArenaPet2_UpdateScale(value)
	LockoutDB.scale.lockout_arenapet2_scale = Lockout_ArenaPet2_Scale_Slider:GetValue()
	lockoutarenapet2:SetScale(LockoutDB.scale.lockout_arenapet2_scale)
	Lockout_ArenaPet2_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_Arena3_UpdateScale(value)
	LockoutDB.scale.lockout_arena3_scale = Lockout_Arena3_Scale_Slider:GetValue()
	lockoutarena3:SetScale(LockoutDB.scale.lockout_arena3_scale)
	Lockout_Arena3_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_ArenaPet3_UpdateScale(value)
	LockoutDB.scale.lockout_arenapet3_scale = Lockout_ArenaPet3_Scale_Slider:GetValue()
	lockoutarenapet3:SetScale(LockoutDB.scale.lockout_arenapet3_scale)
	Lockout_ArenaPet3_Scale_Slider_Text:SetText(format("%.2f", value) )
end

function Lockout_CDText_UpdateScale(value)
	LockoutDB.scale.lockout_cdtext_scale = Lockout_CDText_Scale_Slider:GetValue()
	SetCooldownTextSize()
	Lockout_CDText_Scale_Slider_Text:SetText(format("CD size %.1f", value) )
end

function Lockout_Close()
	Lockout_Frame:Hide()

	dummytextpla:Hide()
	texdummypla:Hide()
	lockoutpla:EnableMouse(false)
	lockoutpla:SetMovable(false)

	dummytextplayerpet:Hide()
	texdummyplayerpet:Hide()
	lockoutplayerpet:EnableMouse(false)
	lockoutplayerpet:SetMovable(false)

	dummytexttar:Hide()
	texdummytar:Hide()
	lockouttar:EnableMouse(false)
	lockouttar:SetMovable(false)

	dummytextfoc:Hide()
	texdummyfoc:Hide()
	lockoutfoc:EnableMouse(false)
	lockoutfoc:SetMovable(false)

	dummytextparty1:Hide()
	texdummyparty1:Hide()
	lockoutparty1:EnableMouse(false)
	lockoutparty1:SetMovable(false)

	dummytextpartypet1:Hide()
	texdummypartypet1:Hide()
	lockoutpartypet1:EnableMouse(false)
	lockoutpartypet1:SetMovable(false)

	dummytextparty2:Hide()
	texdummyparty2:Hide()
	lockoutparty2:EnableMouse(false)
	lockoutparty2:SetMovable(false)

	dummytextpartypet2:Hide()
	texdummypartypet2:Hide()
	lockoutpartypet2:EnableMouse(false)
	lockoutpartypet2:SetMovable(false)

	dummytextarena1:Hide()
	texdummyarena1:Hide()
	lockoutarena1:EnableMouse(false)
	lockoutarena1:SetMovable(false)

	dummytextarenapet1:Hide()
	texdummyarenapet1:Hide()
	lockoutarenapet1:EnableMouse(false)
	lockoutarenapet1:SetMovable(false)

	dummytextarena2:Hide()
	texdummyarena2:Hide()
	lockoutarena2:EnableMouse(false)
	lockoutarena2:SetMovable(false)

	dummytextarenapet2:Hide()
	texdummyarenapet2:Hide()
	lockoutarenapet2:EnableMouse(false)
	lockoutarenapet2:SetMovable(false)

	dummytextarena3:Hide()
	texdummyarena3:Hide()
	lockoutarena3:EnableMouse(false)
	lockoutarena3:SetMovable(false)

	dummytextarenapet3:Hide()
	texdummyarenapet3:Hide()
	lockoutarenapet3:EnableMouse(false)
	lockoutarenapet3:SetMovable(false)
end

SLASH_LO1 = "/lockout"
SLASH_LO2 = "/lock"
SLASH_LO3 = "/lo"
SlashCmdList["LO"] = function()
	OpenLockoutUI_Toggle()
end

local function Lockout_Open()
	if LockoutDB.defaults.lockout_showplayer == true then
		dummytextpla:Show()
		texdummypla:Show()
	end
	lockoutpla:EnableMouse(true)
	lockoutpla:SetMovable(true)

	if LockoutDB.defaults.lockout_showplayerpet == true then
		dummytextplayerpet:Show()
		texdummyplayerpet:Show()
	end
	lockoutplayerpet:EnableMouse(true)
	lockoutplayerpet:SetMovable(true)

	if LockoutDB.defaults.lockout_showtarget == true then
		dummytexttar:Show()
		texdummytar:Show()
	end
	lockouttar:EnableMouse(true)
	lockouttar:SetMovable(true)

	if LockoutDB.defaults.lockout_showfocus == true then
		dummytextfoc:Show()
		texdummyfoc:Show()
	end
	lockoutfoc:EnableMouse(true)
	lockoutfoc:SetMovable(true)

	if LockoutDB.defaults.lockout_showparty1 == true then
		dummytextparty1:Show()
		texdummyparty1:Show()
	end
	lockoutparty1:EnableMouse(true)
	lockoutparty1:SetMovable(true)

	if LockoutDB.defaults.lockout_showpartypet1 == true then
		dummytextpartypet1:Show()
		texdummypartypet1:Show()
	end
	lockoutpartypet1:EnableMouse(true)
	lockoutpartypet1:SetMovable(true)

	if LockoutDB.defaults.lockout_showparty2 == true then
		dummytextparty2:Show()
		texdummyparty2:Show()
	end
	lockoutparty2:EnableMouse(true)
	lockoutparty2:SetMovable(true)

	if LockoutDB.defaults.lockout_showpartypet2 == true then
		dummytextpartypet2:Show()
		texdummypartypet2:Show()
	end
	lockoutpartypet2:EnableMouse(true)
	lockoutpartypet2:SetMovable(true)

	if LockoutDB.defaults.lockout_showarena1 == true then
		dummytextarena1:Show()
		texdummyarena1:Show()
	end
	lockoutarena1:EnableMouse(true)
	lockoutarena1:SetMovable(true)

	if LockoutDB.defaults.lockout_showarenapet1 == true then
		dummytextarenapet1:Show()
		texdummyarenapet1:Show()
	end
	lockoutarenapet1:EnableMouse(true)
	lockoutarenapet1:SetMovable(true)

	if LockoutDB.defaults.lockout_showarena2 == true then
		dummytextarena2:Show()
		texdummyarena2:Show()
	end
	lockoutarena2:EnableMouse(true)
	lockoutarena2:SetMovable(true)

	if LockoutDB.defaults.lockout_showarenapet2 == true then
		dummytextarenapet2:Show()
		texdummyarenapet2:Show()
	end
	lockoutarenapet2:EnableMouse(true)
	lockoutarenapet2:SetMovable(true)

	if LockoutDB.defaults.lockout_showarena3 == true then
		dummytextarena3:Show()
		texdummyarena3:Show()
	end
	lockoutarena3:EnableMouse(true)
	lockoutarena3:SetMovable(true)

	if LockoutDB.defaults.lockout_showarenapet3 == true then
		dummytextarenapet3:Show()
		texdummyarenapet3:Show()
	end
	lockoutarenapet3:EnableMouse(true)
	lockoutarenapet3:SetMovable(true)
end

function OpenLockoutUI_Toggle()
    if (Lockout_Frame:IsShown() ) then
        Lockout_Close()
    else
        Lockout_Frame:Show()
		Lockout_Open()
    end
end

-- Скрываем окно настроек эскейпом
hooksecurefunc("ToggleGameMenu", function()
    if (Lockout_Frame:IsShown() ) then
        if (GameMenuFrame:IsShown() ) then
            HideUIPanel(GameMenuFrame)
        end
        Lockout_Close()
    end
end)

lockoutpla:SetScript("OnMouseDown", function (self, button)
lockoutpla:StartMoving()
end)
lockoutpla:SetScript("OnMouseUp", function (self, button)
lockoutpla:StopMovingOrSizing()
LockoutDB.positions.lockout_playerxoffset = lockoutpla:GetLeft()
LockoutDB.positions.lockout_playeryoffset = lockoutpla:GetBottom()
end)

lockoutplayerpet:SetScript("OnMouseDown", function (self, button)
lockoutplayerpet:StartMoving()
end)
lockoutplayerpet:SetScript("OnMouseUp", function (self, button)
lockoutplayerpet:StopMovingOrSizing()
LockoutDB.positions.lockout_playerpetxoffset = lockoutplayerpet:GetLeft()
LockoutDB.positions.lockout_playerpetyoffset = lockoutplayerpet:GetBottom()
end)

lockouttar:SetScript("OnMouseDown", function (self, button)
lockouttar:StartMoving()
end)
lockouttar:SetScript("OnMouseUp", function (self, button)
lockouttar:StopMovingOrSizing()
LockoutDB.positions.lockout_targetxoffset = lockouttar:GetLeft()
LockoutDB.positions.lockout_targetyoffset = lockouttar:GetBottom()
end)

lockoutfoc:SetScript("OnMouseDown", function (self, button)
lockoutfoc:StartMoving()
end)
lockoutfoc:SetScript("OnMouseUp", function (self, button)
lockoutfoc:StopMovingOrSizing()
LockoutDB.positions.lockout_focusxoffset = lockoutfoc:GetLeft()
LockoutDB.positions.lockout_focusyoffset = lockoutfoc:GetBottom()
end)

lockoutparty1:SetScript("OnMouseDown", function (self, button)
lockoutparty1:StartMoving()
end)
lockoutparty1:SetScript("OnMouseUp", function (self, button)
lockoutparty1:StopMovingOrSizing()
LockoutDB.positions.lockout_party1xoffset = lockoutparty1:GetLeft()
LockoutDB.positions.lockout_party1yoffset = lockoutparty1:GetBottom()
end)

lockoutpartypet1:SetScript("OnMouseDown", function (self, button)
lockoutpartypet1:StartMoving()
end)
lockoutpartypet1:SetScript("OnMouseUp", function (self, button)
lockoutpartypet1:StopMovingOrSizing()
LockoutDB.positions.lockout_partypet1xoffset = lockoutpartypet1:GetLeft()
LockoutDB.positions.lockout_partypet1yoffset = lockoutpartypet1:GetBottom()
end)

lockoutparty2:SetScript("OnMouseDown", function (self, button)
lockoutparty2:StartMoving()
end)
lockoutparty2:SetScript("OnMouseUp", function (self, button)
lockoutparty2:StopMovingOrSizing()
LockoutDB.positions.lockout_party2xoffset = lockoutparty2:GetLeft()
LockoutDB.positions.lockout_party2yoffset = lockoutparty2:GetBottom()
end)

lockoutpartypet2:SetScript("OnMouseDown", function (self, button)
lockoutpartypet2:StartMoving()
end)
lockoutpartypet2:SetScript("OnMouseUp", function (self, button)
lockoutpartypet2:StopMovingOrSizing()
LockoutDB.positions.lockout_partypet2xoffset = lockoutpartypet2:GetLeft()
LockoutDB.positions.lockout_partypet2yoffset = lockoutpartypet2:GetBottom()
end)

lockoutarena1:SetScript("OnMouseDown", function (self, button)
lockoutarena1:StartMoving()
end)
lockoutarena1:SetScript("OnMouseUp", function (self, button)
lockoutarena1:StopMovingOrSizing()
LockoutDB.positions.lockout_arena1xoffset = lockoutarena1:GetLeft()
LockoutDB.positions.lockout_arena1yoffset = lockoutarena1:GetBottom()
end)

lockoutarenapet1:SetScript("OnMouseDown", function (self, button)
lockoutarenapet1:StartMoving()
end)
lockoutarenapet1:SetScript("OnMouseUp", function (self, button)
lockoutarenapet1:StopMovingOrSizing()
LockoutDB.positions.lockout_arenapet1xoffset = lockoutarenapet1:GetLeft()
LockoutDB.positions.lockout_arenapet1yoffset = lockoutarenapet1:GetBottom()
end)

lockoutarena2:SetScript("OnMouseDown", function (self, button)
lockoutarena2:StartMoving()
end)
lockoutarena2:SetScript("OnMouseUp", function (self, button)
lockoutarena2:StopMovingOrSizing()
LockoutDB.positions.lockout_arena2xoffset = lockoutarena2:GetLeft()
LockoutDB.positions.lockout_arena2yoffset = lockoutarena2:GetBottom()
end)

lockoutarenapet2:SetScript("OnMouseDown", function (self, button)
lockoutarenapet2:StartMoving()
end)
lockoutarenapet2:SetScript("OnMouseUp", function (self, button)
lockoutarenapet2:StopMovingOrSizing()
LockoutDB.positions.lockout_arenapet2xoffset = lockoutarenapet2:GetLeft()
LockoutDB.positions.lockout_arenapet2yoffset = lockoutarenapet2:GetBottom()
end)

lockoutarena3:SetScript("OnMouseDown", function (self, button)
lockoutarena3:StartMoving()
end)
lockoutarena3:SetScript("OnMouseUp", function (self, button)
lockoutarena3:StopMovingOrSizing()
LockoutDB.positions.lockout_arena3xoffset = lockoutarena3:GetLeft()
LockoutDB.positions.lockout_arena3yoffset = lockoutarena3:GetBottom()
end)

lockoutarenapet3:SetScript("OnMouseDown", function (self, button)
lockoutarenapet3:StartMoving()
end)
lockoutarenapet3:SetScript("OnMouseUp", function (self, button)
lockoutarenapet3:StopMovingOrSizing()
LockoutDB.positions.lockout_arenapet3xoffset = lockoutarenapet3:GetLeft()
LockoutDB.positions.lockout_arenapet3yoffset = lockoutarenapet3:GetBottom()
end)

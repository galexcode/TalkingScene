PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "ContentTable" ("ContentID" INTEGER NOT NULL , "SequenceID" INTEGER NOT NULL , "HeroID" INTEGER NOT NULL , "ContentText" TEXT NOT NULL , "ContentVoice" TEXT NOT NULL , "IsOrigin" BOOL NOT NULL  DEFAULT 0);
INSERT INTO "ContentTable" VALUES(1001,1,2001,'WORD_1Achievements','WORD_1.mp3',0);
INSERT INTO "ContentTable" VALUES(1001,2,2002,'WORD_2','WORD_2.mp3',0);
INSERT INTO "ContentTable" VALUES(1001,3,2001,'WORD_3','WORD_3.mp3',0);

CREATE TABLE "PlayerData" ("ID" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "EventName" TEXT NOT NULL , "EventValue" INTEGER NOT NULL , 'EventStringValue' TEXT,"DownloadDate" DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00');
INSERT INTO "PlayerData" VALUES(17,'TimesFailed',0,'','2013-06-10 00:00:00');
INSERT INTO "PlayerData" VALUES(18,'FirstInstallTime',-1,'','2013-06-10 00:00:00');
INSERT INTO "PlayerData" VALUES(19,'TotalPlayTimeInLevel',0,'','2013-06-10 00:00:00');

CREATE TABLE "HeroTable" ("HeroID" INTEGER PRIMARY KEY  NOT NULL ,"HeroName" TEXT NOT NULL  DEFAULT ('') ,"HeroIcon" TEXT NOT NULL  DEFAULT ('') ,"HeroBrief" TEXT NOT NULL  DEFAULT ('') ,'HeroStars' INTEGER NOT NULL DEFAULT 0);
INSERT INTO "HeroTable" VALUES(2001,'HN_SHU_WU_KONG_IAPInfo','HN_SHU_WU_KONG.png','HN_GUAN_SHI_YIN_BRF',0;
INSERT INTO "HeroTable" VALUES(2002,'HN_LIU_ER_MI_HOU','HN_LIU_ER_MI_HOU.png','HN_LIU_ER_MI_HOU_BRF',0);
INSERT INTO "HeroTable" VALUES(2003,'HN_GUAN_SHI_YIN','HN_GUAN_SHI_YIN.png','HN_GUAN_SHI_YIN_BRF',0);

CREATE TABLE "Settings" ("ID" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , "Name" TEXT NOT NULL , "Value" INTEGER NOT NULL  DEFAULT 0);
INSERT INTO "Settings" VALUES(0,'DatabaseVersion',1);
INSERT INTO "Settings" VALUES(10,'AudioOn',1);
INSERT INTO "Settings" VALUES(11,'MusicOn',1);
INSERT INTO "Settings" VALUES(12,'VoiceOn',0);
INSERT INTO "Settings" VALUES(13,'SubtitlesOn',1);
INSERT INTO "Settings" VALUES(20,'Graphics',-1);
INSERT INTO "Settings" VALUES(21,'TargetFramerate',-1);
INSERT INTO "Settings" VALUES(31,'AllowFacebookPublishing',-1);
INSERT INTO "Settings" VALUES(32,'CloudSync',0);
INSERT INTO "Settings" VALUES(33,'FirstLaunch', 1);
INSERT INTO "Settings" VALUES(34,'UsedHintsTutorial', 0);
INSERT INTO "Settings" VALUES(35,'HasSinaMicroBlog', 1);
INSERT INTO "Settings" VALUES(36,'HasChukongExchangeCode', 1);

CREATE TABLE "SceneTable" ("SceneID" INTEGER PRIMARY KEY  NOT NULL ,"SceneName" TEXT NOT NULL ,"SceneIcon" TEXT NOT NULL ,"SceneBrief" TEXT NOT NULL,"SceneStars" INTEGER NOT NULL  DEFAULT (0));
INSERT INTO "SceneTable" VALUES(3001,'SN_SAN_DA_BAI_GU_JING_LevelInfo','SAN_DA_BAI_GU_JING.png','SAN_DA_BAI_GU_JING_BRF',1);
INSERT INTO "SceneTable" VALUES(3002,'SN_NIV_ER_GUO','NIV_ER_GUO.png','NIV_ER_GUO_BRF',0);
INSERT INTO "SceneTable" VALUES(3003,'SN_DA_NAO_TIAN_KONG','DA_NAO_TIAN_KONG.png','DA_NAO_TIAN_KONG_BRF',1);

CREATE TABLE "StoreInfo" ("ID" INTEGER PRIMARY KEY  NOT NULL  UNIQUE ,"Coins" INTEGER DEFAULT 0,"Add_Coins" FLOAT DEFAULT 0,"Texture_Normal" TEXT DEFAULT '',"Texture_Pressed" TEXT DEFAULT '',"Coins_Icon" TEXT DEFAULT '',"Hot_Icon" TEXT DEFAULT '',"Discount_Icon" TEXT DEFAULT '', "IAP_item_id" TEXT DEFAULT '', "Coins_Price" TEXT DEFAULT '',"Hot_Label" TEXT DEFAULT '',"Discount_Label" TEXT DEFAULT '');
INSERT INTO "StoreInfo" VALUES(1,1000,0,'UI_Store_btn_price_normal.webp','UI_Store_btn_price_pressed.webp','UI_Store_coin05.webp','','','coins_01','COINS_PRICE_IOS_01','','');
INSERT INTO "StoreInfo" VALUES(2,2100,0,'','','UI_Store_coin06.webp','','','coins_02','COINS_PRICE_IOS_02','','');

CREATE TABLE "StoryTable" ("StoryID" INTEGER PRIMARY KEY NOT NULL UNIQUE, "StoryName" TEXT NOT NULL DEFAULT 'ST_', "StroyIcon" TEXT NOT NULL,  "StoryBrief" TEXT NOT NULL DEFAULT '_BRF', "StoryAuthor" TEXT NOT NULL DEFAULT '_ATH', "StoryStars" INTEGER,NOT NULL  DEFAULT (0));
INSERT INTO "StoryTable" VALUES(4001,'ST_XI_YOU_JI_PowerUpInfo','XI_YOU_JI.png','XI_YOU_JI_BRF','XI_YOU_JI_ATH',1);
INSERT INTO "StoryTable" VALUES(4002,'ST_DA_CHANG_JIN','DA_CHANG_JIN.png','DA_CHANG_JIN_BRF','DA_CHANG_JIN_ATH',1);

DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('PlayerData',14);
INSERT INTO "sqlite_sequence" VALUES('Settings',32);

CREATE TABLE "StoryFScene" ("StoryID" INTEGER NOT NULL, "SceneID" INTEGER NOT NULL);
INSERT INTO "StoryFScene" VALUES(4001, 3001);
INSERT INTO "StoryFScene" VALUES(4001, 3002);
INSERT INTO "StoryFScene" VALUES(4001, 3003);
INSERT INTO "StoryFScene" VALUES(4002, 3004);

CREATE TABLE "SceneFContent" ("SceneID" INTEGER NOT NULL, "ContentID" INTEGER NOT NULL);
INSERT INTO "SceneFContent" VALUES(3001,1001);
INSERT INTO "SceneFContent" VALUES(3001,1002);
INSERT INTO "SceneFContent" VALUES(3002,1003);
INSERT INTO "SceneFContent" VALUES(3003,1004);

CREATE TABLE "UserPlayTable" ("UserID" INTEGER NOT NULL, "PlayDate" DATETIME NOT NULL DEFAULT '2013-01-01 00:00:00', "StroyID" INTEGER NOT NULL, "SceneID" INTEGER NOT NULL,"HeroID" INTEGER NOT NULL);
INSERT INTO "UserPlayTable" VALUES(5001,'2013-01-01 00:00:00',4001,3001,2001);
INSERT INTO "UserPlayTable" VALUES(5001,'2013-01-01 00:00:00',4002,3001,2002);
INSERT INTO "UserPlayTable" VALUES(5001,'2013-01-01 00:00:00',4003,3002,2003);
INSERT INTO "UserPlayTable" VALUES(5001,'2013-01-01 00:00:00',4004,3003,2004);

COMMIT;

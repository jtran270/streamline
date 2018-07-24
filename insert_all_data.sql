/*
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
*/
-- Delete from tables if there are any existing values
DELETE FROM ArtistUserid;
DELETE FROM ArtistEmail;
DELETE FROM ArtistName;
DELETE FROM Album;
DELETE FROM ContainSong;
DELETE FROM CreateAlbum;
DELETE FROM CreatePlaylist;
DELETE FROM PlaylistIncludesSongs;
DELETE FROM ListenerUserID;
DELETE FROM ListenerEmail;
DELETE FROM Genre;
DELETE FROM HaveSongs;
DELETE FROM IsParentOfLabel;
DELETE FROM Label;
DELETE FROM UnderLabel;

----------------------------------- Artist -----------------------------------
INSERT INTO ArtistUserid(userid,email,stagename)
VALUES
(1,'jcube@enterprise.ca','JCUBE'),
(2,'hcmcg@dawg.com','HCMCGangster'),
(3,'fufusu@fufusu.com','Fufusu'),
(4,'yangboss@boss.com','YangBoss'),
(5,'hbrother@rising.com','Higher Brothers');

INSERT INTO ArtistEmail(email,password)
VALUES
('jcube@enterprise.ca','jcube123@09'),
('hcmcg@dawg.com','hcmcg456-0'),
('fufusu@fufusu.com','fufusu567==='),
('yangboss@boss.com','bossishere'),
('hbrother@rising.com','higherbroz5');

INSERT INTO ArtistName(stagename,firstname,lastname)
VALUES
('JCUBE','Juno','Sohn'),
('HCMCGangster','Jessie','Tran'),
('Fufusu','Frank','Su'),
('YangBoss','Michael','Yang'),
('Higher Brothers','Masi','Wei');
----------------------------------- Listener -----------------------------------
INSERT INTO ListenerUserID (UserID,Email,FirstName,LastName,Age)
VALUES
(6, 'dog@dog.com', 'John', 'Doe', 23),
(7,	'mouse@mouse.com', 'Mary', 'Jane', 15),
(8,	'lion@lion.com', 'Simon', 'Smith', 7),
(9, 'cat@cat.com', 'Neko', 'Kawaii', 14),
(10, 'jesus@holywater.com',	'Jesus', 'Christ',2018);

INSERT INTO ListenerEmail (Email, Password)
VALUES
('dog@dog.com', '12345'),
('mouse@mouse.com', 'iluvyou'),
('lion@lion.com', '11111'),
('cat@cat.com', '12345'),
('jesus@holywater.com', 'qwerty');
----------------------------------- Album -----------------------------------
INSERT INTO Album(AlbumID,AlbumArt,AlbumName)
VALUES
(1,'deephouse.jpg','Deep Jouse'),
(2,'trap.jpg','Troy'),
(3,'dawg.jpg','Fufusu'),
(4,'boss.png','IamBoss'),
(5,'711.jpg','7-Eleven');

INSERT INTO CreateAlbum(UserId,AlbumID,CreationDate)
VALUES
(1,1,'2018-06-20'),
(2,2,'2018-06-21'),
(3,3,'2018-06-22'),
(4,4,'2018-06-23'),
(5,5,'2018-06-24');
------------------------------ Genre -----------------------------------
INSERT INTO Genre (GenreName)
VALUES
('Hip pop'),
('Rap'),
('Trap'),
('Deep House'),
('House'),
('Pop'),
('Techno');

------------------------------ Labels -----------------------------------
INSERT INTO Label (LabelName)
VALUES
('Omniversal Music Group'),
('Bony Entertainment'),
('Under Dawg Entertainment'),
('Old Money Entertainment'),
('Ric Nation LLC'),
('YoBoss Inc.'),
('88 Rising');

INSERT INTO IsParentOfLabel(ParentLabelName,SubLabelName)
VALUES
('Bony Entertainment','Under Dawg Entertainment'),
('Bony Entertainment','Ric Nation LLC'),
('Omniversal Music Group','Old Money Entertainment'),
('Omniversal Music Group','YoBoss Inc.');

INSERT INTO UnderLabel (UserID, AlbumID, LabelName)
VALUES
(1,1,'Omniversal Music Group'),
(2,2,'Ric Nation LLC'),
(3,3,'Under Dawg Entertainment'),
(4,4,'YoBoss Inc.'),
(5,5,'88 Rising');
------------------------------ ContainSong -----------------------------------
INSERT INTO ContainSong(AlbumID,SongName,TrackLength)
VALUES
(1,'Jouse Flow','00:05:00'),
(1,'Private Selec.','00:03:40'),
(1,'Bliss','00:02:59'),
(2,'Sad Boi','00:03:21'),
(2,'Cries','00:04:00'),
(2,'Trap Nation','00:03:20'),
(3,'Fufusu','00:04:38'),
(3,'I am a sinner','00:08:08'),
(4,'Boss','00:06:09'),
(4,'BossMama','00:04:12'),
(5,'7-11','00:04:29'),
(5,'Storm','00:02:38');
-- should be after containsong
INSERT INTO HaveSongs (AlbumID,SongName,GenreName)
VALUES
(1,'Jouse Flow','Deep House'),
(1,'Private Selec.','Deep House'),
(2,'Sad Boi','Rap'),
(2,'Trap Nation','Trap'),
(3,'Fufusu','Techno'),
(4,'Boss','House'),
(5,'Storm','Pop');

INSERT INTO CreatePlaylist(UserID,PlayListName)
VALUES
(6, 'Babe coming over'),
(6, 'Chill'),
(8, 'Sad song for a sad boi'),
(9, 'Favorites'),
(9, 'Study playlist'),
(9, 'Moms home playlist'),
(10, 'Gospels only Praise the Holy Father');

INSERT INTO PlaylistIncludesSongs (AlbumID, SongName, UserID, PlayListName)
VALUES
(1, 'Private Selec.', 6, 'Babe coming over'),
(1, 'Bliss', 6, 'Babe coming over'),
(5, '7-11', 6, 'Chill'),
(2, 'Sad Boi', 8, 'Sad song for a sad boi'),
(2, 'Cries', 8, 'Sad song for a sad boi'),
(1, 'Jouse Flow', 9, 'Study playlist'),
(4, 'BossMama', 9, 'Moms home playlist'),
(2, 'Trap Nation', 9, 'Favorites'),
(3, 'I am a sinner', 10, 'Gospels only Praise the Holy Father');

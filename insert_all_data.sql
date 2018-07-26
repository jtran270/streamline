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
(5,'711.jpg','7-Eleven'),
(6,'sassy.jpg','Meme');

INSERT INTO CreateAlbum(UserId,AlbumID,CreationDate)
VALUES
(1,1,'2018-06-20'),
(2,2,'2018-06-21'),
(3,3,'2018-06-22'),
(4,4,'2018-06-23'),
(5,5,'2018-06-24'),
(5,6,'2018-06-25');
------------------------------ Genre -----------------------------------
INSERT INTO Genre (GenreName)
VALUES
('Hip Hop'),
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
(5,5,'88 Rising'),
(5,6,'88 Rising');
------------------------------ ContainSong -----------------------------------
INSERT INTO ContainSong(AlbumID,SongName,TrackLength)
VALUES
(1,'Jouse Flow','00:05:00'),
(1,'Private Selec.','00:03:40'),
(1,'Bliss','00:02:59'),
(1,'God is a Woman','00:05:00'),
(1,'Toxic','00:03:21'),
(2,'Sad Boi','00:03:21'),
(2,'Cries','00:04:00'),
(2,'Trap Nation','00:03:20'),
(2,'Radar','00:03:25'),
(2,'Call Me','00:05:17'),
(3,'Fufusu','00:04:38'),
(3,'I am a sinner','00:08:08'),
(3,'Warm on a Cold Night','00:05:05'),
(3,'Just Spin','00:04:04'),
(3,'All Eyes on Me','00:05:07'),
(4,'Boss','00:06:09'),
(4,'BossMama','00:04:12'),
(4,'I Got You','00:04:55'),
(4,'Location Unknown','00:03:56'),
(4,'Day 1','00:03:55'),
(5,'7-11','00:04:29'),
(5,'Lemme Take a Selfie','00:05:23'),
(5,'Me & You','00:02:56'),
(5,'Sassy','00:04:35'),
(5,'Storm','00:02:38'),
(6,'Forget Me Not','00:05:34'),
(6,'Meme','00:05:22'),
(6,'Blood Orange','00:04:23'),
(6,'306','00:03:29'),
(6,'Just Dance','00:04:52');

-- should be after containsong
INSERT INTO HaveSongs (AlbumID,SongName,GenreName)
VALUES
(1,'Jouse Flow','Deep House'),
(1,'Private Selec.','Deep House'),
(1,'Bliss','Deep House'),
(1,'God is a Woman','Deep House'),
(1,'Toxic','Deep House'),
(2,'Sad Boi','Rap'),
(2,'Cries','Trap'),
(2,'Trap Nation','Rap'),
(2,'Radar','Trap'),
(2,'Call Me','Rap'),
(3,'Fufusu','Techno'),
(3,'I am a sinner','Pop'),
(3,'Warm on a Cold Night','Techno'),
(3,'Just Spin','Pop'),
(3,'All Eyes on Me','Pop'),
(4,'Boss','House'),
(4,'BossMama','House'),
(4,'I Got You','House'),
(4,'Location Unknown','House'),
(4,'Day 1','House'),
(5,'7-11','Hip Hop'),
(5,'Lemme Take a Selfie','Hip Hop'),
(5,'Me & You','Hip Hop'),
(5,'Sassy','Hip Hop'),
(5,'Storm','Hip Hop'),
(6,'Forget Me Not','Hip Hop'),
(6,'Meme','Pop'),
(6,'Blood Orange','Pop'),
(6,'306','Pop'),
(6,'Just Dance','Pop');

INSERT INTO CreatePlaylist(UserID,PlayListName)
VALUES
(6, 'Babe coming over'),
(6, 'Chill'),
(7,'Spin Hit'),
(7,'Beach'),
(7,'Inner Peace'),
(8, 'Sad song for a sad boi'),
(8,'This is Us'),
(9, 'Favorites'),
(9, 'Study playlist'),
(9, 'Moms home playlist'),
(10, 'Gospels only Praise the Holy Father');

INSERT INTO PlaylistIncludesSongs (AlbumID, SongName, UserID, PlayListName)
VALUES
(1, 'Private Selec.', 6, 'Babe coming over'),
(1, 'Bliss', 6, 'Babe coming over'),
(1,'God is a Woman',6,'Babe coming over'),
(3,'I am a sinner',6,'Babe coming over'),
(5,'Lemme Take a Selfie',6,'Babe coming over'),
(6,'Just Dance',6,'Babe coming over'),
(1,'God is a Woman',6,'Chill'),
(5, '7-11', 6, 'Chill'),
(6,'Just Dance',6,'Chill'),
(2,'Sad Boi',7,'Spin Hit'),
(6,'Just Dance',7,'Spin Hit'),
(3,'Warm on a Cold Night',7,'Spin Hit'),
(3,'Just Spin',7,'Spin Hit'),
(2,'Sad Boi',7,'Beach'),
(6,'Just Dance',7,'Beach'),
(1,'Toxic',7,'Beach'),
(2,'Sad Boi',7,'Inner Peace'),
(6,'Just Dance',7,'Inner Peace'),
(4,'I Got You',7,'Inner Peace'),
(5,'Me & You',7,'Inner Peace'),
(5,'Storm',7,'Inner Peace'),
(2, 'Sad Boi', 8, 'Sad song for a sad boi'),
(2, 'Cries', 8, 'Sad song for a sad boi'),
(6,'Just Dance',8,'Sad song for a sad boi'),
(6,'Just Dance',8,'This is Us'),
(5,'Storm',8,'This is Us'),
(5,'Sassy',8,'This is Us'),
(5,'7-11',8,'This is Us'),
(4,'Day 1',8,'This is Us'),
(4,'Location Unknown',8,'This is Us'),
(1, 'Jouse Flow', 9, 'Study playlist'),
(6,'Just Dance',9,'Study playlist'),
(1,'Toxic',9,'Study playlist'),
(2,'Radar',9,'Study playlist'),
(2,'Call Me',9,'Study playlist'),
(4, 'BossMama', 9, 'Moms home playlist'),
(6,'Just Dance',9,'Moms home playlist'),
(1,'Toxic',9,'Moms home playlist'),
(3,'Warm on a Cold Night',9,'Moms home playlist'),
(2, 'Trap Nation', 9, 'Favorites'),
(6,'Just Dance',9,'Favorites'),
(1,'Toxic',9,'Favorites'),
(3,'All Eyes on Me',9,'Favorites'),
(6,'Just Dance',10,'Gospels only Praise the Holy Father'),
(4,'BossMama',10,'Gospels only Praise the Holy Father'),
(3, 'I am a sinner', 10, 'Gospels only Praise the Holy Father'),
(5,'Lemme Take a Selfie',10,'Gospels only Praise the Holy Father'),
(6,'Forget Me Not',10,'Gospels only Praise the Holy Father'),
(1,'Bliss',10,'Gospels only Praise the Holy Father'),
(2,'Trap Nation',10,'Gospels only Praise the Holy Father'),
(6,'Blood Orange',10,'Gospels only Praise the Holy Father');

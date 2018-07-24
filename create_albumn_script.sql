/*
Artist_User_ID(User_ID, Email, Stage_Name)
Artist_Email(Email, Password)
Artist_Name(Stage_Name, First_Name, Last_Name)

Album(Album_ID, Album_Art, Album_Name)
Contain_Song(Album_ID, Song_Name, Track_Length)

Create(User_ID, Album_ID, Creation_Date)

//
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
//
//
artistuserid
artistemail
artistname

*/
-- Delete from tables if there are any existing values
DELETE FROM ArtistUserid;
DELETE FROM ArtistEmail;
DELETE FROM ArtistName;
DELETE FROM Album;

INSERT INTO ArtistUserid(userid,email,stagename)
VALUES (1,'jcube@enterprise.ca','JCUBE'),
        (2,'hcmcg@dawg.com','HCMCGangster'),
        (3,'fufusu@fufusu.com','Fufusu'),
        (4,'yangboss@boss.com','YangBoss'),
        (5,'hbrother@rising.com','Higher Brothers');

INSERT INTO ArtistEmail(email,password)
VALUES ('jcube@enterprise.ca','jcube123@09'),
      ('hcmcg@dawg.com','hcmcg456-0'),
      ('fufusu@fufusu.com','fufusu567==='),
      ('yangboss@boss.com','bossishere'),
      ('hbrother@rising.com','higherbroz5');

INSERT INTO ArtistName(stagename,firstname,lastname)
VALUES ('JCUBE','Juno','Sohn'),
        ('HCMCGangster','Jessie','Tran'),
        ('Fufusu','Frank','Su'),
        ('YangBoss','Michael','Yang'),
        ('Higher Brothers','Masi','Wei');

INSERT INTO Album(AlbumID,AlbumArt,AlbumName)
VALUES (1,'deephouse.jpg','Deep Jouse'),
        (2,'trap.jpg','Troy'),
        (3,'dawg.jpg','Fufusu'),
        (4,'boss.png','IamBoss'),
        (5,'711.jpg','7-Eleven');

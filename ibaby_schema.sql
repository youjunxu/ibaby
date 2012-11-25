DROP TABLE IF EXISTS `tb_rates`;
CREATE TABLE `tb_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `tb_ratings`;
CREATE TABLE `tb_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ratings_on_rate_id` (`rate_id`),
  KEY `index_ratings_on_ratable_id_and_ratable_type` (`ratable_id`,`ratable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_taggings`;
CREATE TABLE `tb_taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `catalog_id` int(8) unsigned DEFAULT 0,
  `parent_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name_and_catalog` (`name`,`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_batype`;
CREATE TABLE `tb_batype` (
  `lmid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lmname` varchar(100) NOT NULL,
  PRIMARY KEY (`lmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `tb_aclinfo`;
CREATE TABLE `tb_aclinfo` (
  `aclid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `acllevel` int(11) NOT NULL,
  `acldes` varchar(200) NOT NULL,
  `dtavil` datetime DEFAULT NULL,
  `dtsxrq` datetime DEFAULT NULL,
  `mkcode` varchar(50) DEFAULT NULL,
  `mkname` varchar(100) DEFAULT NULL,
  `STRCONTENT` text,
  PRIMARY KEY (`aclid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tb_acllevel`;
CREATE TABLE `tb_acllevel` (
  `acllevel` int(11) NOT NULL,
  `acldes` varchar(200) NOT NULL,
  PRIMARY KEY (`acllevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_ACTLY`;
CREATE TABLE `TB_ACTLY` (
  `LYID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ACTID` int(11) DEFAULT NULL,
  `ACTNAME` varchar(100) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `LYCONTENT` text NOT NULL,
  `USERID` int(11) NOT NULL,
  `NICKNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`LYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_ACTXX`;
CREATE TABLE `TB_ACTXX` (
  `ACTID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ACTNAME` varchar(100) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `ACTCONTENT` text,
  `DTSTART` datetime NOT NULL,
  `DTEND` datetime NOT NULL,
  `ACTIMG` varchar(50) NOT NULL,
  `ACTSTATUS` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `JPJS` text,
  `PHOTOWIDTH` int(11) DEFAULT NULL,
  `PHOTOHEIGHT` int(11) DEFAULT NULL,
  `HDJS` varchar(200) DEFAULT NULL,
  `ACTLINK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ACTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_BADOCSH`;
CREATE TABLE `TB_BADOCSH` (
  `REEDIT` int(11) NOT NULL,
  `SHKEY` varchar(200) NOT NULL,
  `DTUPDATE` datetime NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_CITY`;
CREATE TABLE `TB_CITY` (
  `CITYID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SSNAME` varchar(50) NOT NULL,
  `CITYNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CITYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_GG`;
CREATE TABLE `TB_GG` (
  `GGID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `MKCODE` varchar(50) NOT NULL,
  `STRTITLE` varchar(100) NOT NULL,
  `STRCONTENT` text NOT NULL,
  `USERID` int(11) NOT NULL,
  `STRAUTHOR` varchar(50) DEFAULT NULL,
  `DTCREA` datetime DEFAULT NULL,
  PRIMARY KEY (`GGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_HOMEJS`;
CREATE TABLE `TB_HOMEJS` (
  `JSID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `JSTITLE` varchar(200) NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `STRCONTENT` varchar(50) DEFAULT NULL,
  `DTCREA` datetime NOT NULL,
  `STRMEMO` text,
  `DOCLEVEL` int(11) DEFAULT NULL,
  `DOCPASS` varchar(50) DEFAULT NULL,
  `SHBJ` int(11) DEFAULT NULL,
  `SHRQ` datetime DEFAULT NULL,
  `SHUSERID` int(11) DEFAULT NULL,
  `SHUSERNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`JSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_INBOX`;
CREATE TABLE `TB_INBOX` (
  `XXID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SENDUSERID` int(11) DEFAULT NULL,
  `SENDUSERNAME` varchar(50) DEFAULT NULL,
  `RECUSERID` int(11) DEFAULT NULL,
  `RECUSERNAME` varchar(50) DEFAULT NULL,
  `DTSEND` varchar(50) DEFAULT NULL,
  `XXTITLE` varchar(50) DEFAULT NULL,
  `XXBODY` text,
  `YDBJ` int(11) DEFAULT NULL,
  `XSOUT` int(11) DEFAULT NULL,
  `XSIN` int(11) DEFAULT NULL,
  `hfXxId` int(11) DEFAULT NULL,
  PRIMARY KEY (`XXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_LINEIGO`;
CREATE TABLE `TB_LINEIGO` (
  `IGOID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `IGOTYPEID` int(11) NOT NULL,
  `IGOTYPENAME` varchar(50) NOT NULL,
  `BRANDID` int(11) NOT NULL,
  `BRANDNAME` varchar(50) NOT NULL,
  `IGONAME` varchar(50) NOT NULL,
  `IGOORIGINAL` varchar(100) DEFAULT NULL,
  `IGOSECTION` varchar(50) DEFAULT NULL,
  `IGOGUIDE` decimal(5,2) DEFAULT NULL,
  `IGOSHMCA` varchar(80) DEFAULT NULL,
  `IGOSHMCB` varchar(80) DEFAULT NULL,
  `IGOSHLINK` varchar(200) DEFAULT NULL,
  `IGOXY` int(11) DEFAULT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `DTUPDATE` datetime NOT NULL,
  `SPIMG` varchar(50) NOT NULL,
  `STRZBMC` varchar(50) DEFAULT NULL,
  `STRZBDW` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IGOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_LMBAEJ`;
CREATE TABLE `TB_LMBAEJ` (
  `EJID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `EJNAME` varchar(50) NOT NULL,
  `SYPHOTO` varchar(100) DEFAULT NULL,
  `HOMEXY` varchar(200) DEFAULT NULL,
  `GRLABLE` varchar(100) DEFAULT NULL,
  `DTUPDATE` datetime NOT NULL,
  `STRCONTENT` text,
  `INTREADERS` int(11) NOT NULL,
  `PHOTOSTATUS` int(11) NOT NULL,
  `INTTXSH` int(11) DEFAULT NULL,
  PRIMARY KEY (`EJID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_LMBAXY`;
CREATE TABLE `TB_LMBAXY` (
  `BAID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `STRTITLE` varchar(200) NOT NULL,
  `STRAUTHOR` varchar(50) NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `FROMNAME` varchar(200) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `STRCONTENT` varchar(500) DEFAULT NULL,
  `STRMEMO` text,
  `READERS` int(11) DEFAULT NULL,
  `LMCODE` int(11) DEFAULT NULL,
  `LMNAME` varchar(100) DEFAULT NULL,
  `STRLABLE` varchar(200) DEFAULT NULL,
  `PLZANS` int(11) DEFAULT NULL,
  `PLFLOWERS` int(11) DEFAULT NULL,
  `PLHANDS` int(11) DEFAULT NULL,
  `PLYMS` int(11) DEFAULT NULL,
  `PLCAIS` int(11) DEFAULT NULL,
  `SHBJ` int(11) DEFAULT NULL,
  `SHRQ` datetime DEFAULT NULL,
  `SHUSERID` int(11) DEFAULT NULL,
  `SHUSERNAME` varchar(50) DEFAULT NULL,
  `SHLY` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`BAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


  
DROP TABLE IF EXISTS `TB_LMSPPL`;
CREATE TABLE `TB_LMSPPL` (
  `PLID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SPID` int(11) NOT NULL,
  `SPTITLE` varchar(200) NOT NULL,
  `USERID` int(11) NOT NULL,
  `STRAUTHOR` varchar(50) NOT NULL,
  `PLDATE` datetime NOT NULL,
  `FSMYD` int(11) DEFAULT NULL,
  `FSKG` int(11) DEFAULT NULL,
  `FSSYX` int(11) DEFAULT NULL,
  `FSXJB` int(11) DEFAULT NULL,
  `STRCONTENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_LMSPZZ`;
CREATE TABLE `TB_LMSPZZ` (
  `ZZID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SPTITLE` varchar(200) NOT NULL,
  `USERID` int(11) NOT NULL,
  `STRAUTHOR` varchar(50) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `LBCODE` int(11) DEFAULT NULL,
  `LBNAME` varchar(50) DEFAULT NULL,
  `BRANDCODE` int(11) DEFAULT NULL,
  `BRANDNAME` varchar(50) DEFAULT NULL,
  `SPPRICE` int(11) DEFAULT NULL,
  `STRXQ` varchar(50) DEFAULT NULL,
  `STRCONTENT` varchar(500) DEFAULT NULL,
  `FLAGTJ` int(11) DEFAULT NULL,
  `STRZZIMG` varchar(100) DEFAULT NULL,
  `FSMYD` int(11) DEFAULT NULL,
  `FSKG` int(11) DEFAULT NULL,
  `FSSYX` int(11) DEFAULT NULL,
  `FSXJB` int(11) DEFAULT NULL,
  `INTREADERS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZZID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `TB_LOGINFO`;
CREATE TABLE `TB_LOGINFO` (
  `LOGID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `CZDATE` datetime NOT NULL,
  `OPERATORDESC` varchar(500) NOT NULL,
  `CNAME` varchar(50) DEFAULT NULL,
  `LOGIP` varchar(50) NOT NULL,
  `STRCONTENT` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`LOGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_LOGMEMO`;
CREATE TABLE `TB_LOGMEMO` (
  `LOGID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `OBJECTNAME` varchar(50) NOT NULL,
  `BEFORECZ` varchar(300) NOT NULL,
  `AFTERCZ` varchar(300) NOT NULL,
  `STRCONTENT` text NOT NULL,
  PRIMARY KEY (`LOGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_MAILINFO`;
CREATE TABLE `TB_MAILINFO` (
  `USERNAME` varchar(50) NOT NULL,
  `USERPASS` varchar(50) NOT NULL,
  `SMTPNAME` varchar(50) NOT NULL,
  `MAILPORT` varchar(50) NOT NULL,
  `MAILADDR` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `TB_MEMBERGZ`;
CREATE TABLE `TB_MEMBERGZ` (
  `GZID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `GZUSERID` int(11) NOT NULL,
  `GZUSERNAME` varchar(50) NOT NULL,
  `BGZUSERID` int(11) NOT NULL,
  `BGZUSERNAME` varchar(50) NOT NULL,
  `DTGZDATE` datetime NOT NULL,
  PRIMARY KEY (`GZID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_MEMBERJFGZ`;
CREATE TABLE `TB_MEMBERJFGZ` (
  `GZID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `GZCODE` varchar(10) DEFAULT NULL,
  `JFS` float NOT NULL,
  `DTUPDATE` datetime DEFAULT NULL,
  `strContent` varchar(200) DEFAULT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `JFDW` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GZID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_MEMBERJFXF`;
CREATE TABLE `TB_MEMBERJFXF` (
  `SPANDID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `XFJF` float NOT NULL,
  `DTXFDATE` datetime DEFAULT NULL,
  `XFDESC` varchar(200) DEFAULT NULL,
  `GZID` int(11) DEFAULT NULL,
  `GZCODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SPANDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_MODULE`;
CREATE TABLE `TB_MODULE` (
  `MKID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `MKSORT` int(11) DEFAULT NULL,
  `MKCODE` varchar(50) DEFAULT NULL,
  `MKNAME` varchar(100) DEFAULT NULL,
  `NOLOGINACL` varchar(50) DEFAULT NULL,
  `USERACL` varchar(50) DEFAULT NULL,
  `MEMBERACL` varchar(50) DEFAULT NULL,
  `SUPERACL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_NETXX`;
CREATE TABLE `TB_NETXX` (
  `ABOUTUS` varchar(2000) NOT NULL,
  `XGSM` varchar(2000) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `USERID` int(11) NOT NULL,
  `NICKNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_PHOTOMEMO`;
CREATE TABLE `TB_PHOTOMEMO` (
  `PHOTOID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `XCID` int(11) NOT NULL,
  `XCTITLE` varchar(100) NOT NULL,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `STRTITLE` varchar(100) NOT NULL,
  `WJNAME` varchar(100) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `PHSTATUS` int(11) NOT NULL,
  `SFFM` int(11) DEFAULT NULL,
  `PHOTOWIDTH` int(11) DEFAULT NULL,
  `PHOTOHEIGHT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PHOTOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `TB_PHOTOPZ`;
CREATE TABLE `TB_PHOTOPZ` (
  `XCID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `STRTITLE` varchar(100) NOT NULL,
  `DTCREA` datetime DEFAULT NULL,
  `XCSTATUS` int(11) DEFAULT NULL,
  `XCPASSWORD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_PINGLUN`;
CREATE TABLE `TB_PINGLUN` (
  `PLID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `MKCODE` varchar(50) NOT NULL,
  `DOCID` varchar(50) NOT NULL,
  `PLRESULT` varchar(50) NOT NULL,
  `PLDATE` datetime NOT NULL,
  PRIMARY KEY (`PLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_SEEKLOG`;
CREATE TABLE `TB_SEEKLOG` (
  `LGID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SKUSERID` int(11) DEFAULT NULL,
  `SKUSERNAME` varchar(50) DEFAULT NULL,
  `MKCODE` varchar(50) DEFAULT NULL,
  `DOCID` int(11) DEFAULT NULL,
  `DTSEEK` datetime DEFAULT NULL,
  `SKIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TB_SPBRAND`;
CREATE TABLE `TB_SPBRAND` (
  `BRANDID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SPTYPEID` int(11) NOT NULL,
  `SPTYPENAME` varchar(50) NOT NULL,
  `BRANDNAME` varchar(200) NOT NULL,
  `BRANDIMG` varchar(100) DEFAULT NULL,
  `DISPXH` int(11) DEFAULT NULL,
  PRIMARY KEY (`BRANDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_SPTYPE`;
CREATE TABLE `TB_SPTYPE` (
  `SPTYPEID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SPTYPENAME` varchar(50) NOT NULL,
  `ZBNAME` varchar(50) DEFAULT NULL,
  `ZBDW` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SPTYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_TSJY`;
CREATE TABLE `TB_TSJY` (
  `TSJYID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `JYTITLE` varchar(50) NOT NULL,
  `FBUSERID` int(11) NOT NULL,
  `FBUSERNAME` varchar(50) NOT NULL,
  `DTFBRQ` datetime NOT NULL,
  `STRCONTENT` varchar(500) NOT NULL,
  `IPADDR` varchar(20) NOT NULL,
  `HFUSERID` int(11) DEFAULT NULL,
  `HFUSERNAME` varchar(50) DEFAULT NULL,
  `DTHFRQ` datetime DEFAULT NULL,
  `HFCONTENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`TSJYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_USERHOME`;
CREATE TABLE `TB_USERHOME` (
  `USERNAME` varchar(50) NOT NULL,
  `XNAME` varchar(50) NOT NULL,
  `HEADIMG` varchar(100) DEFAULT NULL,
  `HOMEXY` varchar(100) DEFAULT NULL,
  `HOMELABLE` varchar(100) DEFAULT NULL,
  `HOMECONTENT` varchar(200) DEFAULT NULL,
  `INTREADERS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `TB_USERINFO`;
CREATE TABLE `TB_USERINFO` (
  `USERID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `USERPASS` varchar(50) NOT NULL,
  `NICKNAME` varchar(50) NOT NULL,
  `DTZCRQ` datetime NOT NULL,
  `DTYZRQ` datetime DEFAULT NULL,
  `SEX` char(2) DEFAULT NULL,
  `HEADIMG` varchar(100) DEFAULT NULL,
  `USERSTATUS` int(11) NOT NULL,
  `USERLASTPWD` datetime DEFAULT NULL,
  `USERJFZS` float DEFAULT NULL,
  `USERXFJF` float DEFAULT NULL,
  `USERSYJF` float DEFAULT NULL,
  `STRCONTENT` text,
  `LXTEL` varchar(50) DEFAULT NULL,
  `LXSJ` varchar(50) DEFAULT NULL,
  `LXEMAIL` varchar(50) DEFAULT NULL,
  `LXQQ` varchar(50) DEFAULT NULL,
  `LXMSN` varchar(50) DEFAULT NULL,
  `REGCODE` varchar(50) DEFAULT NULL,
  `STRCITY` varchar(50) DEFAULT NULL,
  `SSNAME` varchar(50) DEFAULT NULL,
  `INTTXSH` int(11) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `TB_YQLJ`;
CREATE TABLE `TB_YQLJ` (
  `LJID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `LJNAME` varchar(50) NOT NULL,
  `LJADDR` varchar(100) NOT NULL,
  `DTCREA` datetime NOT NULL,
  `USERID` int(11) NOT NULL,
  `NICKNAME` varchar(50) NOT NULL,
  `LINKIMG` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LJID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;









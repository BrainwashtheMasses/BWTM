-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: brainwashthemasses.org    Database: gazelle
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_applications`
--

DROP TABLE IF EXISTS `api_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_applications` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserID` int(10) NOT NULL,
  `Token` char(32) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_applications`
--

LOCK TABLES `api_applications` WRITE;
/*!40000 ALTER TABLE `api_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_users`
--

DROP TABLE IF EXISTS `api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_users` (
  `UserID` int(10) NOT NULL,
  `AppID` int(10) NOT NULL,
  `Token` char(32) NOT NULL,
  `State` enum('0','1','2') NOT NULL DEFAULT '0',
  `Time` datetime NOT NULL,
  `Access` text,
  PRIMARY KEY (`UserID`,`AppID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_users`
--

LOCK TABLES `api_users` WRITE;
/*!40000 ALTER TABLE `api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_alias`
--

DROP TABLE IF EXISTS `artists_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_alias` (
  `AliasID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtistID` int(10) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Redirect` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AliasID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_alias`
--

LOCK TABLES `artists_alias` WRITE;
/*!40000 ALTER TABLE `artists_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_group`
--

DROP TABLE IF EXISTS `artists_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_group` (
  `ArtistID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `RevisionID` int(12) DEFAULT NULL,
  `VanityHouse` tinyint(1) DEFAULT '0',
  `LastCommentID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ArtistID`),
  KEY `Name` (`Name`),
  KEY `RevisionID` (`RevisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_group`
--

LOCK TABLES `artists_group` WRITE;
/*!40000 ALTER TABLE `artists_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar`
--

DROP TABLE IF EXISTS `artists_similar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_similar` (
  `ArtistID` int(10) NOT NULL DEFAULT '0',
  `SimilarID` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ArtistID`,`SimilarID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `SimilarID` (`SimilarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_similar`
--

LOCK TABLES `artists_similar` WRITE;
/*!40000 ALTER TABLE `artists_similar` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar_scores`
--

DROP TABLE IF EXISTS `artists_similar_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_similar_scores` (
  `SimilarID` int(12) NOT NULL AUTO_INCREMENT,
  `Score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SimilarID`),
  KEY `Score` (`Score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_similar_scores`
--

LOCK TABLES `artists_similar_scores` WRITE;
/*!40000 ALTER TABLE `artists_similar_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar_votes`
--

DROP TABLE IF EXISTS `artists_similar_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_similar_votes` (
  `SimilarID` int(12) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Way` enum('up','down') NOT NULL DEFAULT 'up',
  PRIMARY KEY (`SimilarID`,`UserID`,`Way`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_similar_votes`
--

LOCK TABLES `artists_similar_votes` WRITE;
/*!40000 ALTER TABLE `artists_similar_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_tags`
--

DROP TABLE IF EXISTS `artists_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_tags` (
  `TagID` int(10) NOT NULL DEFAULT '0',
  `ArtistID` int(10) NOT NULL DEFAULT '0',
  `PositiveVotes` int(6) NOT NULL DEFAULT '1',
  `NegativeVotes` int(6) NOT NULL DEFAULT '1',
  `UserID` int(10) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`ArtistID`),
  KEY `TagID` (`TagID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `PositiveVotes` (`PositiveVotes`),
  KEY `NegativeVotes` (`NegativeVotes`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_tags`
--

LOCK TABLES `artists_tags` WRITE;
/*!40000 ALTER TABLE `artists_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bad_passwords`
--

DROP TABLE IF EXISTS `bad_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bad_passwords` (
  `Password` char(32) NOT NULL,
  PRIMARY KEY (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bad_passwords`
--

LOCK TABLES `bad_passwords` WRITE;
/*!40000 ALTER TABLE `bad_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bad_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ThreadID` int(10) unsigned DEFAULT NULL,
  `Important` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,1,'What this is.','This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.','2016-11-20 21:18:43',1,1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_artists`
--

DROP TABLE IF EXISTS `bookmarks_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_artists` (
  `UserID` int(10) NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  KEY `UserID` (`UserID`),
  KEY `ArtistID` (`ArtistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_artists`
--

LOCK TABLES `bookmarks_artists` WRITE;
/*!40000 ALTER TABLE `bookmarks_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_collages`
--

DROP TABLE IF EXISTS `bookmarks_collages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_collages` (
  `UserID` int(10) NOT NULL,
  `CollageID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  KEY `UserID` (`UserID`),
  KEY `CollageID` (`CollageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_collages`
--

LOCK TABLES `bookmarks_collages` WRITE;
/*!40000 ALTER TABLE `bookmarks_collages` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_collages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_requests`
--

DROP TABLE IF EXISTS `bookmarks_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_requests` (
  `UserID` int(10) NOT NULL,
  `RequestID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  KEY `UserID` (`UserID`),
  KEY `RequestID` (`RequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_requests`
--

LOCK TABLES `bookmarks_requests` WRITE;
/*!40000 ALTER TABLE `bookmarks_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_torrents`
--

DROP TABLE IF EXISTS `bookmarks_torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_torrents` (
  `UserID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `groups_users` (`GroupID`,`UserID`),
  KEY `UserID` (`UserID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_torrents`
--

LOCK TABLES `bookmarks_torrents` WRITE;
/*!40000 ALTER TABLE `bookmarks_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Body` mediumtext,
  `Category` tinyint(1) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `AddedBy` int(10) DEFAULT NULL,
  `Importance` tinyint(1) DEFAULT NULL,
  `Team` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (1,'Happy Thanksgiving!','I\'m thankful that this site exists. Let\'s not lose sight of its goal, and make sure we\'re instrumental in the reinstatement of the next great music tracker. ',6,'2016-11-24 00:00:00','2016-11-24 00:00:00',223,2,1);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Message` text NOT NULL,
  `Author` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages`
--

DROP TABLE IF EXISTS `collages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collages` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `UserID` int(10) NOT NULL DEFAULT '0',
  `NumTorrents` int(4) NOT NULL DEFAULT '0',
  `Deleted` enum('0','1') DEFAULT '0',
  `Locked` enum('0','1') NOT NULL DEFAULT '0',
  `CategoryID` int(2) NOT NULL DEFAULT '1',
  `TagList` varchar(500) NOT NULL DEFAULT '',
  `MaxGroups` int(10) NOT NULL DEFAULT '0',
  `MaxGroupsPerUser` int(10) NOT NULL DEFAULT '0',
  `Featured` tinyint(4) NOT NULL DEFAULT '0',
  `Subscribers` int(10) DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `UserID` (`UserID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collages`
--

LOCK TABLES `collages` WRITE;
/*!40000 ALTER TABLE `collages` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages_artists`
--

DROP TABLE IF EXISTS `collages_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collages_artists` (
  `CollageID` int(10) NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Sort` int(10) NOT NULL DEFAULT '0',
  `AddedOn` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CollageID`,`ArtistID`),
  KEY `UserID` (`UserID`),
  KEY `Sort` (`Sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collages_artists`
--

LOCK TABLES `collages_artists` WRITE;
/*!40000 ALTER TABLE `collages_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages_torrents`
--

DROP TABLE IF EXISTS `collages_torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collages_torrents` (
  `CollageID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Sort` int(10) NOT NULL DEFAULT '0',
  `AddedOn` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CollageID`,`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `Sort` (`Sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collages_torrents`
--

LOCK TABLES `collages_torrents` WRITE;
/*!40000 ALTER TABLE `collages_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Page` enum('artist','collages','requests','torrents') NOT NULL,
  `PageID` int(10) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Body` mediumtext,
  `EditedUserID` int(10) DEFAULT NULL,
  `EditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Page` (`Page`,`PageID`),
  KEY `AuthorID` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_edits`
--

DROP TABLE IF EXISTS `comments_edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_edits` (
  `Page` enum('forums','artist','collages','requests','torrents') DEFAULT NULL,
  `PostID` int(10) DEFAULT NULL,
  `EditUser` int(10) DEFAULT NULL,
  `EditTime` datetime DEFAULT NULL,
  `Body` mediumtext,
  KEY `EditUser` (`EditUser`),
  KEY `PostHistory` (`Page`,`PostID`,`EditTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_edits`
--

LOCK TABLES `comments_edits` WRITE;
/*!40000 ALTER TABLE `comments_edits` DISABLE KEYS */;
INSERT INTO `comments_edits` VALUES ('forums',10,3,'2016-11-20 22:53:31','http://www.brainwashthemasses.org/wiki.php?action=article&amp;id=2'),('forums',10,3,'2016-11-20 23:02:56','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping with Exact Audio Copy[/URL]'),('forums',10,3,'2016-11-20 23:14:11','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\r\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\r\nhttps://apt.jwshields.net/what/'),('forums',10,3,'2016-11-20 23:14:51','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&amp;id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\r\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\r\nhttps://apt.jwshields.net/what/\n\n[size=4][b][color=blue]better.sh: Transcode a folder of FLACs to V0, V2 and 320[/color][/b][/size]\r\n\r\n\r\n[size=3][b]Instructions[b][/size]\r\n\r\n1. Open up a terminal or establish a SSH connection to your seedbox\r\n2. Verify that &quot;lame&quot; and &quot;flac&quot; are installed (already installed on baconSeed!)\r\n3. Download the script and move it to ~/bin then run this command:\r\n\r\n[pre]~$ chmod +x ~/bin/better.sh[/pre]\r\n\r\n4. Transcode!\r\n\r\n[pre]~$ better.sh &quot;~/downloads/Rebecca Black - Unintelligible Screeching [FLAC]&quot; &quot;Rebecca Black - Unintelligible Screeching&quot; &quot;~/downloads&quot;[/pre]\r\n\r\n[size=3][b]Script[/b][/size]\r\n\r\n[pre]#!/bin/bash\r\n# Written by Phos, released into the public domain\r\n# Attribution requested. :)\r\n#\r\n# Usage:\r\n# ./better.sh FLAC_FOLDER NAME_PREFIX OUTPUT_PATH\r\n# ./better.sh path/to/My.Awesome.Music.FLAC/ &quot;John Doe - This is an Album&quot; path/to/rtorrent/downloads\r\n\r\nconvert () {\r\n  artist=$(metaflac --show-tag=ARTIST &quot;$1&quot; | sed &#39;s .......  &#39;)\r\n  album=$(metaflac --show-tag=ALBUM &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  title=$(metaflac --show-tag=TITLE &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  date=$(metaflac --show-tag=DATE &quot;$1&quot; | sed &#39;s .....  &#39;)\r\n  number=$(metaflac --show-tag=TRACKNUMBER &quot;$1&quot; |sed &#39;s ............  &#39;)\r\n\r\n  flac -cd &quot;$1&quot; 2&gt; /dev/null | lame &quot;$3&quot; -h --tt &quot;$title&quot; --ta &quot;$artist&quot; --tl &quot;$album&quot; --ty &quot;$date&quot; --tn &quot;$number&quot; - &quot;$2&quot; 2&gt; /dev/null;\r\n}\r\n\r\nconvertv0 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 0&quot;\r\n}\r\n\r\nconvertv2 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 2&quot;\r\n}\r\n\r\nconvert320 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-b 320&quot;\r\n}\r\n\r\nFLAC_FOLDER=&quot;$1&quot;\r\nNAME_PREFIX=&quot;$2&quot;\r\nOUTPUT_PATH=&quot;$3&quot;\r\n\r\nV0PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v0]&quot;\r\nV2PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v2]&quot;\r\nM320PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [320]&quot;\r\n\r\nmkdir -p &quot;$V0PATH&quot; &quot;$V2PATH&quot; &quot;$M320PATH&quot;\r\n\r\nfor flac_file in &quot;$FLAC_FOLDER/&quot;*.flac; do\r\n  emptyname=$(basename &quot;$flac_file&quot; .flac)\r\n  name=&quot;$emptyname&quot;.mp3\r\n\r\n  echo &quot;Converting $emptyname to v0, v2, 320...&quot;\r\n  convertv0 &quot;$flac_file&quot; &quot;$V0PATH/$name&quot; &amp;\r\n  convertv2 &quot;$flac_file&quot; &quot;$V2PATH/$name&quot; &amp;\r\n  convert320 &quot;$flac_file&quot; &quot;$M320PATH/$name&quot; &amp;\r\n  wait\r\ndone[/pre]'),('forums',10,3,'2016-11-20 23:14:57','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\nhttps://apt.jwshields.net/what/\n\n'),('forums',10,3,'2016-11-20 23:15:08','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\nhttps://apt.jwshields.net/what/\n\n\n\n[size=4][b][color=blue]better.sh: Transcode a folder of FLACs to V0, V2 and 320[/color][/b][/size]\r\n\r\n\r\n[size=3][b]Instructions[b][/size]\r\n\r\n1. Open up a terminal or establish a SSH connection to your seedbox\r\n2. Verify that \"lame\" and \"flac\" are installed (already installed on baconSeed!)\r\n3. Download the script and move it to ~/bin then run this command:\r\n\r\n[pre]~$ chmod +x ~/bin/better.sh[/pre]\r\n\r\n4. Transcode!\r\n\r\n[pre]~$ better.sh \"~/downloads/Rebecca Black - Unintelligible Screeching [FLAC]\" \"Rebecca Black - Unintelligible Screeching\" \"~/downloads\"[/pre]\r\n\r\n[size=3][b]Script[/b][/size]\r\n\r\n[pre]#!/bin/bash\r\n# Written by Phos, released into the public domain\r\n# Attribution requested. :)\r\n#\r\n# Usage:\r\n# ./better.sh FLAC_FOLDER NAME_PREFIX OUTPUT_PATH\r\n# ./better.sh path/to/My.Awesome.Music.FLAC/ \"John Doe - This is an Album\" path/to/rtorrent/downloads\r\n\r\nconvert () {\r\n  artist=$(metaflac --show-tag=ARTIST \"$1\" | sed \'s .......  \')\r\n  album=$(metaflac --show-tag=ALBUM \"$1\" | sed \'s ......  \')\r\n  title=$(metaflac --show-tag=TITLE \"$1\" | sed \'s ......  \')\r\n  date=$(metaflac --show-tag=DATE \"$1\" | sed \'s .....  \')\r\n  number=$(metaflac --show-tag=TRACKNUMBER \"$1\" |sed \'s ............  \')\r\n\r\n  flac -cd \"$1\" 2> /dev/null | lame \"$3\" -h --tt \"$title\" --ta \"$artist\" --tl \"$album\" --ty \"$date\" --tn \"$number\" - \"$2\" 2> /dev/null;\r\n}\r\n\r\nconvertv0 () {\r\n  convert \"$1\" \"$2\" \"-V 0\"\r\n}\r\n\r\nconvertv2 () {\r\n  convert \"$1\" \"$2\" \"-V 2\"\r\n}\r\n\r\nconvert320 () {\r\n  convert \"$1\" \"$2\" \"-b 320\"\r\n}\r\n\r\nFLAC_FOLDER=\"$1\"\r\nNAME_PREFIX=\"$2\"\r\nOUTPUT_PATH=\"$3\"\r\n\r\nV0PATH=\"$OUTPUT_PATH/$NAME_PREFIX [v0]\"\r\nV2PATH=\"$OUTPUT_PATH/$NAME_PREFIX [v2]\"\r\nM320PATH=\"$OUTPUT_PATH/$NAME_PREFIX [320]\"\r\n\r\nmkdir -p \"$V0PATH\" \"$V2PATH\" \"$M320PATH\"\r\n\r\nfor flac_file in \"$FLAC_FOLDER/\"*.flac; do\r\n  emptyname=$(basename \"$flac_file\" .flac)\r\n  name=\"$emptyname\".mp3\r\n\r\n  echo \"Converting $emptyname to v0, v2, 320...\"\r\n  convertv0 \"$flac_file\" \"$V0PATH/$name\" &\r\n  convertv2 \"$flac_file\" \"$V2PATH/$name\" &\r\n  convert320 \"$flac_file\" \"$M320PATH/$name\" &\r\n  wait\r\ndone[/pre]'),('forums',10,3,'2016-11-20 23:15:37','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&amp;id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\nhttps://apt.jwshields.net/what/\n\n\n\n[size=4][b][color=blue]better.sh: Transcode a folder of FLACs to V0, V2 and 320[/color][/b][/size]\r\n\r\n\r\n[size=3][b]Instructions[b][/size]\r\n\r\n1. Open up a terminal or establish a SSH connection to your seedbox\r\n2. Verify that &quot;lame&quot; and &quot;flac&quot; are installed (already installed on baconSeed!)\r\n3. Download the script and move it to ~/bin then run this command:\r\n\r\n[pre]~$ chmod +x ~/bin/better.sh[/pre]\r\n\r\n4. Transcode!\r\n\r\n[pre]~$ better.sh &quot;~/downloads/Rebecca Black - Unintelligible Screeching [FLAC]&quot; &quot;Rebecca Black - Unintelligible Screeching&quot; &quot;~/downloads&quot;[/pre]\r\n\r\n[size=3][b]Script[/b][/size]\r\n\r\n[pre]#!/bin/bash\r\n# Written by Phos, released into the public domain\r\n# Attribution requested. :)\r\n#\r\n# Usage:\r\n# ./better.sh FLAC_FOLDER NAME_PREFIX OUTPUT_PATH\r\n# ./better.sh path/to/My.Awesome.Music.FLAC/ &quot;John Doe - This is an Album&quot; path/to/rtorrent/downloads\r\n\r\nconvert () {\r\n  artist=$(metaflac --show-tag=ARTIST &quot;$1&quot; | sed &#39;s .......  &#39;)\r\n  album=$(metaflac --show-tag=ALBUM &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  title=$(metaflac --show-tag=TITLE &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  date=$(metaflac --show-tag=DATE &quot;$1&quot; | sed &#39;s .....  &#39;)\r\n  number=$(metaflac --show-tag=TRACKNUMBER &quot;$1&quot; |sed &#39;s ............  &#39;)\r\n\r\n  flac -cd &quot;$1&quot; 2&gt; /dev/null | lame &quot;$3&quot; -h --tt &quot;$title&quot; --ta &quot;$artist&quot; --tl &quot;$album&quot; --ty &quot;$date&quot; --tn &quot;$number&quot; - &quot;$2&quot; 2&gt; /dev/null;\r\n}\r\n\r\nconvertv0 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 0&quot;\r\n}\r\n\r\nconvertv2 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 2&quot;\r\n}\r\n\r\nconvert320 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-b 320&quot;\r\n}\r\n\r\nFLAC_FOLDER=&quot;$1&quot;\r\nNAME_PREFIX=&quot;$2&quot;\r\nOUTPUT_PATH=&quot;$3&quot;\r\n\r\nV0PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v0]&quot;\r\nV2PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v2]&quot;\r\nM320PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [320]&quot;\r\n\r\nmkdir -p &quot;$V0PATH&quot; &quot;$V2PATH&quot; &quot;$M320PATH&quot;\r\n\r\nfor flac_file in &quot;$FLAC_FOLDER/&quot;*.flac; do\r\n  emptyname=$(basename &quot;$flac_file&quot; .flac)\r\n  name=&quot;$emptyname&quot;.mp3\r\n\r\n  echo &quot;Converting $emptyname to v0, v2, 320...&quot;\r\n  convertv0 &quot;$flac_file&quot; &quot;$V0PATH/$name&quot; &amp;\r\n  convertv2 &quot;$flac_file&quot; &quot;$V2PATH/$name&quot; &amp;\r\n  convert320 &quot;$flac_file&quot; &quot;$M320PATH/$name&quot; &amp;\r\n  wait\r\ndone[/pre]\n\n[size=4][b][color=blue]better.sh: Transcode a folder of FLACs to V0, V2 and 320[/color][/b][/size]\r\n\r\n\r\n[size=3][b]Instructions[b][/size]\r\n\r\n1. Open up a terminal or establish a SSH connection to your seedbox\r\n2. Verify that &quot;lame&quot; and &quot;flac&quot; are installed (already installed on baconSeed!)\r\n3. Download the script and move it to ~/bin then run this command:\r\n\r\n[pre]~$ chmod +x ~/bin/better.sh[/pre]\r\n\r\n4. Transcode!\r\n\r\n[pre]~$ better.sh &quot;~/downloads/Rebecca Black - Unintelligible Screeching [FLAC]&quot; &quot;Rebecca Black - Unintelligible Screeching&quot; &quot;~/downloads&quot;[/pre]\r\n\r\n[size=3][b]Script[/b][/size]\r\n\r\n[pre]#!/bin/bash\r\n# Written by Phos, released into the public domain\r\n# Attribution requested. :)\r\n#\r\n# Usage:\r\n# ./better.sh FLAC_FOLDER NAME_PREFIX OUTPUT_PATH\r\n# ./better.sh path/to/My.Awesome.Music.FLAC/ &quot;John Doe - This is an Album&quot; path/to/rtorrent/downloads\r\n\r\nconvert () {\r\n  artist=$(metaflac --show-tag=ARTIST &quot;$1&quot; | sed &#39;s .......  &#39;)\r\n  album=$(metaflac --show-tag=ALBUM &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  title=$(metaflac --show-tag=TITLE &quot;$1&quot; | sed &#39;s ......  &#39;)\r\n  date=$(metaflac --show-tag=DATE &quot;$1&quot; | sed &#39;s .....  &#39;)\r\n  number=$(metaflac --show-tag=TRACKNUMBER &quot;$1&quot; |sed &#39;s ............  &#39;)\r\n\r\n  flac -cd &quot;$1&quot; 2&gt; /dev/null | lame &quot;$3&quot; -h --tt &quot;$title&quot; --ta &quot;$artist&quot; --tl &quot;$album&quot; --ty &quot;$date&quot; --tn &quot;$number&quot; - &quot;$2&quot; 2&gt; /dev/null;\r\n}\r\n\r\nconvertv0 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 0&quot;\r\n}\r\n\r\nconvertv2 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-V 2&quot;\r\n}\r\n\r\nconvert320 () {\r\n  convert &quot;$1&quot; &quot;$2&quot; &quot;-b 320&quot;\r\n}\r\n\r\nFLAC_FOLDER=&quot;$1&quot;\r\nNAME_PREFIX=&quot;$2&quot;\r\nOUTPUT_PATH=&quot;$3&quot;\r\n\r\nV0PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v0]&quot;\r\nV2PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [v2]&quot;\r\nM320PATH=&quot;$OUTPUT_PATH/$NAME_PREFIX [320]&quot;\r\n\r\nmkdir -p &quot;$V0PATH&quot; &quot;$V2PATH&quot; &quot;$M320PATH&quot;\r\n\r\nfor flac_file in &quot;$FLAC_FOLDER/&quot;*.flac; do\r\n  emptyname=$(basename &quot;$flac_file&quot; .flac)\r\n  name=&quot;$emptyname&quot;.mp3\r\n\r\n  echo &quot;Converting $emptyname to v0, v2, 320...&quot;\r\n  convertv0 &quot;$flac_file&quot; &quot;$V0PATH/$name&quot; &amp;\r\n  convertv2 &quot;$flac_file&quot; &quot;$V2PATH/$name&quot; &amp;\r\n  convert320 &quot;$flac_file&quot; &quot;$M320PATH/$name&quot; &amp;\r\n  wait\r\ndone[/pre]'),('forums',16,21,'2016-11-21 00:49:45','Couldn&#39;t make the cache trick work on my browser unfortunately, but there&#39;s a few whatcd screens here and there online. Not always up to date, but that can be a good starting point !\r\n\r\nForum Screen from 2013 : http://inviteparadise.com/uploads/imgs/pre_1379315235__forums_--_whatcd_2013-09-16_12-13-09.png'),('forums',16,21,'2016-11-21 00:50:07','Couldn&#39;t make the cache trick work on my browser unfortunately, but there&#39;s a few whatcd screens here and there online. Not always up to date, but that can be a good starting point !\n\nForum Screen from 2013 : http://inviteparadise.com/uploads/imgs/pre_1379315235__forums_--_whatcd_2013-09-16_12-13-09.png\n\nEdit : Many other screens including full rules from 2013 : http://inviteparadise.com/index.php?/topic/287-whatcd-music-review-september-2013/\n\nCan be interesting as well even if this website isn&#39;t going to host torrents as it can serve as basis for new rules for whoever wants to build a new tracker'),('forums',22,31,'2016-11-21 02:07:05','Old Revived Wiki Articles:\r\nhttps://www.brainwashthemasses.org/wiki.php?action=article&amp;id=3\r\nhttps://www.brainwashthemasses.org/wiki.php?action=article&amp;id=2\r\n'),('forums',23,3,'2016-11-21 04:16:20','I made this topic to post all the relevant information on any kind of WCD database restore and similar subjects.'),('forums',27,19,'2016-11-21 14:19:38','I just want to hear someone has access to all this metadata: https://archive.org/details/whatcdcrawl'),('forums',39,23,'2016-11-21 16:18:45','Remember your buffer? I Member.\r\n\r\nhttps://sherlock.whatbarco.de\r\n\r\nWhat?CD\r\n\r\n'),('forums',39,23,'2016-11-21 16:28:26','Remember your buffer? I Member.\n\nhttps://sherlock.whatbarco.de\n\nPM me if you forget the password'),('forums',39,23,'2016-11-21 16:29:14','Remember your buffer? I Member.\n\nhttps://sherlock.whatbarco.de\n\nPM me if you forget the password\n\nIn case you were not part of sherlock and have no idea what this was:\r\n\r\nIt was a dude&#39;s website that logged into what and kept track of users buffers and plotted them on a graph.\r\nTo have data there, you would have had to request to be added in the forums.\r\n'),('forums',40,51,'2016-11-21 16:49:32','Hello.. thanks for the invite. Was a pretty tenured What.CD user, made it up to a TM. I also do a lot of SQL coding and can be available to help. Curious.. what&#39;s the end goal here? Do you envisioning this replacing What from a tracker prospective as well or are you just trying to get the knowledge-based item back up? '),('forums',39,23,'2016-11-21 17:23:50','Remember your buffer? I \'member.\n\nhttps://sherlock.whatbarco.de\n\nPM me if you forget the password\n\nIn case you were not part of sherlock and have no idea what this was:\n\nIt was a dude\'s website that logged into what and kept track of users buffers and plotted them on a graph.\nTo have data there, you would have had to request to be added in the forums.'),('forums',43,11,'2016-11-21 17:44:14','[quote=gcarn|41]What is behind this archive?\r\n\r\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/\r\n\r\nI can&#39;t seem to connect to any peers to see inside it myself[/quote]in the same boat. currently have 90nodes with 0 peers connected. My guess is the person who posted this stopped himself from being connectable.'),('forums',40,51,'2016-11-21 17:50:37','Hello.. thanks for the invite. Was a pretty tenured What.CD user, made it up to a TM. I also do a lot of SQL coding and can be available to help. Curious.. what&#39;s the end goal here? Do you envision this replacing What from a tracker prospective as well or are you just trying to get the knowledge-based items back up?'),('forums',41,23,'2016-11-21 18:24:28','What is behind this archive?\r\n\r\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/\r\n\r\nI can&#39;t seem to connect to any peers to see inside it myself\r\n\r\n'),('forums',34,30,'2016-11-21 19:17:36','[quote=pillboxer|28][quote=Tinerfe|19]To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I&#39;m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.[/quote]\r\n\r\nAgree, many (most?) will have their files still sitting in their client. An informative guide on getting those back on to the new site.[/quote]\r\n\r\nSome warez trackers have made programs (Windows) that will automatically search for existing scene releases by the scene naming standard on hard disks, and then automagically add them to the torrent program for a certain tracker (only uTorrent, perhaps). That might be hard to do considering What.CD releases aren&#39;t scene and there&#39;s (yet?) no access to the metadata. I&#39;m no coder, but maybe it would be possible to have a program check already present What.CD torrents in a user&#39;s torrent program and change the tracker info to the new one? Of course that requires that somebody already uploaded the torrent. Will work fine on popular torrents and also an indicator of what torrents a user should upload. Another thing would be something, like a script, that will simplify the upload of like +1000 torrents. A built in metadata and cover crawler? It would only take some hours to verify a 1000 covers! :D\r\n\r\nA sidenote: Maybe a stricter naming of directories for future new rips uploaded would be good, ie something in the directory name that would make it identifiable as content from What.CD? For future proofing. Better to reinstate what was one week ago for now, though.\r\n\r\n[quote=adinbied|33]I have the Vinyl Guide, I&#39;ll put it up later today.[/quote]\r\n\r\nI saw someone on PTP (I think) posting both the Vinyl and CD ripping guide in .doc yesterday. If noone else finds it, I&#39;ll look tonight (CET). '),('forums',34,30,'2016-11-22 19:49:41','[quote=pillboxer|28][quote=Tinerfe|19]To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I\'m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.[/quote]\n\nAgree, many (most?) will have their files still sitting in their client. An informative guide on getting those back on to the new site.[/quote]\n\nSome warez trackers have made programs (Windows) that will automatically search for existing scene releases by the scene naming standard on hard disks, and then automagically add them to the torrent program for a certain tracker (only uTorrent, perhaps). That might be hard to do considering What.CD releases aren\'t scene and there\'s (yet?) no access to the metadata. I\'m no coder, but maybe it would be possible to have a program check already present What.CD torrents in a user\'s torrent program and change the tracker info to the new one? Of course that requires that somebody already uploaded the torrent. Will work fine on popular torrents and also an indicator of what torrents a user should upload. Another thing would be something, like a script, that will simplify the upload of like +1000 torrents. A built in metadata and cover crawler? It would only take some hours to verify a 1000 covers! :D\n\nA sidenote: Maybe a stricter naming of directories for future new rips uploaded would be good, ie something in the directory name that would make it identifiable as content from What.CD? For future proofing. Better to reinstate what was one week ago for now, though.\n\n[quote=adinbied|33]I have the Vinyl Guide, I\'ll put it up later today.[/quote]\n\nI saw someone on PTP (I think) posting both the Vinyl and CD ripping guide in .doc yesterday. If noone else finds it, I\'ll look tonight (CET).\n\nEDIT: Here they are: https://minfil.org/N1s0qeb5b1/EAC___TT_Ripping.rar'),('forums',34,30,'2016-11-22 19:57:20','[quote=pillboxer|28][quote=Tinerfe|19]To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I\'m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.[/quote]\n\nAgree, many (most?) will have their files still sitting in their client. An informative guide on getting those back on to the new site.[/quote]\n\nSome warez trackers have made programs (Windows) that will automatically search for existing scene releases by the scene naming standard on hard disks, and then automagically add them to the torrent program for a certain tracker (only uTorrent, perhaps). That might be hard to do considering What.CD releases aren\'t scene and there\'s (yet?) no access to the metadata. I\'m no coder, but maybe it would be possible to have a program check already present What.CD torrents in a user\'s torrent program and change the tracker info to the new one? Of course that requires that somebody already uploaded the torrent. Will work fine on popular torrents and also an indicator of what torrents a user should upload. Another thing would be something, like a script, that will simplify the upload of like +1000 torrents. A built in metadata and cover crawler? It would only take some hours to verify a 1000 covers! :D\n\nA sidenote: Maybe a stricter naming of directories for future new rips uploaded would be good, ie something in the directory name that would make it identifiable as content from What.CD? For future proofing. Better to reinstate what was one week ago for now, though.\n\n[quote=adinbied|33]I have the Vinyl Guide, I\'ll put it up later today.[/quote]\n\nI saw someone on PTP (I think) posting both the Vinyl and CD ripping guide in .doc yesterday. If noone else finds it, I\'ll look tonight (CET).\n\nEDIT: Here they are: https://minfil.org/N1s0qeb5b1/EAC___TT_Ripping.rar\n\nThere\'s another site for rebuilding What, which seems to have gotten further: http://whatcd.tk/index.php Maybe better to continue there?'),('forums',66,91,'2016-11-22 23:52:17','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: &quot;Web Page (complete)&quot;.\r\nI scrubbed my username and auths just in case and also replaced &quot;http://what.cd/&quot; with &quot;#&quot; so you don&#39;t accidentally click on something.\r\n\r\nIncludes:\r\n- Capitalization Guidelines\r\n- Codecs and Containers - A guide\r\n- Definition - A list of technical terms\r\n- Definition - Bit Depth\r\n- Definition - Bit Reservoir\r\n- Definition - Free Lossless Audio Codec (FLAC)\r\n- Definition - LAME\r\n- Definition - Lossy\r\n- EAC - Ripping with Exact Audio Copy\r\n- EAC - Setting up Exact Audio Copy\r\n- EAC find &amp; set CD drive write offset\r\n- Edition Information Guidelines\r\n- Noise Reduction\r\n- Replay Gain\r\n- Resampling and Bit Depth Reduction - The Right Way\r\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\r\n- Transcodes\r\n- Typography\r\n- What.CD Toolbox for Windows\r\n- Windows&#39; Hidden NFO\r\n\r\nSaved in 2014.\r\n\r\n[url=http://www107.zippyshare.com/v/mbqQ7wcU/file.html]Download .zip from Zippyshare[/url]\r\n\r\n'),('forums',70,94,'2016-11-23 00:30:16','I can help too. I&#39;m on /r/whatnextcd and also checking wcd threads on PTP. If you grant me invites, just tell me the criteria.'),('forums',72,34,'2016-11-23 01:02:55','From r/Whatnextcd:\r\n\r\n[quote]\r\nStart at [url=http://whatcd.tk/what.cd.htm]Whatcd.tk[/url], then you can click on &quot;Home&quot;, and from there you can visit the main pages of wiki, rules, better, torrents, and a post in the forum. Also some parts of the wiki are up, [url=http://whatcd.tk/sacdwiki.php]SACD ripping guide[/url], [url=http://whatcd.tk/eacwiki.php]EAC Ripping guide[/url], [url=http://whatcd.tk/logcheckerwiki.php]LogChecker Guide[/url].\r\nAlso some non linked pages are up, as Blog and Stats.\r\nI had the profile page and the torrent page too, but not sure if that would get me in trouble.\r\n\r\nEdit: torrents is online now.\r\nEdit: Added more wiki!! SACD ripping guide, EAC Ripping guide, LogChecker Guide\r\nEdit: You can contribute by sending me the php and htm pages you get with nirsoft cache viewer, or by donating BTC to 1DTpZfAmW23GscVGDB3Qag6iTKAPwHQF2x ;) thanks!!\r\nEdit: Profile page is up\r\nEdit: Torrent page is down, after a second thought, even if that page doesn&#39;t affect myself, better not cause any troubles to the mods (don&#39;t know if that could matter, but as precaution)\r\n[/quote]\r\n'),('forums',73,18,'2016-11-23 02:23:06','There is a lot of effort going on in restoring Wcd content. I feel bad for not browsing the site during its last days, hence cannot contribute as much. I have decided to start a thread to restore collages, as it was one of the places to find music.\r\n\r\nRestoring collages might not make sense as they are collection of torrents. But I guess we can create a &quot;database&quot; with Artist and Album data for each collage, which could eventually be imported into the successor.\r\n\r\nI believe I have all the albums from last year&#39;s birthday and Halloween picks. I think most people might also have similar information. Can someone point out the best way to build a &quot;database&quot; of collages to make things easy with Gazelle in the future.'),('forums',75,101,'2016-11-23 03:45:54','I was Power TM andm in the TM+ DC hub. Can distribute invites.'),('forums',80,110,'2016-11-23 04:48:12','I was Elite, formerly TM.\r\n\r\n[img]http://imgur.com/3dGAQja[/img]'),('forums',66,91,'2016-11-23 07:10:07','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: &quot;Web Page (complete)&quot;.\nI scrubbed my username and auths just in case and also replaced &quot;[code]http://what.cd/[/code]&quot; with &quot;#&quot; so you don&#39;t accidentally click on something.\n\nIncludes:\n- Capitalization Guidelines\n- Codecs and Containers - A guide\n- Definition - A list of technical terms\n- Definition - Bit Depth\n- Definition - Bit Reservoir\n- Definition - Free Lossless Audio Codec (FLAC)\n- Definition - LAME\n- Definition - Lossy\n- EAC - Ripping with Exact Audio Copy\n- EAC - Setting up Exact Audio Copy\n- EAC find &amp; set CD drive write offset\n- Edition Information Guidelines\n- Noise Reduction\n- Replay Gain\n- Resampling and Bit Depth Reduction - The Right Way\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\n- Transcodes\n- Typography\n- What.CD Toolbox for Windows\n- Windows&#39; Hidden NFO\n\nSaved in 2014.\n\n[url=http://www107.zippyshare.com/v/mbqQ7wcU/file.html]Download .zip from Zippyshare[/url]'),('forums',92,143,'2016-11-23 18:32:49','We have 175 users right now, I would be willing to go through up to ~ 200 screenshots and check each person&#39;s\r\n\r\n- user class\r\n- upload/download\r\n- seeding size\r\n\r\nand add them here. I have some SQL experience (decent but I don&#39;t use it regularly). Linux/shell experience intermediate/advanced, I make my living orchestrating/deploying servers. I was not Elite/TM on WCD. A few questions would arise:\r\n\r\n- What about people with differing nicknames? WCD was one of the few trackers, where I had a different nickname.\r\n\r\nI&#39;ll help any way I can, but I can&#39;t guarantee to have more than 5-10 hours a week.'),('forums',104,91,'2016-11-23 21:01:22','[quote=Denominator|99][quote=mainstream|85]I messaged that guy. I bet he will be on here pretty soon.[/quote]Any updates? We really should have a news item that directs to a forum page detailing how people can get started.[/quote]He was grateful for my 20 wiki saves that he will combine with his 15 saves and others he found so he is rebuilding the wiki. But I really lost the overview over how many people are trying the very same thing right now. I think this place is better than reddit so I sent him the link to [url=https://goo.gl/forms/I288kwLREAsx7smi1]this[/url] and hope he will appear here soon.'),('forums',109,68,'2016-11-23 21:31:16','[quote=Denominator|96][quote=atriox|95]can we get https://www.brainwashthemasses.org/wiki.php?action=search&amp;type=Title&amp;order=Title&amp;way=Ascending added to the wiki \r\nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\r\n\r\nor maybe editing privileges? \r\n\r\nsomeone is doing this\r\n\r\nhttp://whatcd.tk/wiki.php\r\n\r\nhttp://whatcdinfo.000webhostapp.com/index.html\r\n\r\nit would be nice to get them on board if anyone knows who it is\r\n\r\nI&#39;m also lurking irc/pu+ forums and can give out invites.[/quote]\r\n\r\nI know one; Ill contact him and see if he&#39;s interested in helping out. Will also reach out to the other one.[/quote]\r\n\r\n\r\nJust got a response from the one guy:\r\n\r\n[blockquote]\r\nI&#39;m on BTM, i&#39;m putting stuff on a separate site because all of my posts were being hidden. I&#39;m also working on re-formatting stuff, I&#39;ll have an update later.[/blockquote]'),('forums',109,68,'2016-11-23 21:32:03','[quote=Denominator|96][quote=atriox|95]can we get https://www.brainwashthemasses.org/wiki.php?action=search&amp;type=Title&amp;order=Title&amp;way=Ascending added to the wiki \nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\n\nor maybe editing privileges? \n\nsomeone is doing this\n\nhttp://whatcd.tk/wiki.php\n\nhttp://whatcdinfo.000webhostapp.com/index.html\n\nit would be nice to get them on board if anyone knows who it is\n\nI&#39;m also lurking irc/pu+ forums and can give out invites.[/quote]\n\nI know one; Ill contact him and see if he&#39;s interested in helping out. Will also reach out to the other one.[/quote]\n\n\nJust got a response from the one guy:\n\n[quote]\nI&#39;m on BTM, i&#39;m putting stuff on a separate site because all of my posts were being hidden. I&#39;m also working on re-formatting stuff, I&#39;ll have an update later.[/quote]'),('forums',111,31,'2016-11-23 21:50:56','Oh, Hi there!'),('forums',111,31,'2016-11-23 21:53:14','Oh, Hi there! That&#39;s me. I have ~35 wiki pages that I&#39;m willing to contribute. The reason that I was saying stuff was hidden was because there is no way for me to edit the actual wiki page. To view my postings, you have to go to Wiki, then Browse Articles, then All. It&#39;s more complex than it needs to be IMO.'),('forums',115,91,'2016-11-23 22:22:38','I don&#39;t have a screenshot but I don&#39;t see the point in this either. People want their stats back on a website where it&#39;s of no use? I could understand the title but the numbers carry no importance in my opinion.'),('forums',121,223,'2016-11-23 23:22:32','[quote=Captain|47]I have no desire to rebuild torrent and upload lists. No hard data like that, but looking for those that have screenshots of their user stats to be given their title and upload/download stats back.[/quote]\r\n\r\nTo be honest, it&#39;s pretty easy to forge this, and you should not be asking for screenshots in order to verify users&#39; previous classes. This site presents the perfect opportunity to photoshop previous stats, like this:\r\n\r\n[img]https://cl.ly/0u1N2h0P1Y12/Image%202016-11-23%20at%206.20.28%20PM.png[/img]'),('forums',66,223,'2016-11-24 01:55:48','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: &quot;Web Page (complete)&quot;.\nI scrubbed my username and auths just in case and also replaced &quot;[code]http://what.cd/[/code]&quot; with &quot;#&quot; so you don&#39;t accidentally click on something.\n\nIncludes:\n- Capitalization Guidelines\n- Codecs and Containers - A guide\n- Definition - A list of technical terms\n- Definition - Bit Depth\n- Definition - Bit Reservoir\n- Definition - Free Lossless Audio Codec (FLAC)\n- Definition - LAME\n- Definition - Lossy\n- EAC - Ripping with Exact Audio Copy\n- EAC - Setting up Exact Audio Copy\n- EAC find &amp; set CD drive write offset\n- Edition Information Guidelines\n- Noise Reduction\n- Replay Gain\n- Resampling and Bit Depth Reduction - The Right Way\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\n- Transcodes\n- Typography\n- What.CD Toolbox for Windows\n- Windows&#39; Hidden NFO\n\nSaved in 2014.\n\n[url=http://www17.zippyshare.com/v/W7e8VXYP/file.html]Download .zip from Zippyshare[/url]'),('forums',66,223,'2016-11-24 02:05:52','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: &quot;Web Page (complete)&quot;.\nI scrubbed my username and auths just in case and also replaced &quot;[code]http://what.cd/[/code]&quot; with &quot;#&quot; so you don&#39;t accidentally click on something.\n\nIncludes:\n- Capitalization Guidelines\n- Codecs and Containers - A guide\n- Definition - A list of technical terms\n- Definition - Bit Depth\n- Definition - Bit Reservoir\n- Definition - Free Lossless Audio Codec (FLAC)\n- Definition - LAME\n- Definition - Lossy\n- EAC - Ripping with Exact Audio Copy\n- EAC - Setting up Exact Audio Copy\n- EAC find &amp; set CD drive write offset\n- Edition Information Guidelines\n- Noise Reduction\n- Replay Gain\n- Resampling and Bit Depth Reduction - The Right Way\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\n- Transcodes\n- Typography\n- What.CD Toolbox for Windows\n- Windows&#39; Hidden NFO\n\nSaved in 2014.\n\n[ LINK REMOVED ]'),('forums',66,223,'2016-11-24 04:44:51','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: &quot;Web Page (complete)&quot;.\nI scrubbed my username and auths just in case and also replaced &quot;[code]http://what.cd/[/code]&quot; with &quot;#&quot; so you don&#39;t accidentally click on something.\n\nIncludes:\n- Capitalization Guidelines\n- Codecs and Containers - A guide\n- Definition - A list of technical terms\n- Definition - Bit Depth\n- Definition - Bit Reservoir\n- Definition - Free Lossless Audio Codec (FLAC)\n- Definition - LAME\n- Definition - Lossy\n- EAC - Ripping with Exact Audio Copy\n- EAC - Setting up Exact Audio Copy\n- EAC find &amp; set CD drive write offset\n- Edition Information Guidelines\n- Noise Reduction\n- Replay Gain\n- Resampling and Bit Depth Reduction - The Right Way\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\n- Transcodes\n- Typography\n- What.CD Toolbox for Windows\n- Windows&#39; Hidden NFO\n\nSaved in 2014.\n\nhttp://www17.zippyshare.com/v/W7e8VXYP/file.html'),('forums',185,68,'2016-11-24 05:18:32','[quote=kingorlowest|174]It&#39;s the yellow teeth that get me[/quote]\r\n\r\nSame ;)\r\n\r\nI&#39;d ask to be a Mod but I don&#39;t think I&#39;d be consistent in terms of having the time to continuously provide value. Life has been pretty crazy lately. However, I have a deep background with linux, infra, and modern containerization etc.. so I&#39;d love to help in any way I can technically. The archivist in me is always available for quick backup/storage needs as well, but of course, we have a community that should be able to help with that ;)');
/*!40000 ALTER TABLE `comments_edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_edits_tmp`
--

DROP TABLE IF EXISTS `comments_edits_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_edits_tmp` (
  `Page` enum('forums','artist','collages','requests','torrents') DEFAULT NULL,
  `PostID` int(10) DEFAULT NULL,
  `EditUser` int(10) DEFAULT NULL,
  `EditTime` datetime DEFAULT NULL,
  `Body` mediumtext,
  KEY `EditUser` (`EditUser`),
  KEY `PostHistory` (`Page`,`PostID`,`EditTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_edits_tmp`
--

LOCK TABLES `comments_edits_tmp` WRITE;
/*!40000 ALTER TABLE `comments_edits_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_edits_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concerts`
--

DROP TABLE IF EXISTS `concerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concerts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ConcertID` int(10) NOT NULL,
  `TopicID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ConcertID` (`ConcertID`),
  KEY `TopicID` (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerts`
--

LOCK TABLES `concerts` WRITE;
/*!40000 ALTER TABLE `concerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `concerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover_art`
--

DROP TABLE IF EXISTS `cover_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cover_art` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GroupID` int(10) NOT NULL,
  `Image` varchar(255) NOT NULL DEFAULT '',
  `Summary` varchar(100) DEFAULT NULL,
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `GroupID` (`GroupID`,`Image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover_art`
--

LOCK TABLES `cover_art` WRITE;
/*!40000 ALTER TABLE `cover_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `cover_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_conversion_rates`
--

DROP TABLE IF EXISTS `currency_conversion_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_conversion_rates` (
  `Currency` char(3) NOT NULL,
  `Rate` decimal(9,4) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_conversion_rates`
--

LOCK TABLES `currency_conversion_rates` WRITE;
/*!40000 ALTER TABLE `currency_conversion_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_conversion_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `do_not_upload`
--

DROP TABLE IF EXISTS `do_not_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `do_not_upload` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Sequence` mediumint(8) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `do_not_upload`
--

LOCK TABLES `do_not_upload` WRITE;
/*!40000 ALTER TABLE `do_not_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `do_not_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donations` (
  `UserID` int(10) NOT NULL,
  `Amount` decimal(6,2) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Time` datetime NOT NULL,
  `Currency` varchar(5) NOT NULL DEFAULT 'USD',
  `Source` varchar(30) NOT NULL DEFAULT '',
  `Reason` mediumtext NOT NULL,
  `Rank` int(10) DEFAULT '0',
  `AddedBy` int(10) DEFAULT '0',
  `TotalRank` int(10) DEFAULT '0',
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`),
  KEY `Amount` (`Amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations_bitcoin`
--

DROP TABLE IF EXISTS `donations_bitcoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donations_bitcoin` (
  `BitcoinAddress` varchar(34) NOT NULL,
  `Amount` decimal(24,8) NOT NULL,
  KEY `BitcoinAddress` (`BitcoinAddress`,`Amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations_bitcoin`
--

LOCK TABLES `donations_bitcoin` WRITE;
/*!40000 ALTER TABLE `donations_bitcoin` DISABLE KEYS */;
/*!40000 ALTER TABLE `donations_bitcoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_forum_usernames`
--

DROP TABLE IF EXISTS `donor_forum_usernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_forum_usernames` (
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Prefix` varchar(30) NOT NULL DEFAULT '',
  `Suffix` varchar(30) NOT NULL DEFAULT '',
  `UseComma` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_forum_usernames`
--

LOCK TABLES `donor_forum_usernames` WRITE;
/*!40000 ALTER TABLE `donor_forum_usernames` DISABLE KEYS */;
INSERT INTO `donor_forum_usernames` VALUES (1,'','',0);
/*!40000 ALTER TABLE `donor_forum_usernames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_rewards`
--

DROP TABLE IF EXISTS `donor_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_rewards` (
  `UserID` int(10) NOT NULL DEFAULT '0',
  `IconMouseOverText` varchar(200) NOT NULL DEFAULT '',
  `AvatarMouseOverText` varchar(200) NOT NULL DEFAULT '',
  `CustomIcon` varchar(200) NOT NULL DEFAULT '',
  `SecondAvatar` varchar(200) NOT NULL DEFAULT '',
  `CustomIconLink` varchar(200) NOT NULL DEFAULT '',
  `ProfileInfo1` text NOT NULL,
  `ProfileInfo2` text NOT NULL,
  `ProfileInfo3` text NOT NULL,
  `ProfileInfo4` text NOT NULL,
  `ProfileInfoTitle1` varchar(255) NOT NULL,
  `ProfileInfoTitle2` varchar(255) NOT NULL,
  `ProfileInfoTitle3` varchar(255) NOT NULL,
  `ProfileInfoTitle4` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_rewards`
--

LOCK TABLES `donor_rewards` WRITE;
/*!40000 ALTER TABLE `donor_rewards` DISABLE KEYS */;
INSERT INTO `donor_rewards` VALUES (1,'','','','','','','','','','','','','');
/*!40000 ALTER TABLE `donor_rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drives` (
  `DriveID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Offset` varchar(10) NOT NULL,
  PRIMARY KEY (`DriveID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drives`
--

LOCK TABLES `drives` WRITE;
/*!40000 ALTER TABLE `drives` DISABLE KEYS */;
/*!40000 ALTER TABLE `drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupe_groups`
--

DROP TABLE IF EXISTS `dupe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupe_groups` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Comments` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupe_groups`
--

LOCK TABLES `dupe_groups` WRITE;
/*!40000 ALTER TABLE `dupe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dupe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_blacklist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserID` int(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Time` datetime NOT NULL,
  `Comment` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_albums`
--

DROP TABLE IF EXISTS `featured_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_albums` (
  `GroupID` int(10) NOT NULL DEFAULT '0',
  `ThreadID` int(10) NOT NULL DEFAULT '0',
  `Title` varchar(35) NOT NULL DEFAULT '',
  `Started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ended` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_albums`
--

LOCK TABLES `featured_albums` WRITE;
/*!40000 ALTER TABLE `featured_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_merch`
--

DROP TABLE IF EXISTS `featured_merch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_merch` (
  `ProductID` int(10) NOT NULL DEFAULT '0',
  `Title` varchar(35) NOT NULL DEFAULT '',
  `Image` varchar(255) NOT NULL DEFAULT '',
  `Started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ended` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ArtistID` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_merch`
--

LOCK TABLES `featured_merch` WRITE;
/*!40000 ALTER TABLE `featured_merch` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_merch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `ID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryID` tinyint(2) NOT NULL DEFAULT '0',
  `Sort` int(6) unsigned NOT NULL,
  `Name` varchar(40) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT '',
  `MinClassRead` int(4) NOT NULL DEFAULT '0',
  `MinClassWrite` int(4) NOT NULL DEFAULT '0',
  `MinClassCreate` int(4) NOT NULL DEFAULT '0',
  `NumTopics` int(10) NOT NULL DEFAULT '0',
  `NumPosts` int(10) NOT NULL DEFAULT '0',
  `LastPostID` int(10) NOT NULL DEFAULT '0',
  `LastPostAuthorID` int(10) NOT NULL DEFAULT '0',
  `LastPostTopicID` int(10) NOT NULL DEFAULT '0',
  `LastPostTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AutoLock` enum('0','1') DEFAULT '1',
  `AutoLockWeeks` int(3) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`ID`),
  KEY `Sort` (`Sort`),
  KEY `MinClassRead` (`MinClassRead`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,1,5,'Brainwash The Masses','Totally rad forum',100,100,100,5,67,164,1,11,'2016-11-24 02:35:18','1',4),(2,5,20,'The Lounge','Expect this to fill up with spam',100,100,100,3,31,181,31,3,'2016-11-24 05:04:16','1',4),(3,10,40,'Help!','I fell down and I cant get up',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(4,20,100,'Trash','Every thread ends up here eventually',100,500,500,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(5,8,31,'Music','We love music.',100,100,100,1,12,183,206,5,'2016-11-24 05:13:02','1',4),(6,1,10,'Announcements','',100,100,800,2,9,185,68,18,'2016-11-24 05:17:55','1',4),(7,1,6,'Rebuilding','',100,100,100,5,18,173,223,21,'2016-11-24 04:27:40','1',4),(8,1,11,'What.CD','',100,100,100,1,7,178,223,12,'2016-11-24 04:43:53','1',4),(9,1,12,'Contests & Designs','',100,100,100,1,1,89,124,17,'2016-11-23 15:23:53','1',4),(10,1,13,'Projects','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(11,1,14,'The Laboratory','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(12,1,15,'Suggestions / Ideas','',100,100,100,1,2,180,223,24,'2016-11-24 05:03:37','1',4),(13,1,16,'Bugs','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(14,5,21,'The Library','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(15,5,22,'Concerts, Events & Meets','',100,100,100,2,2,146,1,20,'2016-11-24 01:33:08','1',4),(16,5,23,'Comics','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(17,5,24,'Technology','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(18,8,32,'Vanity House','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(19,8,33,'The Studio','',100,100,100,1,31,184,223,16,'2016-11-24 05:13:12','1',4),(20,8,34,'Offered','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(21,8,35,'Vinyl','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(22,10,41,'Tutorials','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(23,10,42,'BitTorrent','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(24,10,43,'Editing','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(25,20,95,'Resolved Bugs','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(26,20,99,'Closed Suggestions','',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00','1',4),(27,1,4,'STAFF','',800,800,800,1,1,175,223,23,'2016-11-24 04:34:48','1',4);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_categories`
--

DROP TABLE IF EXISTS `forums_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_categories` (
  `ID` tinyint(2) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL DEFAULT '',
  `Sort` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Sort` (`Sort`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_categories`
--

LOCK TABLES `forums_categories` WRITE;
/*!40000 ALTER TABLE `forums_categories` DISABLE KEYS */;
INSERT INTO `forums_categories` VALUES (1,'Site',1),(5,'Community',5),(8,'Music',8),(10,'Help',10),(20,'Trash',20);
/*!40000 ALTER TABLE `forums_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_last_read_topics`
--

DROP TABLE IF EXISTS `forums_last_read_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_last_read_topics` (
  `UserID` int(10) NOT NULL,
  `TopicID` int(10) NOT NULL,
  `PostID` int(10) NOT NULL,
  PRIMARY KEY (`UserID`,`TopicID`),
  KEY `TopicID` (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_last_read_topics`
--

LOCK TABLES `forums_last_read_topics` WRITE;
/*!40000 ALTER TABLE `forums_last_read_topics` DISABLE KEYS */;
INSERT INTO `forums_last_read_topics` VALUES (1,1,182),(1,2,130),(1,3,181),(1,4,101),(1,5,151),(1,6,144),(1,7,131),(1,8,31),(1,9,57),(1,10,160),(1,11,164),(1,12,178),(1,13,166),(1,14,162),(1,15,78),(1,16,150),(1,17,89),(1,18,174),(1,19,145),(1,20,146),(1,21,173),(1,22,169),(1,23,175),(1,24,180),(2,1,3),(2,4,19),(3,1,163),(3,2,46),(3,3,85),(3,4,63),(3,5,36),(3,6,23),(3,7,83),(3,8,31),(3,9,39),(3,10,47),(3,11,96),(3,12,98),(3,13,97),(3,14,73),(3,17,89),(3,18,165),(3,21,167),(4,7,43),(4,12,53),(5,1,3),(5,2,114),(5,3,22),(5,4,29),(5,6,23),(5,7,43),(5,9,39),(5,11,111),(5,12,60),(6,1,3),(6,2,25),(6,3,22),(6,4,34),(6,5,36),(6,7,43),(6,8,31),(6,9,42),(7,2,17),(7,3,10),(7,4,11),(7,5,12),(8,3,10),(10,2,17),(10,3,10),(10,4,11),(10,5,12),(11,2,25),(11,3,22),(11,4,11),(11,5,12),(11,6,23),(11,7,43),(11,9,42),(12,2,62),(12,3,22),(12,4,29),(12,5,12),(12,6,23),(12,7,83),(12,8,31),(12,9,42),(12,10,47),(12,11,96),(12,12,53),(12,13,61),(12,15,78),(12,16,81),(13,2,9),(13,3,99),(13,4,101),(13,5,36),(13,6,23),(13,7,35),(13,8,31),(13,11,103),(13,12,98),(13,13,97),(14,1,44),(14,2,25),(14,3,22),(14,4,34),(14,5,36),(14,6,23),(14,7,43),(14,9,42),(14,11,111),(14,12,60),(15,1,3),(16,2,21),(16,3,10),(16,5,12),(17,2,9),(18,1,70),(18,2,21),(18,3,72),(18,4,69),(18,5,36),(18,6,23),(18,7,65),(18,8,31),(18,9,57),(18,10,47),(18,11,71),(18,12,60),(18,13,61),(18,14,73),(18,15,78),(19,1,3),(19,2,127),(19,3,22),(19,4,34),(19,5,36),(19,6,23),(19,7,43),(19,8,31),(19,9,42),(19,10,121),(20,3,136),(20,5,36),(20,7,43),(20,9,42),(20,12,135),(21,1,88),(21,2,46),(21,3,22),(21,4,55),(21,5,36),(21,6,23),(21,7,58),(21,8,31),(21,9,39),(21,10,47),(21,11,56),(21,12,60),(21,13,61),(21,15,78),(22,2,21),(22,3,22),(22,4,19),(22,5,12),(22,6,23),(22,7,43),(22,9,42),(23,1,44),(23,2,25),(23,3,22),(23,4,34),(23,5,36),(23,7,58),(23,8,31),(23,9,42),(23,10,92),(23,11,109),(23,12,60),(23,13,97),(26,2,16),(26,3,22),(26,4,34),(26,5,12),(26,6,23),(26,8,31),(26,9,42),(27,2,16),(27,4,11),(28,1,3),(28,2,62),(28,5,36),(28,7,43),(28,8,31),(28,9,42),(30,1,3),(30,4,101),(30,9,42),(30,10,92),(30,12,98),(30,13,97),(30,15,78),(31,1,3),(31,2,25),(31,3,181),(31,4,33),(31,6,144),(31,7,131),(31,9,39),(31,11,164),(31,13,97),(31,18,174),(31,21,173),(31,23,175),(32,1,3),(32,7,65),(34,1,70),(34,3,72),(34,5,36),(34,9,57),(34,10,47),(34,11,71),(34,12,60),(34,13,61),(34,14,73),(34,15,78),(35,2,21),(35,4,19),(35,5,12),(35,6,23),(35,8,31),(35,9,42),(37,2,21),(37,7,38),(37,12,60),(37,15,78),(38,2,25),(38,3,22),(38,4,69),(38,6,23),(38,13,61),(38,14,73),(39,1,48),(39,2,25),(39,3,85),(39,4,34),(39,5,36),(39,6,23),(39,7,83),(39,8,31),(39,9,42),(39,10,47),(39,11,51),(39,12,53),(39,13,59),(40,3,22),(40,4,34),(41,1,88),(41,3,22),(41,4,24),(41,5,36),(41,6,23),(41,7,32),(41,16,81),(42,1,3),(42,2,25),(42,4,24),(42,5,12),(42,6,23),(42,7,43),(42,8,31),(42,9,42),(42,10,160),(42,11,161),(42,12,135),(42,18,159),(43,2,25),(43,3,22),(46,2,25),(46,4,28),(47,1,88),(47,2,25),(47,3,85),(47,4,101),(47,5,12),(47,6,23),(47,7,40),(47,9,39),(47,10,92),(47,11,106),(47,12,98),(47,13,61),(48,1,3),(49,2,25),(49,3,22),(49,4,33),(49,5,12),(50,6,23),(50,7,38),(50,8,31),(51,1,3),(51,7,43),(52,1,124),(52,2,114),(52,3,122),(52,4,34),(52,5,123),(52,6,23),(52,7,83),(52,8,31),(52,9,57),(52,10,121),(52,11,96),(52,12,119),(52,13,97),(52,14,73),(52,16,81),(52,17,89),(52,22,168),(53,1,3),(53,7,43),(53,8,31),(54,9,42),(56,9,42),(57,1,87),(57,15,78),(58,1,44),(58,5,84),(58,13,61),(58,15,78),(59,2,25),(59,6,23),(59,7,43),(59,8,31),(60,3,22),(60,4,34),(60,7,43),(60,8,31),(61,1,48),(62,1,48),(62,2,25),(62,3,85),(62,7,83),(62,8,31),(62,9,42),(62,10,47),(62,12,60),(62,13,61),(62,15,78),(63,1,44),(63,7,43),(65,1,157),(65,2,25),(65,3,22),(65,4,34),(65,6,23),(65,7,131),(65,8,31),(65,9,42),(65,11,153),(66,2,46),(66,10,47),(66,14,73),(66,15,78),(67,7,83),(67,12,60),(67,15,78),(68,1,182),(68,2,130),(68,3,105),(68,4,69),(68,6,23),(68,7,131),(68,8,31),(68,9,42),(68,11,153),(68,12,178),(68,13,166),(68,18,185),(68,21,173),(69,1,44),(69,2,62),(69,6,23),(69,7,83),(69,8,31),(69,11,80),(69,12,60),(70,1,163),(70,2,130),(70,3,136),(70,4,101),(70,6,144),(70,7,131),(70,9,57),(70,10,129),(70,11,161),(70,12,119),(70,13,166),(70,15,78),(70,18,165),(70,21,170),(70,22,168),(71,8,31),(72,1,44),(74,1,48),(74,7,83),(74,10,47),(74,12,53),(74,15,78),(75,1,48),(75,2,62),(75,7,50),(75,9,57),(75,12,60),(75,13,61),(76,1,48),(76,3,22),(76,4,34),(76,9,42),(76,10,47),(76,11,96),(76,13,93),(77,7,50),(77,10,47),(78,4,34),(78,7,65),(78,9,42),(78,10,47),(78,13,97),(78,15,78),(79,1,48),(79,9,42),(79,12,53),(80,9,42),(80,10,47),(80,11,51),(81,11,51),(82,10,47),(83,1,48),(83,2,114),(83,7,52),(83,10,47),(83,12,53),(84,2,46),(85,3,72),(85,9,57),(85,10,47),(85,11,71),(85,12,60),(87,1,102),(87,3,104),(87,10,160),(87,12,53),(89,1,48),(89,9,42),(90,1,86),(90,2,62),(90,3,85),(90,4,69),(90,5,84),(90,6,23),(90,7,83),(90,8,31),(90,9,57),(90,10,47),(90,11,80),(90,12,60),(90,13,61),(90,14,73),(90,15,78),(90,16,81),(91,1,112),(91,2,114),(91,3,113),(91,4,63),(91,5,100),(91,6,23),(91,7,83),(91,8,31),(91,9,57),(91,10,115),(91,11,111),(91,12,98),(91,13,97),(91,14,73),(91,15,78),(91,16,81),(91,17,89),(92,1,48),(92,2,62),(92,3,22),(92,4,55),(92,7,65),(92,9,57),(92,10,47),(92,11,71),(92,12,60),(92,13,61),(92,14,73),(92,15,78),(94,1,163),(94,2,130),(94,3,136),(94,4,69),(94,5,151),(94,6,144),(94,7,131),(94,8,31),(94,9,57),(94,10,160),(94,11,164),(94,12,135),(94,13,97),(94,18,165),(94,19,145),(94,20,146),(95,7,83),(95,11,161),(95,12,135),(95,13,61),(95,17,89),(96,3,72),(96,12,60),(98,1,70),(99,1,88),(99,3,72),(99,5,90),(99,6,23),(99,7,83),(99,8,31),(99,9,57),(99,10,47),(99,11,75),(99,12,60),(99,13,61),(99,14,73),(99,15,78),(99,17,89),(100,5,36),(101,1,76),(101,2,62),(101,3,72),(101,7,79),(101,8,31),(101,9,57),(101,10,47),(101,11,80),(101,12,60),(101,14,73),(101,15,78),(102,1,88),(102,5,36),(102,7,83),(102,11,77),(102,12,60),(102,15,78),(102,16,81),(103,11,80),(104,1,76),(104,3,72),(104,5,36),(104,12,60),(105,2,114),(105,3,72),(105,5,100),(105,6,23),(105,7,83),(105,8,31),(105,9,57),(105,10,92),(105,11,137),(105,12,98),(105,13,97),(105,15,78),(105,17,89),(106,11,77),(106,12,60),(107,1,76),(107,2,114),(107,3,136),(107,4,101),(107,7,83),(107,9,57),(107,12,60),(108,2,62),(108,8,31),(108,11,77),(109,3,72),(109,12,60),(110,1,88),(110,2,62),(110,3,72),(110,4,69),(110,5,82),(110,6,23),(110,7,83),(110,8,31),(110,9,57),(110,11,80),(110,12,60),(110,14,73),(110,15,78),(110,16,81),(110,17,89),(111,1,88),(111,7,83),(111,11,77),(111,12,60),(113,1,76),(113,2,62),(113,3,72),(113,4,69),(113,6,23),(113,8,31),(113,9,57),(113,12,60),(114,3,72),(114,10,47),(114,12,60),(114,15,78),(116,1,76),(116,3,72),(116,8,31),(116,12,60),(117,7,83),(118,1,108),(118,3,85),(118,12,98),(119,3,85),(119,15,78),(120,1,88),(120,3,85),(121,1,163),(121,3,85),(121,11,161),(121,12,135),(121,18,165),(121,22,168),(122,1,88),(122,3,85),(122,5,84),(122,7,83),(122,10,115),(122,12,60),(122,13,97),(122,14,73),(122,15,78),(123,7,83),(123,15,78),(124,4,69),(124,12,60),(124,17,89),(124,18,165),(126,1,88),(126,5,90),(126,7,83),(126,12,60),(126,15,78),(126,16,81),(127,3,85),(127,5,90),(127,11,80),(127,12,60),(128,1,88),(128,3,85),(128,9,57),(128,11,109),(128,12,98),(128,18,174),(129,2,62),(129,3,85),(129,4,69),(129,6,23),(129,7,83),(129,8,31),(129,9,57),(129,11,80),(129,12,60),(130,12,60),(131,3,85),(131,5,100),(131,12,98),(132,2,62),(132,3,85),(132,12,60),(135,1,88),(135,11,80),(136,1,88),(136,2,62),(136,3,85),(136,4,69),(136,5,90),(136,6,23),(136,7,83),(136,8,31),(136,9,57),(136,10,47),(136,12,60),(136,13,61),(136,14,73),(136,15,78),(136,16,81),(136,17,89),(137,5,91),(137,7,83),(137,10,47),(137,12,60),(137,13,61),(137,15,78),(138,1,88),(140,1,112),(140,3,85),(140,5,100),(140,12,60),(141,4,69),(143,1,88),(143,2,62),(143,3,85),(143,4,69),(143,5,91),(143,6,23),(143,7,83),(143,8,31),(143,9,57),(143,10,92),(143,11,80),(143,12,60),(143,13,93),(143,14,73),(143,15,78),(145,6,144),(145,7,131),(145,10,129),(145,11,143),(145,12,135),(145,13,97),(145,18,138),(148,1,154),(148,2,130),(148,5,151),(149,2,62),(149,6,23),(149,7,83),(149,11,80),(149,12,60),(151,1,88),(152,3,85),(153,1,88),(154,1,94),(154,2,62),(154,3,85),(154,7,83),(154,9,57),(154,11,96),(154,12,60),(154,16,81),(156,1,88),(156,12,60),(158,1,88),(158,2,62),(158,7,83),(159,1,88),(160,9,57),(160,10,92),(160,12,60),(160,13,97),(160,17,89),(161,11,139),(161,21,173),(162,1,88),(162,2,62),(162,5,91),(162,6,23),(162,7,83),(162,8,31),(162,11,80),(163,3,85),(163,5,90),(163,12,60),(165,1,112),(165,2,114),(165,3,113),(165,12,98),(165,13,97),(166,2,62),(166,3,85),(166,9,57),(166,10,47),(166,11,80),(166,12,60),(166,14,73),(166,17,89),(167,3,85),(167,4,69),(167,7,83),(167,11,80),(167,12,60),(167,15,78),(168,1,112),(168,12,60),(169,2,114),(169,5,120),(169,8,31),(169,11,111),(169,15,78),(170,1,88),(170,7,83),(170,12,60),(172,12,60),(172,15,78),(174,3,85),(174,5,100),(174,7,83),(174,11,106),(174,12,98),(174,13,97),(175,1,88),(175,6,23),(175,16,81),(176,3,85),(176,12,60),(177,2,62),(177,12,60),(178,12,60),(179,1,88),(179,15,78),(179,17,89),(180,1,88),(181,3,85),(181,7,83),(181,12,60),(183,1,94),(183,2,114),(183,8,31),(183,12,119),(183,13,93),(184,1,94),(184,3,85),(184,7,83),(184,12,60),(184,13,93),(185,1,102),(185,16,81),(187,2,114),(189,11,96),(190,10,92),(190,11,161),(190,12,60),(190,13,97),(191,1,154),(191,2,130),(191,3,136),(191,6,144),(191,7,131),(191,10,129),(191,11,153),(191,12,135),(191,16,150),(191,18,159),(191,19,145),(191,20,146),(192,1,94),(192,4,69),(192,10,121),(192,11,96),(192,12,98),(192,16,81),(192,17,89),(194,3,99),(195,12,98),(196,1,118),(197,1,102),(197,3,105),(197,4,101),(197,5,100),(197,11,103),(197,12,98),(197,13,97),(197,17,89),(199,2,114),(199,3,113),(199,10,115),(199,12,119),(203,1,117),(203,10,115),(206,2,114),(206,3,179),(206,5,183),(206,11,109),(206,15,78),(206,17,89),(206,18,165),(208,1,108),(208,10,92),(208,12,98),(210,11,134),(210,12,133),(211,7,83),(211,8,31),(211,11,111),(213,1,126),(214,1,118),(214,3,122),(214,5,120),(214,9,57),(214,10,115),(214,12,119),(214,16,81),(217,1,163),(217,11,111),(218,11,161),(220,2,114),(220,3,113),(220,12,98),(222,1,126),(222,2,130),(222,5,123),(222,6,144),(222,7,131),(222,8,31),(222,11,164),(222,12,135),(222,13,166),(222,17,89),(222,18,174),(222,21,173),(222,22,169),(223,1,182),(223,2,130),(223,3,181),(223,5,183),(223,6,144),(223,7,131),(223,8,31),(223,10,129),(223,11,161),(223,12,178),(223,16,184),(223,17,89),(223,18,174),(223,20,146),(223,21,173),(223,22,169),(223,23,175),(223,24,180),(225,1,117),(225,3,113),(225,10,115),(225,12,98),(229,1,126),(230,2,114),(230,13,97),(231,1,112),(231,2,114),(231,3,113),(231,5,100),(231,6,23),(231,8,31),(231,11,111),(231,12,98),(231,13,97),(231,17,89),(232,12,135),(234,1,112),(235,1,118),(235,2,114),(235,5,123),(235,10,121),(237,1,112),(240,3,113),(240,12,98),(241,1,126),(243,1,126),(243,8,31),(243,11,111),(245,5,151),(245,10,115),(245,17,89),(245,18,156),(246,1,118),(246,2,128),(246,6,23),(246,7,83),(246,8,31),(246,10,129),(246,11,125),(246,12,119),(246,13,97),(246,14,73),(246,15,78),(247,1,126),(247,2,128),(247,3,122),(247,5,123),(247,6,23),(247,7,83),(247,8,31),(247,9,57),(247,10,121),(247,11,125),(247,12,119),(247,16,81),(247,17,89),(248,1,112),(248,8,31),(248,11,111),(249,2,114),(249,12,98),(257,12,119),(258,1,154),(261,2,114),(261,12,119),(261,13,97),(262,12,135),(265,2,128),(266,1,118),(266,3,122),(266,4,101),(266,5,123),(266,9,57),(266,10,121),(266,12,119),(266,13,97),(266,14,73),(266,15,78),(266,17,89),(266,18,159),(266,19,145),(266,20,146),(267,2,127),(267,10,121),(267,12,119),(267,15,78),(268,1,126),(268,4,101),(268,8,31),(268,9,57),(268,12,133),(268,16,81),(269,2,127),(269,10,121),(269,13,97),(269,14,73),(269,15,78),(270,2,114),(278,12,135),(281,1,126),(282,1,126),(282,3,136),(282,18,165),(283,1,126),(283,2,128),(283,3,122),(283,5,123),(283,6,23),(283,7,83),(283,8,31),(283,9,57),(283,10,121),(283,12,119),(287,2,128),(288,1,126),(289,3,136),(291,11,139),(294,2,130),(294,5,123),(296,1,142),(296,5,147),(296,10,129),(296,12,135),(296,13,97),(296,18,138),(299,5,151),(299,6,144),(299,7,131),(299,8,31),(299,10,129),(299,11,149),(299,12,135),(299,14,73),(299,15,78),(299,18,138),(300,7,131),(300,11,139),(302,2,130),(302,6,144),(302,10,129),(302,11,153),(302,12,135),(302,18,159),(303,1,154),(303,5,151),(303,12,135),(303,17,89),(304,7,131),(304,10,160),(306,12,135),(310,1,163),(310,10,160),(310,12,135),(310,14,162),(310,18,159),(310,19,145),(310,20,146),(314,2,130),(314,3,136),(314,5,151),(314,11,161),(314,12,135),(316,3,136),(317,8,31),(317,12,135),(318,3,136),(318,12,135),(319,1,154),(322,11,161),(322,12,135),(322,21,167),(322,22,168),(323,1,163),(323,3,136),(323,12,135),(324,6,144),(324,11,164),(326,1,177),(326,11,164),(326,12,135),(326,17,89),(326,18,174),(327,12,135),(327,24,176),(328,1,154),(328,12,135),(328,18,174),(331,2,130),(331,21,173),(332,1,154),(332,3,179),(336,11,161),(336,18,174),(337,2,130),(337,3,181),(337,4,101),(337,8,31),(337,9,57),(337,10,160),(337,12,178),(338,1,154),(338,7,131),(338,8,31),(338,12,178),(338,18,174),(339,13,166);
/*!40000 ALTER TABLE `forums_last_read_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_polls`
--

DROP TABLE IF EXISTS `forums_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_polls` (
  `TopicID` int(10) unsigned NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Answers` text NOT NULL,
  `Featured` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Closed` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_polls`
--

LOCK TABLES `forums_polls` WRITE;
/*!40000 ALTER TABLE `forums_polls` DISABLE KEYS */;
INSERT INTO `forums_polls` VALUES (13,'Should The Database Be Read-Only Open Access','a:3:{i:1;s:3:\"Yes\";i:2;s:2:\"No\";i:3;s:5:\"Parts\";}','0000-00-00 00:00:00','0'),(23,'Should we create an image hosting service of our own?','a:2:{i:1;s:3:\"Yes\";i:2;s:2:\"No\";}','0000-00-00 00:00:00','0');
/*!40000 ALTER TABLE `forums_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_polls_votes`
--

DROP TABLE IF EXISTS `forums_polls_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_polls_votes` (
  `TopicID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL,
  `Vote` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`TopicID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_polls_votes`
--

LOCK TABLES `forums_polls_votes` WRITE;
/*!40000 ALTER TABLE `forums_polls_votes` DISABLE KEYS */;
INSERT INTO `forums_polls_votes` VALUES (13,1,3),(13,3,3),(13,18,3),(13,30,1),(13,31,0),(13,62,0),(13,68,3),(13,76,1),(13,78,3),(13,91,0),(13,92,3),(13,105,0),(13,143,2),(13,174,3),(13,197,3),(13,246,1),(13,266,0),(23,1,1),(23,223,1);
/*!40000 ALTER TABLE `forums_polls_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_posts`
--

DROP TABLE IF EXISTS `forums_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_posts` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TopicID` int(10) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Body` mediumtext,
  `EditedUserID` int(10) DEFAULT NULL,
  `EditedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TopicID` (`TopicID`),
  KEY `AuthorID` (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_posts`
--

LOCK TABLES `forums_posts` WRITE;
/*!40000 ALTER TABLE `forums_posts` DISABLE KEYS */;
INSERT INTO `forums_posts` VALUES (1,1,1,'2016-11-20 21:18:43','This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.',NULL,NULL),(2,2,1,'2016-11-20 21:21:01','This site is NOT the successor to what.cd\r\n\r\nThis site is to rebuild the documentation, wiki, faqs, guides, etc. that was lost from the original what.cd\r\n\r\nIt uses gazelle solely in the hopes/goal that the information recreated here will be in a suitable format to import easily into the successor, whomever that is.\r\n\r\nThis site WILL NOT be hosting torrents. All uploads are disabled.',NULL,NULL),(3,1,3,'2016-11-20 21:27:19','Right. I think the biggest concentration of ex-users is in the facebook group. I think many would be interested in helping, what do you think?\r\n\r\n[quote=Captain|1]This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.[/quote]',NULL,NULL),(4,2,5,'2016-11-20 22:07:33','Glad to be here ',NULL,NULL),(5,2,6,'2016-11-20 22:14:55','Me too, let\'s start the rebuild!',NULL,NULL),(6,2,5,'2016-11-20 22:20:48','i have some docx files like ripping guides\r\n',NULL,NULL),(7,3,1,'2016-11-20 22:41:25','We need to rebuild all the documentation, guides, wikis, FAQs, interviews, etc.\r\n\r\nIn that effort, we need a place to post it all. Please post in the forums here.\r\nIf you would like to be made a forum moderator (and/or have screenshots of the various Categories) please send me a PM or post here.',NULL,NULL),(8,2,1,'2016-11-20 22:45:08','[quote=XTC|6]i have some docx files like ripping guides[/quote]\r\n\r\nFantastic. I\'ll set up a repository to dump files like that and any and all screenshots from what.cd.\r\n\r\nWe shall rebuild.',NULL,NULL),(9,2,5,'2016-11-20 22:49:23','[quote=Captain|8][quote=XTC|6]i have some docx files like ripping guides[/quote]\r\n\r\nFantastic. I\'ll set up a repository to dump files like that and any and all screenshots from what.cd.\r\n\r\nWe shall rebuild.[/quote]\r\n\r\n\r\nvery nice ',NULL,NULL),(10,3,3,'2016-11-20 22:50:53','[URL=http://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping with Exact Audio Copy[/URL]\n\n[spoiler=Rippy images][img=http://i.imgur.com/cHLqtXM.png][/spoiler]\n[url=https://apt.jwshields.net/what/rippy.zip]Link[/url]\nhttps://apt.jwshields.net/what/\n\n\n\n[size=4][b][color=blue]better.sh: Transcode a folder of FLACs to V0, V2 and 320[/color][/b][/size]\n\n\n[size=3][b]Instructions[b][/size]\n\n1. Open up a terminal or establish a SSH connection to your seedbox\n2. Verify that \"lame\" and \"flac\" are installed (already installed on baconSeed!)\n3. Download the script and move it to ~/bin then run this command:\n\n[pre]~$ chmod +x ~/bin/better.sh[/pre]\n\n4. Transcode!\n\n[pre]~$ better.sh \"~/downloads/Rebecca Black - Unintelligible Screeching [FLAC]\" \"Rebecca Black - Unintelligible Screeching\" \"~/downloads\"[/pre]\n\n[size=3][b]Script[/b][/size]\n\n[pre]#!/bin/bash\n# Written by Phos, released into the public domain\n# Attribution requested. :)\n#\n# Usage:\n# ./better.sh FLAC_FOLDER NAME_PREFIX OUTPUT_PATH\n# ./better.sh path/to/My.Awesome.Music.FLAC/ \"John Doe - This is an Album\" path/to/rtorrent/downloads\n\nconvert () {\n  artist=$(metaflac --show-tag=ARTIST \"$1\" | sed \'s .......  \')\n  album=$(metaflac --show-tag=ALBUM \"$1\" | sed \'s ......  \')\n  title=$(metaflac --show-tag=TITLE \"$1\" | sed \'s ......  \')\n  date=$(metaflac --show-tag=DATE \"$1\" | sed \'s .....  \')\n  number=$(metaflac --show-tag=TRACKNUMBER \"$1\" |sed \'s ............  \')\n\n  flac -cd \"$1\" 2> /dev/null | lame \"$3\" -h --tt \"$title\" --ta \"$artist\" --tl \"$album\" --ty \"$date\" --tn \"$number\" - \"$2\" 2> /dev/null;\n}\n\nconvertv0 () {\n  convert \"$1\" \"$2\" \"-V 0\"\n}\n\nconvertv2 () {\n  convert \"$1\" \"$2\" \"-V 2\"\n}\n\nconvert320 () {\n  convert \"$1\" \"$2\" \"-b 320\"\n}\n\nFLAC_FOLDER=\"$1\"\nNAME_PREFIX=\"$2\"\nOUTPUT_PATH=\"$3\"\n\nV0PATH=\"$OUTPUT_PATH/$NAME_PREFIX [v0]\"\nV2PATH=\"$OUTPUT_PATH/$NAME_PREFIX [v2]\"\nM320PATH=\"$OUTPUT_PATH/$NAME_PREFIX [320]\"\n\nmkdir -p \"$V0PATH\" \"$V2PATH\" \"$M320PATH\"\n\nfor flac_file in \"$FLAC_FOLDER/\"*.flac; do\n  emptyname=$(basename \"$flac_file\" .flac)\n  name=\"$emptyname\".mp3\n\n  echo \"Converting $emptyname to v0, v2, 320...\"\n  convertv0 \"$flac_file\" \"$V0PATH/$name\" &\n  convertv2 \"$flac_file\" \"$V2PATH/$name\" &\n  convert320 \"$flac_file\" \"$M320PATH/$name\" &\n  wait\ndone[/pre]',3,'2016-11-20 23:15:37'),(11,4,1,'2016-11-21 00:20:40','What documents, guides, wikis do you miss the most?\r\n\r\nWhat requests should we work on first?',NULL,NULL),(12,5,1,'2016-11-21 00:22:34','Who are some of your favorite artists? fun. The Early November, Rolling Stones, Sorority Noise.\r\nWhat genres do you listen to? Electronic, pop, rock, alt, ambient, trap, trance, dubstep\r\n\r\nLets get some activity and make this a place to build.\r\n',NULL,NULL),(13,2,21,'2016-11-21 00:24:50','Thanks for making this, it\'s a great idea and it feels good to be browsing Gazelle with the WCD theme, somehow cathartic.\r\n\r\nShouldn\'t we start by making a list as exhaustive as possible of the Forums & Wiki pages and then try and fill them up appropriately ?',NULL,NULL),(14,2,1,'2016-11-21 00:28:30','[quote=Courbine|13]Thanks for making this, it\'s a great idea and it feels good to be browsing Gazelle with the WCD theme, somehow cathartic.\r\n\r\nShouldn\'t we start by making a list as exhaustive as possible of the Forums & Wiki pages and then try and fill them up appropriately ?[/quote]\r\n\r\nI think that is a great idea. If you\'ve got screen shots of them I\'d love to start building the framework.',NULL,NULL),(15,2,23,'2016-11-21 00:31:07','I still need to scrub through my caches.\r\n\r\nI\'m hoping to find some of the vinyl ripping guides if I\'m lucky',NULL,NULL),(16,2,21,'2016-11-21 00:43:08','Couldn\'t make the cache trick work on my browser unfortunately, but there\'s a few whatcd screens here and there online. Not always up to date, but that can be a good starting point !\n\nForum Screen from 2013 : http://inviteparadise.com/uploads/imgs/pre_1379315235__forums_--_whatcd_2013-09-16_12-13-09.png\n\n[b]Edit :[/b] Many other screens including full rules from 2013 : http://inviteparadise.com/index.php?/topic/287-whatcd-music-review-september-2013/\n\nCan be interesting as well even if this website isn\'t going to host torrents as it can serve as basis for new rules for whoever wants to build a new tracker',21,'2016-11-21 00:50:07'),(17,2,28,'2016-11-21 01:08:18','Hi everybody, glad to be here!',NULL,NULL),(18,2,11,'2016-11-21 01:24:27','[quote=Captain|2]This site WILL NOT be hosting torrents. All uploads are disabled.[/quote]If this site will never host any torrents then why is it invite only? why not let everyone come see what what.cd used to look like including the un-invited? just a question i thought I\'d ask.',NULL,NULL),(19,4,30,'2016-11-21 01:31:49','To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I\'m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.',NULL,NULL),(20,2,5,'2016-11-21 01:36:45','[quote=OldPirate|18][quote=Captain|2]This site WILL NOT be hosting torrents. All uploads are disabled.[/quote]If this site will never host any torrents then why is it invite only? why not let everyone come see what what.cd used to look like including the un-invited? just a question i thought I\'d ask.[/quote]\r\n\r\ni imagine too much traffic might crash the site lol, but this is a great rendition of What,i must say',NULL,NULL),(21,2,11,'2016-11-21 01:39:14','[quote=XTC|20][quote=OldPirate|18][quote=Captain|2]This site WILL NOT be hosting torrents. All uploads are disabled.[/quote]If this site will never host any torrents then why is it invite only? why not let everyone come see what what.cd used to look like including the un-invited? just a question i thought I\'d ask.[/quote]\r\n\r\ni imagine too much traffic might crash the site lol, but this is a great rendition of What,i must say[/quote]never thought of the traffic scenario.',NULL,NULL),(22,3,31,'2016-11-21 02:05:27','Old Revived Wiki Articles:\n[URL=https://www.brainwashthemasses.org/wiki.php?action=article&id=3]EAC - Setup Guide[/URL]\n[URL=https://www.brainwashthemasses.org/wiki.php?action=article&id=2]EAC - Ripping Guide[/URL]',31,'2016-11-21 02:07:05'),(23,6,3,'2016-11-21 04:15:10','I made this topic to post all the relevant information on any kind of WCD database restore and similar subjects.\n\n[url=https://www.reddit.com/r/trackers/comments/5e0e7q/i_parsed_whatcds_site_a_year_ago_to_store_the/]A guy on Reddit have parsed What.CD\'s site a year ago to store the catalog of recordings and their download counts of famous composers.[/url]\n',3,'2016-11-21 04:16:20'),(24,4,40,'2016-11-21 09:34:34','Collages, for sure. That was one of the things I used the most. ',NULL,NULL),(25,2,1,'2016-11-21 11:25:02','[quote=OldPirate|21][quote=XTC|20][quote=OldPirate|18][quote=Captain|2]This site WILL NOT be hosting torrents. All uploads are disabled.[/quote]If this site will never host any torrents then why is it invite only? why not let everyone come see what what.cd used to look like including the un-invited? just a question i thought I\'d ask.[/quote]\r\n\r\ni imagine too much traffic might crash the site lol, but this is a great rendition of What,i must say[/quote]never thought of the traffic scenario.[/quote]\r\n\r\nThe traffic is only one issue, (its free tier AWS instance) but I would like to rebuild the site using the quality members that What.CD was built on in the first place. In time, it will likely be open registration but I want those that were around and knew what to be the ones contributing to building it first.',NULL,NULL),(26,4,38,'2016-11-21 12:57:13','That\'s going to be a tricky one without torrents - given they\'re really just a list of torrents.',NULL,NULL),(27,4,19,'2016-11-21 13:14:00','I just want to hear someone has access to all this metadata: https://archive.org/details/whatcdcrawl\n\nAlso this:\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/',19,'2016-11-21 14:19:38'),(28,4,6,'2016-11-21 13:15:48','[quote=Tinerfe|19]To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I\'m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.[/quote]\r\n\r\nAgree, many (most?) will have their files still sitting in their client. An informative guide on getting those back on to the new site.',NULL,NULL),(29,4,47,'2016-11-21 14:12:28','I don\'t have the old vinyl ripping guide, but I\'ll create a new one if the WCD version doesn\'t pop up in the next few days.',NULL,NULL),(30,7,21,'2016-11-21 14:19:06','So we organise the discussion a bit, what would you guys say we restored the previous threads from What.CD + add a section dedicated to those who want to rebuild the knowledge database ? This way people can keep talking in appropriate threads as if nothing happened and work on rebuilding the knowledge database at the same time ?\r\n\r\nFrom a screenshot from 2013, the forum structure was something like this :\r\n\r\n> Site\r\nAnnouncements\r\nWhat.CD\r\nContests & Designs\r\nProjects\r\nThe Laboratory\r\nSuggestions / Ideas\r\nBugs\r\n\r\n> Community\r\nThe Lounge\r\nThe Library\r\nConcerts, Events & Meets\r\nComics\r\nTechnology\r\n\r\n> Music\r\nMusic\r\nVanity House\r\nThe Studio\r\nOffered\r\nVinyl\r\n\r\n> Help\r\nHelp\r\nTutorials\r\nBitTorrent\r\nEditing\r\n\r\n> Trash\r\nResolved Bugs\r\nClosed Suggestions\r\nTrash\r\n\r\nShould we add something like :\r\n\r\n> Rebuild\r\nWiki\r\nCollages\r\nFeatures (Logcheck, Sherlock, Top 10..)\r\nSuggestions / Ideas\r\n\r\nWhat do you think ?',NULL,NULL),(31,8,1,'2016-11-21 14:32:41','Glad these cucks are shut down!\r\n \r\n19* 19Now talking on #what.cd-interview8\r\n29* 29Topic for #what.cd-interview8 29is: What.CD Invite Interview Room #8\r\n29* 29Topic for #what.cd-interview8 29set by numnumjuice 29at Mon Aug 03 23:06:45 2015\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SECTION 1 - INTRODUCTION\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n21<OccupyDemonoid>21 Hello <******> , my name is OccupyDemonoid and I will be your interviewer today.\r\n<OccupyDemonoid> Youâ€™re about to take a test that can take anywhere between 1 hour and 2 hours.\r\n<OccupyDemonoid> Before you get started, you need to know that if you leave the test at any time for whatever reason it will be counted as a fail.\r\n<OccupyDemonoid> If you decide you do not have enough time right now to complete the test, youâ€™re free to leave and try again later.\r\n<OccupyDemonoid> Leaving now will not be counted as a fail.\r\n<OccupyDemonoid> Feel free to ask any questions before a section starts.\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> Type OccupyDemonoid when youâ€™re ready to continue.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SECTION 2 - INTERVIEW RULES\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 1. Use your own words to answer questions in a reasonable amount of time. You don\'t need to sound like you swallowed an encyclopedia!\r\n<OccupyDemonoid> 2. DO NOT search for answers in your notes (including on paper) or on Google, Wikipedia, hydrogenaudio, the What.CD Interview Preparation site, or any other site. Please close the prep site or any interview notes now.\r\n<OccupyDemonoid> 3. 4POSTING THE CONTENTS OF THIS INTERVIEW ANYWHERE OR SHOWING IT TO ANYONE WILL COST YOU YOUR ACCOUNT OR YOUR CHANCES AT INTERVIEWING AGAIN!\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> If you have any questions, please ask them now.\r\n<OccupyDemonoid> When you are done and to show you have understood all the rules, please type OccupyDemonoid.\r\n<OccupyDemonoid> You get up to 3 tries to pass the test.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SECTION 3 - BACKGROUND INFORMATION\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 4-ONE LINE PER ANSWER. NUMBER YOUR ANSWERS.-\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 1. Have you had an account at What.CD before?\r\n<OccupyDemonoid> 2. Have you interviewed here before? If so, by whom and when?\r\n<OccupyDemonoid> 3. Where do you live? Are you currently using your home connection?\r\n<OccupyDemonoid> 4. Are you fluent in English? If not, what\'s your primary language?\r\n<OccupyDemonoid> 5. How did you find out about the interviewing process?\r\n<OccupyDemonoid> 6. What is your e-mail address?\r\n<OccupyDemonoid> 7. Have you ever participated in invite trading, buying, or selling? Admit to it now and your actions will be excused. Deny it and get found later and you will be permanently banned.\r\n<OccupyDemonoid> 8. Are you a member of other private trackers? Please list all of them, rutracker counts for the purpose of this question. If you had a Demonoid account, tell me what username you had there.\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> When you are done with your answers type my name: OccupyDemonoid.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SCREEN SHOTS - http://www.take-a-screenshot.org - A how-to guide\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> Take screenshots of your trackers profiles pages. These need to be fullscreen, with this chat and your taskbar visible. You can only hide your passkey. If you do not have any torrent profiles, you can take a screenshot with this chat, your torrent client and your dock showing.\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> Upload the image to imgur.com and link me the image file(s).\r\n<OccupyDemonoid> Say my nick OccupyDemonoid, when you are done.\r\n<OccupyDemonoid> Are you on windows?\r\n<OccupyDemonoid> If so, it would be your taskbar. The part where it shows the time.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SECTION 5 - BITRATES\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> -ONE LINE PER ANSWER. NUMBER YOUR ANSWERS.-\r\n<OccupyDemonoid> 4You only have 10 minutes to answer this section.\r\n<OccupyDemonoid> 1. Order the following formats from LOWEST to HIGHEST target bitrate. List the letters only.\r\n<OccupyDemonoid> --- A. MP3 128 (CBR)\r\n<OccupyDemonoid> --- B. MP3 V0 (VBR)\r\n<OccupyDemonoid> --- C. FLAC\r\n<OccupyDemonoid> --- D. MP3 320 (CBR)\r\n<OccupyDemonoid> --- E. MP3 V2 (VBR)\r\n<OccupyDemonoid> 2. Which of these formats are lossless? If you can\'t find any, tell me one.\r\n<OccupyDemonoid> --- A. AAC 256 (CBR)\r\n<OccupyDemonoid> --- B. MP3 192 (CBR)\r\n<OccupyDemonoid> --- C. MP3 V2 (VBR)\r\n<OccupyDemonoid> --- D. WAV (PCM)\r\n<OccupyDemonoid> --- E. DTS\r\n<OccupyDemonoid> 3. Which of these formats are ARE allowed on What.CD? List the letters only.\r\n<OccupyDemonoid> --- A. FLAC\r\n<OccupyDemonoid> --- B. APE\r\n<OccupyDemonoid> --- C. MP3 320 kbps (CBR)\r\n<OccupyDemonoid> --- D. ALAC\r\n<OccupyDemonoid> --- E. OGG\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> When you are done type my name: OccupyDemonoid.\r\n<OccupyDemonoid> So you know, ALAC is not allowed.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> SECTION 6 - FORMATS AND ENCODING\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 4-ONE LINE PER ANSWER. NUMBER YOUR ANSWERS.-\r\n<OccupyDemonoid> 4You only have 10 minutes to answer this section.\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 1. Do you know the lowest allowed CBR bitrate on What.CD?\r\n<OccupyDemonoid> 2. Tell me everything you know about VBR and CBR. Why would you choose one over the other?\r\n<OccupyDemonoid> 3. What is LAME, and what does it output?\r\n<OccupyDemonoid> 4. When we are talking about lossy, what does that mean? Tell me everything you know on the subject.\r\n<OccupyDemonoid> 5. Which of these formats are LAME outputs, and why not the others?\r\n<OccupyDemonoid> --- A. WAV (PCM)\r\n<OccupyDemonoid> --- B. MP3 320 (CBR)\r\n<OccupyDemonoid> --- C. MP3 192 (CBR)\r\n<OccupyDemonoid> --- D. MP3 V2 (VBR)\r\n<OccupyDemonoid> --- E. FLAC\r\n<OccupyDemonoid> 6. What makes a music file \"lossless\"? Name two examples.\r\n<OccupyDemonoid> 7. Which of the following formats are allowed on What.CD?\r\n<OccupyDemonoid> --- A. MP3 320 (CBR)\r\n<OccupyDemonoid> --- B. MP3 V2\r\n<OccupyDemonoid> --- C. MP3 192 (CBR)\r\n<OccupyDemonoid> --- D. MP3 V0\r\n<OccupyDemonoid> --- E. AAC with iTunes exclusive content\r\n<OccupyDemonoid> --- F. AAC that you ripped from a CD\r\n<OccupyDemonoid> --- G. MP3 V7\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> When you are done type my name: OccupyDemonoid.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> YOU HAVE FAILED THE INTERVIEW!\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> Study up at http://whatinterviewprep.com\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> You may return after 48 hours to interview again, for a total of 3 interviews.\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> 4POSTING THE CONTENTS OF THIS INTERVIEW ANYWHERE OR SHOWING IT TO ANYONE WILL COST YOU YOUR ACCOUNT!\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> Here are some helpful links to help you study:\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=Lossy\r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=Lossless\r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=LAME\r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=CBR\r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=VBR\r\n<OccupyDemonoid> http://wiki.hydrogenaudio.org/index.php?title=Transcoding\r\n<OccupyDemonoid> http://whatinterviewprep.com/\r\n<OccupyDemonoid>  \r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n<OccupyDemonoid> Do you have any questions? If not, feel free to type /part.\r\n<OccupyDemonoid> ------------------------------------------------------------------------\r\n \r\n \r\n \r\nhttps://www.whatinterviewprep.com/starting-the-interview/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/torrenting/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/what-cd-rules/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/spectral-analysis/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/analog-and-digital-music-sources/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/audio-formats/\r\nhttps://www.whatinterviewprep.com/prepare-for-the-interview/what-cd-rules/',NULL,NULL),(32,7,1,'2016-11-21 14:34:25','Give me a little bit, I\'ll restore the forums like that.',NULL,NULL),(33,4,31,'2016-11-21 14:46:55','I have the Vinyl Guide, I\'ll put it up later today.',NULL,NULL),(34,4,30,'2016-11-21 15:11:22','[quote=pillboxer|28][quote=Tinerfe|19]To get everything going again, I suggest the guides on ripping and uploading be prioritized. Ripping CDs on Windows, with EAC, probably being the most important for ripping. I might be way ahead here, but when it comes to uploading, I\'m thinking there will be a need to post a guide on how to upload the What.CD torrents people have. This is also an excellent time to refresh the guides, as some of the previous ones were kinda...not so organized.[/quote]\n\nAgree, many (most?) will have their files still sitting in their client. An informative guide on getting those back on to the new site.[/quote]\n\nSome warez trackers have made programs (Windows) that will automatically search for existing scene releases by the scene naming standard on hard disks, and then automagically add them to the torrent program for a certain tracker (only uTorrent, perhaps). That might be hard to do considering What.CD releases aren\'t scene and there\'s (yet?) no access to the metadata. I\'m no coder, but maybe it would be possible to have a program check already present What.CD torrents in a user\'s torrent program and change the tracker info to the new one? Of course that requires that somebody already uploaded the torrent. Will work fine on popular torrents and also an indicator of what torrents a user should upload. Another thing would be something, like a script, that will simplify the upload of like +1000 torrents. A built in metadata and cover crawler? It would only take some hours to verify a 1000 covers! :D\n\nA sidenote: Maybe a stricter naming of directories for future new rips uploaded would be good, ie something in the directory name that would make it identifiable as content from What.CD? For future proofing. Better to reinstate what was one week ago for now, though.\n\n[quote=adinbied|33]I have the Vinyl Guide, I\'ll put it up later today.[/quote]\n\nI saw someone on PTP (I think) posting both the Vinyl and CD ripping guide in .doc yesterday. If noone else finds it, I\'ll look tonight (CET).\n\nEDIT: Here they are: https://minfil.org/N1s0qeb5b1/EAC___TT_Ripping.rar\n\nThere\'s another site for rebuilding What, which seems to have gotten further: http://whatcd.tk/index.php Maybe better to continue there?\n\nAnother initiative to rebuild What\'s wikis and so on seems to have gotten further: http://whatcd.tk/index.php',30,'2016-11-22 19:57:20'),(35,7,1,'2016-11-21 15:12:01','As it would turn out, the forum software is severely lacking in Gazelle. It looks like there isn\'t a control panel for a lot of things and they will have to be changed manually. Currently, this isn\'t high on my development plan, but I restored as much as possible.',NULL,NULL),(36,5,23,'2016-11-21 15:14:32','I\'m big into Canadian 90\'s rock (What I was raised on)\r\nHowever I listen to absoutley anything.\r\n\r\nMy favourite artist is Protest The Hero\r\n\r\nI made it a personal mission to ensure their what\'cd profile was as complete as possible.\r\n',NULL,NULL),(37,7,23,'2016-11-21 15:16:19','[quote=Captain|35]As it would turn out, the forum software is severely lacking in Gazelle. It looks like there isn\'t a control panel for a lot of things and they will have to be changed manually. Currently, this isn\'t high on my development plan, but I restored as much as possible.[/quote]\r\n\r\nIf I can help with any paticular PHP scripts / projects here, feel free to shoot me a PM. I\'m a full time PHP dev and stare at code all day.',NULL,NULL),(38,7,21,'2016-11-21 15:39:04','Thanks, looks much better and organized :)',NULL,NULL),(39,9,23,'2016-11-21 16:18:04','Remember your buffer? I \'member.\n\nhttps://sherlock.whatbarco.de\n\nPM me if you forget the password\n\nIn case you were not part of sherlock and have no idea what this was:\n\nIt was a dude\'s website that logged into what and kept track of users buffers and plotted them on a graph.\nTo have data there, you would have had to request to be added in the forums.\n\n..aaaand it\'s down',23,'2016-11-21 17:23:50'),(40,7,51,'2016-11-21 16:48:59','Hello.. thanks for the invite. Was a pretty tenured What.CD user, made it up to a TM. I also do a lot of SQL coding and can be available to help. Curious.. what\'s the end goal here? Do you envision this replacing What from a tracker prospective as well or are you just trying to get the knowledge-based items back up?\n\n\nEdit: Nevermind.. answered my own question here.',51,'2016-11-21 17:50:37'),(41,7,23,'2016-11-21 17:30:20','What is behind this archive?\n\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/\n\nI can\'t seem to connect to any peers to see inside it myself\n\n*Edit, it started d/ling a bunch of dll\'s and shit I\'d rather not download. I\'d advise to stay away from this',23,'2016-11-21 18:24:28'),(42,9,11,'2016-11-21 17:38:17','[quote=gcarn|39]..aaaand it\'s down[/quote]Damn. i wanted to get a snapshot of my buffer',NULL,NULL),(43,7,11,'2016-11-21 17:41:40','[quote=gcarn|41]What is behind this archive?\n\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/\n\nI can\'t seem to connect to any peers to see inside it myself[/quote]in the same boat. currently have 90nodes with 0 peers connected. My guess is the person who posted this stopped himself from being connectable.\n\nEdit: I maybe correct. I recieved a message saying the host closed the connections.',11,'2016-11-21 17:44:14'),(44,1,57,'2016-11-22 14:05:58','StockholmSynT posted some wiki articles on the WhatNextCD subreddit:\r\nhttp://whatcd.tk/wiki.php\r\n',NULL,NULL),(45,7,68,'2016-11-22 15:54:09','[quote=OldPirate|43][quote=gcarn|41]What is behind this archive?\r\n\r\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/\r\n\r\nI can\'t seem to connect to any peers to see inside it myself[/quote]in the same boat. currently have 90nodes with 0 peers connected. My guess is the person who posted this stopped himself from being connectable.\r\n\r\nEdit: I maybe correct. I recieved a message saying the host closed the connections.[/quote]\r\n\r\nYeah because he made it writable by anyone. I think I still know who he is on Reddit and may try to get in touch with him. ',NULL,NULL),(46,2,68,'2016-11-22 16:01:36','[quote=Captain|25][quote=OldPirate|21][quote=XTC|20][quote=OldPirate|18][quote=Captain|2]This site WILL NOT be hosting torrents. All uploads are disabled.[/quote]If this site will never host any torrents then why is it invite only? why not let everyone come see what what.cd used to look like including the un-invited? just a question i thought I\'d ask.[/quote]\r\n\r\ni imagine too much traffic might crash the site lol, but this is a great rendition of What,i must say[/quote]never thought of the traffic scenario.[/quote]\r\n\r\nThe traffic is only one issue, (its free tier AWS instance) but I would like to rebuild the site using the quality members that What.CD was built on in the first place. In time, it will likely be open registration but I want those that were around and knew what to be the ones contributing to building it first.[/quote]\r\n\r\nGood to know. I have a good bit of stuff to contribute (I\'ve been collecting everything going around) and am excited to help rebuild wiki articles and other states of things that were on w.cd etc..\r\n\r\nThanks for making me a part of this ;)',NULL,NULL),(47,10,1,'2016-11-22 17:09:57','I have no desire to rebuild torrent and upload lists. No hard data like that, but looking for those that have screenshots of their user stats to be given their title and upload/download stats back.\r\n\r\nIf anyone would like to take on this part of the project please let me know.',NULL,NULL),(48,1,1,'2016-11-22 17:11:07','[quote=X|3]Right. I think the biggest concentration of ex-users is in the facebook group. I think many would be interested in helping, what do you think?\r\n\r\n[quote=Captain|1]This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.[/quote][/quote]\r\n\r\nI would love all the help we can get. I\'m getting a little swamped managing users.',NULL,NULL),(49,7,70,'2016-11-22 17:17:52','I got in touch with him. I got a copy of his metadata.',NULL,NULL),(50,7,68,'2016-11-22 17:32:05','[quote=outofmymind|49]I got in touch with him. I got a copy of his metadata.[/quote]\r\n\r\nNice. Mind sharing the collection by some means? (Mega would probably be best)',NULL,NULL),(51,11,1,'2016-11-22 17:52:08','If you were a TM or Elite member here and know members who would like to join please post here so I can start spreading invites around.',NULL,NULL),(52,7,70,'2016-11-22 18:13:17','[quote=Denominator|50][quote=outofmymind|49]I got in touch with him. I got a copy of his metadata.[/quote]\r\n\r\nNice. Mind sharing the collection by some means? (Mega would probably be best)[/quote]\r\n\r\nhttps://mega.nz/#!9QdxjJza!2_yETGUzOK8JLASFBqV3mmFYKvoV1kQtuw-MP1GWHnA',NULL,NULL),(53,12,1,'2016-11-22 18:29:03','WHAT.CD IS DEAD - WHAT NOW\r\n \r\nThe latest version of this file will be linked to in the topic of #what-refuge on irc.p2p-network.net.\r\n \r\n1. WHAT WE KNOW\r\n \r\nOn the 17th of November, 2016, What.cd was shut down. The following message was posted to the main website and the what.cd Twitter account:\r\n \r\n  > Due to some recent events, What.CD is shutting down. We are not likely to return any time soon in our current form.\r\n  > All site and user data has been destroyed. So long, and thanks for all the fish.\r\n \r\nThe domain, web server (the one with all the user data) and twitter account haven\'t been seized.\r\n \r\nThere was a raid on OVH by the French police of which has been claimed they seized 12 servers owned by What. At this time it appears to have been confirmed by Le Monde (see below). In any case, What.CD only hosted proxy servers on OVH - no user data was hosted at OVH at any point, as far as we know.\r\n\r\nLe Monde reports that What.CD closed doors after French police and SACEM did stuff (French): http://www.lemonde.fr/pixels/article/2016/11/18/nom-discret-mais-prestigieux-du-piratage-what-cd-ferme-ses-portes_5033446_4408996.html\r\n \r\nAn IRC channel for What users has been set up at #what-refuge on irc.p2p-network.net\r\n\r\n1.1 STUPID RUMOURS\r\n* Martin Skhreli may be a stupid, immature attention whore, but he\'s got nothing to do with this. https://twitter.com/whatcd/status/799491817582501888\r\n \r\n2. WHAT TO DO\r\n \r\nFirst off, do NOT delete any torrent files you have. STOP your torrents, but DO NOT delete them, as they may be useful in any future efforts to rebuild What.\r\n\r\nDo not delete stuff you downloaded, it can\'t really be used as incriminating evidence anyway (connection logs may be, but that was never something you could do much about -- IANAL).\r\n \r\nSecond of all, wait for more concrete information to appear, either in the IRC room, on Twitter or somewhere else. Various trackers and reddit have their own discussion threads going on.\r\n \r\nIf you\'re using Chrome, try using this program (http://www.nirsoft.net/utils/chrome_cache_view.html) to recover your cached profile page and take a screenshot of it, to prove your What membership, in case you want to use that to get into other communities.\r\n\r\n3. CHANNEL RULES\r\n\r\n* NO INVITES\r\n* NO INVITES\r\n* asking for invites -> instaban\r\n* Be excellent to each other\r\n* No sexism, racism, or otherwise being nasty\r\n* No drug sales, warez etc\r\n* Don\'t spam\r\n* Channel operators are always right\r\n* Not everyone has as much experience with IRC, be patient\r\n\r\n0. CHANGELOG\r\n- wording\r\n2016-11-18 12:30\r\n- rules',NULL,NULL),(54,13,1,'2016-11-22 20:07:14','I am thinking of creating a read only user to the entire database (or possibly parts) so that others can download, backup, integrate the work we are putting into this.\r\n\r\nSince there is no illegal content hosted on this site I am not concerned with people having access to it.\r\n\r\nThe passwords are hashed with a random 32-bit key and the passwords created all use another 32bit random salt. Although I am considering not allowing the User table to be accessed.\r\n\r\nIn the future the decentralized nature of the data will make it harder to be taken down. As well help mitigate any legal issues that handing over a specific copy of this data to a torrent site might open myself up to.\r\n\r\nSince it is you, the users, that are helping rebuild this website I am opening the question up to all users of BrainwashTheMasses.',NULL,NULL),(55,4,90,'2016-11-22 21:20:29','Probably it would be best first to get ripping guides and maybe how to upload torrent, just in case for uploads which will go to a new site or Waffles, I guess. :)\r\n\r\n@Tinerfe\r\nThis site like the owner wrote on IRC, is just cached sites which he dig up from his browser, try to open any links in Wiki - zero. :)\r\n\r\nI think this place besides of knowledge base could be a central place for What members which now doesn\'t exist. Maybe after a new site comes to life still BrainwashTheMasses can stay as a community part of the site so if happens the same scenario like with What.CD, community will stay untouched. \r\n\r\nFor example - Karagarga tracker which is a movie/music tracker for non mainstream stuff is separated in two parts - site/tracker and forum. To access the forum you need to register, so basically a separate site.',NULL,NULL),(56,11,90,'2016-11-22 21:29:36','I was Elite (nick IvanaMarin), don\'t have a profile info, just bunch of .torrents sitting in my WhatCD upload folder and my member ID.\r\nI\'m frequent at IRC, /r/whatnextcd and private WhatCDs Soulseek room with few of the ex-members which I talked in WhatCD era, so probably I would for start hand pick few members to invite.\r\nI don\'t know how much would those people contribute to Wiki, but probably it would be good to start activity on the forums, from Lounge to serious discussions if you had that in mind. :)\r\n\r\nMy sherlock stats if those have any significance, managed to get those yesterday I think.\r\n\r\n[img]http://i.imgur.com/n11ut64.jpg[/img]',NULL,NULL),(57,9,90,'2016-11-22 21:31:08','And you needed to have your paranoia set to 0. :)\r\n\r\nAll those memories...\r\n\r\nManaged to get it yesterday I think, had it opened for several hours.\r\n\r\n[img]http://i.imgur.com/n11ut64.jpg[/img]',NULL,NULL),(58,7,90,'2016-11-22 21:33:39','Wait, this guy posted the whole metadata of What.CD? :O\r\n\r\nCan some parts like wiki and forums be extracted and used here?\r\n\r\nCorrect me if my understanding of this archive (metadata) is wrong. :)',NULL,NULL),(59,13,68,'2016-11-22 21:42:06','Yep, great idea. I don\'t know how I feel about giving people direct access to the database. I\'d rather see some automated process for dumping the relevant tables etc.. and making them easily available for direct download and dht enabled torrent',NULL,NULL),(60,12,68,'2016-11-22 21:43:34','Not sure if you\'re in /r/Whatnextcd but there are some other great resources that should be included here, especially relating to WhatManager databases and archiving guides/tutorials etc..',NULL,NULL),(61,13,92,'2016-11-22 22:05:14','Parts of it for sure, but like Denominator said it would probably be better to publish the data at intervals rather than just give access. And I say parts because looking at the other thread under rebuilding, if we do build back some user profiles I don\'t think that should be public. Just stuff like the Wiki and maybe certain parts of the forums like The Laboratory if we can restore parts of that.',NULL,NULL),(62,2,91,'2016-11-22 22:32:48','Rebuilding in process! :)',NULL,NULL),(63,4,1,'2016-11-22 23:23:54','[quote=Hymir|55]Probably it would be best first to get ripping guides and maybe how to upload torrent, just in case for uploads which will go to a new site or Waffles, I guess. :)\r\n\r\n@Tinerfe\r\nThis site like the owner wrote on IRC, is just cached sites which he dig up from his browser, try to open any links in Wiki - zero. :)\r\n\r\nI think this place besides of knowledge base could be a central place for What members which now doesn\'t exist. Maybe after a new site comes to life still BrainwashTheMasses can stay as a community part of the site so if happens the same scenario like with What.CD, community will stay untouched. \r\n\r\nFor example - Karagarga tracker which is a movie/music tracker for non mainstream stuff is separated in two parts - site/tracker and forum. To access the forum you need to register, so basically a separate site.[/quote]\r\n\r\nWe could definitely make that a possibility. Whatever comes next we may be able to auth users versus their database as well.\r\n\r\nI\'d hold off on the upload guides personally, as that may be dependent on whatever takes what\'s place.',NULL,NULL),(64,1,3,'2016-11-22 23:40:32','[quote=Captain|48][quote=X|3]Right. I think the biggest concentration of ex-users is in the facebook group. I think many would be interested in helping, what do you think?\r\n\r\n[quote=Captain|1]This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.[/quote][/quote]\r\n\r\nI would love all the help we can get. I\'m getting a little swamped managing users.[/quote]\r\n\r\nCount on me!',NULL,NULL),(65,7,68,'2016-11-22 23:47:17','[quote=Hymir|58]Wait, this guy posted the whole metadata of What.CD? :O\r\n\r\nCan some parts like wiki and forums be extracted and used here?\r\n\r\nCorrect me if my understanding of this archive (metadata) is wrong. :)[/quote]\r\n\r\nHaha no silly. It\'s merely a collection of some guides, wiki articles, and imagery (with a few other goodies).\r\n',NULL,NULL),(66,3,91,'2016-11-22 23:48:27','Here are saves of 20 wiki entries directly from the browser with Ctrl-S: \"Web Page (complete)\".\nI scrubbed my username and auths just in case and also replaced \"[code]http://what.cd/[/code]\" with \"#\" so you don\'t accidentally click on something.\n\nIncludes:\n- Capitalization Guidelines\n- Codecs and Containers - A guide\n- Definition - A list of technical terms\n- Definition - Bit Depth\n- Definition - Bit Reservoir\n- Definition - Free Lossless Audio Codec (FLAC)\n- Definition - LAME\n- Definition - Lossy\n- EAC - Ripping with Exact Audio Copy\n- EAC - Setting up Exact Audio Copy\n- EAC find & set CD drive write offset\n- Edition Information Guidelines\n- Noise Reduction\n- Replay Gain\n- Resampling and Bit Depth Reduction - The Right Way\n- Torrent Naming Irregularities - Live Shows, EPs, Special Characters, and Various Artists\n- Transcodes\n- Typography\n- What.CD Toolbox for Windows\n- Windows\' Hidden NFO\n\nSaved in 2014.\n\nhttps://cl.ly/2W2O0f441e1r/20_wiki_entries.zip',223,'2016-11-24 04:44:51'),(67,11,1,'2016-11-22 23:53:50','[quote=Hymir|56]I was Elite (nick IvanaMarin), don\'t have a profile info, just bunch of .torrents sitting in my WhatCD upload folder and my member ID.\r\nI\'m frequent at IRC, /r/whatnextcd and private WhatCDs Soulseek room with few of the ex-members which I talked in WhatCD era, so probably I would for start hand pick few members to invite.\r\nI don\'t know how much would those people contribute to Wiki, but probably it would be good to start activity on the forums, from Lounge to serious discussions if you had that in mind. :)\r\n\r\nMy sherlock stats if those have any significance, managed to get those yesterday I think.\r\n\r\n[img]http://i.imgur.com/n11ut64.jpg[/img][/quote]\r\n\r\nYou get 20 invites!\r\n\r\nAnd yea, even if they aren\'t able to contribute to the wiki, former what.cd members having activity on the site will help drive people to keep rebuilding or creating new content. ',NULL,NULL),(68,1,1,'2016-11-22 23:55:06','[quote=X|64][quote=Captain|48][quote=X|3]Right. I think the biggest concentration of ex-users is in the facebook group. I think many would be interested in helping, what do you think?\r\n\r\n[quote=Captain|1]This is NOT a successor to what.cd.\r\n\r\nThis is just a place to easily rebuild the wiki, guides, docs, faqs, etc. in such a format that should be easily importable into whomever does start the next site.\r\n\r\nIt WILL NOT be hosting any torrents.[/quote][/quote]\r\n\r\nI would love all the help we can get. I\'m getting a little swamped managing users.[/quote]\r\n\r\nCount on me![/quote]\r\n\r\nYou get 20 invites!\r\n\r\nLet me know if you need more.',NULL,NULL),(69,4,68,'2016-11-22 23:55:41','[quote=Skeebadoo|27]I just want to hear someone has access to all this metadata: https://archive.org/details/whatcdcrawl\r\n\r\nAlso this:\r\nhttps://www.reddit.com/r/DataHoarder/comments/5e39i5/whatcd_metadata_vault/[/quote]\r\n\r\nAlready have that dump: https://mega.nz/#!9QdxjJza!2_yETGUzOK8JLASFBqV3mmFYKvoV1kQtuw-MP1GWHnA',NULL,NULL),(70,1,94,'2016-11-23 00:22:18','I can help too. I was PU here. I\'m on /r/whatnextcd and also checking wcd threads on PTP. I have acces to near 10 reputable other private trackers, if need be. If you grant me invites, just tell me the criteria.',94,'2016-11-23 00:30:16'),(71,11,68,'2016-11-23 00:39:49','@Captain,\r\n\r\nI\'ve got some TM/Elite people PM\'ing me on reddit (from /r/whatnextcd) about joining. Can I get some invites to add them, or do you want to vet their credentials yourself?',NULL,NULL),(72,3,34,'2016-11-23 01:01:05','From r/Whatnextcd:\n\n[quote]\nStart at [url=http://whatcd.tk/what.cd.htm]Whatcd.tk[/url], then you can click on \"Home\", and from there you can visit the main pages of wiki, rules, better, torrents, and a post in the forum. Also some parts of the wiki are up, [url=http://whatcd.tk/sacdwiki.php]SACD ripping guide[/url], [url=http://whatcd.tk/eacwiki.php]EAC Ripping guide[/url], [url=http://whatcd.tk/logcheckerwiki.php]LogChecker Guide[/url].\nAlso some non linked pages are up, as [url=http://whatcd.tk/blog.php]Blog[/url] and [url=http://whatcd.tk/stats.php]Stats[/url].\nI had the profile page and the torrent page too, but not sure if that would get me in trouble.\n\nEdit: torrents is online now.\nEdit: Added more wiki!! SACD ripping guide, EAC Ripping guide, LogChecker Guide\nEdit: You can contribute by sending me the php and htm pages you get with nirsoft cache viewer, or by donating BTC to 1DTpZfAmW23GscVGDB3Qag6iTKAPwHQF2x ;) thanks!!\nEdit: Profile page is up\nEdit: Torrent page is down, after a second thought, even if that page doesn\'t affect myself, better not cause any troubles to the mods (don\'t know if that could matter, but as precaution)\n[/quote]',34,'2016-11-23 01:02:55'),(73,14,18,'2016-11-23 02:22:25','There is a lot of effort going on in restoring Wcd content. I feel bad for not browsing the site during the last days, hence cannot contribute as much. I have decided to start a thread to restore collages, as it was one of the places to find music.\n\nRestoring collages might not make sense as they are collection of torrents. But I guess we can create a \"database\" with Artist and Album data for each collage, which could eventually be imported into the successor.\n\nI believe I have all the albums from last year\'s birthday and Halloween picks. I think most people might also have similar information. Can someone point out the best way to build a \"database\" of collages to make things easy with Gazelle in the future.',18,'2016-11-23 02:23:06'),(74,11,1,'2016-11-23 03:44:03','[quote=Denominator|71]@Captain,\r\n\r\nI\'ve got some TM/Elite people PM\'ing me on reddit (from /r/whatnextcd) about joining. Can I get some invites to add them, or do you want to vet their credentials yourself?[/quote]\r\n\r\nAND YOU GET 20 INVITES!!!\r\nLet me know if you need more.',NULL,NULL),(75,11,101,'2016-11-23 03:45:47','I was Power TM and am in the TM+ DC hub. Can distribute invites.',101,'2016-11-23 03:45:54'),(76,1,1,'2016-11-23 03:46:22','[quote=zaerdy|70]I can help too. I was PU here. I\'m on /r/whatnextcd and also checking wcd threads on PTP. I have acces to near 10 reputable other private trackers, if need be. If you grant me invites, just tell me the criteria.[/quote]\r\n\r\nSending you invites!\r\nHonestly the criteria I\'m trying to stick with is former What.CD members. Not trying to be snobby, but I want to rebuild the community and the work we all created. I\'m wary of a flood of users that were not a part of the site coming in and adding misinformation as we rebuild the wikis and guides.',NULL,NULL),(77,11,1,'2016-11-23 03:49:47','[quote=btym|75]I was Power TM and am in the TM+ DC hub. Can distribute invites.[/quote]\r\n[IMG]https://media.giphy.com/media/l41lZxzroU33typuU/giphy.gif[/img]',NULL,NULL),(78,15,101,'2016-11-23 03:57:32','http://whatcd.tk/sacdwiki.php\r\nhttp://whatcd.tk/eacwiki.php\r\nhttp://whatcd.tk/logcheckerwiki.php\r\nhttp://whatcd.tk/sacdwiki.php\r\nhttp://whatcd.tk/eacwiki.php\r\nhttp://whatcd.tk/logcheckerwiki.php\r\n',NULL,NULL),(79,7,110,'2016-11-23 04:44:41','Funny story, I used all of the tooltips/quotes in a song I made. It didn\'t include the +1 as it didn\'t exist at the time, but that one is \"One of Us! One of Us!\".\r\n\r\nThere are a terrible lot of lies going about the world and the worst of it is that half of them are true.\r\nI was working the lab late one night when my eyes beheld an eerie sight.\r\nDaring ideas are like chessmen moved forward; They may be beaten, but they may start a winning game.\r\nSome days you are the bug, some days you are the windshield.\r\nThe only normal people are the ones you don\'t know very well.\r\nThe first sign of maturity is that the volume knob also turns to the left.\r\nDestiny is not a matter of chance, it is a matter of choice. It is not a thing to be waited for, it is a thing to be achieved.\r\nI don\'t believe in elitism, I don\'t think the audience is this dumb person lower than me. I am the audience.\r\nThe real danger is not that computers will think like men, but that men will think like computers.\r\n[this witty remark only works when accompanied by the sweet harmonies of acoustic guitars]\r\nIn helping others, we shall help ourselves, for whatever good we give out completes the circle and comes back to us.\r\nHe that gives good advice helps with one hand. He that gives good counsel and example builds with both.\r\nWithout freedom, no art, art lives only on the restraints it imposes upon itself and dies of all others.\r\nMy greatest fear is not whether you have failed, but whether you are content with your failure.',NULL,NULL),(80,11,110,'2016-11-23 04:47:48','I was Elite, formerly TM.\n\n[img]http://i.imgur.com/3dGAQja.png[/img]',110,'2016-11-23 04:48:12'),(81,16,110,'2016-11-23 05:01:47','If we don\'t have enough musicians or interest to do this, I understand, but something I almost made a thread for was a new What album before it closed. This wouldn\'t have to be a torrent, obviously, it\'d be for some closure with the sound of What which I was dear fan of.\r\n\r\nI\'d be more than happy to organize this project if it does garner interest.',NULL,NULL),(82,5,110,'2016-11-23 05:04:14','I listen to a lot of shoegaze, My Bloody Valentine, Slowdive, and it\'s \"inspired by\" dream pop (Mew). However, the beginning to my interest in music really started with Sigur Ros.',NULL,NULL),(83,7,105,'2016-11-23 05:08:45','glad to be here... have a ton of Linux and LAMP stack experience in general... PM me if any assistance I can provide. thanks for setting it up!',NULL,NULL),(84,5,105,'2016-11-23 05:31:48','I\'ve been listening to The Psychedelic Furs lately...',NULL,NULL),(85,3,91,'2016-11-23 07:08:41','I messaged that guy. I bet he will be on here pretty soon.',NULL,NULL),(86,1,91,'2016-11-23 07:25:28','Luckily there are enough of us who want to rebuild everything exactly as it was so we will definitely notice if somebody tries to rewrite a wiki from memory or something silly like that.',NULL,NULL),(87,1,65,'2016-11-23 13:43:51','Count on me too. I\'m here to help with anything. If you need to send invitations I can help with that for now.',NULL,NULL),(88,1,121,'2016-11-23 14:25:47','Hi Guys.\r\nI was an ex Oink PU ... made the transition to What.cd within the first 2 days .. Was an Elit ratio almost 3.0\r\n\r\nAnyway.. What i wanna say is .. I happily help out in whatever i can do to create a new home for us \"whaters\" lol\r\nBut unfortunately i can\'t hack code .. But I\'m a great uploader of both Promos from great house-labels and also mac apps.\r\n\r\nHope we can rebuild what to what it was?!\r\nI really liked it wasn\'t easy to keep a good ratio (it made everyone seed everything forever+upload) and the hard rules on everything .. Thats what made What.cd THE source for everything!\r\n\r\nIm looking forward to it .. And hope the guys who can hack code are willing to do so?!\r\n\r\nCheers :)',NULL,NULL),(89,17,124,'2016-11-23 15:23:53','Collection of wallpapers from the wallpaper contest \r\nSorted by users who created them.\r\n\r\nhttps://drive.google.com/drive/folders/0B11j_E7sVXLjQm9LTjlDQjl4eDg\r\n\r\n',NULL,NULL),(90,5,126,'2016-11-23 15:42:28','Can\'t say I have any one single favorite but here are some of my top picks:\r\n\r\nBoards of Canada (which I only found after becoming a member of WCD)\r\nThe Stanfields\r\nFlogging Molly\r\nShakey Graves\r\nSturgill Simpson  ',NULL,NULL),(91,5,162,'2016-11-23 17:49:30','Eh, it\'s hard to say. What I\'m listening to changes very often, as well as my current favorites, but some that have stuck to me over the years would be\r\n\r\nUlver\r\nSoft Machine\r\nMagma\r\nArthur Verocai\r\nCan\r\nDJ Rashad',NULL,NULL),(92,10,143,'2016-11-23 18:31:57','We have 175 users right now, I would be willing to go through the current workload of screenshots and check each person\'s\n\n- user class\n- upload/download\n- seeding size\n\nand add them here. I have some SQL experience (decent but I don\'t use it regularly). Linux/shell experience intermediate/advanced, I make my living orchestrating/deploying servers. I was not Elite/TM on WCD. A few questions would arise:\n\n- What about people with differing nicknames? WCD was one of the few trackers, where I had a different nickname.\n\nI\'ll help any way I can, but I can\'t guarantee to have more than 5-10 hours a week.',143,'2016-11-23 18:32:49'),(93,13,143,'2016-11-23 18:37:13','Would it not make more sense to just export the parts of the database regularly and host them here in compressed SQL?\r\n\r\nI would definitely keep the tables that contain any user data out of it and keep it at a per-request basis. Currently, it would be enough to be able to merely check a user you want to verify using brainwashthemasses.\r\n\r\nBut the dream, I guess, would be to just have the SQL dumps available and not to allow for connections to the database from outside networks.',NULL,NULL),(94,1,183,'2016-11-23 18:49:53','dude this is weird. its like I can come here and have sweet memories..',NULL,NULL),(95,11,52,'2016-11-23 19:08:57','can we get https://www.brainwashthemasses.org/wiki.php?action=search&type=Title&order=Title&way=Ascending added to the wiki \r\nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\r\n\r\nor maybe editing privileges? \r\n\r\nsomeone is doing this\r\n\r\nhttp://whatcd.tk/wiki.php\r\n\r\nhttp://whatcdinfo.000webhostapp.com/index.html\r\n\r\nit would be nice to get them on board if anyone knows who it is\r\n\r\nI\'m also lurking irc/pu+ forums and can give out invites. ',NULL,NULL),(96,11,68,'2016-11-23 19:18:12','[quote=atriox|95]can we get https://www.brainwashthemasses.org/wiki.php?action=search&type=Title&order=Title&way=Ascending added to the wiki \r\nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\r\n\r\nor maybe editing privileges? \r\n\r\nsomeone is doing this\r\n\r\nhttp://whatcd.tk/wiki.php\r\n\r\nhttp://whatcdinfo.000webhostapp.com/index.html\r\n\r\nit would be nice to get them on board if anyone knows who it is\r\n\r\nI\'m also lurking irc/pu+ forums and can give out invites.[/quote]\r\n\r\nI know one; Ill contact him and see if he\'s interested in helping out. Will also reach out to the other one.',NULL,NULL),(97,13,68,'2016-11-23 19:29:01','[quote=Token|93]Would it not make more sense to just export the parts of the database regularly and host them here in compressed SQL?\r\n\r\nI would definitely keep the tables that contain any user data out of it and keep it at a per-request basis. Currently, it would be enough to be able to merely check a user you want to verify using brainwashthemasses.\r\n\r\nBut the dream, I guess, would be to just have the SQL dumps available and not to allow for connections to the database from outside networks.[/quote]\r\n\r\nIdeally, I\'d like external automation for grabbing the releases i.e. a restful api call to download the latest dump. ',NULL,NULL),(98,12,94,'2016-11-23 19:55:30','Do we know if anyone are actually working on building back some sort of tracker? Former what dev/staff? If no, it could be a good idea to have a place on the forums for people willing/able to put some muscle/knowledge together.',NULL,NULL),(99,3,68,'2016-11-23 20:05:51','[quote=mainstream|85]I messaged that guy. I bet he will be on here pretty soon.[/quote]\r\n\r\nAny updates? We really should have a news item that directs to a forum page detailing how people can get started.',NULL,NULL),(100,5,174,'2016-11-23 20:14:01','These days I\'m listening to Joe Satriani. Surprisingly I never did it before and its amazing.',NULL,NULL),(101,4,107,'2016-11-23 20:20:09','[quote=Hymir|55]Probably it would be best first to get ripping guides and maybe how to upload torrent, just in case for uploads which will go to a new site or Waffles, I guess. :)[/quote]\r\n\r\nThis yo!',NULL,NULL),(102,1,165,'2016-11-23 20:28:00','I love what you\'re doing here. Thanks a bunch. \r\n\r\nTorrents or not, we can rebuild this community. Is there any way to add artists and such? I would love to be able to do this and add images, albums and other such data. ',NULL,NULL),(103,11,94,'2016-11-23 20:33:30','I read on reddit that Elit TM we\'re talking (on IRC) about building up a metadata website that could (maybe) work as a back with the new tracker. This way, if the tracker is shut down, the metadata is safe. Anyone able to be in touch with them and maybe invite them over, know what\'s going on?',NULL,NULL),(104,3,91,'2016-11-23 21:00:23','[quote=Denominator|99][quote=mainstream|85]I messaged that guy. I bet he will be on here pretty soon.[/quote]Any updates? We really should have a news item that directs to a forum page detailing how people can get started.[/quote]He was grateful for my 20 wiki saves that he will combine with his 15 saves and others he found so he is rebuilding the wiki. But I really lost the overview over how many people are trying the very same thing right now. I think this place is better than reddit so I sent him the link to [url=https://goo.gl/forms/I288kwLREAsx7smi1]this[/url] and hope he will appear here soon.\n\nShouldn\'t the \"Wiki\" page on here be the place where it\'s all brought together? So many wiki entries are floating around but the wiki on here is still empty.',91,'2016-11-23 21:01:22'),(105,3,68,'2016-11-23 21:02:34','[quote=mainstream|104][quote=Denominator|99][quote=mainstream|85]I messaged that guy. I bet he will be on here pretty soon.[/quote]Any updates? We really should have a news item that directs to a forum page detailing how people can get started.[/quote]He was grateful for my 20 wiki saves that he will combine with his 15 saves and others he found so he is rebuilding the wiki. But I really lost the overview over how many people are trying the very same thing right now. I think this place is better than reddit so I sent him the link to [url=https://goo.gl/forms/I288kwLREAsx7smi1]this[/url] and hope he will appear here soon.\r\n\r\nShouldn\'t the \"Wiki\" page on here be the place where it\'s all brought together? So many wiki entries are floating around but the wiki on here is still empty.[/quote]\r\n\r\nYeah we\'ll see. I think the big thing will be the fact that we\'re actually running a gazelle install and can moderate entries to ensure they\'re true to the originals. Plus, this stuff will be shared with everyone.',NULL,NULL),(106,11,47,'2016-11-23 21:20:34','[quote=zaerdy|103]I read on reddit that Elit TM we\'re talking (on IRC) about building up a metadata website that could (maybe) work as a back with the new tracker. This way, if the tracker is shut down, the metadata is safe. Anyone able to be in touch with them and maybe invite them over, know what\'s going on?[/quote]\r\n\r\nI\'m fairly certain they\'re already here.',NULL,NULL),(107,3,31,'2016-11-23 21:25:50','OK, So I have a mirror of the Wiki which I am working on (should be up soon), I\'ll post more details about it once I finish removing user details and other stuff.',NULL,NULL),(108,1,118,'2016-11-23 21:28:16','So much nicer than having crap out in the open (ie Reddit).\r\n\r\nThank! You!',NULL,NULL),(109,11,68,'2016-11-23 21:31:01','[quote=Denominator|96][quote=atriox|95]can we get https://www.brainwashthemasses.org/wiki.php?action=search&type=Title&order=Title&way=Ascending added to the wiki \nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\n\nor maybe editing privileges? \n\nsomeone is doing this\n\nhttp://whatcd.tk/wiki.php\n\nhttp://whatcdinfo.000webhostapp.com/index.html\n\nit would be nice to get them on board if anyone knows who it is\n\nI\'m also lurking irc/pu+ forums and can give out invites.[/quote]\n\nI know one; Ill contact him and see if he\'s interested in helping out. Will also reach out to the other one.[/quote]\n\n\nJust got a response from the one guy:\n\n[quote]\nI\'m on BTM, i\'m putting stuff on a separate site because all of my posts were being hidden. I\'m also working on re-formatting stuff, I\'ll have an update later.[/quote]\n\nNot sure why stuff was hidden or whatnot, but would be nice to streamline this process and make it easier for folks...',68,'2016-11-23 21:32:03'),(110,1,213,'2016-11-23 21:47:16','The nostalgia is real. Thanks for making this. We can rebuild. We will rebuild.',NULL,NULL),(111,11,31,'2016-11-23 21:48:44','Oh, Hi there! That\'s me. I have ~35 wiki pages that I\'m willing to contribute. The reason that I was saying stuff was hidden was because there is no way for me to edit the actual wiki page. To view my postings, you have to go to Wiki, then Browse Articles, then All. It\'s more complex than it needs to be IMO.\n\nEdit: Also, I am moving to a dedicated host with a proper domain, and am coding a new interface. Here is a rough idea of what i\'m thinking: http://imgur.com/a/PWMQK',31,'2016-11-23 21:53:14'),(112,1,91,'2016-11-23 21:49:51','How really nice it is to read through comments in the what style again. Awesome!\r\nAnd I am totally seeing that so many people who were a part of what want to rebuild what we had.\r\n\r\nIt should be good.',NULL,NULL),(113,3,91,'2016-11-23 21:51:58','Great :)\r\nOnce we have the wiki online again, nothing can take it away, huh?\r\nI don\'t see why anyone could take this website down if it just contains written knowledge but no torrents.',NULL,NULL),(114,2,220,'2016-11-23 21:56:47','This is a great idea, thanks for your efforts! ',NULL,NULL),(115,10,91,'2016-11-23 22:19:16','I don\'t care about the numbers but I understand that it\'s cooler to read TM instead of User. Will you re-create user classes for this site?',91,'2016-11-23 22:22:38'),(116,1,217,'2016-11-23 23:02:15','[quote=eminenz|44]StockholmSynT posted some wiki articles on the WhatNextCD subreddit:\r\nhttp://whatcd.tk/wiki.php[/quote]\r\n\r\nI cannot access this page for some reason.',NULL,NULL),(117,1,225,'2016-11-23 23:02:34','Let\'s do this ! ',NULL,NULL),(118,1,223,'2016-11-23 23:04:10','Solidarity with all of you.',NULL,NULL),(119,12,223,'2016-11-23 23:13:00','[quote=zaerdy|98]Do we know if anyone are actually working on building back some sort of tracker? Former what dev/staff? If no, it could be a good idea to have a place on the forums for people willing/able to put some muscle/knowledge together.[/quote]\r\n\r\nI think Waffles is our best bet at this point. Apparently they have no interest in switching to Gazelle though, which is unfortunate. I\'d rather a completely new site pop up, but we\'ll see. ',NULL,NULL),(120,5,223,'2016-11-23 23:13:32','Anohni. ',NULL,NULL),(121,10,223,'2016-11-23 23:21:22','[quote=Captain|47]I have no desire to rebuild torrent and upload lists. No hard data like that, but looking for those that have screenshots of their user stats to be given their title and upload/download stats back.[/quote]\n\nTo be honest, it\'s pretty easy to forge this, and you should not be asking for screenshots in order to verify users\' previous classes. This site presents the perfect opportunity to photoshop previous stats, like this:\n\n[img]https://cl.ly/0u1N2h0P1Y12/Image%202016-11-23%20at%206.20.28%20PM.png[/img]\n\nEdit: That said, I was a Power User (and still am on other sites), so if you want to hmu with proof for that, chill. : )',223,'2016-11-23 23:22:32'),(122,3,223,'2016-11-23 23:31:24','[quote=mainstream|113]Great :)\r\nOnce we have the wiki online again, nothing can take it away, huh?\r\nI don\'t see why anyone could take this website down if it just contains written knowledge but no torrents.[/quote]\r\n\r\nThat said, let\'s also be sure to make a backup of this site periodically. 2016 taught us well...',NULL,NULL),(123,5,266,'2016-11-23 23:45:53','[quote=kingorlowest|120]Anohni.[/quote]\r\nI\'ve had 4 Degrees stuck in my head for weeks\r\n\r\n\r\nI WANT TO BURN THE SKY I WANT TO BURN THE BREEEEEEEEEEEEZE',NULL,NULL),(124,1,243,'2016-11-24 00:06:56','I cried when I see wooden panels... it\'s like what never closed its doors. is this a miracle? It\'s like me and my girlfriend of four years came back together after fighting for a week. so glad to be here',NULL,NULL),(125,11,247,'2016-11-24 00:09:47','Hey, former PTM, got only one ETM with whom I\'ve been in touch on PTP. I could get him aboard. ',NULL,NULL),(126,1,282,'2016-11-24 00:10:34','Thanks a ton for the invite. Just being on a site that looks like What is bringing me comfort.',NULL,NULL),(127,2,267,'2016-11-24 00:11:03','I too commend the efforts and hope I can help in some small way. ',NULL,NULL),(128,2,247,'2016-11-24 00:18:45','Getting our community back is the most important first step. With people scattered all over irc channels and different subreddits, this is a huge upgrade. \r\nI salute your initiative.\r\n\r\n',NULL,NULL),(129,10,1,'2016-11-24 00:44:15','[quote=mainstream|115]I don\'t care about the numbers but I understand that it\'s cooler to read TM instead of User. Will you re-create user classes for this site?[/quote]\r\n\r\nQuite honestly, this was more the idea. The upload/download would mean nothing as users can fake it and it has no relation whatsoever to permissions.',NULL,NULL),(130,2,1,'2016-11-24 00:45:22','Thank you. Its just a start to get the what.cd community back together. But we are clearly stronger and more united than any government wants to believe or admit.',NULL,NULL),(131,7,1,'2016-11-24 00:46:54','[quote=glass|79]Funny story, I used all of the tooltips/quotes in a song I made. It didn\'t include the +1 as it didn\'t exist at the time, but that one is \"One of Us! One of Us!\".\r\n\r\nThere are a terrible lot of lies going about the world and the worst of it is that half of them are true.\r\nI was working the lab late one night when my eyes beheld an eerie sight.\r\nDaring ideas are like chessmen moved forward; They may be beaten, but they may start a winning game.\r\nSome days you are the bug, some days you are the windshield.\r\nThe only normal people are the ones you don\'t know very well.\r\nThe first sign of maturity is that the volume knob also turns to the left.\r\nDestiny is not a matter of chance, it is a matter of choice. It is not a thing to be waited for, it is a thing to be achieved.\r\nI don\'t believe in elitism, I don\'t think the audience is this dumb person lower than me. I am the audience.\r\nThe real danger is not that computers will think like men, but that men will think like computers.\r\n[this witty remark only works when accompanied by the sweet harmonies of acoustic guitars]\r\nIn helping others, we shall help ourselves, for whatever good we give out completes the circle and comes back to us.\r\nHe that gives good advice helps with one hand. He that gives good counsel and example builds with both.\r\nWithout freedom, no art, art lives only on the restraints it imposes upon itself and dies of all others.\r\nMy greatest fear is not whether you have failed, but whether you are content with your failure.[/quote]\r\n\r\nWhere were these? Were these the descriptions to the sub forums?',NULL,NULL),(132,11,1,'2016-11-24 00:50:05','[quote=atriox|95]can we get https://www.brainwashthemasses.org/wiki.php?action=search&type=Title&order=Title&way=Ascending added to the wiki \r\nhttps://www.brainwashthemasses.org/wiki.php?action=browse is not working\r\n\r\nor maybe editing privileges? \r\n\r\nsomeone is doing this\r\n\r\nhttp://whatcd.tk/wiki.php\r\n\r\nhttp://whatcdinfo.000webhostapp.com/index.html\r\n\r\nit would be nice to get them on board if anyone knows who it is\r\n\r\nI\'m also lurking irc/pu+ forums and can give out invites.[/quote]\r\nHe has been invited. =]\r\n\r\nAs for the browse, you have to click on all first. I\'ll change it as soon as I get a chance. Same with adding the title ascending. In general, the backend for the wiki isn\'t as clear as I\'d like. It seems to be a lot more of editing the PHP files on the site rather than having a menu to change anythng.',NULL,NULL),(133,12,94,'2016-11-24 00:57:48','Yeah me too. And I fear the won\'t be able/let aevery refugee in. I keep telling myself that some people are working on something, would just be nice to have some info. Maybe people here can pitch in and help.',NULL,NULL),(134,11,1,'2016-11-24 01:03:32','[quote=adinbied|111]Oh, Hi there! That\'s me. I have ~35 wiki pages that I\'m willing to contribute. The reason that I was saying stuff was hidden was because there is no way for me to edit the actual wiki page. To view my postings, you have to go to Wiki, then Browse Articles, then All. It\'s more complex than it needs to be IMO.\r\n\r\nEdit: Also, I am moving to a dedicated host with a proper domain, and am coding a new interface. Here is a rough idea of what i\'m thinking: http://imgur.com/a/PWMQK[/quote]\r\n\r\nShoot me a PM; right now the back end to the Wiki is... lacking to say the least. I will need some help setting that all up. I\'ve manually invited over 400 users, so thats been taking a lot of my time.',NULL,NULL),(135,12,1,'2016-11-24 01:07:54','[quote=zaerdy|98]Do we know if anyone are actually working on building back some sort of tracker? Former what dev/staff? If no, it could be a good idea to have a place on the forums for people willing/able to put some muscle/knowledge together.[/quote]\r\n\r\nHere is my stance. I would love to see a tracker come back. However, as OPSEC wasn\'t my goal when I was setting this website up, I will have to stay out of that development. If anyone has any questions in that regard, they can feel free to PM me.\r\n\r\nIn order to keep this site alive, at least until the next What.CD comes to be, please keep any talk of trackers or torrents general. I don\'t mind mentioning sites, but specifics to Users, policies, torrents, content, etc. will be removed.',NULL,NULL),(136,3,1,'2016-11-24 01:11:17','[quote=kingorlowest|122][quote=mainstream|113]Great :)\r\nOnce we have the wiki online again, nothing can take it away, huh?\r\nI don\'t see why anyone could take this website down if it just contains written knowledge but no torrents.[/quote]\r\n\r\nThat said, let\'s also be sure to make a backup of this site periodically. 2016 taught us well...[/quote]\r\n\r\nYes, I will be periodically uploading exports of the database for everyone to download (sans user data). I will reach out to some other torrent sysops about possibly holding a full encrypted copy of the database so as even that may be restored in the event I get hit by a bus.',NULL,NULL),(137,11,94,'2016-11-24 01:19:57','[quote=Captain|134]I\'ve manually invited over 400 users, so thats been taking a lot of my time.[/quote]\r\n\r\nWhy don\'t we set up official invite thread on other famous websites. You could then disptach someone in charge of each thread. Obv we would have to ask permission to the staff there first. I could take care of BTN and/or bB.',NULL,NULL),(138,18,1,'2016-11-24 01:20:19','Alright, this site has grown quicker than I have ever expected.\r\n\r\nI am needing a lot of help to keep this and everything together. That said, I will be opening up several positions for those interested. If you were a previous moderator or staff member please PM me. If you were a recruiter and know the interview process well, please PM me. I would like to make this open to those that have a passion for music. We don\'t need to be very strict since there won\'t be torrents but I don\'t want to see someone trying to say 128kbps is all you ever need.\r\n\r\nForum moderators!\r\nI need some. Post here with your interest and a short reason why you think you should be one. Part of this job is to promote discussion on the site. So starting forum topics and being active.\r\n\r\nWiki Mods!\r\nI am looking for some people who are willing and able to lead and manage the rebuilding of the Wiki.\r\nNote, everyone has access to create and edit the wiki. I need those that will ensure all the wiki is correct, the formatting is proper, and things are cross linked appropriately. Please post here with a short reason why you would like to take this on.\r\n\r\nCoders!\r\nI will need a sample of your work (please PM me a small portfolio). The site is primarily PHP with a MYSQL backend. So those that know PHP are preferred. But anyone talented can be utilized. Please post here with a short reason why you want to work on the site.',NULL,NULL),(139,11,1,'2016-11-24 01:23:10','[quote=zaerdy|137][quote=Captain|134]I\'ve manually invited over 400 users, so thats been taking a lot of my time.[/quote]\r\n\r\nWhy don\'t we set up official invite thread on other famous websites. You could then disptach someone in charge of each thread. Obv we would have to ask permission to the staff there first. I could take care of BTN and/or bB.[/quote]\r\n\r\nSounds like a good idea. If you want to reach out to the BTN staff, please do. I\'ll add you as having unlimited invites.',NULL,NULL),(140,1,1,'2016-11-24 01:26:24','[quote=b|102]I love what you\'re doing here. Thanks a bunch. \r\n\r\nTorrents or not, we can rebuild this community. Is there any way to add artists and such? I would love to be able to do this and add images, albums and other such data.[/quote]\r\n\r\nI will look into what it would take to do so. I don\'t currently know if that was tied into uploads before or if it was a separate creation.',NULL,NULL),(141,11,94,'2016-11-24 01:27:00','Ok, I\'ll do this right now. Coming back with news.',NULL,NULL),(142,1,296,'2016-11-24 01:28:04','Yah. this is nice :)',NULL,NULL),(143,11,1,'2016-11-24 01:30:56','[quote=zaerdy|141]Ok, I\'ll do this right now. Coming back with news.[/quote]\r\n\r\nIf they need verification, my user name is the same there as on PTP. They can PM me (or likely someone is here from there that might see this) Whatever.',NULL,NULL),(144,6,223,'2016-11-24 01:31:32','[quote=Waffles Admin]OK. here, finally is the story. Waffles went down for financial reasons, and stayed down due to staff issues that will not be hashed in public, don\'t bother asking. Lack of communication was because of the staff element, I was hoping the downtime would last a day or two at most at the beginning, but that obviously isn\'t what happened. This happened at a really inopportune time, we were just as surprised at what happened since we went down as you were.\r\n\r\nWe\'ve changed hosts to get a situation that is within our current means. We still owe a debt to the old host that will need payment, and we still need money to pay it. Because we\'re changing hosts (and equipment), we don\'t know how long it will take before we are able to come back up. But I will make sure our twitter and this space are updated with news as it comes, particularly if an ETA arrives.\r\n\r\nSome answers to frequently asked questions: No, we\'re not adopting gazelle. The amount of development time it would take to do that is not available. For now, things will be as they were when we went down.\r\n\r\nNo data appears to be lost, we have the site code as it was when we went offline.\r\n\r\nWe\'re keeping the current invite policy in place when we reopen. We recruit at a couple of private torrent sites, plus invites are open. So will we offer something more liberal? That depends on what we find our current capacity to be after we get set up.\r\n\r\nThat\'s all for now. Let\'s hope the migration goes simple and easy.\r\n[/quote]\r\n\r\n[url]https://pay.reddit.com/r/trackers/comments/5e1brs/soon/[/url]',NULL,NULL),(145,19,1,'2016-11-24 01:32:17','Anyone have plans for the new years yet?\r\n\r\nI\'m considering White Wonderland if they have it again.',NULL,NULL),(146,20,1,'2016-11-24 01:33:08','Anyone been to a Sorority Noise show? They\'ve one near me next month. Pretty sure I want to be there. One of my favorite bands right now.',NULL,NULL),(147,5,1,'2016-11-24 01:34:25','[quote=glass|82]I listen to a lot of shoegaze, My Bloody Valentine, Slowdive, and it\'s \"inspired by\" dream pop (Mew). However, the beginning to my interest in music really started with Sigur Ros.[/quote]\r\n\r\nI love shoegaze. I haven\'t heard Sigur Ros, but I\'ll have to search youtube or something.',NULL,NULL),(148,11,68,'2016-11-24 01:34:35','[quote=Captain|139][quote=zaerdy|137][quote=Captain|134]I\'ve manually invited over 400 users, so thats been taking a lot of my time.[/quote]\r\n\r\nWhy don\'t we set up official invite thread on other famous websites. You could then disptach someone in charge of each thread. Obv we would have to ask permission to the staff there first. I could take care of BTN and/or bB.[/quote]\r\n\r\nSounds like a good idea. If you want to reach out to the BTN staff, please do. I\'ll add you as having unlimited invites.[/quote]\r\n\r\nI can be the invite ambassador for AHD and Waffles when it comes back.',NULL,NULL),(149,11,1,'2016-11-24 01:37:50','[quote=Denominator|148][quote=Captain|139][quote=zaerdy|137][quote=Captain|134]I\'ve manually invited over 400 users, so thats been taking a lot of my time.[/quote]\r\n\r\nWhy don\'t we set up official invite thread on other famous websites. You could then disptach someone in charge of each thread. Obv we would have to ask permission to the staff there first. I could take care of BTN and/or bB.[/quote]\r\n\r\nSounds like a good idea. If you want to reach out to the BTN staff, please do. I\'ll add you as having unlimited invites.[/quote]\r\n\r\nI can be the invite ambassador for AHD and Waffles when it comes back.[/quote]\r\n\r\nBOOM! Unlimited invites. Reach out and they can contact me here for verification if they need to. I\'ll tell you my normal spiel with everyone I work with.\r\n\r\n\"Don\'t be a dick\"\r\n\r\nThank you, that is all.',NULL,NULL),(150,16,1,'2016-11-24 01:40:33','I would love to see artists that want to contribute to the ideal What.cd was built on and why we all have returned.\r\n\r\nIf anyone would be willing to put in music and/or release their music I would gladly distribute it.\r\n\r\nThere will however, have to be approval first before anything is added so that we can keep this site 100% legal.',NULL,NULL),(151,5,223,'2016-11-24 01:40:54','[quote=Captain|147][quote=glass|82]I listen to a lot of shoegaze, My Bloody Valentine, Slowdive, and it\'s \"inspired by\" dream pop (Mew). However, the beginning to my interest in music really started with Sigur Ros.[/quote]\r\n\r\nI love shoegaze. I haven\'t heard Sigur Ros, but I\'ll have to search youtube or something.[/quote]\r\n\r\n! Yes, this should be at the top of your priority list for listening while helping build this site. :)',NULL,NULL),(152,1,223,'2016-11-24 01:41:56','[quote=Captain|140][quote=b|102]I love what you\'re doing here. Thanks a bunch. \r\n\r\nTorrents or not, we can rebuild this community. Is there any way to add artists and such? I would love to be able to do this and add images, albums and other such data.[/quote]\r\n\r\nI will look into what it would take to do so. I don\'t currently know if that was tied into uploads before or if it was a separate creation.[/quote]\r\n\r\nAs someone very personally interested in the collage feature especially, please keep us updated.',NULL,NULL),(153,11,68,'2016-11-24 01:43:32','Gotcha! I am honored and will not let you down ;)\r\n',NULL,NULL),(154,1,1,'2016-11-24 01:44:50','[quote=kingorlowest|152][quote=Captain|140][quote=b|102]I love what you\'re doing here. Thanks a bunch. \r\n\r\nTorrents or not, we can rebuild this community. Is there any way to add artists and such? I would love to be able to do this and add images, albums and other such data.[/quote]\r\n\r\nI will look into what it would take to do so. I don\'t currently know if that was tied into uploads before or if it was a separate creation.[/quote]\r\n\r\nAs someone very personally interested in the collage feature especially, please keep us updated.[/quote]\r\n\r\nThe creation of the artist pages appear to have been generated when torrents were created. I am reaching out to a developer who has offered to help. My hope is that we can adapt the upload page\'s script to become an Artist/Album/Release creator.',NULL,NULL),(155,1,1,'2016-11-24 01:45:58','[quote=kingorlowest|152][quote=Captain|140][quote=b|102]I love what you\'re doing here. Thanks a bunch. \r\n\r\nTorrents or not, we can rebuild this community. Is there any way to add artists and such? I would love to be able to do this and add images, albums and other such data.[/quote]\r\n\r\nI will look into what it would take to do so. I don\'t currently know if that was tied into uploads before or if it was a separate creation.[/quote]\r\n\r\nAs someone very personally interested in the collage feature especially, please keep us updated.[/quote]\r\n\r\nOnce we have artists and albums back, would it such a stretch to start building collages again? There will be no link to download the music, but we could still start collaborating on what music is great with each other.',NULL,NULL),(156,18,223,'2016-11-24 01:47:15','[quote=Captain|138]I am looking for some people who are willing and able to lead and manage the rebuilding of the Wiki.\r\nNote, everyone has access to create and edit the wiki. I need those that will ensure all the wiki is correct, the formatting is proper, and things are cross linked appropriately. Please post here with a short reason why you would like to take this on.[/quote]\r\n\r\nVolunteering for this. I\'d like to coalesce all the various information floating around here and on reddit. Even when the new great music tracker comes along, this site needs to be maintained for that site\'s inevitable demise. I don\'t want us to ever have to start from the ground up like this again. ',NULL,NULL),(157,1,223,'2016-11-24 01:49:51','It\'s not clear to me how much metadata can be pulled from previous user\'s whatmanagers, but no, I don\'t think it\'d be a stretch to start building collages again. Seeing the discussions happen around the web, this was another thing people are missing the most.',NULL,NULL),(158,18,1,'2016-11-24 02:00:49','[quote=kingorlowest|156][quote=Captain|138]I am looking for some people who are willing and able to lead and manage the rebuilding of the Wiki.\r\nNote, everyone has access to create and edit the wiki. I need those that will ensure all the wiki is correct, the formatting is proper, and things are cross linked appropriately. Please post here with a short reason why you would like to take this on.[/quote]\r\n\r\nVolunteering for this. I\'d like to coalesce all the various information floating around here and on reddit. Even when the new great music tracker comes along, this site needs to be maintained for that site\'s inevitable demise. I don\'t want us to ever have to start from the ground up like this again.[/quote]\r\n\r\n[img]https://media.giphy.com/media/b5WsjNpMc35za/giphy.gif[/img]\r\nAs a note to all who work with me, I stick to one major rule.\r\n\r\n\"Don\'t be a dick\"',NULL,NULL),(159,18,94,'2016-11-24 02:03:09','Your avatar sure is an incentive to be nice lol.\r\nBe at peace with me :)',NULL,NULL),(160,10,304,'2016-11-24 02:11:54','So I have a screenshot of the front page showing my upload/download/ratio as well as the fact that I had unlimited invites.  I don\'t have my profile page and couldn\'t get it from cache.  The fact that I had unlimited invites though would mean that I was at least TM, which I was.',NULL,NULL),(161,11,42,'2016-11-24 02:28:57','Hey Captain, it\'s looking like you might be considering at some point opening this site up for hosting torrents in the future.\r\n\r\nSilly question...if that does happen would it be possible to either change my username here, or delete it and I can establish a new account?\r\n\r\nIf I\'d want to use this site in the long term, I\'d prefer to use the same username that I use on trackers.  :)\r\n\r\n',NULL,NULL),(162,14,310,'2016-11-24 02:33:09','Collages are what I miss most',NULL,NULL),(163,1,310,'2016-11-24 02:35:01','Much love to all the What refugees out there\r\n\r\n\r\n\r\n\r\nStay strong in these dark times',NULL,NULL),(164,11,1,'2016-11-24 02:35:18','[quote=Doommantia|161]Hey Captain, it\'s looking like you might be considering at some point opening this site up for hosting torrents in the future.\r\n\r\nSilly question...if that does happen would it be possible to either change my username here, or delete it and I can establish a new account?\r\n\r\nIf I\'d want to use this site in the long term, I\'d prefer to use the same username that I use on trackers.  :)[/quote]\r\n\r\nThis site will NOT host torrents (except possibly 100% legal released by artists that want to contribute to the community)',NULL,NULL),(165,18,1,'2016-11-24 02:36:06','[quote=zaerdy|159]Your avatar sure is an incentive to be nice lol.\r\nBe at peace with me :)[/quote]\r\nYea, but Emma Stone is super friendly. So...... take what you will from that.',NULL,NULL),(166,13,1,'2016-11-24 02:37:57','[quote=Denominator|97][quote=Token|93]Would it not make more sense to just export the parts of the database regularly and host them here in compressed SQL?\r\n\r\nI would definitely keep the tables that contain any user data out of it and keep it at a per-request basis. Currently, it would be enough to be able to merely check a user you want to verify using brainwashthemasses.\r\n\r\nBut the dream, I guess, would be to just have the SQL dumps available and not to allow for connections to the database from outside networks.[/quote]\r\n\r\nIdeally, I\'d like external automation for grabbing the releases i.e. a restful api call to download the latest dump.[/quote]\r\nThis is ultimately what I would like. A full dump (sans user data) and then an API. But that will take a little setting up while opening up the database to read only access might be a short term solution until I can learn how to set up an API.',NULL,NULL),(167,21,31,'2016-11-24 03:02:43','Hi All,\r\nSo i\'ve mentioned that I\'m working on mirroring the Wiki on my own. Well, I just launched my site on a proper host: http://wcdwikimirror.tk/index.html. Within the next week or so(sorry, im pretty busy) I\'ll begin posting them on here and getting the Wiki Page on BTM looking good. Let me know if you have any questions/want to help out. \r\nThanks,\r\nadinbied',NULL,NULL),(168,22,1,'2016-11-24 03:34:06','Artists!\r\n\r\nWe all LOVE what.cd, and I believe that we should ALWAYS have a what.cd theme.\r\nHowever we should start creating logo\'s for this site and create another theme.\r\nPost some ideas or portfolio work and lets get something going together.',NULL,NULL),(169,22,223,'2016-11-24 04:17:45','I was thinking the same thing today. At the very least just to replace the top left logo in the postmod theme. Will throw something in here soon. ',NULL,NULL),(170,21,70,'2016-11-24 04:22:02','Can you make a place where we can drop off screenshots and other files we\'ve recovered.',NULL,NULL),(173,21,223,'2016-11-24 04:27:40','This sounds fantastic. If your mirror is good to go, I can start porting stuff over. \r\n\r\n[quote=outofmymind|170]Can you make a place where we can drop off screenshots and other files we\'ve recovered.[/quote]\r\nIn the meantime, use imgur. If you have an account on PTPIMG and the like, that\'s preferable. ',NULL,NULL),(174,18,223,'2016-11-24 04:28:45','It\'s the yellow teeth that get me',NULL,NULL),(175,23,223,'2016-11-24 04:34:48','We need to make a list of acceptable file/image hosting services. \r\nSuggestions:\r\n\r\nimgur.com\r\nptpimg.me\r\ncl.ly\r\n\r\nNot allowed:\r\nGoogle Drive\r\nDropbox \r\n\r\nAlternatively, we can run our own image hosting server potentially, called btmimg.net or something, using up1: https://github.com/Upload/Up1\r\n\r\n\r\n',NULL,NULL),(176,24,327,'2016-11-24 04:38:43','Long-term this might be useful to anyone trying to develop decentralised file hosting.\r\nA member at KG has set up the basics and a guide for IPFS in an image hosting context.\r\n\r\nMore info on IPFS: https://ipfs.io/docs/getting-started/',NULL,NULL),(177,1,326,'2016-11-24 04:41:23','Thanks very much for having me. It\'s really comforting to see the site. Like a beautiful mirage. I\'m happy to be of assistance as I can.',NULL,NULL),(178,12,223,'2016-11-24 04:43:53','A tracker will definitely come back (whether it\'s waffles or something else), but it won\'t be here. What\'s particularly scary to me, and hopefully this will be clarified in the near future, is that what.cd was able to be taken down despite the servers not containing illegal/copyrighted material. Perhaps the next iteration will be similar to TPB, using magnet links, with another tracker. I\'m not sure what the legality is here.\r\n\r\nEither way, it won\'t be here at BTM. This site is for community and resource building, to reduce the likelihood of losing documentation and an entire community overnightâ€”which we\'ve seen happens.',NULL,NULL),(179,3,223,'2016-11-24 04:47:10','So, the Wiki mirroring is in a new thread here: https://www.brainwashthemasses.org/forums.php?action=viewthread&threadid=21\r\n\r\nWe should definitely be on the lookout for FAQ and interview documentation as well, although the Wiki guides are highest priority. ',NULL,NULL),(180,24,223,'2016-11-24 05:03:37','Thanks for the suggestion! Not sure how this would work into the site architecture. It\'s probably better if we use our own image host. ',NULL,NULL),(181,3,31,'2016-11-24 05:04:16','[quote=kingorlowest|179]So, the Wiki mirroring is in a new thread here: https://www.brainwashthemasses.org/forums.php?action=viewthread&threadid=21\r\n\r\nWe should definitely be on the lookout for FAQ and interview documentation as well, although the Wiki guides are highest priority.[/quote]\r\nI have two different Interview Q\'s and A\'s, if that will help.',NULL,NULL),(182,1,68,'2016-11-24 05:05:57','[quote=kingorlowest|157]It\'s not clear to me how much metadata can be pulled from previous user\'s whatmanagers, but no, I don\'t think it\'d be a stretch to start building collages again. Seeing the discussions happen around the web, this was another thing people are missing the most.[/quote]\r\n\r\nThis could be epic. Might be a good idea to post in /r/whatnextcd asking for people with cached collage pages and original collage creators to contribute.',NULL,NULL),(183,5,206,'2016-11-24 05:13:02','What I listen to varies a lot, recently I\'ve been listening to a lot of hip-hop, right now mostly Wu-Tang Clan, A Tribe Called Quest, Nas, MF DOOM, and Kanye West. Also just joined a shoegaze tracker, trying to get into the genre.',NULL,NULL),(184,16,223,'2016-11-24 05:13:12','Yeah, hosting cc-licensed or giving BTM explicit distributing rights would be incredible. This would be for artists with accounts on the site though, and not just any public-domain work. ',NULL,NULL),(185,18,68,'2016-11-24 05:17:55','[quote=kingorlowest|174]It\'s the yellow teeth that get me[/quote]\n\nSame ;)\n\nI\'d ask to be a Mod but I don\'t think I\'d be consistent in terms of having the time to continuously provide value. Life has been pretty crazy lately. However, I have a deep background with linux, infra/networking, and modern containerization etc.. so I\'d love to help in any way I can technically. The archivist in me is always available for quick backup/storage needs as well, but of course, we have a community that should be able to help with that ;)',68,'2016-11-24 05:18:32');
/*!40000 ALTER TABLE `forums_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_specific_rules`
--

DROP TABLE IF EXISTS `forums_specific_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_specific_rules` (
  `ForumID` int(6) unsigned DEFAULT NULL,
  `ThreadID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_specific_rules`
--

LOCK TABLES `forums_specific_rules` WRITE;
/*!40000 ALTER TABLE `forums_specific_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_specific_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_topic_notes`
--

DROP TABLE IF EXISTS `forums_topic_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_topic_notes` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TopicID` int(10) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime NOT NULL,
  `Body` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `TopicID` (`TopicID`),
  KEY `AuthorID` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_topic_notes`
--

LOCK TABLES `forums_topic_notes` WRITE;
/*!40000 ALTER TABLE `forums_topic_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_topic_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_topics`
--

DROP TABLE IF EXISTS `forums_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums_topics` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `IsLocked` enum('0','1') NOT NULL DEFAULT '0',
  `IsSticky` enum('0','1') NOT NULL DEFAULT '0',
  `ForumID` int(3) NOT NULL,
  `NumPosts` int(10) NOT NULL DEFAULT '0',
  `LastPostID` int(10) NOT NULL,
  `LastPostTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastPostAuthorID` int(10) NOT NULL,
  `StickyPostID` int(10) NOT NULL DEFAULT '0',
  `Ranking` tinyint(2) DEFAULT '0',
  `CreatedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ForumID` (`ForumID`),
  KEY `IsSticky` (`IsSticky`),
  KEY `LastPostID` (`LastPostID`),
  KEY `Title` (`Title`),
  KEY `CreatedTime` (`CreatedTime`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums_topics`
--

LOCK TABLES `forums_topics` WRITE;
/*!40000 ALTER TABLE `forums_topics` DISABLE KEYS */;
INSERT INTO `forums_topics` VALUES (1,'What this is.',1,'0','0',19,30,182,'2016-11-24 05:05:57',68,0,0,'2016-11-20 21:18:43'),(2,'What this is.',1,'0','0',1,21,130,'2016-11-24 00:45:22',1,0,0,'2016-11-20 21:21:01'),(3,'What to help rebuild?',1,'0','0',2,15,181,'2016-11-24 05:04:16',31,0,0,'2016-11-20 22:41:25'),(4,'What is it you want to see rebuilt first?',1,'0','0',2,13,101,'2016-11-23 20:20:09',107,0,0,'2016-11-21 00:20:40'),(5,'Who is your favorite artist?',1,'0','0',5,12,183,'2016-11-24 05:13:02',206,0,0,'2016-11-21 00:22:34'),(6,'[NEWS]',3,'0','0',1,2,144,'2016-11-24 01:31:32',223,0,0,'2016-11-21 04:15:10'),(7,'Restoring the forum and general organisation',21,'0','0',1,17,131,'2016-11-24 00:46:54',1,0,0,'2016-11-21 14:19:06'),(8,'What.CD Interview Questions',1,'0','0',1,1,31,'2016-11-21 14:32:41',1,0,0,'2016-11-21 14:32:41'),(9,'Looks like sherlock is up!',23,'0','0',2,3,57,'2016-11-22 21:31:08',90,0,0,'2016-11-21 16:18:04'),(10,'Looking for individuals to help rebuild user profiles',1,'0','0',7,6,160,'2016-11-24 02:11:54',304,0,0,'2016-11-22 17:09:57'),(11,'Looking for TMs to invite more former What users',1,'0','0',1,26,164,'2016-11-24 02:35:18',1,0,0,'2016-11-22 17:52:08'),(12,'What.CD is Dead',1,'0','0',8,7,178,'2016-11-24 04:43:53',223,0,0,'2016-11-22 18:29:03'),(13,'Open up the database with a read-only mysql user.',1,'0','0',7,6,166,'2016-11-24 02:37:57',1,0,0,'2016-11-22 20:07:14'),(14,'Restoring Collages',18,'0','0',7,2,162,'2016-11-24 02:33:09',310,0,0,'2016-11-23 02:22:25'),(15,'Rebuilding wiki',101,'0','0',7,1,78,'2016-11-23 03:57:32',101,0,0,'2016-11-23 03:57:32'),(16,'Last Vanity House Album',110,'0','0',19,3,184,'2016-11-24 05:13:12',223,0,0,'2016-11-23 05:01:47'),(17,'What.cd Wallpapers Archive',124,'0','0',9,1,89,'2016-11-23 15:23:53',124,0,0,'2016-11-23 15:23:53'),(18,'RECRUITMENT',1,'0','0',6,7,185,'2016-11-24 05:17:55',68,0,0,'2016-11-24 01:20:19'),(19,'New Years Eve',1,'0','0',15,1,145,'2016-11-24 01:32:17',1,0,0,'2016-11-24 01:32:17'),(20,'Sorority Noise',1,'0','0',15,1,146,'2016-11-24 01:33:08',1,0,0,'2016-11-24 01:33:08'),(21,'Wiki Mirroring',31,'0','0',7,3,173,'2016-11-24 04:27:40',223,0,0,'2016-11-24 03:02:43'),(22,'More recruitment!',1,'0','0',6,2,169,'2016-11-24 04:17:45',223,0,0,'2016-11-24 03:34:06'),(23,'Acceptable File Hosting',223,'0','0',27,1,175,'2016-11-24 04:34:48',223,0,0,'2016-11-24 04:34:48'),(24,'IPFS: distributed P2P image hosting',327,'0','0',12,2,180,'2016-11-24 05:03:37',223,0,0,'2016-11-24 04:38:43');
/*!40000 ALTER TABLE `forums_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geoip_country`
--

DROP TABLE IF EXISTS `geoip_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geoip_country` (
  `StartIP` int(11) unsigned NOT NULL,
  `EndIP` int(11) unsigned NOT NULL,
  `Code` varchar(2) NOT NULL,
  PRIMARY KEY (`StartIP`,`EndIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geoip_country`
--

LOCK TABLES `geoip_country` WRITE;
/*!40000 ALTER TABLE `geoip_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `geoip_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_log`
--

DROP TABLE IF EXISTS `group_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GroupID` int(10) NOT NULL,
  `TorrentID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Info` mediumtext,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `TorrentID` (`TorrentID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_log`
--

LOCK TABLES `group_log` WRITE;
/*!40000 ALTER TABLE `group_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_bans`
--

DROP TABLE IF EXISTS `ip_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_bans` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FromIP` int(11) unsigned NOT NULL,
  `ToIP` int(11) unsigned NOT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FromIP_2` (`FromIP`,`ToIP`),
  KEY `ToIP` (`ToIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_bans`
--

LOCK TABLES `ip_bans` WRITE;
/*!40000 ALTER TABLE `ip_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_aliases`
--

DROP TABLE IF EXISTS `label_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_aliases` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `BadLabel` varchar(100) NOT NULL,
  `AliasLabel` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BadLabel` (`BadLabel`),
  KEY `AliasLabel` (`AliasLabel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_aliases`
--

LOCK TABLES `label_aliases` WRITE;
/*!40000 ALTER TABLE `label_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_sent_email`
--

DROP TABLE IF EXISTS `last_sent_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_sent_email` (
  `UserID` int(10) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_sent_email`
--

LOCK TABLES `last_sent_email` WRITE;
/*!40000 ALTER TABLE `last_sent_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `last_sent_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_contest`
--

DROP TABLE IF EXISTS `library_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_contest` (
  `UserID` int(10) NOT NULL,
  `TorrentID` int(10) NOT NULL,
  `Points` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_contest`
--

LOCK TABLES `library_contest` WRITE;
/*!40000 ALTER TABLE `library_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locked_accounts`
--

DROP TABLE IF EXISTS `locked_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locked_accounts` (
  `UserID` int(10) unsigned NOT NULL,
  `Type` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`UserID`) REFERENCES `users_main` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locked_accounts`
--

LOCK TABLES `locked_accounts` WRITE;
/*!40000 ALTER TABLE `locked_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `locked_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Message` varchar(400) NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'Wiki article 2 (EAC - Ripping with Exact Audio Copy [FROM baconBits]) was created by X','2016-11-20 22:42:10'),(2,'Wiki article 3 (EAC Setup Guide) was created by adinbied','2016-11-21 01:37:07'),(3,'Wiki article 4 (XLD Guide) was created by adinbied','2016-11-21 14:43:44'),(4,'Wiki article 5 (User Classes) was created by hxr4mp3','2016-11-24 00:15:22');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_info_hashes`
--

DROP TABLE IF EXISTS `new_info_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_info_hashes` (
  `TorrentID` int(11) NOT NULL,
  `InfoHash` binary(20) DEFAULT NULL,
  PRIMARY KEY (`TorrentID`),
  KEY `InfoHash` (`InfoHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_info_hashes`
--

LOCK TABLES `new_info_hashes` WRITE;
/*!40000 ALTER TABLE `new_info_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_info_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'What is this?','This site is NOT the successor to what.cd\r\n\r\nThis site is to rebuild the documentation, wiki, faqs, guides, etc. that was lost from the original what.cd\r\n\r\nIt uses gazelle solely in the hopes/goal that the information recreated here will be in a suitable format to import easily into the successor, whomever that is.\r\n\r\nThis site WILL NOT be hosting torrents. All uploads are disabled.','2016-11-20 21:25:55'),(2,1,'The What.CD Ninth Birthday - AT / FLS / FM picks','On this third day of celebration, we want to recognize three of our important site teams.\r\n\r\nForum Moderators are dedicated members who spend their time keeping our forums welcoming for everyone, dealing with reports and rule breaking posts.\r\n\r\nFirst Line Support members deal with a huge amount of PMs (more than 4,300 this year alone), while also being helpful on the Help forums and on IRC.\r\n\r\nFinally, Alpha Team members are masters in the art of the perfect coffee, helping the Staff Team work in ideal conditions.\r\n\r\nBefore leaving you with their favourite albums, we are very happy to say that the Compact Disc upload contest is now in full swing, with over 250 uploads in the first two days!\r\n\r\nhttps://whatimg.com/i/LBipTs.png\r\n\r\n\r\nhisashiburi\'s Alpha Team Pick\r\n\r\nChaos A.D. - Buzz Caner\r\n\r\nGenre: Electronic, Techno, IDM, Acid, Experimental \r\n\r\nTorrents: torrents.php?id=57964\r\n\r\nReview:\r\nSquarepusher\'s more abrasive side. Raw electronic onslaught. Play with it carefully.\r\n\r\n\r\n\r\nlibussa\'s Alpha Team Pick\r\n\r\nSol.illaquists of Sound - No More Heroes\r\n\r\nGenre: hip.hop, underground, alternative\r\n\r\nTorrents: torrents.php?id=548302\r\n\r\nReview:\r\nThis album is awesome. Listen to their other releases too!\r\n\r\n\r\n\r\nred7bait\'s Alpha Team Pick\r\n\r\nBarbarisms - Browser\r\n\r\nGenre: rock, indie\r\n\r\nTorrents: torrents.php?id=73250488\r\n\r\nReview:\r\nPitched somewhere between the playful jangle of Jeffrey Lewis and the off-kilter wisdom of Guided By Voices...a captivating slice of lo-fi wonder that shines like a gem shimmering in a pool of darkness.\r\n\r\n\r\n\r\nwar10ck\'s Alpha Team Pick\r\n\r\nThe Fray - How to Save a Life\r\n\r\nGenre: Alternative, Rock.\r\n\r\nTorrents: torrents.php?id=13104\r\n\r\nReview:\r\nThe band\'s debut album How to Save a Life was released on September 13, 2005; its style is between traditional rock and alternative rock. \"Over My Head (Cable Car)\" was released as the first single from the album, and it soon became a top 40 hit on the Modern Rock Tracks chart in late 2005, peaking at No. 37. The single gained airplay nationally, entering the Billboard Hot 100 chart on the issue marked February 25, 2006. Fourteen weeks later, it reached its peak position at No. 8 on the Hot 100 chart. On the Billboard Adult Top 40 chart, the single reached the No. 2 position. Internationally, the song was a Top 25 hit in Australia, Canada, Denmark, Ireland, New Zealand and the UK. The song was the fifth-most downloaded single of 2006.\r\n\r\n\r\n\r\nblablabla\'s Alpha Team Pick\r\n\r\nBlack Marble - It\'s Immaterial\r\n\r\nGenre: electronic, minimal.synth, synth.pop\r\n\r\nTorrents: torrents.php?id=73333442\r\n\r\n\r\nhttps://whatimg.com/i/qBKgVw.png\r\n\r\n\r\nBlitzkriegBob\'s FLS Pick\r\n\r\nGary Hughes - Once and Future King Part I\r\n\r\nGenre: Rock, Symphonic Metal, Metal Opera\r\n\r\nTorrents: torrents.php?id=784500\r\n\r\nReview:\r\nThis is truly a killer album!! Every song is great (but with several being truly exceptional) and the painstaking attention to detail with the arrangements sure pays off. This album really is hard to put away, after several listens, the quality of this album really starts to grab you. Soaring vocal melodies, lots of up front guitar riffs and sustaining power chords all combine to produce one of the best albums in the melodic metal genre so far this year.\r\n\r\nfrom http://www.metalreviews.com/reviews/album/1735\r\n\r\n\r\ndoctu\'s FLS Pick\r\n\r\nQueen - Absolute Greatest\r\n\r\nGenre: Rock\r\n\r\nTorrents: torrents.php?id=627688\r\n\r\nReview:\r\nThink spiffy review here.\r\n\r\n\r\n\r\nars3nic\'s FLS Pick\r\n\r\nPlini - Handmade Cities\r\n\r\nGenre: Progressive Rock, Jazz, Fusion, Progressive Metal, Djent, Instrumental\r\n\r\nTorrents: torrents.php?id=73304587\r\n\r\nReview: from http://www.itdjents.com/reviews-2/review-plini-handmade-cities/\r\nIf happiness truly is a smile, I have no adequate word to describe the blissful calm I felt while listening to Handmade Cities for the first time. Pliniâ€™s unrelentingly melodic, playful and precise approach is the epitome of aural serenity. Unobtrusive and intriguing at once, it impressively represents an entire blooming strand of instrumental prog/djent and could be a stepping stone for people just getting into the genre. A debut this refined, expressive and dynamic is indeed a rare accomplishment. In short, Handmade Cities is a fantastic record, forged by one of the most promising young guitarists today.\r\n\r\n\r\n\r\nJaames\' FLS Pick\r\n\r\nMassive Attack - Mezzanine\r\n\r\nGenre: Leftfield, Trip Hop, Downtempo\r\n\r\nTorrents: torrents.php?id=13334\r\n\r\n\r\npears\'s FLS Pick\r\n\r\nMortichnia - Heir to Scoria and Ash\r\n\r\nGenre: metal, black metal\r\n\r\nTorrents: torrents.php?id=73217008\r\n\r\nReview:\r\nAn incredible first album by a mysterious band, full of dreadful atmosphere and a slight progressive touch. This was recorded and mixed by Altar of Plagues\' James Kelly, and is a perfect representative of the small but unique Irish black metal scene.\r\n\r\n\r\n\r\nhttps://whatimg.com/i/GiCDye.png\r\n\r\n\r\nJakalope\'s Forum Moderator Pick\r\n\r\nSALES - SALES\r\n\r\nGenre: Indie, Pop, singer.songwriter\r\n\r\nTorrents: torrents.php?id=73218130\r\n\r\nReview:\r\nSALES are a rad duo from Florida that make catchy upbeat indie pop songs. Nothing more to know.\r\n\r\n\r\n\r\nVelvelette\'s Forum Moderator Pick\r\n\r\nJuliana Hatfield - Made in China\r\n\r\nGenre: Alternative, Rock, Indie, Lo-Fi\r\n\r\nTorrents: torrents.php?id=144642\r\n\r\nReview:\r\nA spiky, distorted rush of an album that fairly accurately reflects my high school experience. \"It\'s a miracle I\'m even here...so what do I care?\"\r\n\r\n\r\n\r\nmubydram\'s Forum Moderator Pick\r\n\r\nJMSN - It Is.\r\n\r\nGenre: rhythm.and.blues, soul, hip.hop\r\n\r\nTorrents: torrents.php?id=73228920\r\n\r\nmubydram wrote:\r\nThis was found in ods 2016 collage. It\'s worth listening to for the lyrics alone. JMSN just carries himself in a well-versed manner. \"I got a lot of shit on my mind, all the time.\" - JMSN. Interestingly enough, I\'ve found myself applying his mantra and philosophies in my own life.\r\n\r\n\r\n\r\nHorklinator\'s Forum Moderator Pick\r\n\r\nClutch - Psychic Warfare\r\n\r\nGenre: Rock, Blues Rock, Stoner Rock\r\n\r\nTorrents: torrents.php?id=73068068\r\n\r\nReview:\r\nFirebirds? Energy Weapons? Both of these things are interesting to me.\r\n','2016-11-21 14:21:26'),(3,1,'The What.CD Ninth Birthday - Special Donor Picks','Here we are on this fourth day of celebration. For nine years, the site has been entirely funded by our beloved donors. Here are their picks, enjoy them!\r\n\r\nMuch \r\n\r\nhttps://whatimg.com/i/McozBW.png\r\n\r\n\r\n\r\nsinonick\'s Special Donor Pick\r\n\r\nVangelis - Blade Runner\r\n\r\nGenre: Ambient, Electronic, New Age, Soundtrack\r\n\r\nTorrents: torrents.php?id=52682\r\n\r\nReview:\r\nVangelis\' soundtrack to the Ridley Scott film Blade Runner still stands as one of the twentieth century\'s greatest achievements in sound. It functions on various levels. As a soundtrack, it is an integral part of the movie, a character of its own that strengthens the moods and illuminating the story rather than merely following it. As an album, it is a near perfect collection of atmospheric sculptures that provide an intriguing listen. It is a prime example of how to make soundtrack music sounding evocative and emotional. Remarkably dramatic, even visual, it deserves recognition as one of the finest soundtracks of all time.\r\n\r\n\r\n\r\nmpf101\'s Special Donor Pick\r\n\r\nRichard Thompson - More Guitar\r\n\r\nGenre: Rock, Live Concert, 80\'s\r\n\r\nTorrents: torrents.php?id=72706268\r\n\r\nReview:\r\nWhen invited to choose a freeleech, I quickly made a list of 5 deserving albums, and 3 of them were from Richard Thompson, songwriter extraordinaire and my personal favorite guitarist of the past 50 years. When trying to select one out of RT\'s massive catalog, do you go with Fairport Convention, Richard & Linda, or solo work? Electric or acoustic? There\'s no way to win here, but also no way to lose. I chose this one for it\'s insane, jangly, angular solos, some of the best ever squeezed from a Strat, even though it\'s not his finest collection of songs. One of my first uploads and it was promptly trumped for bad tags, but so it goes. Enjoy!\r\n\r\n\r\n\r\nBabaOriley\'s Special Donor Pick\r\n\r\nInfidels - Mad About That Girl\r\n\r\nGenre: Power Pop, Garage Punk\r\n\r\nTorrents: torrents.php?id=72346553\r\n\r\nReview:\r\nRare and highly sought after album by power pop/garage band The Infidels, only a handful of these were pressed by the GMG label in Paris, France back in 1986. Out of print ever since.\r\n\r\n\r\n\r\nAdenZerda\'s Special Donor Pick\r\n\r\nPyrrhon - The Mother of Virtues\r\n\r\nGenre: Technical Death Metal, Noise\r\n\r\nTorrents: torrents.php?id=72691642\r\n\r\nReview:\r\nPyrrhon\'s chaotic, off-kilter walls of sound are something great. The Mother of Virtues is dissonant, driving, and absolutely filthy across its runtime, but the experience is somehow refreshing, with jazzy, atmospheric elements and rich songwriting throughout. This one\'s special.\r\n\r\n\r\n\r\nfusoyaff2\'s Special Donor Pick\r\n\r\nThe Four Postmen - Hit Record\r\n\r\nGenre: Comedy, Rock, Folk\r\nTorrents: torrents.php?id=72797868\r\n\r\nReview:\r\nOne of my favorite CDs of all time - The Chainsaw Juggler and Let Me Make You Smile In Bed were staples of the Dr Demento show in the early 2000s, and the rest of the disc is excellent too! Not just comedy, but really well done music.\r\n\r\nIt really is a shame that The Four Postmen never became a bigger name, as their entire catalog is amazing, and they have really fun live shows.\r\n\r\n\r\n\r\nFidesGhostInversa\'s Special Donor Pick\r\n\r\nAll Them Witches - Lightning At The Door\r\n\r\nGenre: blues.rock, psychedelic.rock\r\n\r\nTorrents: torrents.php?id=72609693\r\n\r\nReview:\r\nThis is modern Led Zeppelin, if you are into any kind of rock, be it stoner/blues/psych. This will be the best thing you have heard since 1972.\r\n\r\n\r\n\r\nMTN_\'s Special Donor Pick\r\n\r\nJoÃ£o Gilberto & Stan Getz - Selections from Getz/Gilberto \'76\r\n\r\nGenre: jazz, smooth.jazz, folk, brazil, acoustic\r\n\r\nTorrents: torrents.php?id=72951874\r\n\r\nReview:\r\nSoothing soft jazz from some of the best. Live sessions of Stan Getz and JoÃ£o Gilberto at the well-known Keystone Korner in San Francisco.\r\n\r\n\r\n\r\nkablekill\'s Special Donor Pick\r\n\r\n28 Days - Stealing Chairs [2002] [Album]\r\n\r\nGenre: Alternative, Rock, Grunge, punk, rap.metal, Australia\r\n\r\nTorrents: torrents.php?id=446150\r\n\r\nReview:\r\n28 Days return with their 2002 long-player. Melding the most potent and abrasive elements of hardcore, hip-hop and rock produced by Machine (Ozzy, Hed Pe). Sputnik. Stealing Chairs was named for a favourite pastime of their late drummer, Scott Murray.\r\n\r\n\r\n\r\nTheDaftMonk\'s Special Donor Pick\r\n\r\nSmoke Fairies - Through Low Light and Trees\r\n\r\nGenre: Gothic Folk, Folk Rock, Blues\r\n\r\nTorrents: torrents.php?id=71818776\r\n\r\nReview: TheDaftMonk wrote:\r\nLike conducting an evening seance in the woods of the Midwest, with candles dying and the smell of woodsmoke mixing with the coming autumn chill. A criminally underrated favourite from years past.\r\n\r\n\r\n\r\nBr00t41\'s Special Donor Pick\r\n\r\nDÃ¢M-FunK - Album Toeachizown\r\n\r\nGenre: Funk, Boogie, G-Funk, Soul, electro.funk\r\n\r\nTorrents: torrents.php?id=608115\r\n\r\nReview:\r\n\r\nDam provides us with over two hours of G funk that has carried me through endless car rides, essays, parties, and smoke sessions. Young and old, I haven\'t met anyone who hasn\'t liked these grooves. Great for all occasions!\r\nHis instagram is pretty on point too. \r\n\r\nThank you to What.cd for blessing us with this community! \r\n\r\n\r\n\r\nmatteoautomata\'s Special Donor Pick\r\n\r\nJeremiah Johnson - Grind\r\n\r\nGenre: Blues, Rock\r\n\r\nTorrents: torrents.php?id=73002275\r\n\r\nReview:\r\nJeremiah Johnson is the new face of Mississippi River Blues. Jeremiah left St. Louis for Texas with his guitar, a fist full of songs, and a ton of ambition. Jeremiah has returned home to release two albums as The Jeremiah Johnson Band with The Sliders, and most recently he has released his solo album Grind. On Grind, Jeremiah Johnson is backed by such seasoned musicians and award winning individuals including drummer Yonriko Scott, pianist Rick Steff, bassist Jeff Girardier, engineer Pete Mattews, and producer Devon Allman with legendary blues rock heritage. The result is an original blues rock experience with a little Texas country twist.\r\n\r\n\r\n\r\nculture0\'s Special Donor Pick\r\n\r\nNOFX - Punk in Drublic\r\n\r\nGenre: Punk\r\n\r\nTorrents: torrents.php?id=26118\r\n\r\nReview:\r\nThis is not only a great introduction to my favorite band, NOFX, but also one of the best modern Punk Rock albums ever created. It hits all the notes: serious tracks, political tracks, silly tracks, some fast and some slower. It has a little something for everyone.\r\n\r\n\r\n\r\nJunZu\'s Special Donor Pick\r\n\r\nMickey - Eye Witness\r\n\r\nGenre: boogie, funk, electronic, vaporwave\r\n\r\nTorrents: torrents.php?id=73030063\r\n\r\nReview:\r\nTight electro-boogie and soul. Get down with that lucky lady or guy in your life, turn this up, and groove all night. If you ain\'t got that special someone, my girl Mary Jane should make you feel right with this album, too.','2016-11-21 14:24:25'),(4,1,'The What.CD Ninth Birthday - ???','https://whatimg.com/i/dCJyyc.png\r\n\r\n\r\nDiscovery. Who has the chance to have it all?\r\nDiscovery. Give me some truth and stop makin\' me cry!\r\n\r\nWord on the street is that a hidden treasure awaits our discovery. Some say that this treasure contains something sure to bring What.CD\'s 9th birthday celebration to another level. There are nine hidden clues. One clue leads to the next, but be warned: it\'s easy to get lost. Only the most observant will reach the end and unlock the prize.\r\n\r\nTeamwork will aid you in this quest, so join forces with fellow treasure hunters and post your discoveries in the thread. \r\nRewards come in many forms, and it\'s always better to share the secrets you\'ve found. Are you ready? The hunt starts now!\r\n\r\n\r\nhttps://whatimg.com/i/6jm4xP.png\r\n\r\n\r\n#1: I am very near but on the hidden side\r\nthat only the most generous among us have.\r\n\r\nClick to see all the clues: Show\r\n\r\nREWARD\r\n\r\nhttps://whatimg.com/i/wOWDVB.png\r\n\r\n\r\nYou\'ve done it! All it took was one hour, 600 messages, 158 Forum reports and 156 PMs to Drone.\r\n\r\nYou\'ve discovered:\r\n\r\nhttps://whatimg.com/i/VXQmai.png\r\n\r\n\r\nAs of the time of this edit, 15 FL Tokens have been distributed to all users. Let\'s all give a round of thanks to the treasure hunters who made this possible!\r\nNote to leech-disabled users: if you get out of ratio watch, send us a Staff PM and the 15 tokens will be given to you.\r\n\r\nTokens will expire on November 28th, 00:00 GMT (same time as the end of the CD upload contest)\r\n\r\nBONUS: The first person to share each newly discovered clue inside the discussion thread has earned a front page user pick. \r\nYou\'ll be contacted via PM and your picks will be featured in a future announcement.','2016-11-21 14:27:58'),(5,1,'The What.CD Ninth Birthday - Staff and Legend Picks','The festivities now wind to a close, and we&#39;re pleased to send you off with a traditional round of Staff Picks. We&#39;re also including a handful of Legend Picks for good measure. Let&#39;s give a round of applause to all the people - past and present - who&#39;ve labored in the shadows to ensure the continued growth and success of our mission.\r\n\r\nAnd let&#39;s also take a moment to congratulate everyone who has been a part of What.CD. What we&#39;ve built - and are building - is the the net result of countless strangers working together to create something that matters. Every upload, every interview, every post, every client left on overnight: we owe this to you. Every staffer, every team member, every poster, every designer, every musician toiling to fill the silence of a bedroom: we owe this to you. There are no guarantees in life, and as we approach years in the double digits, there&#39;s no doubt that we should be anything but thankful. And we are.\r\n\r\nSo here&#39;s to the next year and to the challenges ahead. Together we&#39;ll prove the sustaining power of music.\r\n\r\nHappy birthday, What.CD.\r\n\r\n\r\n[img]whatimg/zgYHRN.png[/img]\r\n\r\n[b][url=user.php?action=search&amp;search=Ajax]Ajax[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Springtime Carnivore - Midnight Room[/b]\r\n\r\n[b]Genre:[/b] indie, dream.pop\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=73329361]torrents.php?id=73329361[/url]\r\n\r\n[b]Review:[/b] [quote]Wait for the clock to strike midnight, throw on the music, and ride the sound into the autumn night.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=TonDef]TonDef[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]FM-84 - Atlas[/b]\r\n\r\n[b]Genre:[/b] Dreamwave\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=73222334]torrents.php?id=73222334[/url]\r\n\r\n[b]Review:[/b] [quote]80&#39;s inspired music has always held a special place in the heart&#39;s of music lovers, but FM-84&#39;s debut album transcends nostalgia into a modern masterpiece.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Patience]Patience[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Dead Larry - Never Made It To Space[/b]\r\n\r\n[b]Genre:[/b] Awesome, Jam, Psychedelic, Funk, Rock\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72631820]torrents.php?id=72631820[/url]\r\n\r\n[b]Review:[/b] [quote]You can&#39;t really appreciate how talented Dead Larry are without the volume turned up to 11 and at least one dude in the room wearing a mask, BUT you should give it a shot anyway. Their music is good, clean fun for the entire family to boogie down to.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=draculesti]draculesti[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Gustav Mahler - Symphony No. 1[/b]\r\n\r\n[b]Genre:[/b] Classical\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=603561]torrents.php?id=603561[/url]\r\n\r\n[b]Review:[/b] [quote]Just great stuff. Give it a listen[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=iapetus]iapetus[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Monophonics - Sound of Sinning[/b]\r\n\r\n[b]Genre:[/b] soul, psychedelic, funk\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72955187]torrents.php?id=72955187[/url]\r\n\r\n[b]Review:[/b] [quote] Touching on Northern soul, doo-wop, rock and roll, Psych pop, and cinematic music, Monophonics show off their diversity while remaining true to their roots. Overall it&#39;s heartfelt music and old school vibes, without losing sight of the present. This is music steeped in that timeless feeling when people could write and produce songs that you could listen to over and over again. [/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=kitchenstaff]kitchenstaff[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Ooze - Where the Fields Never End[/b]\r\n\r\n[b]Genre:[/b] Downtempo, Ambient, Psychedelic, Chillout\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72295898]torrents.php?id=72295898[/url]\r\n\r\n[b]Review:[/b] [quote]I&#39;ve been listening to this album for well over a decade, and it remains one of my favorite recordings, chock full of long, meandering psychedelic landscapes, well-deserving of the Aleph Zero reissue a few years ago.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=FZeroX]FZeroX[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Darren Korb - Bastion Original Soundtrack[/b]\r\n\r\n[b]Genre:[/b] Rock, Video Game\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72022079]torrents.php?id=72022079[/url]\r\n\r\n[b]Review:[/b] [quote]My father - who introduced me to both music and bittorrent - passed away earlier this year. Out of all the albums I introduced him to, this was perhaps his favourite. There is no higher accolade as far as I&#39;m concerned. I miss you, dad.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=brancusi]brancusi[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Einojuhani Rautavaara - 12 Concertos[/b]\r\n\r\n[b]Genre:[/b] classical, modern, contemporary\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72056273]torrents.php?id=72056273[/url]\r\n\r\n[b]Review:[/b][quote]Einojuhani Rautavaara (1928 &ndash; 2016) was considered the most notable Finnish composer after Jean Sibelius. \r\nThese recordings were produced in collaboration with the composer between 1990 and 2005.\r\nDefinitely a set to seek out if the composer, or late twentieth century orchestral music, makes you curious.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=jowa]jowa[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Arpanet - Inertial Frame[/b]\r\n\r\n[b]Genre:[/b] Electronic, Techno, Experimental, Detroit Techno\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=42291]torrents.php?id=42291[/url]\r\n\r\n[b]Review:[/b] [b]boomkat.com[/b] wrote: [quote]Arpanet&#39;s &quot;Inertial Frame&quot; reveals a much more rhythmic dimension to what we already know from Arpanet and their (rare) live performances. Starting off with a laconic arpeggio overlooking cold synthesizer waves and chords, a distorted and ill fitted Germanic voice lands from nowhere reminding you why you love them so much. Chiselled electro beats &agrave; la Drexcyia eventually intervene and call for a dark and gloomy souvenir of Tangerine Dream meets Kraftwerk and J Carpenter in a futuristic goth melodrama. For Drexciya heads - get on this quick. KILLER![/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=ClosingTime]ClosingTime[/url]&#39;s Legend Pick[/b]\r\n\r\n[b]Oren Lavie - The Opposite Side of the Sea[/b]\r\n\r\n[b]Genre:[/b] Indie, Folk, Pop\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=44349]torrents.php?id=44349[/url]\r\n\r\n[b]Review:[/b] [b]Lancifer, indierockreviews.com[/b] wrote: [quote]It&rsquo;s not difficult to hear the playwright and theatre influences in the Israel born artist, Oren Lavie. Each song has the potential to paint a descriptive landscape for you to float through on a cushioned cloud. All that is required of you, is to close your eyes, lay back, and relax to the soothing and beautifully produced album.[/quote]\r\n\r\n\r\n\r\n[img]whatimg/7eBn4b.png[/img]\r\n\r\n[b][url=user.php?action=search&amp;search=DixieFlatline]DixieFlatline[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Hol Baumann - Human[/b]\r\n\r\n[b]Genre:[/b] Ambient, Electronic\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=75341]torrents.php?id=75341[/url]\r\n\r\n[b]Review:[/b] [quote]The future is unwritten.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Avles]Avles[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Venetian Snares - Songs About My Cats[/b]\r\n\r\n[b]Genre:[/b] breakcore\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=39798]torrents.php?id=39798[/url]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Logos]Logos[/url]&#39; Staff Pick[/b]\r\n\r\n[b]Agent Fresco - Destrier[/b]\r\n\r\n[b]Genre:[/b] progressive.rock, alternative, art.rock, math.rock\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=73031196]torrents.php?id=73031196[/url]\r\n\r\n[b]Review:[/b] [b]newnoisemagazine.com[/b] wrote: [quote]Agent Fresco&rsquo;s sophomore release is basically the perfect progressive rock album. It has everything going for it. With a sound that&rsquo;s one part [url=artist.php?artistname=dredg]dredg[/url] (remember them?), one part [url=artist.php?artistname=Leprous]Leprous[/url], one part [url=artist.php?artistname=Fair+to+Midland]Fair to Midland[/url], and one part [url=artist.php?artistname=Muse]Muse[/url]. Put another way, Agent Fresco is bizarro version of [url=artist.php?artistname=Tool]Tool[/url] where the band grew up on [url=artist.php?artistname=Radiohead]Radiohead[/url] and [url=artist.php?artistname=Coldplay]Coldplay[/url], mixing an appreciation for art rock in all its forms with a grand sense of songwriting. This means Destrier is bombastic, powerful, and surprisingly melodic for something in the prog realm. Agent Fresco&rsquo;s sound does a phenomenal job skirting pop sensibilities with interesting musicianship, making songs like &ldquo;Dark Water&rdquo; and &ldquo;Wait For Me&rdquo; impressive and memorable.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=PepoteRouge]PepoteRouge[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Hugh Masekela - I Am Not Afraid[/b]\r\n\r\n[b]Genre:[/b] Jazz, African, Fusion\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72105749]torrents.php?id=72105749[/url]\r\n\r\n[b]Review:[/b] [quote]This album features beautiful brass, emotive storytelling and summer song grooves heavy on electric piano and percussion. The songs skip and jump through genres. If you go see Hugh Masekela live today, he will likely present you with a long and impassioned performance of Stimela, the dark accusatory closing track that would have justified this pick by itself.[/quote]\r\n\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=colibri]colibri[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Dr. Lonnie Smith - Evolution[/b]\r\n\r\n[b]Genre:[/b] jazz\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=73157882]torrents.php?id=73157882[/url]\r\n\r\n[b]Review:[/b] [quote]Since Hammond B-3 specialist Lonnie Smith left Blue Note in the &#39;70s, the largely self-taught musician has added the &quot;Dr.&quot; to his name, adopted a traditional Sikh turban as a distinctive, if enigmatic style choice (he isn&#39;t a follower of the religion), and continued to release a steady stream of highly regarded soulful well before the 21st century came around. With 2016&#39;s Evolution, Smith returns to Blue Note, his first studio album for the label since 1970&#39;s Drives. Produced by Don Was, Evolution is one of the most robust albums of his career.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=nando]nando[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Duett - Borderline[/b]\r\n\r\n[b]Genre:[/b] synthwave, electronic, chillwave\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=73036745]torrents.php?id=73036745[/url]\r\n\r\n[b]Review:[/b] [quote]no words to describe how this album took me to a journey full of happiness and sadness at once. positive vibes all along. enjoy it, and buy it if you like. because he really deserves it.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Peppermint]Peppermint[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]The Conet Project - Recordings of Shortwave Numbers Stations[/b]\r\n\r\n[b]Genre:[/b] Experimental, Field Recording, Radio, Numbers Stations\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=101427]torrents.php?id=101427[/url]\r\n\r\n[b]Review:[/b] [quote]Nine. Nine. Oxen. Eight. Five. Four. Nine. Nine. Free. Eight. Five. Four. Nine. Nine. Play. Eight. Five. Four. [/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Durio]Durio[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Various Artists - Gravikords, Whirlies &amp; Pyrophones[/b]\r\n\r\n[b]Genre:[/b] avantgarde, experimental\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=270305]torrents.php?id=270305[/url]\r\n\r\n[b]Review:[/b] [quote]&quot;How can you not love this collection of professional loonies and their fantastical noisemaking contraptions?&quot;[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Bourbon]Bourbon[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Earth - The Bees Made Honey in the Lion&#39;s Skull[/b]\r\n\r\n[b]Genre:[/b] Psychedelic, Post-Rock\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=37001]torrents.php?id=37001[/url]\r\n\r\n[b]Review:[/b] [quote]The Bees Made Honey in the Lion&#39;s Skull recounts a tale in seven parts, using cryptic titles and opuses sans words, making it slightly more accessible than Earth&#39;s early work but no less innovative. The tracks have an ancient, organic feel to them. They sound like rock music made during a prehistoric time, along with the gorgeous cover art.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Gautam]Gautam[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Black Dice - Broken Ear Record[/b]\r\n\r\n[b]Genre:[/b] experimental, noise, electronic\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=9107]torrents.php?id=9107[/url]\r\n\r\n[b]Review:[/b] [quote]&amp;Gautam | Time to find a random ass album.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=brd]brd[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Leech - If We Get There One Day, Would You Please Open The Gates?[/b]\r\n\r\n[b]Genre:[/b] post-rock\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72163291]torrents.php?id=72163291[/url]\r\n\r\n[b]Review:[/b] [quote]I might be there now, could you?\r\n\r\n[url=http://www.youtube.com/watch?v=XArNpC50Spo]Fine print note link[/url][/quote]\r\n\r\n\r\n[b][url=/user.php?id=463202]Medell&iacute;n[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Ocote Soul Sounds - Taurus[/b]\r\n\r\n[b]Genre:[/b] world.music, funk\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=71982697]torrents.php?id=71982697[/url]\r\n\r\n[b]Review:[/b] [url=http://www.austinvida.com/events/2011/album-review-taurus-by-ocote-soul-sounds/]Link[/url]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Bliss]Bliss[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Alpines - Oasis[/b]\r\n\r\n[b]Genre:[/b] indie.pop, electronic\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72729671]torrents.php?id=72729671[/url]\r\n\r\n[b]Review:[/b] [quote]Overlooked pop record of 2014.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=eXistenZ]eXistenZ[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Ned&#39;s Atomic Dustbin - God Fodder[/b]\r\n\r\n[b]Genre:[/b] alternative, indie, rock\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=91374]torrents.php?id=91374[/url]\r\n\r\n[b]Review:[/b] [quote]Frenzied, melodic rock with touches of punk/grebo.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=coriander]coriander[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Public Image Ltd. - The Flowers of Romance[/b]\r\n\r\n[b]Genre:[/b] Punk, Alternative, Experimental\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=149397]torrents.php?id=149397[/url]\r\n\r\n[b]Review:[/b] [quote]Put your sound system to the ultimate high volume test with &quot;Under the House&quot;.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=TARS]TARS[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]Lee Morgan - Cornbread[/b]\r\n\r\n[b]Genre:[/b] Jazz, Hard Bop\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=224783]torrents.php?id=224783[/url]\r\n\r\n[b]Review:[/b] [b]The Ranting Recluse[/b] wrote: [quote]So much good stuff here, it&#39;s like a Sunday dinner for the ears; there&#39;s no need for me to point out which songs are the standouts, because every track is a delight. Highly, highly recommended.[/quote]\r\n\r\n\r\n[b][url=user.php?action=search&amp;search=Hyperion]Hyperion[/url]&#39;s Staff Pick[/b]\r\n\r\n[b]David August - Times[/b]\r\n\r\n[b]Genre:[/b] Electronic, House, Downtempo, Deep House\r\n\r\n[b]Torrents:[/b] [url=/torrents.php?id=72447234]torrents.php?id=72447234[/url]\r\n\r\n[b]Review:[/b] [b]stoneyroads.com[/b] wrote: [quote]German wunderkind David August released his debut album, &quot;Times&quot;--and it&#39;s a gem. August and the album will draw the inescapable comparisons to Nicolas Jaar--but that&#39;s perhaps the biggest complement you can pay a modern, electronic artist. No matter that August is still a teenager--it&#39;s flat out brilliant effort. Yet, oddly enough, no one is talking about the album.[/quote]\r\n','2016-11-21 14:28:36'),(6,1,'Offering invites on other trackers','As of the time of this announcement, we no longer allow users to offer their invites on other private trackers. Previously, the options for prospective users interested in joining What.CD were as follows:\r\n\r\n[*]being invited by a friend on the site;[*]taking our IRC interview;[*]contacting a recruiter running one of our official recruitment threads on another private tracker;[*]contacting a user offering invites in an unofficial capacity on another private tracker\'s class-restricted forum.[/list]\r\nThe fourth option was an exception to the prohibition of \"public\" offers in Golden Rule 2.2. After a great deal of thought and discussion, we have eliminated that exception. While users offering invites on other private trackers presumably have good intentions and simply want to help our community grow, the presence of these offers introduces a number of problems to the enforcement of our rules against invite trading and selling. These problems include but are not limited to:\r\n\r\n[list][*]the widespread use of such offers as sources of invites to trade or sell;[*]the impossibility for normal users to effectively screen out harmful elements;[*]the time spent by moderators investigating and trying to confirm disabled users\' claims that they were invited after responding to such an offer, and not in a way inconsistent with our invite rules.[/list]\r\n[b]From this point forward, users should only invite people that they know and trust. Any What.CD invite offer which is not meant for a specific individual is now prohibited. Only official recruiters (selected by What.CD staff) are exempt from this rule.[/b] To reflect this, we have updated [url=/rules.php#gr2.2]Golden Rule 2.2[/url] and clarified certain other aspects of its intent:\r\n\r\n[b]old rule[/b] wrote: [quote][b]2.2. Do not trade, sell, publicly give away, or publicly offer invites.[/b]\r\nInvites should only be given to people you know and trust. There is one exception to this rule: invites may also be offered in class-restricted forums on other invitation-only private trackers where official What.CD recruitment threads don\'t already exist. Responding to public invite requests may place your account or invites privileges at risk.[/quote]\r\n[b]new rule[/b] wrote: [quote][b][url=/rules.php#gr2.2]2.2.[/url] Do not trade, sell, publicly give away, or publicly offer invites.[/b]\r\nOnly invite people you know and trust. Do not offer invites via other trackers, forums, social media, or other public locations. Responding to public invite requests is prohibited. Exception: Staff-designated recruiters may offer invites in approved locations.[/quote]\r\n\r\n[url=/forums.php?action=viewthread&threadid=210883]Discuss this post here.[/url]','2016-11-21 14:29:30');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocelot_query_times`
--

DROP TABLE IF EXISTS `ocelot_query_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocelot_query_times` (
  `buffer` enum('users','torrents','snatches','peers') NOT NULL,
  `starttime` datetime NOT NULL,
  `ocelotinstance` datetime NOT NULL,
  `querylength` int(11) NOT NULL,
  `timespent` int(11) NOT NULL,
  UNIQUE KEY `starttime` (`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocelot_query_times`
--

LOCK TABLES `ocelot_query_times` WRITE;
/*!40000 ALTER TABLE `ocelot_query_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocelot_query_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Level` int(10) unsigned NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Values` text NOT NULL,
  `DisplayStaff` enum('0','1') NOT NULL DEFAULT '0',
  `PermittedForums` varchar(150) NOT NULL DEFAULT '',
  `Secondary` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Level` (`Level`),
  KEY `DisplayStaff` (`DisplayStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,100,'User','a:7:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:14:\"site_edit_wiki\";i:1;s:19:\"torrents_add_artist\";i:1;s:11:\"MaxCollages\";s:1:\"0\";}','','',0),(3,150,'Member','a:10:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:19:\"torrents_add_artist\";i:1;s:11:\"MaxCollages\";s:1:\"1\";}','','',0),(4,200,'Power User','a:14:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:19:\"forums_polls_create\";i:1;s:14:\"zip_downloader\";i:1;s:19:\"torrents_add_artist\";i:1;s:11:\"MaxCollages\";s:1:\"5\";}','','',0),(5,250,'Elite','a:20:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_advanced_top10\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:22:\"site_can_invite_always\";i:1;s:27:\"site_send_unlimited_invites\";i:1;s:19:\"forums_polls_create\";i:1;s:15:\"site_delete_tag\";i:1;s:14:\"zip_downloader\";i:1;s:13:\"torrents_edit\";i:1;s:19:\"torrents_add_artist\";i:1;s:17:\"admin_clear_cache\";i:1;s:11:\"MaxCollages\";s:2:\"50\";}','','',0),(11,800,'Moderator','a:89:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:20:\"site_collages_delete\";i:1;s:23:\"site_collages_subscribe\";i:1;s:22:\"site_collages_personal\";i:1;s:28:\"site_collages_renamepersonal\";i:1;s:19:\"site_advanced_top10\";i:1;s:16:\"site_album_votes\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:22:\"site_can_invite_always\";i:1;s:27:\"site_send_unlimited_invites\";i:1;s:22:\"site_moderate_requests\";i:1;s:18:\"site_delete_artist\";i:1;s:19:\"forums_polls_create\";i:1;s:21:\"forums_polls_moderate\";i:1;s:20:\"site_moderate_forums\";i:1;s:17:\"site_admin_forums\";i:1;s:14:\"site_view_flow\";i:1;s:18:\"site_view_full_log\";i:1;s:28:\"site_view_torrent_snatchlist\";i:1;s:18:\"site_recommend_own\";i:1;s:27:\"site_manage_recommendations\";i:1;s:15:\"site_delete_tag\";i:1;s:23:\"site_disable_ip_history\";i:1;s:14:\"zip_downloader\";i:1;s:17:\"site_proxy_images\";i:1;s:16:\"site_search_many\";i:1;s:21:\"site_collages_recover\";i:1;s:23:\"site_forums_double_post\";i:1;s:12:\"project_team\";i:1;s:21:\"site_tag_aliases_read\";i:1;s:16:\"users_edit_ratio\";i:1;s:20:\"users_edit_own_ratio\";i:1;s:17:\"users_edit_titles\";i:1;s:18:\"users_edit_avatars\";i:1;s:18:\"users_edit_invites\";i:1;s:21:\"users_edit_reset_keys\";i:1;s:19:\"users_edit_profiles\";i:1;s:18:\"users_view_friends\";i:1;s:20:\"users_reset_own_keys\";i:1;s:19:\"users_edit_password\";i:1;s:19:\"users_promote_below\";i:1;s:16:\"users_give_donor\";i:1;s:10:\"users_warn\";i:1;s:19:\"users_disable_users\";i:1;s:19:\"users_disable_posts\";i:1;s:17:\"users_disable_any\";i:1;s:18:\"users_delete_users\";i:1;s:18:\"users_view_invites\";i:1;s:20:\"users_view_seedleech\";i:1;s:19:\"users_view_uploaded\";i:1;s:15:\"users_view_keys\";i:1;s:14:\"users_view_ips\";i:1;s:16:\"users_view_email\";i:1;s:23:\"users_override_paranoia\";i:1;s:20:\"users_make_invisible\";i:1;s:12:\"users_logout\";i:1;s:9:\"users_mod\";i:1;s:13:\"torrents_edit\";i:1;s:15:\"torrents_delete\";i:1;s:20:\"torrents_delete_fast\";i:1;s:18:\"torrents_freeleech\";i:1;s:20:\"torrents_search_fast\";i:1;s:19:\"torrents_add_artist\";i:1;s:13:\"edit_unknowns\";i:1;s:25:\"torrents_edit_vanityhouse\";i:1;s:23:\"artist_edit_vanityhouse\";i:1;s:17:\"torrents_hide_dnu\";i:1;s:19:\"torrents_fix_ghosts\";i:1;s:17:\"admin_manage_news\";i:1;s:17:\"admin_manage_blog\";i:1;s:18:\"admin_manage_polls\";i:1;s:13:\"admin_reports\";i:1;s:26:\"admin_advanced_user_search\";i:1;s:18:\"admin_create_users\";i:1;s:15:\"admin_donor_log\";i:1;s:19:\"admin_manage_ipbans\";i:1;s:9:\"admin_dnu\";i:1;s:17:\"admin_clear_cache\";i:1;s:17:\"admin_login_watch\";i:1;s:17:\"admin_manage_wiki\";i:1;s:11:\"MaxCollages\";s:3:\"100\";}','1','',0),(15,1000,'Sysop','a:101:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:20:\"site_collages_delete\";i:1;s:23:\"site_collages_subscribe\";i:1;s:22:\"site_collages_personal\";i:1;s:28:\"site_collages_renamepersonal\";i:1;s:19:\"site_advanced_top10\";i:1;s:16:\"site_album_votes\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:22:\"site_can_invite_always\";i:1;s:27:\"site_send_unlimited_invites\";i:1;s:22:\"site_moderate_requests\";i:1;s:18:\"site_delete_artist\";i:1;s:19:\"forums_polls_create\";i:1;s:21:\"forums_polls_moderate\";i:1;s:20:\"site_moderate_forums\";i:1;s:17:\"site_admin_forums\";i:1;s:14:\"site_view_flow\";i:1;s:18:\"site_view_full_log\";i:1;s:28:\"site_view_torrent_snatchlist\";i:1;s:18:\"site_recommend_own\";i:1;s:27:\"site_manage_recommendations\";i:1;s:15:\"site_delete_tag\";i:1;s:23:\"site_disable_ip_history\";i:1;s:14:\"zip_downloader\";i:1;s:10:\"site_debug\";i:1;s:17:\"site_proxy_images\";i:1;s:16:\"site_search_many\";i:1;s:21:\"site_collages_recover\";i:1;s:23:\"site_forums_double_post\";i:1;s:12:\"project_team\";i:1;s:21:\"site_tag_aliases_read\";i:1;s:20:\"users_edit_usernames\";i:1;s:16:\"users_edit_ratio\";i:1;s:20:\"users_edit_own_ratio\";i:1;s:17:\"users_edit_titles\";i:1;s:18:\"users_edit_avatars\";i:1;s:18:\"users_edit_invites\";i:1;s:22:\"users_edit_watch_hours\";i:1;s:21:\"users_edit_reset_keys\";i:1;s:19:\"users_edit_profiles\";i:1;s:18:\"users_view_friends\";i:1;s:20:\"users_reset_own_keys\";i:1;s:19:\"users_edit_password\";i:1;s:19:\"users_promote_below\";i:1;s:16:\"users_promote_to\";i:1;s:16:\"users_give_donor\";i:1;s:10:\"users_warn\";i:1;s:19:\"users_disable_users\";i:1;s:19:\"users_disable_posts\";i:1;s:17:\"users_disable_any\";i:1;s:18:\"users_delete_users\";i:1;s:18:\"users_view_invites\";i:1;s:20:\"users_view_seedleech\";i:1;s:19:\"users_view_uploaded\";i:1;s:15:\"users_view_keys\";i:1;s:14:\"users_view_ips\";i:1;s:16:\"users_view_email\";i:1;s:18:\"users_invite_notes\";i:1;s:23:\"users_override_paranoia\";i:1;s:20:\"users_make_invisible\";i:1;s:12:\"users_logout\";i:1;s:9:\"users_mod\";i:1;s:13:\"torrents_edit\";i:1;s:15:\"torrents_delete\";i:1;s:20:\"torrents_delete_fast\";i:1;s:18:\"torrents_freeleech\";i:1;s:20:\"torrents_search_fast\";i:1;s:19:\"torrents_add_artist\";i:1;s:13:\"edit_unknowns\";i:1;s:25:\"torrents_edit_vanityhouse\";i:1;s:23:\"artist_edit_vanityhouse\";i:1;s:17:\"torrents_hide_dnu\";i:1;s:19:\"torrents_fix_ghosts\";i:1;s:17:\"admin_manage_news\";i:1;s:17:\"admin_manage_blog\";i:1;s:18:\"admin_manage_polls\";i:1;s:19:\"admin_manage_forums\";i:1;s:16:\"admin_manage_fls\";i:1;s:13:\"admin_reports\";i:1;s:26:\"admin_advanced_user_search\";i:1;s:18:\"admin_create_users\";i:1;s:15:\"admin_donor_log\";i:1;s:19:\"admin_manage_ipbans\";i:1;s:9:\"admin_dnu\";i:1;s:17:\"admin_clear_cache\";i:1;s:15:\"admin_whitelist\";i:1;s:24:\"admin_manage_permissions\";i:1;s:14:\"admin_schedule\";i:1;s:17:\"admin_login_watch\";i:1;s:17:\"admin_manage_wiki\";i:1;s:18:\"admin_update_geoip\";i:1;s:11:\"MaxCollages\";s:3:\"500\";}','1','',0),(19,201,'Artist','a:9:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:18:\"site_recommend_own\";i:1;s:11:\"MaxCollages\";s:2:\"50\";}','','',0),(20,202,'Donor','a:10:{s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"forums_polls_create\";i:1;s:14:\"zip_downloader\";i:1;s:11:\"MaxCollages\";s:1:\"2\";}','','',0),(21,300,'Torrent Master','a:20:{s:10:\"site_leech\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_advanced_top10\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:22:\"site_can_invite_always\";i:1;s:27:\"site_send_unlimited_invites\";i:1;s:19:\"forums_polls_create\";i:1;s:15:\"site_delete_tag\";i:1;s:14:\"zip_downloader\";i:1;s:13:\"torrents_edit\";i:1;s:19:\"torrents_add_artist\";i:1;s:17:\"admin_clear_cache\";i:1;s:11:\"MaxCollages\";s:2:\"30\";}','','',0);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications_usage`
--

DROP TABLE IF EXISTS `push_notifications_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_notifications_usage` (
  `PushService` varchar(10) NOT NULL,
  `TimesUsed` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PushService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications_usage`
--

LOCK TABLES `push_notifications_usage` WRITE;
/*!40000 ALTER TABLE `push_notifications_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `ThingID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(30) DEFAULT NULL,
  `Comment` text,
  `ResolverID` int(10) unsigned NOT NULL DEFAULT '0',
  `Status` enum('New','InProgress','Resolved') DEFAULT 'New',
  `ResolvedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ReportedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Reason` text NOT NULL,
  `ClaimerID` int(10) unsigned NOT NULL DEFAULT '0',
  `Notes` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Status` (`Status`),
  KEY `Type` (`Type`),
  KEY `ResolvedTime` (`ResolvedTime`),
  KEY `ResolverID` (`ResolverID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,223,66,'post',NULL,1,'Resolved','2016-11-24 01:59:07','2016-11-24 01:54:43','This link is spam? The download points to a malware site presenting itself to be an Adobe Flash update. Removing the link for now.',1,'');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_email_blacklist`
--

DROP TABLE IF EXISTS `reports_email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_email_blacklist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Type` tinyint(4) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Checked` tinyint(4) NOT NULL DEFAULT '0',
  `ResolverID` int(10) DEFAULT '0',
  `Email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `Time` (`Time`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_email_blacklist`
--

LOCK TABLES `reports_email_blacklist` WRITE;
/*!40000 ALTER TABLE `reports_email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsv2`
--

DROP TABLE IF EXISTS `reportsv2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportsv2` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ReporterID` int(10) unsigned NOT NULL DEFAULT '0',
  `TorrentID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` varchar(20) DEFAULT '',
  `UserComment` text,
  `ResolverID` int(10) unsigned NOT NULL DEFAULT '0',
  `Status` enum('New','InProgress','Resolved') DEFAULT 'New',
  `ReportedTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastChangeTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModComment` text,
  `Track` text,
  `Image` text,
  `ExtraID` text,
  `Link` text,
  `LogMessage` text,
  PRIMARY KEY (`ID`),
  KEY `Status` (`Status`),
  KEY `Type` (`Type`(1)),
  KEY `LastChangeTime` (`LastChangeTime`),
  KEY `TorrentID` (`TorrentID`),
  KEY `ResolverID` (`ResolverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportsv2`
--

LOCK TABLES `reportsv2` WRITE;
/*!40000 ALTER TABLE `reportsv2` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportsv2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL,
  `LastVote` datetime DEFAULT NULL,
  `CategoryID` int(3) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Description` text NOT NULL,
  `ReleaseType` tinyint(2) DEFAULT NULL,
  `CatalogueNumber` varchar(50) NOT NULL,
  `BitrateList` varchar(255) DEFAULT NULL,
  `FormatList` varchar(255) DEFAULT NULL,
  `MediaList` varchar(255) DEFAULT NULL,
  `LogCue` varchar(20) DEFAULT NULL,
  `FillerID` int(10) unsigned NOT NULL DEFAULT '0',
  `TorrentID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeFilled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Visible` binary(1) NOT NULL DEFAULT '1',
  `RecordLabel` varchar(80) DEFAULT NULL,
  `GroupID` int(10) DEFAULT NULL,
  `OCLC` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_artists`
--

DROP TABLE IF EXISTS `requests_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests_artists` (
  `RequestID` int(10) unsigned NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `AliasID` int(10) NOT NULL,
  `Importance` enum('1','2','3','4','5','6','7') DEFAULT NULL,
  PRIMARY KEY (`RequestID`,`AliasID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests_artists`
--

LOCK TABLES `requests_artists` WRITE;
/*!40000 ALTER TABLE `requests_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_tags`
--

DROP TABLE IF EXISTS `requests_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests_tags` (
  `TagID` int(10) NOT NULL DEFAULT '0',
  `RequestID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`,`RequestID`),
  KEY `TagID` (`TagID`),
  KEY `RequestID` (`RequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests_tags`
--

LOCK TABLES `requests_tags` WRITE;
/*!40000 ALTER TABLE `requests_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_votes`
--

DROP TABLE IF EXISTS `requests_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests_votes` (
  `RequestID` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Bounty` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`RequestID`,`UserID`),
  KEY `RequestID` (`RequestID`),
  KEY `UserID` (`UserID`),
  KEY `Bounty` (`Bounty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests_votes`
--

LOCK TABLES `requests_votes` WRITE;
/*!40000 ALTER TABLE `requests_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `NextHour` int(2) NOT NULL DEFAULT '0',
  `NextDay` int(2) NOT NULL DEFAULT '0',
  `NextBiWeekly` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (0,0,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_history`
--

DROP TABLE IF EXISTS `site_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_history` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Url` varchar(255) NOT NULL DEFAULT '',
  `Category` tinyint(2) DEFAULT NULL,
  `SubCategory` tinyint(2) DEFAULT NULL,
  `Tags` mediumtext,
  `AddedBy` int(10) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Body` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_history`
--

LOCK TABLES `site_history` WRITE;
/*!40000 ALTER TABLE `site_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_options`
--

DROP TABLE IF EXISTS `site_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_options` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Value` tinytext NOT NULL,
  `Comment` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `name_index` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_options`
--

LOCK TABLES `site_options` WRITE;
/*!40000 ALTER TABLE `site_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_a`
--

DROP TABLE IF EXISTS `sphinx_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_a` (
  `gid` int(11) DEFAULT NULL,
  `aname` text,
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_a`
--

LOCK TABLES `sphinx_a` WRITE;
/*!40000 ALTER TABLE `sphinx_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_delta`
--

DROP TABLE IF EXISTS `sphinx_delta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_delta` (
  `ID` int(10) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `GroupName` varchar(255) DEFAULT NULL,
  `ArtistName` varchar(2048) DEFAULT NULL,
  `TagList` varchar(728) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `CatalogueNumber` varchar(50) DEFAULT NULL,
  `RecordLabel` varchar(50) DEFAULT NULL,
  `CategoryID` tinyint(2) DEFAULT NULL,
  `Time` int(12) DEFAULT NULL,
  `ReleaseType` tinyint(2) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL,
  `Snatched` int(10) DEFAULT NULL,
  `Seeders` int(10) DEFAULT NULL,
  `Leechers` int(10) DEFAULT NULL,
  `LogScore` int(3) DEFAULT NULL,
  `Scene` tinyint(1) NOT NULL DEFAULT '0',
  `VanityHouse` tinyint(1) NOT NULL DEFAULT '0',
  `HasLog` tinyint(1) DEFAULT NULL,
  `HasCue` tinyint(1) DEFAULT NULL,
  `FreeTorrent` tinyint(1) DEFAULT NULL,
  `Media` varchar(255) DEFAULT NULL,
  `Format` varchar(255) DEFAULT NULL,
  `Encoding` varchar(255) DEFAULT NULL,
  `RemasterYear` varchar(50) NOT NULL DEFAULT '',
  `RemasterTitle` varchar(512) DEFAULT NULL,
  `RemasterRecordLabel` varchar(50) DEFAULT NULL,
  `RemasterCatalogueNumber` varchar(50) DEFAULT NULL,
  `FileList` mediumtext,
  `Description` text,
  `VoteScore` float NOT NULL DEFAULT '0',
  `LastChanged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Size` (`Size`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_delta`
--

LOCK TABLES `sphinx_delta` WRITE;
/*!40000 ALTER TABLE `sphinx_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_hash`
--

DROP TABLE IF EXISTS `sphinx_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_hash` (
  `ID` int(10) NOT NULL,
  `GroupName` varchar(255) DEFAULT NULL,
  `ArtistName` varchar(2048) DEFAULT NULL,
  `TagList` varchar(728) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `CatalogueNumber` varchar(50) DEFAULT NULL,
  `RecordLabel` varchar(50) DEFAULT NULL,
  `CategoryID` tinyint(2) DEFAULT NULL,
  `Time` int(12) DEFAULT NULL,
  `ReleaseType` tinyint(2) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL,
  `Snatched` int(10) DEFAULT NULL,
  `Seeders` int(10) DEFAULT NULL,
  `Leechers` int(10) DEFAULT NULL,
  `LogScore` int(3) DEFAULT NULL,
  `Scene` tinyint(1) NOT NULL DEFAULT '0',
  `VanityHouse` tinyint(1) NOT NULL DEFAULT '0',
  `HasLog` tinyint(1) DEFAULT NULL,
  `HasCue` tinyint(1) DEFAULT NULL,
  `FreeTorrent` tinyint(1) DEFAULT NULL,
  `Media` varchar(255) DEFAULT NULL,
  `Format` varchar(255) DEFAULT NULL,
  `Encoding` varchar(255) DEFAULT NULL,
  `RemasterYear` int(4) DEFAULT NULL,
  `RemasterTitle` varchar(512) DEFAULT NULL,
  `RemasterRecordLabel` varchar(50) DEFAULT NULL,
  `RemasterCatalogueNumber` varchar(50) DEFAULT NULL,
  `FileList` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_hash`
--

LOCK TABLES `sphinx_hash` WRITE;
/*!40000 ALTER TABLE `sphinx_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_index_last_pos`
--

DROP TABLE IF EXISTS `sphinx_index_last_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_index_last_pos` (
  `Type` varchar(16) NOT NULL DEFAULT '',
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_index_last_pos`
--

LOCK TABLES `sphinx_index_last_pos` WRITE;
/*!40000 ALTER TABLE `sphinx_index_last_pos` DISABLE KEYS */;
INSERT INTO `sphinx_index_last_pos` VALUES ('log',3),('requests',1479945901),('torrents',1479945901);
/*!40000 ALTER TABLE `sphinx_index_last_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_requests`
--

DROP TABLE IF EXISTS `sphinx_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_requests` (
  `ID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeAdded` int(12) unsigned NOT NULL,
  `LastVote` int(12) unsigned NOT NULL,
  `CategoryID` int(3) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `ArtistList` varchar(2048) DEFAULT NULL,
  `ReleaseType` tinyint(2) DEFAULT NULL,
  `CatalogueNumber` varchar(50) NOT NULL,
  `BitrateList` varchar(255) DEFAULT NULL,
  `FormatList` varchar(255) DEFAULT NULL,
  `MediaList` varchar(255) DEFAULT NULL,
  `LogCue` varchar(20) DEFAULT NULL,
  `FillerID` int(10) unsigned NOT NULL DEFAULT '0',
  `TorrentID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeFilled` int(12) unsigned NOT NULL,
  `Visible` binary(1) NOT NULL DEFAULT '1',
  `Bounty` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Votes` int(10) unsigned NOT NULL DEFAULT '0',
  `RecordLabel` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_requests`
--

LOCK TABLES `sphinx_requests` WRITE;
/*!40000 ALTER TABLE `sphinx_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_requests_delta`
--

DROP TABLE IF EXISTS `sphinx_requests_delta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_requests_delta` (
  `ID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeAdded` int(12) unsigned DEFAULT NULL,
  `LastVote` int(12) unsigned DEFAULT NULL,
  `CategoryID` tinyint(4) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TagList` varchar(728) NOT NULL DEFAULT '',
  `Year` int(4) DEFAULT NULL,
  `ArtistList` varchar(2048) DEFAULT NULL,
  `ReleaseType` tinyint(2) DEFAULT NULL,
  `CatalogueNumber` varchar(50) DEFAULT NULL,
  `BitrateList` varchar(255) DEFAULT NULL,
  `FormatList` varchar(255) DEFAULT NULL,
  `MediaList` varchar(255) DEFAULT NULL,
  `LogCue` varchar(20) DEFAULT NULL,
  `FillerID` int(10) unsigned NOT NULL DEFAULT '0',
  `TorrentID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeFilled` int(12) unsigned DEFAULT NULL,
  `Visible` binary(1) NOT NULL DEFAULT '1',
  `Bounty` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Votes` int(10) unsigned NOT NULL DEFAULT '0',
  `RecordLabel` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_requests_delta`
--

LOCK TABLES `sphinx_requests_delta` WRITE;
/*!40000 ALTER TABLE `sphinx_requests_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_requests_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_t`
--

DROP TABLE IF EXISTS `sphinx_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_t` (
  `id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `size` bigint(20) NOT NULL,
  `snatched` int(11) NOT NULL,
  `seeders` int(11) NOT NULL,
  `leechers` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `logscore` smallint(6) NOT NULL,
  `scene` tinyint(4) NOT NULL,
  `haslog` tinyint(4) NOT NULL,
  `hascue` tinyint(4) NOT NULL,
  `freetorrent` tinyint(4) NOT NULL,
  `media` varchar(15) NOT NULL,
  `format` varchar(15) NOT NULL,
  `encoding` varchar(30) NOT NULL,
  `remyear` smallint(6) NOT NULL,
  `remtitle` varchar(80) NOT NULL,
  `remrlabel` varchar(80) NOT NULL,
  `remcnumber` varchar(80) NOT NULL,
  `filelist` mediumtext,
  `remident` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `gid_remident` (`gid`,`remident`),
  KEY `format` (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_t`
--

LOCK TABLES `sphinx_t` WRITE;
/*!40000 ALTER TABLE `sphinx_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_tg`
--

DROP TABLE IF EXISTS `sphinx_tg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sphinx_tg` (
  `id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `rlabel` varchar(80) DEFAULT NULL,
  `cnumber` varchar(80) DEFAULT NULL,
  `catid` smallint(6) DEFAULT NULL,
  `reltype` smallint(6) DEFAULT NULL,
  `vanityhouse` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sphinx_tg`
--

LOCK TABLES `sphinx_tg` WRITE;
/*!40000 ALTER TABLE `sphinx_tg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_tg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_blog`
--

DROP TABLE IF EXISTS `staff_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_blog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_blog`
--

LOCK TABLES `staff_blog` WRITE;
/*!40000 ALTER TABLE `staff_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_blog_visits`
--

DROP TABLE IF EXISTS `staff_blog_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_blog_visits` (
  `UserID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `UserID` (`UserID`),
  CONSTRAINT `staff_blog_visits_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users_main` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_blog_visits`
--

LOCK TABLES `staff_blog_visits` WRITE;
/*!40000 ALTER TABLE `staff_blog_visits` DISABLE KEYS */;
INSERT INTO `staff_blog_visits` VALUES (1,'2016-11-20 21:18:51');
/*!40000 ALTER TABLE `staff_blog_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `styles_backup`
--

DROP TABLE IF EXISTS `styles_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles_backup` (
  `UserID` int(10) NOT NULL DEFAULT '0',
  `StyleID` int(10) DEFAULT NULL,
  `StyleURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `StyleURL` (`StyleURL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styles_backup`
--

LOCK TABLES `styles_backup` WRITE;
/*!40000 ALTER TABLE `styles_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `styles_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylesheets`
--

DROP TABLE IF EXISTS `stylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stylesheets` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Default` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stylesheets`
--

LOCK TABLES `stylesheets` WRITE;
/*!40000 ALTER TABLE `stylesheets` DISABLE KEYS */;
INSERT INTO `stylesheets` VALUES (2,'Layer cake','Grey stylesheet by Emm','0'),(9,'Proton','Proton by Protiek','0'),(21,'postmod','Upgrade on anorex','1');
/*!40000 ALTER TABLE `stylesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_aliases`
--

DROP TABLE IF EXISTS `tag_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_aliases` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `BadTag` varchar(30) DEFAULT NULL,
  `AliasTag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BadTag` (`BadTag`),
  KEY `AliasTag` (`AliasTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_aliases`
--

LOCK TABLES `tag_aliases` WRITE;
/*!40000 ALTER TABLE `tag_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `TagType` enum('genre','other') NOT NULL DEFAULT 'other',
  `Uses` int(12) NOT NULL DEFAULT '1',
  `UserID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_2` (`Name`),
  KEY `TagType` (`TagType`),
  KEY `Uses` (`Uses`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'rock','genre',0,1),(2,'pop','genre',0,1),(3,'female.fronted.symphonic.death.metal','genre',0,1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top10_history`
--

DROP TABLE IF EXISTS `top10_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top10_history` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Type` enum('Daily','Weekly') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top10_history`
--

LOCK TABLES `top10_history` WRITE;
/*!40000 ALTER TABLE `top10_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `top10_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top10_history_torrents`
--

DROP TABLE IF EXISTS `top10_history_torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top10_history_torrents` (
  `HistoryID` int(10) NOT NULL DEFAULT '0',
  `Rank` tinyint(2) NOT NULL DEFAULT '0',
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `TitleString` varchar(150) NOT NULL DEFAULT '',
  `TagString` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top10_history_torrents`
--

LOCK TABLES `top10_history_torrents` WRITE;
/*!40000 ALTER TABLE `top10_history_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `top10_history_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents`
--

DROP TABLE IF EXISTS `torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Media` varchar(20) DEFAULT NULL,
  `Format` varchar(10) DEFAULT NULL,
  `Encoding` varchar(15) DEFAULT NULL,
  `Remastered` enum('0','1') NOT NULL DEFAULT '0',
  `RemasterYear` int(4) DEFAULT NULL,
  `RemasterTitle` varchar(80) NOT NULL DEFAULT '',
  `RemasterCatalogueNumber` varchar(80) NOT NULL DEFAULT '',
  `RemasterRecordLabel` varchar(80) NOT NULL DEFAULT '',
  `Scene` enum('0','1') NOT NULL DEFAULT '0',
  `HasLog` enum('0','1') NOT NULL DEFAULT '0',
  `HasCue` enum('0','1') NOT NULL DEFAULT '0',
  `LogScore` int(6) NOT NULL DEFAULT '0',
  `info_hash` blob NOT NULL,
  `FileCount` int(6) NOT NULL,
  `FileList` mediumtext NOT NULL,
  `FilePath` varchar(255) NOT NULL DEFAULT '',
  `Size` bigint(12) NOT NULL,
  `Leechers` int(6) NOT NULL DEFAULT '0',
  `Seeders` int(6) NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FreeTorrent` enum('0','1','2') NOT NULL DEFAULT '0',
  `FreeLeechType` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Description` text,
  `Snatched` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `LastReseedRequest` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TranscodedFrom` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `InfoHash` (`info_hash`(40)),
  KEY `GroupID` (`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `Media` (`Media`),
  KEY `Format` (`Format`),
  KEY `Encoding` (`Encoding`),
  KEY `Year` (`RemasterYear`),
  KEY `FileCount` (`FileCount`),
  KEY `Size` (`Size`),
  KEY `Seeders` (`Seeders`),
  KEY `Leechers` (`Leechers`),
  KEY `Snatched` (`Snatched`),
  KEY `last_action` (`last_action`),
  KEY `Time` (`Time`),
  KEY `FreeTorrent` (`FreeTorrent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents`
--

LOCK TABLES `torrents` WRITE;
/*!40000 ALTER TABLE `torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_artists`
--

DROP TABLE IF EXISTS `torrents_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_artists` (
  `GroupID` int(10) NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `AliasID` int(10) NOT NULL,
  `UserID` int(10) unsigned NOT NULL DEFAULT '0',
  `Importance` enum('1','2','3','4','5','6','7') NOT NULL DEFAULT '1',
  PRIMARY KEY (`GroupID`,`ArtistID`,`Importance`),
  KEY `ArtistID` (`ArtistID`),
  KEY `AliasID` (`AliasID`),
  KEY `Importance` (`Importance`),
  KEY `GroupID` (`GroupID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_artists`
--

LOCK TABLES `torrents_artists` WRITE;
/*!40000 ALTER TABLE `torrents_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_bad_files`
--

DROP TABLE IF EXISTS `torrents_bad_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_bad_files` (
  `TorrentID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_bad_files`
--

LOCK TABLES `torrents_bad_files` WRITE;
/*!40000 ALTER TABLE `torrents_bad_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_bad_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_bad_folders`
--

DROP TABLE IF EXISTS `torrents_bad_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_bad_folders` (
  `TorrentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TimeAdded` datetime NOT NULL,
  PRIMARY KEY (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_bad_folders`
--

LOCK TABLES `torrents_bad_folders` WRITE;
/*!40000 ALTER TABLE `torrents_bad_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_bad_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_bad_tags`
--

DROP TABLE IF EXISTS `torrents_bad_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_bad_tags` (
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `TimeAdded` (`TimeAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_bad_tags`
--

LOCK TABLES `torrents_bad_tags` WRITE;
/*!40000 ALTER TABLE `torrents_bad_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_bad_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_balance_history`
--

DROP TABLE IF EXISTS `torrents_balance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_balance_history` (
  `TorrentID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `balance` bigint(20) NOT NULL,
  `Time` datetime NOT NULL,
  `Last` enum('0','1','2') DEFAULT '0',
  UNIQUE KEY `TorrentID_2` (`TorrentID`,`Time`),
  UNIQUE KEY `TorrentID_3` (`TorrentID`,`balance`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_balance_history`
--

LOCK TABLES `torrents_balance_history` WRITE;
/*!40000 ALTER TABLE `torrents_balance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_balance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_cassette_approved`
--

DROP TABLE IF EXISTS `torrents_cassette_approved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_cassette_approved` (
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `TimeAdded` (`TimeAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_cassette_approved`
--

LOCK TABLES `torrents_cassette_approved` WRITE;
/*!40000 ALTER TABLE `torrents_cassette_approved` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_cassette_approved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_files`
--

DROP TABLE IF EXISTS `torrents_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_files` (
  `TorrentID` int(10) NOT NULL,
  `File` mediumblob NOT NULL,
  PRIMARY KEY (`TorrentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_files`
--

LOCK TABLES `torrents_files` WRITE;
/*!40000 ALTER TABLE `torrents_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_group`
--

DROP TABLE IF EXISTS `torrents_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_group` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtistID` int(10) DEFAULT NULL,
  `CategoryID` int(3) DEFAULT NULL,
  `Name` varchar(300) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `CatalogueNumber` varchar(80) NOT NULL DEFAULT '',
  `RecordLabel` varchar(80) NOT NULL DEFAULT '',
  `ReleaseType` tinyint(2) DEFAULT '21',
  `TagList` varchar(500) NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `RevisionID` int(12) DEFAULT NULL,
  `WikiBody` text NOT NULL,
  `WikiImage` varchar(255) NOT NULL,
  `VanityHouse` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `Name` (`Name`(255)),
  KEY `Year` (`Year`),
  KEY `Time` (`Time`),
  KEY `RevisionID` (`RevisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_group`
--

LOCK TABLES `torrents_group` WRITE;
/*!40000 ALTER TABLE `torrents_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_logs_new`
--

DROP TABLE IF EXISTS `torrents_logs_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_logs_new` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `Log` mediumtext NOT NULL,
  `Details` mediumtext NOT NULL,
  `Score` int(3) NOT NULL,
  `Revision` int(3) NOT NULL,
  `Adjusted` enum('1','0') NOT NULL DEFAULT '0',
  `AdjustedBy` int(10) NOT NULL DEFAULT '0',
  `NotEnglish` enum('1','0') NOT NULL DEFAULT '0',
  `AdjustmentReason` text,
  PRIMARY KEY (`LogID`),
  KEY `TorrentID` (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_logs_new`
--

LOCK TABLES `torrents_logs_new` WRITE;
/*!40000 ALTER TABLE `torrents_logs_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_logs_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_lossymaster_approved`
--

DROP TABLE IF EXISTS `torrents_lossymaster_approved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_lossymaster_approved` (
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `TimeAdded` (`TimeAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_lossymaster_approved`
--

LOCK TABLES `torrents_lossymaster_approved` WRITE;
/*!40000 ALTER TABLE `torrents_lossymaster_approved` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_lossymaster_approved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_lossyweb_approved`
--

DROP TABLE IF EXISTS `torrents_lossyweb_approved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_lossyweb_approved` (
  `TorrentID` int(10) NOT NULL DEFAULT '0',
  `UserID` int(10) NOT NULL DEFAULT '0',
  `TimeAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `TimeAdded` (`TimeAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_lossyweb_approved`
--

LOCK TABLES `torrents_lossyweb_approved` WRITE;
/*!40000 ALTER TABLE `torrents_lossyweb_approved` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_lossyweb_approved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_peerlists`
--

DROP TABLE IF EXISTS `torrents_peerlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_peerlists` (
  `TorrentID` int(11) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `Seeders` int(11) DEFAULT NULL,
  `Leechers` int(11) DEFAULT NULL,
  `Snatches` int(11) DEFAULT NULL,
  PRIMARY KEY (`TorrentID`),
  KEY `GroupID` (`GroupID`),
  KEY `Stats` (`TorrentID`,`Seeders`,`Leechers`,`Snatches`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_peerlists`
--

LOCK TABLES `torrents_peerlists` WRITE;
/*!40000 ALTER TABLE `torrents_peerlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_peerlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_peerlists_compare`
--

DROP TABLE IF EXISTS `torrents_peerlists_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_peerlists_compare` (
  `TorrentID` int(11) NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `Seeders` int(11) DEFAULT NULL,
  `Leechers` int(11) DEFAULT NULL,
  `Snatches` int(11) DEFAULT NULL,
  PRIMARY KEY (`TorrentID`),
  KEY `GroupID` (`GroupID`),
  KEY `Stats` (`TorrentID`,`Seeders`,`Leechers`,`Snatches`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_peerlists_compare`
--

LOCK TABLES `torrents_peerlists_compare` WRITE;
/*!40000 ALTER TABLE `torrents_peerlists_compare` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_peerlists_compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_recommended`
--

DROP TABLE IF EXISTS `torrents_recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_recommended` (
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`GroupID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_recommended`
--

LOCK TABLES `torrents_recommended` WRITE;
/*!40000 ALTER TABLE `torrents_recommended` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_tags`
--

DROP TABLE IF EXISTS `torrents_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_tags` (
  `TagID` int(10) NOT NULL DEFAULT '0',
  `GroupID` int(10) NOT NULL DEFAULT '0',
  `PositiveVotes` int(6) NOT NULL DEFAULT '1',
  `NegativeVotes` int(6) NOT NULL DEFAULT '1',
  `UserID` int(10) DEFAULT NULL,
  PRIMARY KEY (`TagID`,`GroupID`),
  KEY `TagID` (`TagID`),
  KEY `GroupID` (`GroupID`),
  KEY `PositiveVotes` (`PositiveVotes`),
  KEY `NegativeVotes` (`NegativeVotes`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_tags`
--

LOCK TABLES `torrents_tags` WRITE;
/*!40000 ALTER TABLE `torrents_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_tags_votes`
--

DROP TABLE IF EXISTS `torrents_tags_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_tags_votes` (
  `GroupID` int(10) NOT NULL,
  `TagID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Way` enum('up','down') NOT NULL DEFAULT 'up',
  PRIMARY KEY (`GroupID`,`TagID`,`UserID`,`Way`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_tags_votes`
--

LOCK TABLES `torrents_tags_votes` WRITE;
/*!40000 ALTER TABLE `torrents_tags_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_tags_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_votes`
--

DROP TABLE IF EXISTS `torrents_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrents_votes` (
  `GroupID` int(10) NOT NULL,
  `Ups` int(10) unsigned NOT NULL DEFAULT '0',
  `Total` int(10) unsigned NOT NULL DEFAULT '0',
  `Score` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`GroupID`),
  KEY `Score` (`Score`),
  CONSTRAINT `torrents_votes_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `torrents_group` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrents_votes`
--

LOCK TABLES `torrents_votes` WRITE;
/*!40000 ALTER TABLE `torrents_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_contest`
--

DROP TABLE IF EXISTS `upload_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_contest` (
  `TorrentID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`TorrentID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `upload_contest_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users_main` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_contest`
--

LOCK TABLES `upload_contest` WRITE;
/*!40000 ALTER TABLE `upload_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_aliases`
--

DROP TABLE IF EXISTS `wiki_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_aliases` (
  `Alias` varchar(50) NOT NULL,
  `UserID` int(10) NOT NULL,
  `ArticleID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_aliases`
--

LOCK TABLES `wiki_aliases` WRITE;
/*!40000 ALTER TABLE `wiki_aliases` DISABLE KEYS */;
INSERT INTO `wiki_aliases` VALUES ('eacrippingwithexactaudiocopyfrombaconbits',0,2),('eacsetupguide',0,3),('userclasses',0,5),('wiki',1,1),('xldguide',0,4);
/*!40000 ALTER TABLE `wiki_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articles`
--

DROP TABLE IF EXISTS `wiki_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articles` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Revision` int(10) NOT NULL DEFAULT '1',
  `Title` varchar(100) DEFAULT NULL,
  `Body` mediumtext,
  `MinClassRead` int(4) DEFAULT NULL,
  `MinClassEdit` int(4) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Author` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articles`
--

LOCK TABLES `wiki_articles` WRITE;
/*!40000 ALTER TABLE `wiki_articles` DISABLE KEYS */;
INSERT INTO `wiki_articles` VALUES (1,1,'Wiki','Welcome to your new wiki! Hope this works.',100,475,'2016-11-20 17:39:47',1),(2,2,'EAC - Ripping with Exact Audio Copy [FROM baconBits]','[I]This article lifted directly from the What.CD wiki. Guide written by caaok.\r\nI\'d like to thank the What.CD Delta Team for helping with comments and critique, and I\'d especially like to single out PunkMeUp for his contributions.[/I]\r\n\r\nThis guide was made for EAC version 1.0 beta 2 and will not completely work with earlier versions. Versions 0.99 or earlier should use the blowfish guide.\r\n\r\nAnything with a green outline around it is a required setting. Anything orange is required but depends on your drive. Anything unmarked is optional.\r\n\r\nThis is meant to be a no-frills guide with little extra info. A more comprehensive (but outdated) guide can be found here:\r\nhttp://www.afterdawn.com/guides/archive/rip_cds_with_exact_audio_copy.cfm\r\n\r\n[size=3][b]Step 1: Tagging[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/yyBqv.png[/IMG]\r\n\r\nSo now let\'s look at the main window. Be sure everything is named correctly here, as these will be the tags on your ripped files. If you\'re ripping a classical CD, you may wish to fill in the Composer/Performer fields. Also note: the Comment field doesn\'t currently work.\r\n\r\nDrag a cover image into the EAC window. I think ~500x500 is a decent size in most cases. Google images is your friend here.\r\n\r\nIf you\'re ripping a box set, you may wish to use the options under the cover image, otherwise leave them all as \"1\".\r\n\r\nFinally, if you want to add lyrics to the tracks, use the \"Lyrics\" button.\r\n\r\nNote: I\'ve also highlighted the \"New\" button where you can save your settings. This is not a necessary step each time you rip.\r\n\r\n[size=3][b]Step 2: Gap Detection and Cuesheets[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/aniNG.png[/IMG]\r\n\r\nThe pre-rip stuff happens here. Make sure \"Append Gaps to Previous Track (default)\" is checked. It should be. Next, hit the options in the order shown.\r\n\r\nFirst, hit \"Detect Gaps\". This is very important, your rip will fail the logchecker if you do not complete this step. If the first track is highlighted in red, you have a hidden track. You\'ll want to look at this section of the [URL=http://blowfish.be/]blowfish.be[/URL] guide.\r\n\r\nNext, go to Create CUE Sheet -> Multiple WAV Files With Gaps... (Noncompliant). This is usually where I create the folder for ripping as well. Do NOT rip your tracks to any directory containing your name. You should NEVER edit a log for any reason, especially now that we have checksums. A simple C:\\EAC Rips is fine.\r\n\r\nI name my directories as follows:\r\nArtist - Album (Year) [Format] {Extra}\r\n\r\nSo for example, with the album in the screenshots, it\'d be\r\n\r\nSam Roberts Band - Collider (2011) [FLAC] {UMC 0252764577}\r\n\r\nHowever, as long as it contains the album name and no nested folders (don\'t do \\Artist\\Album\\), you\'re fine by the rules here.\r\n\r\nAnyway, make the folder, save the .cue file into it. I usually just name mine Noncompliant.cue, it doesn\'t really matter.\r\n\r\n[size=3][b]Step 3: Ripping[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/Onfxp.png[/IMG]\r\n\r\nFinally, the rip itself! Make sure all the tracks are checkmarked in the main window unless there are some you don\'t want to rip.\r\n\r\nTest & Copy -> Compressed.\r\n\r\nDepending on your drive and whether or not the CD is scratched, this could take anywhere from ten minutes to four hours. Be patient.\r\n\r\n[size=3][b]Step 4: Post-Rip[/b][/size]\r\n\r\nSo you\'re done! You may wish to use logchecker.php to check and make sure your rip is proper, but if you followed this guide, the only possible errors would be with the CD itself. It does happen... some CDs are too badly damaged, even for EAC. Your best bet is to clean the CD and try again.\r\n\r\nOther than that, it never hurts to make sure your files are tagged and named properly (though they should be). Any extra stuff you want to include should be added now as well... Additional artwork, an md5 fingerprint, an info.txt file, that sort of thing. If you don\'t want to do any of that, it\'s time to find yourself an uploading guide!',100,800,'2016-11-20 23:05:29',1),(3,3,'EAC Setup Guide','[b][align=center]EAC 1.0 Setup Guide[/b]\r\n\r\nDownload link: http://www.exactaudiocopy.de/en/index.php/resources/download/\r\nCurrent version as of this guide: EAC 1.0 Beta 3.\r\n[color=#ff0000]This guide was made for EAC version 1.0 beta 3 and will not completely work with earlier versions (which are not recommended any longer). Versions 0.99 or earlier should use the EAC 0.99 guide. [/color]\r\n\r\nAnything with a green outline around it is a required setting. Anything orange is required but depends on your drive. Anything unmarked is optional. This is meant to be a no-frills guide with little extra info. The old EAC 0.99 guide is more comprehensive (but outdated as far as settings go since there are new features in EAC 1.0) - visit it if you run into problems, the background information is basically still correct.\r\n\r\n[b]Step 1: Download and install EAC[/b]\r\n\r\nDownload the installer and fire it up.\r\n\r\n[img]https://web.archive.org/web/20140714023611im_/http://blowfish.be/eac/Caaok/Images/eac01.png[/img]\r\n\r\nEventually you\'ll get to a screen like this. Make sure you install AccurateRip, CDRDAO, CTDB and freedb as a bare minimum. FLAC will be useful as well if you don\'t have it separately installed. GD3 is only useful if you want to pay for metadata results. I assume you don\'t. \r\nNote: The above screenshot is from Beta 3. The new Beta 3 adds the option to include the CueTools Database Plugin. It is recommended to install it but not required. Full details for installation of the plugin on older versions is located in the appendix at the end of this guide.\r\n\r\n[b]Step 2: Start EAC[/b]\r\n\r\n[img]https://web.archive.org/web/20140714033449im_/http://blowfish.be/eac/Caaok/Images/eac02.png[/img]\r\n\r\nWhen you first start EAC, you\'ll see a screen like this one. Hit \"Cancel\". Next, put a popular CD into your drive, preferably not one that was recently released (a few months old at least). You\'ll see a window like the one below appear. If you have an older version of EAC or dBpoweramp installed, it\'s likely AccurateRip was already configured, and this may not appear. You may need to try multiple CDs to get this to show up.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714084437im_/http://blowfish.be/eac/Caaok/Images/eac03.png[/img]\r\n\r\n\r\nHit Configure. It may take a few minutes. Hit \"Ok\" afterward. This is a necessary step, make sure you try several CDs.\r\n\r\n[b]Step 3: EAC Options[/b]\r\n\r\nAll of the options dialogs can be found from the EAC menu at the top of the screen.\r\n\r\n[img]https://web.archive.org/web/20140714031903im_/http://blowfish.be/eac/Caaok/Images/eac04.png[/img]\r\n\r\nStart with EAC Options. Any tabs not pictured are completely optional settings, or are irrelevant to ripping.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714024410im_/http://blowfish.be/eac/Caaok/Images/eac07.png[/img]\r\n\r\nIf your drive is capable of reading UPC/ISRC codes and CD-Text (you can only really figure this out by trial and error), you\'re welcome to keep the top two options checked. Otherwise, uncheck them.\r\n\r\nOther than that, these settings are pretty much ideal. I wouldn\'t recommend using more than 1 compressor thread even if you have a multicore computer. It doesn\'t take very long compared to the track extraction anyway. Note that in tests run by punkmeup, disabling the queue of external compressors in the background fixed an issue where EAC was generating WAV files instead of FLAC, so I\'ve made that a required option. It should have no bearing on the rip quality. If rip queueing works for you (it does for me), feel free to leave it enabled.\r\n\r\n[b]Note that m3u file creation is technically optional, however, some users use these files to manage their libraries. [/b]\r\n\r\n[img]https://web.archive.org/web/20140714035652im_/http://blowfish.be/eac/Caaok/Images/eac05.png[/img]\r\n\r\nMake sure you set the green highlighted settings as shown. If you\'re using an older version of EAC, make sure \"No use of null samples for CRC calculations is [b]UNCHECKED[/b]. The rest is optional, choose as you will. Locking the drive tray during extraction isn\'t a bad idea though.\r\n\r\n[img]https://web.archive.org/web/20140714023148im_/http://blowfish.be/eac/Caaok/Images/eac06.png[/img]\r\n\r\nThese settings are pretty much all optional and self explanatory. I\'d recommend using Alternate CD play routines and disabling autostart though.\r\n\r\nThe \"Show status dialog after extraction\" option setting has been problematic for some users. This displays the log after the rip is done, and offers you the option to save the log file. If you follow this guide, EAC will do this automatically. Do NOT hit \"Save Log\". As such I\'ve disabled the setting here. Only turn it on if you know what you\'re doing.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714030229im_/http://blowfish.be/eac/Caaok/Images/eac08.png[/img]\r\n\r\nFriends don\'t let friends normalize their EAC rips. Don\'t ever do it. The rip will no longer be a true \"exact copy\" of the CD.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714023544im_/http://blowfish.be/eac/Caaok/Images/eac09.png[/img]\r\n\r\nAs shown in the screenshot above here is the proper way to name tracks.\r\n\r\n[b]Naming Convention[/b] : %tracknr2% - %title%\r\n\r\nCheck [b]\'Use Various Artists Naming Scheme\'[/b] and use : %tracknr2% - %artist% - %title%\r\n\r\n\r\nThe only difference acceptable here would be perhaps [b]%tracknr2%. %title%[/b] if you prefer periods instead of dashes in the filenames. If you need track numbers to go into triple digits for some reason, use %tracknr3% instead.\r\n\r\nDon\'t replace spaces by underscores. It looks ridiculous.\r\n\r\n[b]A note on directory naming schemes and cuesheets:[/b]: Don\'t use a directory structure in your EAC filename options, unless you want to go back and edit your [b]CUE sheet[/b] later. When you add a directory to the naming scheme, it\'ll put that directory path into the files. When, at a later date when you may have moved the files, you want to burn the files in EAC using your cuesheet, you\'ll be unable to do so. If you do insist on using a directory structure here, you need to go back, edit the [b]CUE sheet[/b] in a program such as notepad, and remove the folder name from each line.\r\n\r\nFor example, a cuesheet line should look like this:\r\n\r\nFILE \"01 Last Known Surroundings.wav\" WAVE\r\n\r\nNot like this: \r\n\r\nFILE \"C:\\EAC Rips\\Explosions in the Sky - Take Care, Take Care, Take Care (2011) [FLAC]\\01 Last Known Surroundings.wav\" WAVE\r\n\r\nIf you insist on doing this, the scheme might look something like this:\r\n[b]%artist% - %albumtitle% (%year%) [FLAC]\\%tracknr2% - %title%[/b]\r\n\r\nFollow the listed items on the Filename tab if you prefer a different scheme.\r\n\r\n[b]Step 4: Drive Options[/b]\r\n\r\n[img]https://web.archive.org/web/20140714034919im_/http://blowfish.be/eac/Caaok/Images/eac10.png[/img]\r\n\r\nStart by hitting \"Detect Read Features...\". This will actually take a few minutes. The only feature detection that actually matters is Accurate Stream. If your drive can use it, checkmark the setting (most modern drives have Accurate Stream). If it can\'t, don\'t.\r\n\r\nEven if your drive doesn\'t cache audio, it will not harm the rip quality to leave that checked. The rips take a bit longer with that setting enabled, though. Go watch TV or something while you wait.\r\n\r\nDo not use C2, even if EAC thinks you can. Most drives have terrible C2 error implementation.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714032740im_/http://blowfish.be/eac/Caaok/Images/eac11.png[/img]\r\n\r\nHit \"Autodetect read command now\". It shouldn\'t take long. Leave everything else unchecked unless you\'re having problems. You can checkmark \"CD-Text Read capable drive\" if you want to test whether your drive can do it. If it can, great, otherwise, uncheck it. It\'s unlikely you\'ll ever use that feature anyway.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714025157im_/http://blowfish.be/eac/Caaok/Images/eac12.png[/img]\r\n\r\nIf you did the AccurateRip configuration at the start of this guide, the top half here will be greyed out. If not, you\'ll need to find your read offset correction from this list. Don\'t use a combined read/write offset. AccurateRip is a very useful function for checking that your rips are OK, so you should go back and try to get it configured if this option isn\'t greyed out.\r\n\r\nIf you want to figure out whether your drive needs \"Overread into Lead-in and Lead-Out\" checked, you can check by temporarily unchecking \"Use AccurateRip with this drive\". Stick a CD in the drive and hit \"Detect read sample offset correction...\". If you\'re just doing this for the Overread, see below:\r\n\r\n[img]https://web.archive.org/web/20140714023814im_/http://blowfish.be/eac/Caaok/Images/obrvpi.png[/img]\r\n\r\nxuncat\'s EAC 0.99 guide says:\r\n\r\nCheck \"Overread Lead-In and Lead-Out\" only if the test result says that your drive can overread from both the Lead-In and Lead-Out, or if it says Lead-Out and your offset correction is positive ,or if it says Lead-In and your offset correction is negative. Otherwise disable (uncheck) it.\r\n\r\n[b]Remember to check \"Use AccurateRip with this drive\" again once you\'re finished.[/b]\r\n\r\n\r\n[img]https://web.archive.org/web/20140714022340im_/http://blowfish.be/eac/Caaok/Images/eac13.png[/img]\r\n\r\nPretty much every drive should work with the settings shown. If yours stalls on detecting gaps or detects gaps that are obviously wrong (like 30 second gaps on a non-live album), try Detection method B or C. If A, B, and C all fail, you can switch \"Secure\" to \"Accurate\" and try again.\r\n\r\n[b]Step 5: Metadata Options[/b]\r\n\r\n[img]https://web.archive.org/web/20140714024249im_/http://blowfish.be/eac/Caaok/Images/eac14.png[/img]\r\n\r\nHere\'s where you pick your metadata provider. If you did install GD3, it\'ll be in the list. You can only rip 10 discs before you have to pay for a subscription though. Otherwise, you have a choice between the MusicBrainz plugin (CTDB), freedb plugin and EAC\'s native freedb support. I\'m not really sure what the big difference is, I\'m guessing it\'s the cover+lyrics. Anyway, change those settings above if you wish.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714025554im_/http://blowfish.be/eac/Caaok/Images/eac15.png[/img]\r\n\r\nIf you use EAC\'s native freedb instead, the settings should look like this. Make sure you put an email at the top, it doesn\'t need to be real. Hit \"Get active freedb server list\". Then checkmark the last option.\r\n\r\n[b]Step 6: Compression Options[/b]\r\n\r\n[img]https://web.archive.org/web/20141003171408im_/http://blowfish.be/eac/Caaok/Images/eac16.png[/img]\r\n\r\nSet up this tab exactly as shown. You\'ll have to browse to the path where you have flac.exe, if you installed it with EAC it\'s in C:\\Program Files (x86)\\Exact Audio Copy\\FLAC\\flac.exe. If you installed it separately it\'s wherever you installed it. The bit rate and high/low quality have no effect on the rip.\r\n\r\nThe commandline parameters have changed in this version, so this will look new to most of you. The commandline recommended for optimal completeness is this: \r\n[b]-8 -V -T \"ARTIST=%artist%\" -T \"TITLE=%title%\" -T \"ALBUM=%albumtitle%\" -T \"DATE=%year%\" -T \"TRACKNUMBER=%tracknr%\" -T \"GENRE=%genre%\" -T \"PERFORMER=%albuminterpret%\" -T \"COMPOSER=%composer%\" %haslyrics%--tag-from-file=LYRICS=\"%lyricsfile%\"%haslyrics% -T \"ALBUMARTIST=%albumartist%\" -T \"DISCNUMBER=%cdnumber%\" -T \"TOTALDISCS=%totalcds%\" -T \"TOTALTRACKS=%numtracks%\" -T \"COMMENT=%comment%\" %source% -o %dest%[/b]\r\n\r\nIt takes no extra effort on your part, just copy and paste that into the additional commandline options and you\'re done.\r\n\r\n[img]https://web.archive.org/web/20141003171408im_/http://blowfish.be/eac/Caaok/Images/eac17.png[/img]\r\n\r\nLeave everything unchecked except the last option. \r\n\r\nCongrats! EAC is now properly set up! You may wish to save your settings in a profile by hitting \"New\" at the bottom of the screen. However, unless you\'re changing your settings frequently there\'s no need, EAC will remember all of this on next launch regardless.\r\n\r\nFor ripping, view the ripping guide here: \r\n[url]https://www.brainwashthemasses.org/wiki.php?action=article&id=2[/url]',100,100,'2016-11-21 01:59:48',31),(4,6,'XLD Guide','[b]Summary[/b]\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners\' guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list \r\nhttp://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various \'lossless\' audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu > Check for Updates to make sure you have the latest version. \r\n\r\n[b] 1. Configuration[/b]\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu > Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n[b](1) [/b]The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n\r\n[b](2)[/b] There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent).\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n[b]%A - %T (%y) [%f]/%n %t[/b]\r\n\r\nor \r\n\r\n[b]%A - %y - %T [%f]/%n %t[/b]\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn\'t always all that useful; \'LAME MP3\' is not as descriptive as \'V0\' as you\'ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n[b]%A - %T (%y) [%f]/%n - %a - %t[/b]\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the \'Output format\' dropdown, so \'FLAC\' or \'LAME MP3\', etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n[b](3)[/b] Set Character encoding of cuesheet to Unicode (UTF-8).\r\n\r\n[b](4)[/b] Set the filename option to Overwrite.\r\n\r\n[b](5)[/b] Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n\r\n[b](6) [/b]The Maximum # of Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n\r\n[b](7)[/b] DO NOT check the Correct \"30 samples moved offset\" problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC\'s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck \"Allow to embed cue sheet\". (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n[b]2.[/b] Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD\'s dock icon and it will batch-convert the folders.\r\n\r\n[b](1)[/b] Check the Preserve directory structures box.\r\n\r\n[b](2)[/b] Set Subdirectory search depth to 0.\r\n\r\n[b](3)[/b] Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n[b]3.[/b] The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n[b]4.[/b] In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n\r\n[b](1)[/b] Uncheck the Embed cover art images into files box, if you choose.\r\n\r\n[b](2)[/b] Uncheck the Set the Compilation flag automatically box.\r\n\r\n[b](3)[/b] Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n\r\n[b](4)[/b] It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n[b]5: CD Rip[/b]\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker\'s assessment of your extraction log. \r\n\r\n[b](1)[/b] Use the XLD Secure Ripper Mode.\r\n\r\n[b](2) [/b]XLD should be able to read your drive\'s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive\'s offset, so this step is usually unnecessary.\r\n\r\n[b](3)[/b] If your drive\'s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the \"Treat AccurateRip mismatch as an inconsistency in log\" box.\r\n\r\n[b](4)[/b] Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n\r\n[b](5)[/b] Verify suspicious sectors.\r\n\r\n[b](6)[/b] Always enable Test before copy (also called test-and-copy).\r\n\r\n[b](7)[/b] Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\n[b]Ripping[/b]\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n\r\n[b]1.[/b] Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n[b]2.[/b] Go to File menu > Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n[b]3.[/b] XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n[b]4.[/b] Add tags. Go to CDBB menu > Query Items > and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu > Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu > Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option \"Include pre-gap except for HTOA.\" If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\n[b]Note:[/b] If you need to extract the hidden track one audio (HTOA), rip the track again using the option \"Include pre-gap for all tracks.\" This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you\'ve already done. You may then split the \'Track 0\' out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n[b]5.[/b] Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\n[b]Log Analysis[/b]\r\n\r\nMain things to look for:\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\n[color=#ff0000]LOG CONSOLIDATION WARNING[/color]\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\n[color=#ff0000]AccurateRip[/color]\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the \"Treat AccurateRip mismatch as an inconsistency in log\" box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive\'s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is \"accurate\". If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\n[color=#ff0000]Errors (CDParanoia III 10.2 Ripper Mode)[/color]\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the \"No errors occurred / End of status report\" message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\n[color=#ff0000][b]Major errors[/b][/color]\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n\r\n[*] Read error\r\n[*] Skipped (treated as error)\r\n[*] Inconsistency in error sectors\r\n\r\n[b]Acceptable errors[/b]\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as \"(maybe fixed)\" in the log.\r\n\r\n[*] Edge jitter error\r\n[*] Atom jitter error\r\n[*] Drift Error\r\n[*] Dropped bytes error\r\n[*] Duplicated bytes error\r\n\r\n[b]Conclusion[/b]\r\n\r\n\r\nIf your CRCs match up and you don\'t have any of the \"bad\" errors that are listed above, then your rip is considered good. AccurateRip isn\'t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe \"maybe fixed\" errors is most likely clean.',100,100,'2016-11-22 06:31:19',31),(5,4,'User Classes','Listed below are the user classes at [b]What.CD[/b] and their requirements.\r\n\r\n[b][color=#FF0000]Users cannot transcend classes while warned.[/color][/b]\r\n\r\nPlease note that promotion to a higher class is not instantaneous; the promotion script only runs once every couple of hours. Should you have not received the class benefits that you ought to have, please try logging out and logging back in; this will often fix the issue.\r\n\r\n[b][size=4]Primary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]User[/b] - The Default.\r\n[i]Requirements[/i] - None.\r\n[i]Perks[/i] - Can make requests.\r\n\r\n[b]Member[/b] - The First Rung.\r\n[i]Requirements[/i] - Been here for at least 1 week, has uploaded at least 10 GB and a ratio above 0.7.\r\n[i]Perks[/i] - Can edit collages.\r\n[i]Demotions[/i] - Demoted to User when ratio drops below 0.65.\r\n\r\n[b]Power User[/b] - Those With a Little Power.\r\n[i]Requirements[/i] - Been here at least 2 weeks, has uploaded at least 5 torrents and 25 GB, ratio above 1.05.\r\n[i]Perks[/i] - Receives invites, can access notifications and college subscriptions, create new collages, get a personal collage, access to the Power User & Invites forums, can create forum polls, and immunity from inactivity disabling.\r\n[i]Demotions[/i] - Demoted to Member when their uploaded amount drops below 25 GB, their ratio drops below 0.95 or their current uploaded torrent total is less than five.\r\n\r\n[b]Elite[/b] - The Elite.\r\n[i]Requirements[/i] - Been here at least 4 weeks, has uploaded at least 50 torrents and 100 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Elite forum, Top 10 filters, a second personal collage, and torrent editing privileges.\r\n[i]Demotions[/i] - Demoted to Power User when their uploaded amount drops below 100 GB or their current uploaded torrent total is less than 50. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Torrent Master[/b] - The Select Few.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 torrents and 500 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Torrent Master forum, earns custom title, a third personal collage, and unlimited invites.\r\n[i]Demotions[/i] - Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Power TM[/b] - The Coolest of the Cool.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 GB, ratio above 1.05, and has also uploaded on or more torrents in at least 500 unique groups (albums).\r\n[i]Perks[/i] - Everything Torrent Master gets plus a fourth personal collage.\r\n[i]Demotions[/i] - Demoted to Torrent Master when their current uploaded torrent total contains less than 500 unique groups. Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Elite TM[/b] - Masters of the FLAC.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 GB, ratio above 1.05, and has also uploaded at least 500 torrents that are \"perfect\" FLAC (100% log for CD, or any Vinyl/DVD/Soundboard/WEB/Cassette/Blu-ray/SACD/DAT). Note that you also have to meet the requirements for Power TM (500 unique groups).\r\n[i]Perks[/i] - Everything Power TM gets plus a fifth personal collage.\r\n[i]Demotions[/i] - Demoted to either Power TM or Torrent Master when their current uploaded torrent total contains less than 500 100% CD FLAC and/or Vinyl/DVD/Soundboard/WEB/Cassette/Blu-ray/SACD/DAT FLAC torrents. Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]VIP[/b] - Special People.\r\n[i]Requirements[/i] - Be Awesome.\r\n[i]Perks[/i] - Access to the VIP forum, advanced Wiki editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Legend[/b] - Great Myths Surround These Mystical Entities.\r\n[i]Requirements[/i] - Former staff member.\r\n[i]Perks[/i] - Access to the special forum, advanced Wiki editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Forum Moderators[/b] - The Forum Staff.\r\n[i]Requirements[/i] - Don\'t ask us; be awesome.\r\n\r\n[b]Staff[/b] - The Staff.\r\nModerator, Developer, Lead Developer, Administrator, and System Administrator.\r\n\r\n[b][size=4]Secondary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]Artist[/b] - The Musicians.\r\nThese people can advertise their albums on the \'Latest vanity house additions\' list. See [url=https://what.cd/forums.php?action=viewthread&threadid=80529]here[/url] for more details.\r\n\r\n[b]First Line Support[/b] - [size=1][b]FLS[/b][/size]\r\n[i]Requirements[/i] - Qualified, experienced and knowledgeable users may apply for this position.\r\n\r\n[b]Interviewer[/b] - [size=1][b]IN[/b][/size] - The Gate Keepers.\r\nThese people interview prospective new members.\r\n[i]Requirements[/i] - Elite and above may apply.\r\n\r\n[b]Torrent Celebrity[/b] - [size=1][b]TC[/b][/size] - Special People on Other Trackers.\r\n[i]Requirements[/i] - Staff at another tracker that meets certain requirements and approved by staff member.\r\n[i]Perks[/i] - Access to the Torrent Celebrity forum, advanced Wiki editing, torrent editing, and can send unlimited invites.\r\n\r\n[b]Delta Team[/b] - [size=1][b]DT[/b][/size] - The Rule Makers\r\n[i]Requirements[/i] - Don\'t ask us; we might ask you.\r\n[i]Perks[/i] - Access to the Delta Team forum, advanced Wiki editing, torrent editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Build Team[/b] - [size=1][b]BT[/b][/size] - The Site Shakers\r\n[i]Requirements[/i] - Don\'t ask us; we might ask you.\r\n[i]Perks[/i] - Access to the Build Team forum, advanced Wiki editing, torrent editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Alpha Team[/b] - [size=1][b]AT[/b][/size] - They Simply Are.\r\n[i]Requirements[/i] - Don\'t ask us; we won\'t ask you.\r\n\r\n[b][color=#FF0000]Members of the Interviewer, Delta and other teams are generally very knowledgeable about the site and can usually be trusted to give accurate information, but they [i]are not staff[/i] and should not be taken as expressing direct staff policy[/color][/b]\r\n\r\n[b][size=4]Bonus[/size][/b]\r\n\r\nAs well as the standard user classes, there is also an extra bonus that users may receive. This is:\r\n\r\n[b]Donor[/b] - [img]https://www.brainwashthemasses.org/static/common/smileys/heart.gif[/img] - Donators.\r\nThese people have donated money to help keep this site running. See [url=https://www.brainwashthemasses.org/donate.php]this page[/url] for more details.',100,100,'2016-11-24 01:03:17',246);
/*!40000 ALTER TABLE `wiki_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_artists`
--

DROP TABLE IF EXISTS `wiki_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_artists` (
  `RevisionID` int(12) NOT NULL AUTO_INCREMENT,
  `PageID` int(10) NOT NULL DEFAULT '0',
  `Body` text,
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Summary` varchar(100) DEFAULT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RevisionID`),
  KEY `PageID` (`PageID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_artists`
--

LOCK TABLES `wiki_artists` WRITE;
/*!40000 ALTER TABLE `wiki_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisions`
--

DROP TABLE IF EXISTS `wiki_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisions` (
  `ID` int(10) NOT NULL,
  `Revision` int(10) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Body` mediumtext,
  `Date` datetime DEFAULT NULL,
  `Author` int(10) DEFAULT NULL,
  KEY `ID_Revision` (`ID`,`Revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisions`
--

LOCK TABLES `wiki_revisions` WRITE;
/*!40000 ALTER TABLE `wiki_revisions` DISABLE KEYS */;
INSERT INTO `wiki_revisions` VALUES (1,1,'Wiki','Welcome to your new wiki! Hope this works.','2016-11-20 17:39:47',1),(2,1,'EAC - Ripping with Exact Audio Copy [FROM baconBits]','[I]This article lifted directly from the What.CD wiki. Guide written by caaok.\r\nI&#39;d like to thank the What.CD Delta Team for helping with comments and critique, and I&#39;d especially like to single out PunkMeUp for his contributions.[/I]\r\n\r\nThis guide was made for EAC version 1.0 beta 2 and will not completely work with earlier versions. Versions 0.99 or earlier should use the blowfish guide.\r\n\r\nAnything with a green outline around it is a required setting. Anything orange is required but depends on your drive. Anything unmarked is optional.\r\n\r\nThis is meant to be a no-frills guide with little extra info. A more comprehensive (but outdated) guide can be found here:\r\nhttp://www.afterdawn.com/guides/archive/rip_cds_with_exact_audio_copy.cfm\r\n\r\n[size=3][b]Step 1: Tagging[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/yyBqv.png[/IMG]\r\n\r\nSo now let&#39;s look at the main window. Be sure everything is named correctly here, as these will be the tags on your ripped files. If you&#39;re ripping a classical CD, you may wish to fill in the Composer/Performer fields. Also note: the Comment field doesn&#39;t currently work.\r\n\r\nDrag a cover image into the EAC window. I think ~500x500 is a decent size in most cases. Google images is your friend here.\r\n\r\nIf you&#39;re ripping a box set, you may wish to use the options under the cover image, otherwise leave them all as &quot;1&quot;.\r\n\r\nFinally, if you want to add lyrics to the tracks, use the &quot;Lyrics&quot; button.\r\n\r\nNote: I&#39;ve also highlighted the &quot;New&quot; button where you can save your settings. This is not a necessary step each time you rip.\r\n\r\n[size=3][b]Step 2: Gap Detection and Cuesheets[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/aniNG.png[/IMG]\r\n\r\nThe pre-rip stuff happens here. Make sure &quot;Append Gaps to Previous Track (default)&quot; is checked. It should be. Next, hit the options in the order shown.\r\n\r\nFirst, hit &quot;Detect Gaps&quot;. This is very important, your rip will fail the logchecker if you do not complete this step. If the first track is highlighted in red, you have a hidden track. You&#39;ll want to look at this section of the [URL=http://blowfish.be/]blowfish.be[/URL] guide.\r\n\r\nNext, go to Create CUE Sheet -&gt; Multiple WAV Files With Gaps... (Noncompliant). This is usually where I create the folder for ripping as well. Do NOT rip your tracks to any directory containing your name. You should NEVER edit a log for any reason, especially now that we have checksums. A simple C:\\EAC Rips is fine.\r\n\r\nI name my directories as follows:\r\nArtist - Album (Year) [Format] {Extra}\r\n\r\nSo for example, with the album in the screenshots, it&#39;d be\r\n\r\nSam Roberts Band - Collider (2011) [FLAC] {UMC 0252764577}\r\n\r\nHowever, as long as it contains the album name and no nested folders (don&#39;t do \\Artist\\Album\\), you&#39;re fine by the rules here.\r\n\r\nAnyway, make the folder, save the .cue file into it. I usually just name mine Noncompliant.cue, it doesn&#39;t really matter.\r\n\r\n[size=3][b]Step 3: Ripping[/b][/size]\r\n\r\n[IMG]http://i.imgur.com/Onfxp.png[/IMG]\r\n\r\nFinally, the rip itself! Make sure all the tracks are checkmarked in the main window unless there are some you don&#39;t want to rip.\r\n\r\nTest &amp; Copy -&gt; Compressed.\r\n\r\nDepending on your drive and whether or not the CD is scratched, this could take anywhere from ten minutes to four hours. Be patient.\r\n\r\n[size=3][b]Step 4: Post-Rip[/b][/size]\r\n\r\nSo you&#39;re done! You may wish to use logchecker.php to check and make sure your rip is proper, but if you followed this guide, the only possible errors would be with the CD itself. It does happen... some CDs are too badly damaged, even for EAC. Your best bet is to clean the CD and try again.\r\n\r\nOther than that, it never hurts to make sure your files are tagged and named properly (though they should be). Any extra stuff you want to include should be added now as well... Additional artwork, an md5 fingerprint, an info.txt file, that sort of thing. If you don&#39;t want to do any of that, it&#39;s time to find yourself an uploading guide!','2016-11-20 22:42:10',3),(3,1,'EAC Setup Guide','[b][align=center]EAC 1.0 Setup Guide[/b]\r\n\r\nDownload link: http://www.exactaudiocopy.de/en/index.php/resources/download/\r\nCurrent version as of this guide: EAC 1.0 Beta 3.\r\n[color=#ff0000]This guide was made for EAC version 1.0 beta 3 and will not completely work with earlier versions (which are not recommended any longer). Versions 0.99 or earlier should use the EAC 0.99 guide. [/color]\r\n\r\nAnything with a green outline around it is a required setting. Anything orange is required but depends on your drive. Anything unmarked is optional. This is meant to be a no-frills guide with little extra info. The old EAC 0.99 guide is more comprehensive (but outdated as far as settings go since there are new features in EAC 1.0) - visit it if you run into problems, the background information is basically still correct.\r\n\r\n[b]Step 1: Download and install EAC[/b]\r\n\r\nDownload the installer and fire it up.\r\n\r\n[img]https://web.archive.org/web/20140714023611im_/http://blowfish.be/eac/Caaok/Images/eac01.png[/img]\r\n\r\nEventually you&#39;ll get to a screen like this. Make sure you install AccurateRip, CDRDAO, CTDB and freedb as a bare minimum. FLAC will be useful as well if you don&#39;t have it separately installed. GD3 is only useful if you want to pay for metadata results. I assume you don&#39;t. \r\nNote: The above screenshot is from Beta 3. The new Beta 3 adds the option to include the CueTools Database Plugin. It is recommended to install it but not required. Full details for installation of the plugin on older versions is located in the appendix at the end of this guide.\r\n\r\n[b]Step 2: Start EAC[/b]\r\n\r\n[img]https://web.archive.org/web/20140714033449im_/http://blowfish.be/eac/Caaok/Images/eac02.png[/img]\r\n\r\nWhen you first start EAC, you&#39;ll see a screen like this one. Hit &quot;Cancel&quot;. Next, put a popular CD into your drive, preferably not one that was recently released (a few months old at least). You&#39;ll see a window like the one below appear. If you have an older version of EAC or dBpoweramp installed, it&#39;s likely AccurateRip was already configured, and this may not appear. You may need to try multiple CDs to get this to show up.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714084437im_/http://blowfish.be/eac/Caaok/Images/eac03.png[/img]\r\n\r\n\r\nHit Configure. It may take a few minutes. Hit &quot;Ok&quot; afterward. This is a necessary step, make sure you try several CDs.\r\n\r\nStep 3: EAC Options\r\n\r\nAll of the options dialogs can be found from the EAC menu at the top of the screen.\r\n\r\nimage loading...\r\n\r\nStart with EAC Options. Any tabs not pictured are completely optional settings, or are irrelevant to ripping.\r\n\r\n\r\nimage loading...\r\n\r\nIf your drive is capable of reading UPC/ISRC codes and CD-Text (you can only really figure this out by trial and error), you&#39;re welcome to keep the top two options checked. Otherwise, uncheck them.\r\n\r\nOther than that, these settings are pretty much ideal. I wouldn&#39;t recommend using more than 1 compressor thread even if you have a multicore computer. It doesn&#39;t take very long compared to the track extraction anyway. Note that in tests run by punkmeup, disabling the queue of external compressors in the background fixed an issue where EAC was generating WAV files instead of FLAC, so I&#39;ve made that a required option. It should have no bearing on the rip quality. If rip queueing works for you (it does for me), feel free to leave it enabled.\r\n\r\nNote that m3u file creation is technically optional, however, some users use these files to manage their libraries. \r\nComment (xuncat): the reason why this is optional rather that required is of course that the option does not affect rip quality at all.\r\n\r\n\r\nimage loading...\r\n\r\nMake sure you set the green highlighted settings as shown. If you&#39;re using an older version of EAC, make sure &quot;No use of null samples for CRC calculations is UNCHECKED. The rest is optional, choose as you will. Locking the drive tray during extraction isn&#39;t a bad idea though.\r\n\r\n\r\nimage loading...\r\n\r\nThese settings are pretty much all optional and self explanatory. I&#39;d recommend using Alternate CD play routines and disabling autostart though.\r\n\r\nThe &quot;Show status dialog after extraction&quot; option setting has been problematic for some users. This displays the log after the rip is done, and offers you the option to save the log file. If you follow this guide, EAC will do this automatically. Do NOT hit &quot;Save Log&quot;. As such I&#39;ve disabled the setting here. Only turn it on if you know what you&#39;re doing.\r\n\r\n\r\nimage loading...\r\n\r\nFriends don&#39;t let friends normalize their EAC rips. Don&#39;t ever do it. The rip will no longer be a true &quot;exact copy&quot; of the CD.\r\n\r\n\r\nimage loading...\r\n\r\nAs shown in the screenshot above here is the proper way to name tracks.\r\n\r\nNaming Convention : %tracknr2% - %title%\r\n\r\nCheck &#39;Use Various Artists Naming Scheme&#39; and use : %tracknr2% - %artist% - %title%\r\n\r\n\r\nThe only difference acceptable here would be perhaps %tracknr2%. %title% if you prefer periods instead of dashes in the filenames. If you need track numbers to go into triple digits for some reason, use %tracknr3% instead.\r\n\r\nDon&#39;t replace spaces by underscores. It looks ridiculous.\r\n\r\nA note on directory naming schemes and cuesheets:: Don&#39;t use a directory structure in your EAC filename options, unless you want to go back and edit your CUE sheet later. When you add a directory to the naming scheme, it&#39;ll put that directory path into the files. When, at a later date when you may have moved the files, you want to burn the files in EAC using your cuesheet, you&#39;ll be unable to do so. If you do insist on using a directory structure here, you need to go back, edit the CUE sheet in a program such as notepad, and remove the folder name from each line.\r\n\r\nFor example, a cuesheet line should look like this:\r\n\r\nFILE &quot;01 Last Known Surroundings.wav&quot; WAVE\r\n\r\nNot like this: \r\n\r\nFILE &quot;C:\\EAC Rips\\Explosions in the Sky - Take Care, Take Care, Take Care (2011) [FLAC]\\01 Last Known Surroundings.wav&quot; WAVE\r\n\r\nIf you insist on doing this, the scheme might look something like this:\r\n%artist% - %albumtitle% (%year%) [FLAC]\\%tracknr2% - %title%\r\n\r\nFollow the listed items on the Filename tab if you prefer a different scheme.\r\n\r\nStep 4: Drive Options\r\n\r\nimage loading...\r\n\r\nStart by hitting &quot;Detect Read Features...&quot;. This will actually take a few minutes. The only feature detection that actually matters is Accurate Stream. If your drive can use it, checkmark the setting (most modern drives have Accurate Stream). If it can&#39;t, don&#39;t.\r\n\r\nEven if your drive doesn&#39;t cache audio, it will not harm the rip quality to leave that checked. The rips take a bit longer with that setting enabled, though. Go watch TV or something while you wait.\r\n\r\nDo not use C2, even if EAC thinks you can. Most drives have terrible C2 error implementation.\r\n\r\n\r\nimage loading...\r\n\r\nHit &quot;Autodetect read command now&quot;. It shouldn&#39;t take long. Leave everything else unchecked unless you&#39;re having problems. You can checkmark &quot;CD-Text Read capable drive&quot; if you want to test whether your drive can do it. If it can, great, otherwise, uncheck it. It&#39;s unlikely you&#39;ll ever use that feature anyway.\r\n\r\n\r\nimage loading...\r\n\r\nIf you did the AccurateRip configuration at the start of this guide, the top half here will be greyed out. If not, you&#39;ll need to find your read offset correction from this list. Don&#39;t use a combined read/write offset. AccurateRip is a very useful function for checking that your rips are OK, so you should go back and try to get it configured if this option isn&#39;t greyed out.\r\n\r\nIf you want to figure out whether your drive needs &quot;Overread into Lead-in and Lead-Out&quot; checked, you can check by temporarily unchecking &quot;Use AccurateRip with this drive&quot;. Stick a CD in the drive and hit &quot;Detect read sample offset correction...&quot;. If you&#39;re just doing this for the Overread, see below:\r\n\r\nimage loading...\r\n\r\nxuncat&#39;s EAC 0.99 guide says:\r\n\r\nCheck &quot;Overread Lead-In and Lead-Out&quot; only if the test result says that your drive can overread from both the Lead-In and Lead-Out, or if it says Lead-Out and your offset correction is positive ,or if it says Lead-In and your offset correction is negative. Otherwise disable (uncheck) it.\r\n\r\nRemember to check &quot;Use AccurateRip with this drive&quot; again once you&#39;re finished.\r\n\r\n\r\nimage loading...\r\n\r\nPretty much every drive should work with the settings shown. If yours stalls on detecting gaps or detects gaps that are obviously wrong (like 30 second gaps on a non-live album), try Detection method B or C. If A, B, and C all fail, you can switch &quot;Secure&quot; to &quot;Accurate&quot; and try again.\r\n\r\nStep 5: Metadata Options\r\n\r\nimage loading...\r\n\r\nHere&#39;s where you pick your metadata provider. If you did install GD3, it&#39;ll be in the list. You can only rip 10 discs before you have to pay for a subscription though. Otherwise, you have a choice between the MusicBrainz plugin (CTDB), freedb plugin and EAC&#39;s native freedb support. I&#39;m not really sure what the big difference is, I&#39;m guessing it&#39;s the cover+lyrics. Anyway, change those settings above if you wish.\r\n\r\n\r\nimage loading...\r\n\r\nIf you use EAC&#39;s native freedb instead, the settings should look like this. Make sure you put an email at the top, it doesn&#39;t need to be real. Hit &quot;Get active freedb server list&quot;. Then checkmark the last option.\r\n\r\nStep 6: Compression Options\r\n\r\nimage loading...\r\n\r\nSet up this tab exactly as shown. You&#39;ll have to browse to the path where you have flac.exe, if you installed it with EAC it&#39;s in C:\\Program Files (x86)\\Exact Audio Copy\\FLAC\\flac.exe. If you installed it separately it&#39;s wherever you installed it. The bit rate and high/low quality have no effect on the rip.\r\n\r\nThe commandline parameters have changed in this version, so this will look new to most of you. The commandline recommended for optimal completeness is this: \r\n-8 -V -T &quot;ARTIST=%artist%&quot; -T &quot;TITLE=%title%&quot; -T &quot;ALBUM=%albumtitle%&quot; -T &quot;DATE=%year%&quot; -T &quot;TRACKNUMBER=%tracknr%&quot; -T &quot;GENRE=%genre%&quot; -T &quot;PERFORMER=%albuminterpret%&quot; -T &quot;COMPOSER=%composer%&quot; %haslyrics%--tag-from-file=LYRICS=&quot;%lyricsfile%&quot;%haslyrics% -T &quot;ALBUMARTIST=%albumartist%&quot; -T &quot;DISCNUMBER=%cdnumber%&quot; -T &quot;TOTALDISCS=%totalcds%&quot; -T &quot;TOTALTRACKS=%numtracks%&quot; -T &quot;COMMENT=%comment%&quot; %source% -o %dest%\r\n\r\nIt takes no extra effort on your part, just copy and paste that into the additional commandline options and you&#39;re done.\r\n\r\nComment (xuncat): the above command line will result in tags only if you have provided the corresponding information in EAC&#39;s main window. For example, if you use this command line and submit &quot;Composer&quot; and &quot;Performer&quot; information, there will be Composer and Performer tags. If you go on to rip a rock album, and don&#39;t add any Composer or Performer, those tags simply will not be created. In other word, the very long command line does no harm, it only makes it possible to have more tags created during the ripping process. If, however, you would prefer a minimal command line mirroring the one in my 0.99 guide, it would be: \r\n-8 -V -T &quot;ARTIST=%artist%&quot; -T &quot;TITLE=%title%&quot; -T &quot;ALBUM=%albumtitle%&quot; -T &quot;DATE=%year%&quot; -T &quot;TRACKNUMBER=%tracknr%&quot; -T &quot;GENRE=%genre%&quot; %source%\r\n\r\nNote: the %comment% function is broken in version 1.0b2 (it returns the track CRC). Use something like -T &quot;COMMENT=EAC V1.0 beta 2, Secure Mode, Test &amp; Copy, AccurateRip, FLAC -8&quot; instead.\r\n\r\nAlso, as of Beta 3 you may use the %tracknr1% variable instead of %tracknr% if you would like to have no leading zeroes in the track number field (like XLD does). tracknr1 will use, for example, &#39;1&#39; instead of &#39;01&#39;.\r\n\r\nA note on the FLAC commandline in versions prior to 1.0b3: If you&#39;re using EAC 1.0b1, use the following commandline for FLAC:\r\n-8 -V -T &quot;ARTIST=%a&quot; -T &quot;TITLE=%t&quot; -T &quot;ALBUM=%g&quot; -T &quot;DATE=%y&quot; -T &quot;TRACKNUMBER=%n&quot; -T &quot;TOTALTRACKS=%x&quot; -T &quot;GENRE=%m&quot; -T &quot;ALBUMARTIST=%v&quot; -T &quot;COMMENT=EAC V1.0 beta 1, Secure Mode, Test &amp; Copy, AccurateRip, FLAC -8&quot; %s\r\n\r\nAnything older than that, just change the version number in the tags.\r\n\r\nA note on ripping to lossy formats like MP3: So first off, this is a complete waste of time. In most cases, EAC is overkill for lossy files, and takes far too long to rip the CD to be practical. Your best bet is to rip once to FLAC and then use a program like dBpoweramp to convert that rip to other formats. Even if you don&#39;t need a FLAC, it&#39;ll still be much faster to rip using any other program, and won&#39;t produce an audibly different result unless your CD has skips and bad scratches.\r\n\r\nHowever, the MP3 and Ogg command lines are included below. You&#39;ll need to browse to LAME.exe or oggenc2.exe, and set the extension to .mp3 or .ogg, respectively. The other settings remain the same, bit rate is still irrelevant. \r\nV0 MP3:\r\n-V 0 --vbr-new --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\nV2 MP3:\r\n-V 2 --vbr-new --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\n320 kbps MP3:\r\n-b 320 -h --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\nq8 Ogg:\r\n-q 8 -a &quot;%artist%&quot; -t &quot;%title%&quot; -l &quot;%albumtitle%&quot; -d &quot;%year%&quot; -N &quot;%tracknr%&quot; -G &quot;%genre%&quot; %source% %dest%\r\n\r\n\r\nimage loading...\r\n\r\nLeave everything unchecked except the last option. \r\nComment (xuncat): adding the cover image to the folder will of course not affect the rip at all, so is really an option.\r\n\r\nCongrats! EAC is now properly set up! You may wish to save your settings in a profile by hitting &quot;New&quot; at the bottom of the screen. However, unless you&#39;re changing your settings frequently there&#39;s no need, EAC will remember all of this on next launch regardless.','2016-11-21 01:37:07',31),(3,2,'EAC Setup Guide','[b][align=center]EAC 1.0 Setup Guide[/b]\r\n\r\nDownload link: http://www.exactaudiocopy.de/en/index.php/resources/download/\r\nCurrent version as of this guide: EAC 1.0 Beta 3.\r\n[color=#ff0000]This guide was made for EAC version 1.0 beta 3 and will not completely work with earlier versions (which are not recommended any longer). Versions 0.99 or earlier should use the EAC 0.99 guide. [/color]\r\n\r\nAnything with a green outline around it is a required setting. Anything orange is required but depends on your drive. Anything unmarked is optional. This is meant to be a no-frills guide with little extra info. The old EAC 0.99 guide is more comprehensive (but outdated as far as settings go since there are new features in EAC 1.0) - visit it if you run into problems, the background information is basically still correct.\r\n\r\n[b]Step 1: Download and install EAC[/b]\r\n\r\nDownload the installer and fire it up.\r\n\r\n[img]https://web.archive.org/web/20140714023611im_/http://blowfish.be/eac/Caaok/Images/eac01.png[/img]\r\n\r\nEventually you&#39;ll get to a screen like this. Make sure you install AccurateRip, CDRDAO, CTDB and freedb as a bare minimum. FLAC will be useful as well if you don&#39;t have it separately installed. GD3 is only useful if you want to pay for metadata results. I assume you don&#39;t. \r\nNote: The above screenshot is from Beta 3. The new Beta 3 adds the option to include the CueTools Database Plugin. It is recommended to install it but not required. Full details for installation of the plugin on older versions is located in the appendix at the end of this guide.\r\n\r\n[b]Step 2: Start EAC[/b]\r\n\r\n[img]https://web.archive.org/web/20140714033449im_/http://blowfish.be/eac/Caaok/Images/eac02.png[/img]\r\n\r\nWhen you first start EAC, you&#39;ll see a screen like this one. Hit &quot;Cancel&quot;. Next, put a popular CD into your drive, preferably not one that was recently released (a few months old at least). You&#39;ll see a window like the one below appear. If you have an older version of EAC or dBpoweramp installed, it&#39;s likely AccurateRip was already configured, and this may not appear. You may need to try multiple CDs to get this to show up.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714084437im_/http://blowfish.be/eac/Caaok/Images/eac03.png[/img]\r\n\r\n\r\nHit Configure. It may take a few minutes. Hit &quot;Ok&quot; afterward. This is a necessary step, make sure you try several CDs.\r\n\r\n[b]Step 3: EAC Options[/b]\r\n\r\nAll of the options dialogs can be found from the EAC menu at the top of the screen.\r\n\r\n[img]https://web.archive.org/web/20140714031903im_/http://blowfish.be/eac/Caaok/Images/eac04.png[/img]\r\n\r\nStart with EAC Options. Any tabs not pictured are completely optional settings, or are irrelevant to ripping.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714024410im_/http://blowfish.be/eac/Caaok/Images/eac07.png[/img]\r\n\r\nIf your drive is capable of reading UPC/ISRC codes and CD-Text (you can only really figure this out by trial and error), you&#39;re welcome to keep the top two options checked. Otherwise, uncheck them.\r\n\r\nOther than that, these settings are pretty much ideal. I wouldn&#39;t recommend using more than 1 compressor thread even if you have a multicore computer. It doesn&#39;t take very long compared to the track extraction anyway. Note that in tests run by punkmeup, disabling the queue of external compressors in the background fixed an issue where EAC was generating WAV files instead of FLAC, so I&#39;ve made that a required option. It should have no bearing on the rip quality. If rip queueing works for you (it does for me), feel free to leave it enabled.\r\n\r\n[b]Note that m3u file creation is technically optional, however, some users use these files to manage their libraries. [/b]\r\n\r\n[img]https://web.archive.org/web/20140714035652im_/http://blowfish.be/eac/Caaok/Images/eac05.png[/img]\r\n\r\nMake sure you set the green highlighted settings as shown. If you&#39;re using an older version of EAC, make sure &quot;No use of null samples for CRC calculations is [b]UNCHECKED[/b]. The rest is optional, choose as you will. Locking the drive tray during extraction isn&#39;t a bad idea though.\r\n\r\n[img]https://web.archive.org/web/20140714023148im_/http://blowfish.be/eac/Caaok/Images/eac06.png[/img]\r\n\r\nThese settings are pretty much all optional and self explanatory. I&#39;d recommend using Alternate CD play routines and disabling autostart though.\r\n\r\nThe &quot;Show status dialog after extraction&quot; option setting has been problematic for some users. This displays the log after the rip is done, and offers you the option to save the log file. If you follow this guide, EAC will do this automatically. Do NOT hit &quot;Save Log&quot;. As such I&#39;ve disabled the setting here. Only turn it on if you know what you&#39;re doing.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714030229im_/http://blowfish.be/eac/Caaok/Images/eac08.png[/img]\r\n\r\nFriends don&#39;t let friends normalize their EAC rips. Don&#39;t ever do it. The rip will no longer be a true &quot;exact copy&quot; of the CD.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714023544im_/http://blowfish.be/eac/Caaok/Images/eac09.png[/img]\r\n\r\nAs shown in the screenshot above here is the proper way to name tracks.\r\n\r\n[b]Naming Convention[/b] : %tracknr2% - %title%\r\n\r\nCheck [b]&#39;Use Various Artists Naming Scheme&#39;[/b] and use : %tracknr2% - %artist% - %title%\r\n\r\n\r\nThe only difference acceptable here would be perhaps [b]%tracknr2%. %title%[/b] if you prefer periods instead of dashes in the filenames. If you need track numbers to go into triple digits for some reason, use %tracknr3% instead.\r\n\r\nDon&#39;t replace spaces by underscores. It looks ridiculous.\r\n\r\n[b]A note on directory naming schemes and cuesheets:[/b]: Don&#39;t use a directory structure in your EAC filename options, unless you want to go back and edit your [b]CUE sheet[/b] later. When you add a directory to the naming scheme, it&#39;ll put that directory path into the files. When, at a later date when you may have moved the files, you want to burn the files in EAC using your cuesheet, you&#39;ll be unable to do so. If you do insist on using a directory structure here, you need to go back, edit the [b]CUE sheet[/b] in a program such as notepad, and remove the folder name from each line.\r\n\r\nFor example, a cuesheet line should look like this:\r\n\r\nFILE &quot;01 Last Known Surroundings.wav&quot; WAVE\r\n\r\nNot like this: \r\n\r\nFILE &quot;C:\\EAC Rips\\Explosions in the Sky - Take Care, Take Care, Take Care (2011) [FLAC]\\01 Last Known Surroundings.wav&quot; WAVE\r\n\r\nIf you insist on doing this, the scheme might look something like this:\r\n[b]%artist% - %albumtitle% (%year%) [FLAC]\\%tracknr2% - %title%[/b]\r\n\r\nFollow the listed items on the Filename tab if you prefer a different scheme.\r\n\r\n[b]Step 4: Drive Options[/b]\r\n\r\n[img]https://web.archive.org/web/20140714034919im_/http://blowfish.be/eac/Caaok/Images/eac10.png[/img]\r\n\r\nStart by hitting &quot;Detect Read Features...&quot;. This will actually take a few minutes. The only feature detection that actually matters is Accurate Stream. If your drive can use it, checkmark the setting (most modern drives have Accurate Stream). If it can&#39;t, don&#39;t.\r\n\r\nEven if your drive doesn&#39;t cache audio, it will not harm the rip quality to leave that checked. The rips take a bit longer with that setting enabled, though. Go watch TV or something while you wait.\r\n\r\nDo not use C2, even if EAC thinks you can. Most drives have terrible C2 error implementation.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714032740im_/http://blowfish.be/eac/Caaok/Images/eac11.png[/img]\r\n\r\nHit &quot;Autodetect read command now&quot;. It shouldn&#39;t take long. Leave everything else unchecked unless you&#39;re having problems. You can checkmark &quot;CD-Text Read capable drive&quot; if you want to test whether your drive can do it. If it can, great, otherwise, uncheck it. It&#39;s unlikely you&#39;ll ever use that feature anyway.\r\n\r\n\r\n[img]https://web.archive.org/web/20140714025157im_/http://blowfish.be/eac/Caaok/Images/eac12.png[/img]\r\n\r\nIf you did the AccurateRip configuration at the start of this guide, the top half here will be greyed out. If not, you&#39;ll need to find your read offset correction from this list. Don&#39;t use a combined read/write offset. AccurateRip is a very useful function for checking that your rips are OK, so you should go back and try to get it configured if this option isn&#39;t greyed out.\r\n\r\nIf you want to figure out whether your drive needs &quot;Overread into Lead-in and Lead-Out&quot; checked, you can check by temporarily unchecking &quot;Use AccurateRip with this drive&quot;. Stick a CD in the drive and hit &quot;Detect read sample offset correction...&quot;. If you&#39;re just doing this for the Overread, see below:\r\n\r\n[img]https://web.archive.org/web/20140714023814im_/http://blowfish.be/eac/Caaok/Images/obrvpi.png[/img]\r\n\r\nxuncat&#39;s EAC 0.99 guide says:\r\n\r\nCheck &quot;Overread Lead-In and Lead-Out&quot; only if the test result says that your drive can overread from both the Lead-In and Lead-Out, or if it says Lead-Out and your offset correction is positive ,or if it says Lead-In and your offset correction is negative. Otherwise disable (uncheck) it.\r\n\r\n[b]Remember to check &quot;Use AccurateRip with this drive&quot; again once you&#39;re finished.[/b]\r\n\r\n\r\n[img]https://web.archive.org/web/20140714022340im_/http://blowfish.be/eac/Caaok/Images/eac13.png[/img]\r\n\r\nPretty much every drive should work with the settings shown. If yours stalls on detecting gaps or detects gaps that are obviously wrong (like 30 second gaps on a non-live album), try Detection method B or C. If A, B, and C all fail, you can switch &quot;Secure&quot; to &quot;Accurate&quot; and try again.\r\n\r\n[b]Step 5: Metadata Options[b]\r\n\r\nimage loading...\r\n\r\nHere&#39;s where you pick your metadata provider. If you did install GD3, it&#39;ll be in the list. You can only rip 10 discs before you have to pay for a subscription though. Otherwise, you have a choice between the MusicBrainz plugin (CTDB), freedb plugin and EAC&#39;s native freedb support. I&#39;m not really sure what the big difference is, I&#39;m guessing it&#39;s the cover+lyrics. Anyway, change those settings above if you wish.\r\n\r\n\r\nimage loading...\r\n\r\nIf you use EAC&#39;s native freedb instead, the settings should look like this. Make sure you put an email at the top, it doesn&#39;t need to be real. Hit &quot;Get active freedb server list&quot;. Then checkmark the last option.\r\n\r\nStep 6: Compression Options\r\n\r\nimage loading...\r\n\r\nSet up this tab exactly as shown. You&#39;ll have to browse to the path where you have flac.exe, if you installed it with EAC it&#39;s in C:\\Program Files (x86)\\Exact Audio Copy\\FLAC\\flac.exe. If you installed it separately it&#39;s wherever you installed it. The bit rate and high/low quality have no effect on the rip.\r\n\r\nThe commandline parameters have changed in this version, so this will look new to most of you. The commandline recommended for optimal completeness is this: \r\n-8 -V -T &quot;ARTIST=%artist%&quot; -T &quot;TITLE=%title%&quot; -T &quot;ALBUM=%albumtitle%&quot; -T &quot;DATE=%year%&quot; -T &quot;TRACKNUMBER=%tracknr%&quot; -T &quot;GENRE=%genre%&quot; -T &quot;PERFORMER=%albuminterpret%&quot; -T &quot;COMPOSER=%composer%&quot; %haslyrics%--tag-from-file=LYRICS=&quot;%lyricsfile%&quot;%haslyrics% -T &quot;ALBUMARTIST=%albumartist%&quot; -T &quot;DISCNUMBER=%cdnumber%&quot; -T &quot;TOTALDISCS=%totalcds%&quot; -T &quot;TOTALTRACKS=%numtracks%&quot; -T &quot;COMMENT=%comment%&quot; %source% -o %dest%\r\n\r\nIt takes no extra effort on your part, just copy and paste that into the additional commandline options and you&#39;re done.\r\n\r\nComment (xuncat): the above command line will result in tags only if you have provided the corresponding information in EAC&#39;s main window. For example, if you use this command line and submit &quot;Composer&quot; and &quot;Performer&quot; information, there will be Composer and Performer tags. If you go on to rip a rock album, and don&#39;t add any Composer or Performer, those tags simply will not be created. In other word, the very long command line does no harm, it only makes it possible to have more tags created during the ripping process. If, however, you would prefer a minimal command line mirroring the one in my 0.99 guide, it would be: \r\n-8 -V -T &quot;ARTIST=%artist%&quot; -T &quot;TITLE=%title%&quot; -T &quot;ALBUM=%albumtitle%&quot; -T &quot;DATE=%year%&quot; -T &quot;TRACKNUMBER=%tracknr%&quot; -T &quot;GENRE=%genre%&quot; %source%\r\n\r\nNote: the %comment% function is broken in version 1.0b2 (it returns the track CRC). Use something like -T &quot;COMMENT=EAC V1.0 beta 2, Secure Mode, Test &amp; Copy, AccurateRip, FLAC -8&quot; instead.\r\n\r\nAlso, as of Beta 3 you may use the %tracknr1% variable instead of %tracknr% if you would like to have no leading zeroes in the track number field (like XLD does). tracknr1 will use, for example, &#39;1&#39; instead of &#39;01&#39;.\r\n\r\nA note on the FLAC commandline in versions prior to 1.0b3: If you&#39;re using EAC 1.0b1, use the following commandline for FLAC:\r\n-8 -V -T &quot;ARTIST=%a&quot; -T &quot;TITLE=%t&quot; -T &quot;ALBUM=%g&quot; -T &quot;DATE=%y&quot; -T &quot;TRACKNUMBER=%n&quot; -T &quot;TOTALTRACKS=%x&quot; -T &quot;GENRE=%m&quot; -T &quot;ALBUMARTIST=%v&quot; -T &quot;COMMENT=EAC V1.0 beta 1, Secure Mode, Test &amp; Copy, AccurateRip, FLAC -8&quot; %s\r\n\r\nAnything older than that, just change the version number in the tags.\r\n\r\nA note on ripping to lossy formats like MP3: So first off, this is a complete waste of time. In most cases, EAC is overkill for lossy files, and takes far too long to rip the CD to be practical. Your best bet is to rip once to FLAC and then use a program like dBpoweramp to convert that rip to other formats. Even if you don&#39;t need a FLAC, it&#39;ll still be much faster to rip using any other program, and won&#39;t produce an audibly different result unless your CD has skips and bad scratches.\r\n\r\nHowever, the MP3 and Ogg command lines are included below. You&#39;ll need to browse to LAME.exe or oggenc2.exe, and set the extension to .mp3 or .ogg, respectively. The other settings remain the same, bit rate is still irrelevant. \r\nV0 MP3:\r\n-V 0 --vbr-new --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\nV2 MP3:\r\n-V 2 --vbr-new --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\n320 kbps MP3:\r\n-b 320 -h --add-id3v2 --ignore-tag-errors --ta &quot;%artist%&quot; --tt &quot;%title%&quot; --tg &quot;%genre%&quot; --tl &quot;%albumtitle%&quot; --ty &quot;%year%&quot; --tn &quot;%tracknr%&quot; %source% %dest%\r\n\r\nq8 Ogg:\r\n-q 8 -a &quot;%artist%&quot; -t &quot;%title%&quot; -l &quot;%albumtitle%&quot; -d &quot;%year%&quot; -N &quot;%tracknr%&quot; -G &quot;%genre%&quot; %source% %dest%\r\n\r\n\r\nimage loading...\r\n\r\nLeave everything unchecked except the last option. \r\nComment (xuncat): adding the cover image to the folder will of course not affect the rip at all, so is really an option.\r\n\r\nCongrats! EAC is now properly set up! You may wish to save your settings in a profile by hitting &quot;New&quot; at the bottom of the screen. However, unless you&#39;re changing your settings frequently there&#39;s no need, EAC will remember all of this on next launch regardless.','2016-11-21 01:50:31',31),(4,1,'XLD Guide','Credit: original guide written by members at what.cd\r\n\r\nSummary\r\n\r\n\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners&#39; guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list + http://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various &#39;lossless&#39; audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\n\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu &gt; Check for Updates to make sure you have the latest version. \r\n\r\nConfiguration\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu &gt; Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n(1) The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n(2) There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent.)\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n%A - %T (%y) [%f]/%n %t\r\n\r\nor \r\n\r\n%A - %y - %T [%f]/%n %t\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn&#39;t always all that useful; &#39;LAME MP3&#39; is not as descriptive as &#39;V0&#39; as you&#39;ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n%A - %T (%y) [%f]/%n - %a - %t\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the &#39;Output format&#39; dropdown, so &#39;FLAC&#39; or &#39;LAME MP3&#39;, etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n(3) Set Character encoding of cuesheet to Unicode (UTF-8).\r\n(4) Set the filename option to Overwrite.\r\n(5) Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n(6) The Maximum #Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n(7) DO NOT check the Correct &quot;30 samples moved offset&quot; problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC&#39;s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck &quot;Allow to embed cue sheet&quot;. (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n2. Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD&#39;s dock icon and it will batch-convert the folders.\r\n(1) Check the Preserve directory structures box.\r\n(2) Set Subdirectory search depth to 0.\r\n(3) Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n3. The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n4. In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n(1) Uncheck the Embed cover art images into files box, if you choose.\r\n(2) Uncheck the Set the Compilation flag automatically box.\r\n(3) Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n(4) It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n5: CD Rip\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker&#39;s assessment of your extraction log. \r\n(1) Use the XLD Secure Ripper Mode.\r\n(2) XLD should be able to read your drive&#39;s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive&#39;s offset, so this step is usually unnecessary.\r\n(3) If your drive&#39;s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box.\r\n(4) Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n(5) Verify suspicious sectors.\r\n(6) Always enable Test before copy (also called test-and-copy).\r\n(7) Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\nRipping\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n1. Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n2. Go to File menu &gt; Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n3. XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n4. Add tags. Go to CDBB menu &gt; Query Items &gt; and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu &gt; Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu &gt; Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option &quot;Include pre-gap except for HTOA.&quot; If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nNote: If you need to extract the hidden track one audio (HTOA), rip the track again using the option &quot;Include pre-gap for all tracks.&quot; This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you&#39;ve already done. You may then split the &#39;Track 0&#39; out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n5. Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\nLog Analysis\r\n\r\n\r\n\r\nMain things to look for\r\n\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\nLOG CONSOLIDATION WARNING\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\nAccurateRip\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive&#39;s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is &quot;accurate&quot;. If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\nErrors (CDParanoia III 10.2 Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the &quot;No errors occurred / End of status report&quot; message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\nRead error\r\nSkipped (treated as error)\r\nInconsistency in error sectors\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\nEdge jitter error\r\nAtom jitter error\r\nDrift Error\r\nDropped bytes error\r\nDuplicated bytes error\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe &quot;maybe fixed&quot; errors is most likely clean. For a detailed discussion of XLD&#39;s error reporting, see this thread at HydrogenAudio.\r\n\r\nErrors (XLD Secure Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Since the XLD Secure Ripper reports additional information on rip quality, logs may sometimes list a number of errors and still report the &quot;No errors occurred / End of status report&quot; message. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n-Read Error\r\n-Damaged Sector Count\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by XLD. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\n-Jitter error (maybe fixed)\r\n-Retry sector count\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has either jitter errors or retry sector count errors is most likely good. Refer to the XLD official release notes for more detailed explanations of each error (under Version 20101115).','2016-11-21 14:43:44',31),(4,2,'XLD Guide','[b]Summary[/b]\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners&#39; guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list \r\nhttp://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various &#39;lossless&#39; audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\n\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu &gt; Check for Updates to make sure you have the latest version. \r\n\r\n[b] 1. Configuration[/b]\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu &gt; Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n(1) The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n(2) There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent.)\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n%A - %T (%y) [%f]/%n %t\r\n\r\nor \r\n\r\n%A - %y - %T [%f]/%n %t\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn&#39;t always all that useful; &#39;LAME MP3&#39; is not as descriptive as &#39;V0&#39; as you&#39;ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n%A - %T (%y) [%f]/%n - %a - %t\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the &#39;Output format&#39; dropdown, so &#39;FLAC&#39; or &#39;LAME MP3&#39;, etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n(3) Set Character encoding of cuesheet to Unicode (UTF-8).\r\n(4) Set the filename option to Overwrite.\r\n(5) Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n(6) The Maximum #Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n(7) DO NOT check the Correct &quot;30 samples moved offset&quot; problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC&#39;s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck &quot;Allow to embed cue sheet&quot;. (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n2. Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD&#39;s dock icon and it will batch-convert the folders.\r\n(1) Check the Preserve directory structures box.\r\n(2) Set Subdirectory search depth to 0.\r\n(3) Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n3. The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n4. In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n(1) Uncheck the Embed cover art images into files box, if you choose.\r\n(2) Uncheck the Set the Compilation flag automatically box.\r\n(3) Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n(4) It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n5: CD Rip\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker&#39;s assessment of your extraction log. \r\n(1) Use the XLD Secure Ripper Mode.\r\n(2) XLD should be able to read your drive&#39;s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive&#39;s offset, so this step is usually unnecessary.\r\n(3) If your drive&#39;s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box.\r\n(4) Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n(5) Verify suspicious sectors.\r\n(6) Always enable Test before copy (also called test-and-copy).\r\n(7) Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\nRipping\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n1. Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n2. Go to File menu &gt; Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n3. XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n4. Add tags. Go to CDBB menu &gt; Query Items &gt; and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu &gt; Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu &gt; Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option &quot;Include pre-gap except for HTOA.&quot; If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nNote: If you need to extract the hidden track one audio (HTOA), rip the track again using the option &quot;Include pre-gap for all tracks.&quot; This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you&#39;ve already done. You may then split the &#39;Track 0&#39; out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n5. Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\nLog Analysis\r\n\r\n\r\n\r\nMain things to look for\r\n\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\nLOG CONSOLIDATION WARNING\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\nAccurateRip\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive&#39;s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is &quot;accurate&quot;. If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\nErrors (CDParanoia III 10.2 Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the &quot;No errors occurred / End of status report&quot; message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\nRead error\r\nSkipped (treated as error)\r\nInconsistency in error sectors\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\nEdge jitter error\r\nAtom jitter error\r\nDrift Error\r\nDropped bytes error\r\nDuplicated bytes error\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe &quot;maybe fixed&quot; errors is most likely clean. For a detailed discussion of XLD&#39;s error reporting, see this thread at HydrogenAudio.\r\n\r\nErrors (XLD Secure Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Since the XLD Secure Ripper reports additional information on rip quality, logs may sometimes list a number of errors and still report the &quot;No errors occurred / End of status report&quot; message. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n-Read Error\r\n-Damaged Sector Count\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by XLD. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\n-Jitter error (maybe fixed)\r\n-Retry sector count\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has either jitter errors or retry sector count errors is most likely good. Refer to the XLD official release notes for more detailed explanations of each error (under Version 20101115).','2016-11-21 16:37:33',31),(4,3,'XLD Guide','[b]Summary[/b]\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners&#39; guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list \r\nhttp://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various &#39;lossless&#39; audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu &gt; Check for Updates to make sure you have the latest version. \r\n\r\n[b] 1. Configuration[/b]\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu &gt; Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n[b](1) [/b]The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n\r\n[b](2)[/b] There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent).\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n[b]%A - %T (%y) [%f]/%n %t[/b]\r\n\r\nor \r\n\r\n[b]%A - %y - %T [%f]/%n %t[/b]\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn&#39;t always all that useful; &#39;LAME MP3&#39; is not as descriptive as &#39;V0&#39; as you&#39;ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n[b]%A - %T (%y) [%f]/%n - %a - %t[/b]\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the &#39;Output format&#39; dropdown, so &#39;FLAC&#39; or &#39;LAME MP3&#39;, etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n[b](3)[/b] Set Character encoding of cuesheet to Unicode (UTF-8).\r\n\r\n[b](4)[/b] Set the filename option to Overwrite.\r\n\r\n[b](5)[/b] Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n\r\n[b](6) [/b]The Maximum # of Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n\r\n[b](7)[/b] DO NOT check the Correct &quot;30 samples moved offset&quot; problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC&#39;s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck &quot;Allow to embed cue sheet&quot;. (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n2. Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD&#39;s dock icon and it will batch-convert the folders.\r\n(1) Check the Preserve directory structures box.\r\n(2) Set Subdirectory search depth to 0.\r\n(3) Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n3. The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n4. In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n(1) Uncheck the Embed cover art images into files box, if you choose.\r\n(2) Uncheck the Set the Compilation flag automatically box.\r\n(3) Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n(4) It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n5: CD Rip\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker&#39;s assessment of your extraction log. \r\n(1) Use the XLD Secure Ripper Mode.\r\n(2) XLD should be able to read your drive&#39;s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive&#39;s offset, so this step is usually unnecessary.\r\n(3) If your drive&#39;s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box.\r\n(4) Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n(5) Verify suspicious sectors.\r\n(6) Always enable Test before copy (also called test-and-copy).\r\n(7) Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\nRipping\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n1. Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n2. Go to File menu &gt; Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n3. XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n4. Add tags. Go to CDBB menu &gt; Query Items &gt; and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu &gt; Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu &gt; Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option &quot;Include pre-gap except for HTOA.&quot; If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nNote: If you need to extract the hidden track one audio (HTOA), rip the track again using the option &quot;Include pre-gap for all tracks.&quot; This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you&#39;ve already done. You may then split the &#39;Track 0&#39; out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n5. Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\nLog Analysis\r\n\r\n\r\n\r\nMain things to look for\r\n\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\nLOG CONSOLIDATION WARNING\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\nAccurateRip\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive&#39;s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is &quot;accurate&quot;. If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\nErrors (CDParanoia III 10.2 Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the &quot;No errors occurred / End of status report&quot; message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\nRead error\r\nSkipped (treated as error)\r\nInconsistency in error sectors\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\nEdge jitter error\r\nAtom jitter error\r\nDrift Error\r\nDropped bytes error\r\nDuplicated bytes error\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe &quot;maybe fixed&quot; errors is most likely clean. For a detailed discussion of XLD&#39;s error reporting, see this thread at HydrogenAudio.\r\n\r\nErrors (XLD Secure Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Since the XLD Secure Ripper reports additional information on rip quality, logs may sometimes list a number of errors and still report the &quot;No errors occurred / End of status report&quot; message. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n-Read Error\r\n-Damaged Sector Count\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by XLD. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\n-Jitter error (maybe fixed)\r\n-Retry sector count\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has either jitter errors or retry sector count errors is most likely good. Refer to the XLD official release notes for more detailed explanations of each error (under Version 20101115).','2016-11-21 18:29:30',31),(4,4,'XLD Guide','[b]Summary[/b]\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners&#39; guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list \r\nhttp://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various &#39;lossless&#39; audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu &gt; Check for Updates to make sure you have the latest version. \r\n\r\n[b] 1. Configuration[/b]\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu &gt; Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n[b](1) [/b]The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n\r\n[b](2)[/b] There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent).\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n[b]%A - %T (%y) [%f]/%n %t[/b]\r\n\r\nor \r\n\r\n[b]%A - %y - %T [%f]/%n %t[/b]\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn&#39;t always all that useful; &#39;LAME MP3&#39; is not as descriptive as &#39;V0&#39; as you&#39;ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n[b]%A - %T (%y) [%f]/%n - %a - %t[/b]\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the &#39;Output format&#39; dropdown, so &#39;FLAC&#39; or &#39;LAME MP3&#39;, etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n[b](3)[/b] Set Character encoding of cuesheet to Unicode (UTF-8).\r\n\r\n[b](4)[/b] Set the filename option to Overwrite.\r\n\r\n[b](5)[/b] Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n\r\n[b](6) [/b]The Maximum # of Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n\r\n[b](7)[/b] DO NOT check the Correct &quot;30 samples moved offset&quot; problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC&#39;s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck &quot;Allow to embed cue sheet&quot;. (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n[b]2.[/b] Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD&#39;s dock icon and it will batch-convert the folders.\r\n\r\n[b](1)[/b] Check the Preserve directory structures box.\r\n\r\n[b](2)[/b] Set Subdirectory search depth to 0.\r\n\r\n[b](3)[/b] Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n[b]3.[/b] The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n[b]4.[/b] In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n\r\n[b](1)[/b] Uncheck the Embed cover art images into files box, if you choose.\r\n\r\n[b](2)[/b] Uncheck the Set the Compilation flag automatically box.\r\n\r\n[b](3)[/b] Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n\r\n[b](4)[/b] It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n[b]5: CD Rip[/b]\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker&#39;s assessment of your extraction log. \r\n\r\n[b](1)[/b] Use the XLD Secure Ripper Mode.\r\n\r\n[b](2) [/b]XLD should be able to read your drive&#39;s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive&#39;s offset, so this step is usually unnecessary.\r\n\r\n[b](3)[/b] If your drive&#39;s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box.\r\n\r\n[b](4)[/b] Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n\r\n[b](5)[/b] Verify suspicious sectors.\r\n\r\n[b](6)[/b] Always enable Test before copy (also called test-and-copy).\r\n\r\n[b](7)[/b] Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\nRipping\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n1. Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n2. Go to File menu &gt; Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n3. XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n4. Add tags. Go to CDBB menu &gt; Query Items &gt; and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu &gt; Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu &gt; Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option &quot;Include pre-gap except for HTOA.&quot; If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nNote: If you need to extract the hidden track one audio (HTOA), rip the track again using the option &quot;Include pre-gap for all tracks.&quot; This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you&#39;ve already done. You may then split the &#39;Track 0&#39; out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n5. Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\nLog Analysis\r\n\r\n\r\n\r\nMain things to look for\r\n\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\nLOG CONSOLIDATION WARNING\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\nAccurateRip\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive&#39;s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is &quot;accurate&quot;. If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\nErrors (CDParanoia III 10.2 Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the &quot;No errors occurred / End of status report&quot; message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\nRead error\r\nSkipped (treated as error)\r\nInconsistency in error sectors\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\nEdge jitter error\r\nAtom jitter error\r\nDrift Error\r\nDropped bytes error\r\nDuplicated bytes error\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe &quot;maybe fixed&quot; errors is most likely clean. For a detailed discussion of XLD&#39;s error reporting, see this thread at HydrogenAudio.\r\n\r\nErrors (XLD Secure Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Since the XLD Secure Ripper reports additional information on rip quality, logs may sometimes list a number of errors and still report the &quot;No errors occurred / End of status report&quot; message. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n-Read Error\r\n-Damaged Sector Count\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by XLD. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\n-Jitter error (maybe fixed)\r\n-Retry sector count\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has either jitter errors or retry sector count errors is most likely good. Refer to the XLD official release notes for more detailed explanations of each error (under Version 20101115).','2016-11-21 18:34:50',31),(4,5,'XLD Guide','[b]Summary[/b]\r\nThis guide is an introduction that will teach you to configure XLD correctly, to rip a CD, and to check ripping (extraction) logs for a good CD rip. It is intended primarily as a beginners&#39; guide, so some more advanced features are (currently) omitted. \r\n\r\nDownload XLD builds and source code from the following links:\r\nhttp://code.google.com/p/xld/downloads/list \r\nhttp://code.google.com/p/xld/\r\nhttp://tmkk.pv.land.to/xld/index_e.html\r\n\r\n\r\nThe official software page describes XLD\r\nXLD Wrote:\r\nX Lossless Decoder (XLD) is a tool for Mac OS X that is able to decode/convert/play various &#39;lossless&#39; audio files. The supported audio files can be split into some tracks with cue sheet when decoding. It works on Mac OS X 10.3 and later. XLD is Universal Binary, so it runs natively on both Intel Macs and PPC Macs.\r\n\r\nI STRONGLY recommend version 20100704 (04 July 2010) or newer. If you are using an older version, then go to XLD menu &gt; Check for Updates to make sure you have the latest version. \r\n\r\n[b] 1. Configuration[/b]\r\n\r\n\r\nIt is very important to properly configure XLD for lossless (FLAC) rips so that the ripping log will score 100% on logcheckers. This guide will also cover encoding lossy formats (such as MP3), as well.\r\n\r\n1. After checking for updates go to XLD menu &gt; Preferences, or hit Command-; (Command is the key with the Apple logo).\r\n\r\n[img]http://i.imgur.com/ih0bx.png[/img]\r\n\r\n\r\nWe will configure the General settings tab with the assumption that you will rip a disc to FLAC (and then transcode the FLAC files to MP3 if you desire).\r\n[b](1) [/b]The Output directory is set manually each time you rip a disc. If you wish to have a default directory for transcoding, then you may set it now.\r\n\r\n[b](2)[/b] There are several options for filenames and directory names. It is ALWAYS recommended to include, at minimum, track number and track title in the filenames. If you upload a torrent missing these, then someone may re-name the files and trump your torrent. (A meaningful directory name is also required: the minimum is to include the album title. If you upload a torrent with a root directory name that omits the album name, then someone may rename the folder and trump your torrent).\r\n\r\nWhen ripping or converting, consider using one of the following: \r\n\r\n[b]%A - %T (%y) [%f]/%n %t[/b]\r\n\r\nor \r\n\r\n[b]%A - %y - %T [%f]/%n %t[/b]\r\n\r\n(Click the Specify radio button to enter text.) This will create a folder for you and put the tracks in it.\r\n\r\nNote that %f isn&#39;t always all that useful; &#39;LAME MP3&#39; is not as descriptive as &#39;V0&#39; as you&#39;ll have to manually correct that if you rely on the %f option. However, XLD will create one folder for each format you are ripping to multiple formats! A workaround to this previous limitation is to set the Output format to Multiple Formats, then each of the output formats (%f) can be named to appropriate names such as V0, V2, 320K LAME, etc.\r\n\r\n[img]http://i.imgur.com/Vf6H8.png[/img]\r\n\r\nFor compilations, you could use\r\n\r\n[b]%A - %T (%y) [%f]/%n - %a - %t[/b]\r\n\r\nwhich adds the track artist to each track name.\r\n\r\nYou can choose from the following options. Forward slashes (i.e., / )will be translated to new folders:\r\n\r\n%D - disc number\r\n%I - disc id\r\n%A - album artist\r\n%T - album title\r\n%a - track artist\r\n%c - composer\r\n%f - format (the same name as in the &#39;Output format&#39; dropdown, so &#39;FLAC&#39; or &#39;LAME MP3&#39;, etc.)\r\n%g - genre\r\n%i - ISRC\r\n%m - MCN\r\n%n - track number\r\n%t - track title\r\n%y - year\r\n\r\n[b](3)[/b] Set Character encoding of cuesheet to Unicode (UTF-8).\r\n\r\n[b](4)[/b] Set the filename option to Overwrite.\r\n\r\n[b](5)[/b] Check the Automatically check for updates box. XLD will check for new versions whenever it is launched. The XLD developer frequently releases updates, so checking this box is highly recommended.\r\n\r\n[b](6) [/b]The Maximum # of Threads setting is the number of simultaneous audio conversions that XLD will perform. If you have a multi-processor or multi-core Mac, you should change this setting from 2 to however many your system has. It should be set automatically.\r\n\r\n[b](7)[/b] DO NOT check the Correct &quot;30 samples moved offset&quot; problem box. In brief, if you have the box checked, then your CRCs will not match those of EAC or another ripper. There is no reason to check this box if you are ripping a CD. (For a more technical explanation, see this thread. This option can partially fix a problem with EAC&#39;s offset detection, but it is irrelevant for our purposes.)\r\n\r\n[img]http://i.imgur.com/GjzYM.jpg[/img]\r\n\r\nFLAC: We will begin with with General tab. Click on the Output format drop-down menu, select FLAC, and click the Option button. Drag the Compression Level slider to High, and uncheck &quot;Allow to embed cue sheet&quot;. (This option is only relevant if you are ripping a disc to a single file. Uncheck and ignore it.) Then click OK.\r\n\r\n[img]http://i.imgur.com/HoE9l.png[/img]\r\n\r\n[img]http://i.imgur.com/HZnCM.png[/img]\r\n\r\n[b]2.[/b] Now we move on to the Batch tab. It is useful when converting nested directories, such as one folder that contains two more folders with tracks you wish to convert. You can drag the main folder onto XLD&#39;s dock icon and it will batch-convert the folders.\r\n\r\n[b](1)[/b] Check the Preserve directory structures box.\r\n\r\n[b](2)[/b] Set Subdirectory search depth to 0.\r\n\r\n[b](3)[/b] Optionally, check the Automatically split file with embedded cue sheet box. Single-track rips are beyond the scope of this article.\r\n\r\n[img]http://i.imgur.com/QYCIf.jpg[/img]\r\n\r\n[b]3.[/b] The CDDB tab can be left alone. You may edit the settings if you feel so inclined.\r\n\r\n[b]4.[/b] In the Metadata tab, you choose whether or not you want to embed album artwork into files.\r\n\r\n[b](1)[/b] Uncheck the Embed cover art images into files box, if you choose.\r\n\r\n[b](2)[/b] Uncheck the Set the Compilation flag automatically box.\r\n\r\n[b](3)[/b] Edit tags before convert will force XLD to prompt you to review and edit tags before making any conversions, including ripping CDs. Check the box if you choose.\r\n\r\n[b](4)[/b] It is generally okay to leave the Preserve unknown metadata if possible box checked, but you may disable it if you choose.\r\n\r\n[img]http://i.imgur.com/W1cTI.jpg[/img]\r\n\r\n[b]5: CD Rip[/b]\r\nThese settings are crucial to obtaining an exact copy of a disc, and the importance is quantized in the logchecker&#39;s assessment of your extraction log. \r\n\r\n[b](1)[/b] Use the XLD Secure Ripper Mode.\r\n\r\n[b](2) [/b]XLD should be able to read your drive&#39;s Read sample offset correction value automatically. Click the black triangle next to the field to display your drive(s). You can look up your drive in AccurateRip drive offset database. NOTE: Matshita brand drives are listed as Panasonic in the AccurateRip list. Normally, however, XLD can find your drive&#39;s offset, so this step is usually unnecessary.\r\n\r\n[b](3)[/b] If your drive&#39;s read offset is correct, then XLD will try to search the AccurateRip database to verify the integrity of your rip by comparing it to the rips of other people. See http://www.accuraterip.com/ for more information. DO NOT check the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box.\r\n\r\n[b](4)[/b] Always save a log file and cue. Without a log, there is no easy way to verify the quality of your rip.\r\n\r\n[b](5)[/b] Verify suspicious sectors.\r\n\r\n[b](6)[/b] Always enable Test before copy (also called test-and-copy).\r\n\r\n[b](7)[/b] Check the Scan ReplayGain box. Regardles of whether you prefer ReplayGain tags in your music files, ReplayGain should be enabled here. XLD will not add ReplayGain tags to the FLAC files, but it will include peak level information in the ripping log. This is used to help differentiate the different pressings of discs.\r\n\r\n[img]http://i.imgur.com/Djpxp.png[/img]\r\n\r\n[b]Ripping[/b]\r\n\r\nNow that we have configured XLD, we can finally begin ripping CDs. Once you have XLD configured once, you can jump straight to here each time you want to rip a disc.\r\n\r\n[b]1.[/b] Insert the CD into your drive and open XLD (not necessarily in that order).\r\n\r\n[b]2.[/b] Go to File menu &gt; Open Audio CD\r\n\r\n[img]http://i.imgur.com/pj1nV.png[/img]\r\n\r\n[b]3.[/b] XLD will now detect pre-gaps for the disc.\r\n\r\n[img]http://i.imgur.com/cc5Yi.png[/img]\r\n\r\n[img]http://i.imgur.com/mzOVO.png[/img]\r\n\r\n[b]4.[/b] Add tags. Go to CDBB menu &gt; Query Items &gt; and choose the options you would like. It is recommended to not embed artwork, as it may be of low quality or incorrect. It is simplest to include the album cover as an image in your torrent directory, e.g. a cover.jpg or folder.jpg.\r\n\r\n[img]http://i.imgur.com/wn3TQ.png[/img]\r\n\r\nThen, go to CDBB menu &gt; Get CD Track Names to check MusicBrainz and/or FreeDB for tags.\r\n\r\n[img]http://i.imgur.com/onPLE.png[/img]\r\n\r\nIf tags are not found or are incorrect, then manually enter the correct tags. \r\n\r\n[img]http://i.imgur.com/LUPP8.png[/img]\r\n\r\nYou can now enter the artist, album title, year, and disc number automatically for all tracks. Click OK when done.\r\n\r\n[img]http://i.imgur.com/WDvxW.png[/img]\r\n\r\nThen, click the first track to select it, and then hit Command-I again (or go to File menu &gt; Edit Metadata). Enter the correct track title for the first track, then click Next, then enter the correct track title for the second track, then click Next, then.... Repeat until all track titles are entered, and click OK.\r\n\r\n\r\nAt the bottom of this screen before you rip you should select the option &quot;Include pre-gap except for HTOA.&quot; If a CD you rip has hidden track one audio, or a track hidden in the pre-gap (or even simply some empty space as is quite common, and illustrated in this example), this option will cause XLD to rip like EAC and not include the pre-gap audio in the first track.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\n[b]Note:[/b] If you need to extract the hidden track one audio (HTOA), rip the track again using the option &quot;Include pre-gap for all tracks.&quot; This will make XLD rip starting at sector 0 where a hidden track would be instead of where the regular first track begins. Ripping as a single file is another way to extract pre-gap audio, but should be avoided if you are doing just a normal CD rip, as a single file rip will not be scored 100%. It is suggested you do this after copying your first rip elsewhere as not to over-write anything you&#39;ve already done. You may then split the &#39;Track 0&#39; out from this track 0+1 file using other means and may include it in your upload.\r\n\r\n[b]5.[/b] Click open, and XLD will begin extraction. A new window named Progess will appear. XLD will rip the first track once (as a test), and then rip it again (as the copy saved to your disk). The CRCs for both tracks will be written to the log file and checked against the AccurateRip database, if your disc is found. Extraction may take anywhere from 30 minutes to over an hour, depending on your drive, the length of the disc, and the condition of the disc.\r\n\r\n[img]http://i.imgur.com/9rdBS.png[/img]\r\n\r\nWhen the extraction has finished, a new window named Log appears. Because you have told XLD to always save a log file, you can close this window. The log file will appear in same folder as the FLAC files and cue sheet.\r\n\r\n\r\n[b]Log Analysis[/b]\r\n\r\nMain things to look for:\r\n\r\nThe main things you need to look for are log errors, the test CRC hash, the actual rip CRC hash, and AccurateRip results to justify the CRC values from the test and rip.\r\n\r\n[color=#ff0000]LOG CONSOLIDATION WARNING[/color]\r\n\r\n\r\nTHIS IN NO WAY MEANS that you are free to consolidate logs by opening up your original rip log and substituting the faulty rip results with the re-ripped track results. When XLD outputs your original log and any additional track-specific rip logs, DO NOT OPEN THE LOGS. Include all logs for this album in your torrent folder and upload each log individually to the site on the upload page. The site will have no problems reading these logs correctly.\r\n\r\n[color=#ff0000]AccurateRip[/color]\r\n\r\n\r\nAccurateRip may or may not confirm whether an album has been ripped properly: there are false negatives from previous poor submissions, false positives (rarely) from identical bad rips, and many, many albums with no data at all. This is why it the &quot;Treat AccurateRip mismatch as an inconsistency in log&quot; box should be left unchecked.\r\n\r\nAccurateRip should always be enabled. Not only does it mean that you have configured (some) settings correctly, it should also mean that your drive&#39;s offset is correct. AccurateRip matches in the ripping log can suggest that your rip is &quot;accurate&quot;. If you have enabled AccurateRip and the CD you are trying to rip is in its database, [AR] will appear in the title bar for an opened disc.\r\n\r\nXLD cannot currently submit rip results to the AccurateRip database.\r\n\r\n[color=#ff0000]Errors (CDParanoia III 10.2 Ripper Mode)[/color]\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Because XLD uses CDparanoia, logs may sometimes list a number of errors, and they still report the &quot;No errors occurred / End of status report&quot; message at the end. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\n[color=#ff0000][b]Major errors[/b][/color]\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\nRead error\r\nSkipped (treated as error)\r\nInconsistency in error sectors\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by cdparanoia. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\nEdge jitter error\r\nAtom jitter error\r\nDrift Error\r\nDropped bytes error\r\nDuplicated bytes error\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has Edge, Atom, Drop, Drift, or Dupe &quot;maybe fixed&quot; errors is most likely clean. For a detailed discussion of XLD&#39;s error reporting, see this thread at HydrogenAudio.\r\n\r\nErrors (XLD Secure Ripper Mode)\r\n\r\n\r\nSometimes you may get errors in ripping your tracks. Some are still acceptable if you only see a few of them. Other errors are not as good, and they indicate unrecoverable problems with your rips. Since the XLD Secure Ripper reports additional information on rip quality, logs may sometimes list a number of errors and still report the &quot;No errors occurred / End of status report&quot; message. This is similar to a proper EAC rip that reports one or more track quality values of under 100%.\r\n\r\nMajor errors\r\n\r\n\r\nIf you have any of these, you should re-rip those tracks with the errors.\r\n-Read Error\r\n-Damaged Sector Count\r\n\r\nAcceptable errors\r\n\r\n\r\nThese errors are common and most often can be fixed by XLD. They will not affect the quality of your rips. These are labeled as &quot;(maybe fixed)&quot; in the log.\r\n-Jitter error (maybe fixed)\r\n-Retry sector count\r\n\r\nConclusion\r\n\r\n\r\nIf your CRCs match up and you don&#39;t have any of the &quot;bad&quot; errors that are listed above, then your rip is considered good. AccurateRip isn&#39;t that relevant to your rip as things can interfere with the quality of AccurateRip results as stated above. A rip that only has either jitter errors or retry sector count errors is most likely good. Refer to the XLD official release notes for more detailed explanations of each error (under Version 20101115).','2016-11-22 06:28:34',31),(5,1,'User Classes','Listed below are the user classes at [b]What.CD[/b] and their requirements.\r\n\r\n[b][color=#FF0000]Users cannot transcend classes while warned.[/color][/b]\r\n\r\nPlease note that promotion to a higher class is not instantaneous; the promotion script only runs once every couple of hours. Should you have not received the class benefits that you ought to have, please try logging out and logging back in; this will often fix the issue.\r\n\r\n[b][size=4]Primary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]User[/b] - The Default.\r\n[i]Requirements[/i] - None.\r\n[i]Perks[/i] - Can make requests.\r\n\r\n[b]Member[/b] - The First Rung.\r\n[i]Requirements[/i] - Been here for at least 1 week, has uploaded at least 10 GB and a ratio above 0.7.\r\n[i]Perks[/i] - Can edit collages.\r\n[i]Demotions[/i] - Demoted to User when ratio drops below 0.65.\r\n\r\n[b]Power User[/b] - Those With a Little Power.\r\n[i]Requirements[/i] - Been here at least 2 weeks, has uploaded at least 5 torrents and 25 GB, ratio above 1.05.\r\n[i]Perks[/i] - Receives invites, can access notifications and college subscriptions, create new collages, get a personal collage, access to the Power User &amp; Invites forums, can create forum polls, and immunity from inactivity disabling.\r\n[i]Demotions[/i] - Demoted to Member when their uploaded amount drops below 25 GB, their ratio drops below 0.95 or their current uploaded torrent total is less than five.\r\n\r\nWIP','2016-11-24 00:15:22',246),(5,2,'User Classes','Listed below are the user classes at [b]What.CD[/b] and their requirements.\r\n\r\n[b][color=#FF0000]Users cannot transcend classes while warned.[/color][/b]\r\n\r\nPlease note that promotion to a higher class is not instantaneous; the promotion script only runs once every couple of hours. Should you have not received the class benefits that you ought to have, please try logging out and logging back in; this will often fix the issue.\r\n\r\n[b][size=4]Primary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]User[/b] - The Default.\r\n[i]Requirements[/i] - None.\r\n[i]Perks[/i] - Can make requests.\r\n\r\n[b]Member[/b] - The First Rung.\r\n[i]Requirements[/i] - Been here for at least 1 week, has uploaded at least 10 GB and a ratio above 0.7.\r\n[i]Perks[/i] - Can edit collages.\r\n[i]Demotions[/i] - Demoted to User when ratio drops below 0.65.\r\n\r\n[b]Power User[/b] - Those With a Little Power.\r\n[i]Requirements[/i] - Been here at least 2 weeks, has uploaded at least 5 torrents and 25 GB, ratio above 1.05.\r\n[i]Perks[/i] - Receives invites, can access notifications and college subscriptions, create new collages, get a personal collage, access to the Power User &amp; Invites forums, can create forum polls, and immunity from inactivity disabling.\r\n[i]Demotions[/i] - Demoted to Member when their uploaded amount drops below 25 GB, their ratio drops below 0.95 or their current uploaded torrent total is less than five.\r\n\r\n[b]Elite[/b] - The Elite.\r\n[i]Requirements[/i] - Been here at least 4 weeks, has uploaded at least 50 torrents and 100 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Elite forum, Top 10 filters, a second personal collage, and torrent editing privileges.\r\n[i]Demotions[/i] - Demoted to Power User when their uploaded amount drops below 100 GB or their current uploaded torrent total is less than 50. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Torrent Master[/b] - The Select Few.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 torrents and 500 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Torrent Master forum, earns custom title, a third personal collage, and unlimited invites.\r\n[i]Demotions[/i] - Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Power TM[/b] - The Coolest of the Cool.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 GB, ratio above 1.05, and has also uploaded on or more torrents in at least 500 unique groups (albums).\r\n[i]Perks[/i] - Everything Torrent Master gets plus a fourth personal collage.\r\n[i]Demotions[/i] - Demoted to Torrent Master when their current uploaded torrent total contains less than 500 unique groups. Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\nWIP','2016-11-24 00:26:56',246),(5,3,'User Classes','Listed below are the user classes at [b]What.CD[/b] and their requirements.\r\n\r\n[b][color=#FF0000]Users cannot transcend classes while warned.[/color][/b]\r\n\r\nPlease note that promotion to a higher class is not instantaneous; the promotion script only runs once every couple of hours. Should you have not received the class benefits that you ought to have, please try logging out and logging back in; this will often fix the issue.\r\n\r\n[b][size=4]Primary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]User[/b] - The Default.\r\n[i]Requirements[/i] - None.\r\n[i]Perks[/i] - Can make requests.\r\n\r\n[b]Member[/b] - The First Rung.\r\n[i]Requirements[/i] - Been here for at least 1 week, has uploaded at least 10 GB and a ratio above 0.7.\r\n[i]Perks[/i] - Can edit collages.\r\n[i]Demotions[/i] - Demoted to User when ratio drops below 0.65.\r\n\r\n[b]Power User[/b] - Those With a Little Power.\r\n[i]Requirements[/i] - Been here at least 2 weeks, has uploaded at least 5 torrents and 25 GB, ratio above 1.05.\r\n[i]Perks[/i] - Receives invites, can access notifications and college subscriptions, create new collages, get a personal collage, access to the Power User &amp; Invites forums, can create forum polls, and immunity from inactivity disabling.\r\n[i]Demotions[/i] - Demoted to Member when their uploaded amount drops below 25 GB, their ratio drops below 0.95 or their current uploaded torrent total is less than five.\r\n\r\n[b]Elite[/b] - The Elite.\r\n[i]Requirements[/i] - Been here at least 4 weeks, has uploaded at least 50 torrents and 100 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Elite forum, Top 10 filters, a second personal collage, and torrent editing privileges.\r\n[i]Demotions[/i] - Demoted to Power User when their uploaded amount drops below 100 GB or their current uploaded torrent total is less than 50. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Torrent Master[/b] - The Select Few.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 torrents and 500 GB, ratio above 1.05.\r\n[i]Perks[/i] - Access to the Torrent Master forum, earns custom title, a third personal collage, and unlimited invites.\r\n[i]Demotions[/i] - Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Power TM[/b] - The Coolest of the Cool.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 GB, ratio above 1.05, and has also uploaded on or more torrents in at least 500 unique groups (albums).\r\n[i]Perks[/i] - Everything Torrent Master gets plus a fourth personal collage.\r\n[i]Demotions[/i] - Demoted to Torrent Master when their current uploaded torrent total contains less than 500 unique groups. Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]Elite TM[/b] - Masters of the FLAC.\r\n[i]Requirements[/i] - Been here at least 8 weeks, has uploaded at least 500 GB, ratio above 1.05, and has also uploaded at least 500 torrents that are &quot;perfect&quot; FLAC (100% log for CD, or any Vinyl/DVD/Soundboard/WEB/Cassette/Blu-ray/SACD/DAT). Note that you also have to meet the requirements for Power TM (500 unique groups).\r\n[i]Perks[/i] - Everything Power TM gets plus a fifth personal collage.\r\n[i]Demotions[/i] - Demoted to either Power TM or Torrent Master when their current uploaded torrent total contains less than 500 100% CD FLAC and/or Vinyl/DVD/Soundboard/WEB/Cassette/Blu-ray/SACD/DAT FLAC torrents. Demoted to Elite when their uploaded amount drops below 500 GB or their current uploaded torrent total is less than 500. Demoted to Member when their ratio drops below 0.95.\r\n\r\n[b]VIP[/b] - Special People.\r\n[i]Requirements[/i] - Be Awesome.\r\n[i]Perks[/i] - Access to the VIP forum, advanced Wiki editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Legend[/b] - Great Myths Surround These Mystical Entities.\r\n[i]Requirements[/i] - Former staff member.\r\n[i]Perks[/i] - Access to the special forum, advanced Wiki editing, custom title, five personal collages, and can send unlimited invites.\r\n\r\n[b]Forum Moderators[/b] - The Forum Staff.\r\n[i]Requirements[/i] - Don&#39;t ask us; be awesome.\r\n\r\n[b]Staff[/b] - The Staff.\r\nModerator, Developer, Lead Developer, Administrator, and System Administrator.\r\n\r\n[b][size=4]Secondary User Classes[/size][/b]\r\n\r\n\r\n\r\n[b]Artist[/b] - The Musicians.\r\nThese people can advertise their albums on the &#39;Latest vanity house additions&#39; list. See [url=https://what.cd/forums.php?action=viewthread&amp;threadid=80529]here[/url] for more details.\r\n\r\n\r\nWIP','2016-11-24 00:38:32',246);
/*!40000 ALTER TABLE `wiki_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_torrents`
--

DROP TABLE IF EXISTS `wiki_torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_torrents` (
  `RevisionID` int(12) NOT NULL AUTO_INCREMENT,
  `PageID` int(10) NOT NULL DEFAULT '0',
  `Body` text,
  `UserID` int(10) NOT NULL DEFAULT '0',
  `Summary` varchar(100) DEFAULT NULL,
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RevisionID`),
  KEY `PageID` (`PageID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_torrents`
--

LOCK TABLES `wiki_torrents` WRITE;
/*!40000 ALTER TABLE `wiki_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_client_whitelist`
--

DROP TABLE IF EXISTS `xbt_client_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xbt_client_whitelist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peer_id` varchar(20) DEFAULT NULL,
  `vstring` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_id` (`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xbt_client_whitelist`
--

LOCK TABLES `xbt_client_whitelist` WRITE;
/*!40000 ALTER TABLE `xbt_client_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_client_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_files_users`
--

DROP TABLE IF EXISTS `xbt_files_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xbt_files_users` (
  `uid` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `announced` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `downloaded` bigint(20) NOT NULL DEFAULT '0',
  `remaining` bigint(20) NOT NULL DEFAULT '0',
  `uploaded` bigint(20) NOT NULL DEFAULT '0',
  `upspeed` int(10) unsigned NOT NULL DEFAULT '0',
  `downspeed` int(10) unsigned NOT NULL DEFAULT '0',
  `corrupt` bigint(20) NOT NULL DEFAULT '0',
  `timespent` int(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(51) NOT NULL DEFAULT '',
  `connectable` tinyint(4) NOT NULL DEFAULT '1',
  `peer_id` binary(20) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fid` int(11) NOT NULL,
  `mtime` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`peer_id`,`fid`,`uid`),
  KEY `remaining_idx` (`remaining`),
  KEY `fid_idx` (`fid`),
  KEY `mtime_idx` (`mtime`),
  KEY `uid_active` (`uid`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xbt_files_users`
--

LOCK TABLES `xbt_files_users` WRITE;
/*!40000 ALTER TABLE `xbt_files_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_files_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_snatched`
--

DROP TABLE IF EXISTS `xbt_snatched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xbt_snatched` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `IP` varchar(15) NOT NULL,
  KEY `fid` (`fid`),
  KEY `tstamp` (`tstamp`),
  KEY `uid_tstamp` (`uid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xbt_snatched`
--

LOCK TABLES `xbt_snatched` WRITE;
/*!40000 ALTER TABLE `xbt_snatched` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_snatched` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-23 21:20:56

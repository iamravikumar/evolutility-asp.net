/* Bugs and feature requests Database    */
/* www.evolutility.org - (c) 2012 Olivier Giulieri  */
/*
	This file is part of Evolutility CRUD Framework.
	Source link <http://www.evolutility.org/download/download.aspx>

	Evolutility is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Evolutility is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU Affero General Public License Version 3
	along with Evolutility. If not, see <http://www.fsf.org/licensing/licenses/agpl-3.0.html>.
*/


/****** Object:  Table `Bug`   ******/ 
CREATE TABLE `Bug`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`UserID`  int(10) unsigned DEFAULT 1,
	`Publish` int(10) unsigned default 0,
	`Title` varchar(100) DEFAULT 'Untitled',
	`Description` varchar(3000) NULL,
	`ProductID`  int(10) unsigned DEFAULT 1,
	`SeverityID`  int(10) unsigned DEFAULT 1,
	`PriorityID`  int(10) unsigned DEFAULT 1,
	`StatusID`  int(10) unsigned DEFAULT 1,
	`ResolutionID` int(10) unsigned DEFAULT 1,
	`SubmitDate`  timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	`ExpectedDate`  timestamp NULL ,
	`CloseDate` timestamp NULL ,
	`CloseRelease` varchar(10) NULL,
	`ErrorMSG` varchar(500) NULL,
	`DevComments` varchar(300) NULL,
	`Acknowledged` timestamp NULL,
	`Expected_Fix` timestamp NULL,
	`LongDescription` varchar(50) NULL,
	`Workaround` varchar(500) NULL,
	`Reproduction` varchar(500) NULL,
	`Demo1` varchar(100) NULL,
	`BDesign` int(10) unsigned default 0,
	`BSQL` int(10) unsigned default 0,
	`BXML` int(10) unsigned default 0,
	`BHTML` int(10) unsigned default 0,
	`BJavascript` int(10) unsigned default 0,
	`User_Management` int(10) unsigned default 0,
	`Integration` int(10) unsigned default 0,
	`CommentCount` int(10) unsigned DEFAULT 0,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/****** Object:  Table `BugPriority`  ******/ 
CREATE TABLE `BugPriority`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`name_FR` varchar(50) NULL,
	`description` varchar(200) NULL,
	`description_FR` varchar(200) NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/****** Object:  Table `EvolProduct`   ******/ 
CREATE TABLE `EvolProduct`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`name` varchar(255) NOT NULL,
	`Description` varchar(1000) NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/****** Object:  Table `BugResolution` ******/ 
CREATE TABLE `BugResolution`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`name` varchar(50) NULL,
	`name_FR` varchar(50) NULL,
	`description` varchar(200) NULL,
	`description_FR` varchar(200) NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/****** Object:  Table `BugSeverity` ******/ 
CREATE TABLE `BugSeverity`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`name` varchar(50) NOT NULL,
	`name_FR` varchar(50) NULL,
	`description` varchar(200) NULL,
	`description_FR` varchar(200) NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/****** Object:  Table `BugStatus`   ******/ 
CREATE TABLE `BugStatus`(
	`ID`  int(10) unsigned NOT NULL auto_increment,
	`name` varchar(100) NOT NULL,
	`name_FR` varchar(100) NULL,
	`description` varchar(200) NULL,
	`description_FR` varchar(200) NULL, 
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*** ExportWizard BugPriority ***/
 

INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (1, '1 - Top Priority', '1 - Prioritaire', '', '');
INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (2, '2 - Urgent', '2 - Urgent', '', '');
INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (3, '3 - Normal', '3 - Régulier', '', '');
INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (4, '4 - Secondary', '4 - Secondaire', '', '');
INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (5, '5 - Nice to have', '5 - A considérer', '', '');
INSERT INTO BugPriority (ID, `name`, name_FR, description, description_FR)
  VALUES (6, 'N/A', '6 - Non renseigné', '', '');
 
 

INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (1, 'N/A', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (2, 'Fixed', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (3, 'Invalid', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (4, 'Won''t fix', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (5, 'Duplicate', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (6, 'Works for me', '', '', '');
INSERT INTO BugResolution (ID, name, name_FR, description, description_FR)
  VALUES (7, 'Moved', '', '', '');
 

INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (1, 'Blocker', '1 - Grave', '', '');
INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (2, 'Critical', '2 - Critique', '', '');
INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (3, 'Major', '3 - Majeur', '', '');
INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (4, 'Minor', '4 - Mineur', '', '');
INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (5, 'Trivial', '5 - Simple', '', '');
INSERT INTO BugSeverity (ID, name, name_FR, description, description_FR)
  VALUES (6, 'Enhancement', '6 - Evolution', '', '');
 

INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (1, 'Unconfirmed', 'Non confirmé', '', '');
INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (2, 'New', 'Nouveau', '', '');
INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (3, 'Assigned', 'Assigné', '', '');
INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (4, 'Re-Opened', 'Re-Ouvert', '', '');
INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (5, 'Resolved', 'Résolut', '', '');
INSERT INTO BugStatus (ID, name, name_FR, description, description_FR)
  VALUES (6, 'Verified', 'Vérifié', '', '');
 

/*** ExportWizard Bug  ***/
 
INSERT INTO Bug (ID, UserID, Publish, Title, Description, ProductID, SeverityID, PriorityID, StatusID, ResolutionID, SubmitDate, ExpectedDate, CloseDate, CloseRelease, ErrorMSG, DevComments, Acknowledged, Expected_Fix, LongDescription, Workaround, Reproduction, Demo1, BDesign, BSQL, BXML, BHTML, BJavascript, User_Management, Integration, CommentCount)
  VALUES (1, 0, 1, 'Tabs don''t work w/ IE 6', 'Tabs are displayed but do not respond to mouse click', 1, 2, 2, 2, 1, '2007-12-11 12:00:00 AM', '2008-1-1 01:46:21 PM', '2008-1-1 01:46:21 PM', '', '', '', NULL, NULL, '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0);


/*** ExportWizard `EvolProduct`  ***/
 

INSERT INTO `EvolProduct`(`ID`,`name`,`Description`)
  VALUES ( 1, 'Evolutility', 'Lightweight web framework for heavylifting');

INSERT INTO `EvolProduct`(`ID`,`name`,`Description`)
  VALUES ( 2, 'EvoDico', 'Database Dictionary for Evolutility');

 

GO


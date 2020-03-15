-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2020 at 05:21 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fac_dash`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicinfo`
--

DROP TABLE IF EXISTS `academicinfo`;
CREATE TABLE IF NOT EXISTS `academicinfo` (
  `fid` decimal(8,0) NOT NULL,
  `year` int(4) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  UNIQUE KEY `fid` (`fid`,`qualification`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academicinfo`
--

INSERT INTO `academicinfo` (`fid`, `year`, `qualification`, `place`) VALUES
('20171521', 2018, 'PhD in Information and Communication Engineering', 'Anna University, Chennai, India'),
('20171521', 2007, 'ME in Computer Science and Engineering', 'Sri Sivasubramaniya Nadar (SSN) College of Engineering, Chennai, India'),
('20171521', 2003, 'BE in Computer Science and Engineering', 'Kongu Engineering College, Perundurai, Erode, Tamilnadu, India');

-- --------------------------------------------------------

--
-- Table structure for table `acheivement`
--

DROP TABLE IF EXISTS `acheivement`;
CREATE TABLE IF NOT EXISTS `acheivement` (
  `aid` decimal(8,0) NOT NULL,
  `aname` varchar(100) DEFAULT NULL,
  `adate` date DEFAULT NULL,
  `fid` decimal(8,0) DEFAULT NULL,
  `visibility` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acheivement`
--

INSERT INTO `acheivement` (`aid`, `aname`, `adate`, `fid`, `visibility`) VALUES
('10001', 'Best Ecofriendly project in Greenokha', '2020-02-14', '20171521', 'Show'),
('10002', 'Best faculty of the semester', '2019-04-06', '20171521', 'Show'),
('24696', 'asdfgh', '2020-01-01', '20171521', 'Hide');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `fid` decimal(8,0) DEFAULT NULL,
  `hodid` decimal(8,0) DEFAULT NULL,
  `apptdate` date DEFAULT NULL,
  `appttime` time DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `apptstatus` varchar(20) DEFAULT NULL,
  `aid` int(6) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `fid` (`fid`,`hodid`,`apptdate`,`appttime`),
  KEY `hodid_constr` (`hodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`fid`, `hodid`, `apptdate`, `appttime`, `purpose`, `apptstatus`, `aid`) VALUES
('20171521', '10012001', '2020-02-05', '13:30:00', 'Greenokha prize winners', 'Approved', 100002),
('20171521', '10012001', '2020-03-06', '15:00:00', 'sdkfhgda', 'Denied', 755596);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `deptid` decimal(4,0) NOT NULL,
  `deptname` varchar(30) DEFAULT NULL,
  `hodid` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptid`, `deptname`, `hodid`) VALUES
('1001', 'CSE', '10012001'),
('1002', 'EEE', '10022002'),
('1003', 'ECE', '10032003'),
('1004', 'IT', '30142835');

-- --------------------------------------------------------

--
-- Table structure for table `fdbleave`
--

DROP TABLE IF EXISTS `fdbleave`;
CREATE TABLE IF NOT EXISTS `fdbleave` (
  `lid` decimal(8,0) NOT NULL,
  `ltype` varchar(30) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  `adate` date DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `lstatus` varchar(20) DEFAULT NULL,
  `fid` decimal(8,0) DEFAULT NULL,
  `hodid` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `fid` (`fid`),
  KEY `hodid` (`hodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fdbleave`
--

INSERT INTO `fdbleave` (`lid`, `ltype`, `sdate`, `edate`, `adate`, `reason`, `lstatus`, `fid`, `hodid`) VALUES
('12340001', 'Casual', '2020-02-05', '2020-02-05', '2020-01-30', 'Family get together', 'Approved', '20171521', '10012001'),
('12340002', 'Medical', '2020-02-01', '2020-02-03', '2020-01-30', 'Monthly checkup', 'Pending', '10022006', '10022002'),
('12340003', 'Emergency', '2020-01-29', '2020-01-31', '2020-01-28', 'Fever', 'Pending', '10032007', '10032003'),
('12341005', 'Casual', '2020-01-09', '2020-01-09', '2020-01-06', 'Going out of station for personal work', 'Approved', '20171521', '10012001'),
('77581435', 'medical', '2020-02-12', '2020-02-15', '2020-02-12', 'Hay fever', 'Denied', '20171521', '10012001');

-- --------------------------------------------------------

--
-- Table structure for table `fdbuser`
--

DROP TABLE IF EXISTS `fdbuser`;
CREATE TABLE IF NOT EXISTS `fdbuser` (
  `fid` decimal(8,0) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `acctype` varchar(20) DEFAULT NULL,
  `fposition` varchar(20) DEFAULT NULL,
  `deptid` decimal(4,0) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `facsince` date DEFAULT NULL,
  `courses` varchar(100) DEFAULT NULL,
  `locked` varchar(1) DEFAULT NULL,
  `count` int(1) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `deptid` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fdbuser`
--

INSERT INTO `fdbuser` (`fid`, `fname`, `lname`, `phone`, `email`, `acctype`, `fposition`, `deptid`, `gender`, `salary`, `facsince`, `courses`, `locked`, `count`) VALUES
('10012001', 'Lily ', 'Thomson', '5550001212', 'lily.t@gmail.com', 'hod', 'HOD', '1001', 'F', '90000', '1998-07-13', 'Machine Learning, Neural Networks,Data Science', 'N', 0),
('10012004', 'Charlie', 'West', '5550005656', 'charlie.w@gmail.com', 'faculty', 'Assistant Professor', '1001', 'M', '50000', '2012-06-25', NULL, 'Y', 5),
('10012005', 'Jessica', 'Campbell', '5550003765', 'jessica.c@gmail.com', 'faculty', 'Professor', '1001', 'F', '70000', '2015-09-08', NULL, NULL, NULL),
('10022002', 'James', 'Henderson', '5550002323', 'james.h@gmail.com', 'hod', 'HOD', '1002', 'M', '90000', '1998-12-08', NULL, NULL, NULL),
('10022006', 'Serena', 'Woods', '5550008767', 'serena.w@gmail.com', 'faculty', 'Assistant Professor', '1002', 'F', '50000', '2011-09-03', NULL, NULL, NULL),
('10032003', 'Jack', 'Bass', '5550003434', 'jack.b@gmail.com', 'hod', 'HOD', '1003', 'M', '90000', '2000-05-15', NULL, NULL, NULL),
('10032007', 'Julia', 'Michaels', '5550001678', 'julia.m@gmail.com', 'faculty', 'Professor', '1003', 'F', '70000', '2016-10-07', NULL, NULL, NULL),
('20171521', 'Sai Srihitha Reddy', 'Thummala', '9597856932', 'srihithareddy100@gmail.com', 'faculty', 'Professor', '1001', 'F', '315424', '2017-03-22', 'Operating System, C programming, Embedded Systems, Machine Learning', 'N', 0),
('30142835', 'Vidhya ', 'Sivaramakrishnan', '9562664686', 's_vidhya@cb.amrita.edu', 'hod', 'hod', '1004', 'F', '90000', '1990-11-02', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hod`
--

DROP TABLE IF EXISTS `hod`;
CREATE TABLE IF NOT EXISTS `hod` (
  `hodid` decimal(8,0) NOT NULL,
  `deptid` decimal(8,0) DEFAULT NULL,
  `empno` decimal(8,0) DEFAULT NULL,
  `hodsince` date DEFAULT NULL,
  PRIMARY KEY (`hodid`),
  KEY `deptid` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hod`
--

INSERT INTO `hod` (`hodid`, `deptid`, `empno`, `hodsince`) VALUES
('10012001', '1001', '3', '2006-06-05'),
('10022002', '1002', '1', '2008-07-12'),
('10032003', '1003', '1', '2010-06-15'),
('30142835', '1004', '1', '2010-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `leaveinfo`
--

DROP TABLE IF EXISTS `leaveinfo`;
CREATE TABLE IF NOT EXISTS `leaveinfo` (
  `fid` decimal(8,0) NOT NULL,
  `ltype` varchar(30) DEFAULT NULL,
  `lavailable` decimal(5,0) DEFAULT NULL,
  `lremaining` decimal(5,0) DEFAULT NULL,
  `ltaken` decimal(5,0) DEFAULT NULL,
  UNIQUE KEY `fid` (`fid`,`ltype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaveinfo`
--

INSERT INTO `leaveinfo` (`fid`, `ltype`, `lavailable`, `lremaining`, `ltaken`) VALUES
('30001284', 'Casual', '5', '25', '5'),
('20171521', 'Casual', '12', '10', '7'),
('20171521', 'Medical', '15', '15', '0');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `fid` decimal(8,0) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `acctype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`fid`, `pwd`, `acctype`) VALUES
('10012001', 'f2001', 'hod'),
('10012004', 'f2004', 'faculty'),
('10012005', 'f2005', 'faculty'),
('10022002', 'f2002', 'hod'),
('10022006', 'f2006', 'faculty'),
('10032003', 'f2003', 'hod'),
('10032007', 'f2007', 'faculty'),
('20171521', 'srihitha', 'faculty'),
('30001284', 'jeyakumar123', 'faculty'),
('30142835', 'vidhya123', 'hod');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
CREATE TABLE IF NOT EXISTS `meetings` (
  `hodid` decimal(8,0) DEFAULT NULL,
  `mdate` date DEFAULT NULL,
  `mtime` time DEFAULT NULL,
  `agenda` varchar(20) DEFAULT NULL,
  `mid` int(5) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `mid` (`mid`),
  KEY `hodid` (`hodid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`hodid`, `mdate`, `mtime`, `agenda`, `mid`, `status`) VALUES
('30142835', '2020-02-20', '16:30:00', 'Student performance', 10001, 'Finished'),
('10012001', '2020-02-10', '10:00:00', 'Anokha budget', 1853, 'Upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `otherinfo`
--

DROP TABLE IF EXISTS `otherinfo`;
CREATE TABLE IF NOT EXISTS `otherinfo` (
  `fid` decimal(8,0) NOT NULL,
  `age` int(5) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `clubs` varchar(30) DEFAULT NULL,
  `emgphone` decimal(10,0) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `bloodgrp` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otherinfo`
--

INSERT INTO `otherinfo` (`fid`, `age`, `dob`, `clubs`, `emgphone`, `address`, `bloodgrp`) VALUES
('20171521', 28, '1992-10-06', 'Sahaya', '7397075953', 'Coimbatore,Kgchavadi,india,641112', 'AB+');

-- --------------------------------------------------------

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
CREATE TABLE IF NOT EXISTS `papers` (
  `pid` decimal(4,0) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `fid` decimal(8,0) DEFAULT NULL,
  `publishedin` varchar(100) DEFAULT NULL,
  `visibility` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `papers`
--

INSERT INTO `papers` (`pid`, `title`, `link`, `pdate`, `fid`, `publishedin`, `visibility`) VALUES
('1001', 'Machine Learning Papers', 'https://www.ieee.org/publications/index.html', '2020-10-20', '20171521', 'IEEE', 'Show'),
('3588', '', '', '2000-01-01', '20171521', '', 'Hide'),
('6255', '', '', '2000-01-01', '20171521', '', 'Hide');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `fid` decimal(8,0) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `stime` time DEFAULT NULL,
  `agenda` varchar(50) DEFAULT NULL,
  `sid` int(6) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`fid`, `type`, `sdate`, `stime`, `agenda`, `sid`) VALUES
('30142835', 'Important', '2020-08-20', '15:30:00', 'Students performance', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `secquesans`
--

DROP TABLE IF EXISTS `secquesans`;
CREATE TABLE IF NOT EXISTS `secquesans` (
  `fid` decimal(8,0) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `q5` varchar(100) NOT NULL,
  UNIQUE KEY `fid` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secquesans`
--

INSERT INTO `secquesans` (`fid`, `q1`, `q2`, `q3`, `q4`, `q5`) VALUES
('20171521', 'Aavula', 'Sunny', 'Kukatpally', 'Hyderabad', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

DROP TABLE IF EXISTS `workshop`;
CREATE TABLE IF NOT EXISTS `workshop` (
  `wid` int(4) NOT NULL,
  `wname` varchar(100) NOT NULL,
  `wdate` date NOT NULL,
  `wplace` varchar(100) NOT NULL,
  `attended` varchar(20) NOT NULL,
  `fid` decimal(8,0) NOT NULL,
  `visibility` varchar(4) DEFAULT NULL,
  UNIQUE KEY `wid` (`wid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`wid`, `wname`, `wdate`, `wplace`, `attended`, `fid`, `visibility`) VALUES
(1001, 'Student workshop on android app development ', '2019-09-14', 'SWAD', 'Conducted', '20171521', 'Show'),
(1002, 'Workshop on \'Publishing your research\' for PG students for 3 days', '2018-05-16', 'Amrita Vishwa Vidyapeetham', 'Conducted', '20171521', 'Show'),
(1467, 'asdfgvh', '2020-01-01', 'asdfgh', 'Conducted', '20171521', 'Hide');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fid_constr` FOREIGN KEY (`fid`) REFERENCES `fdbuser` (`fid`),
  ADD CONSTRAINT `hodid_constr` FOREIGN KEY (`hodid`) REFERENCES `hod` (`hodid`);

--
-- Constraints for table `secquesans`
--
ALTER TABLE `secquesans`
  ADD CONSTRAINT `fid_constr1` FOREIGN KEY (`fid`) REFERENCES `fdbuser` (`fid`);

--
-- Constraints for table `workshop`
--
ALTER TABLE `workshop`
  ADD CONSTRAINT `workshop_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `fdbuser` (`fid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

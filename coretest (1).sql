-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2018 at 02:26 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coretest`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_files_cd` ()  NO SQL
BEGIN

SELECT c_filename FROM contract_document GROUP by c_project;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertlanguage_language` (IN `lcode` VARCHAR(200), IN `lname` VARCHAR(200))  NO SQL
BEGIN
insert into language (language_code,language_name,status) values(lcode,lname,'active');

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertmultiplefiles_cd` (IN `project` VARCHAR(300), IN `location` VARCHAR(300), IN `type` VARCHAR(150), IN `startdate` DATE, IN `enddate` DATE, IN `filename` VARCHAR(150), IN `fileext` VARCHAR(150), IN `cdstatus` VARCHAR(150), IN `empid` BIGINT(10), IN `filepath` VARCHAR(300))  NO SQL
BEGIN

insert into contract_document(c_project,c_location,c_type,c_startdate,c_enddate,c_filename,c_fileext,status,emp_id,file_path) values(project,location,type,startdate,enddate,filename,fileext,cdstatus,empid,filepath);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertmultiplefiles_rm` (IN `empid` BIGINT(10), IN `project` VARCHAR(300), IN `location` VARCHAR(300), IN `rtype` VARCHAR(300), IN `daterange` VARCHAR(300), IN `startdate` DATE, IN `enddate` DATE, IN `reviewedon` VARCHAR(300), IN `reviewedby` VARCHAR(300), IN `filename` VARCHAR(300), IN `fileext` VARCHAR(300), IN `filepath` VARCHAR(300))  NO SQL
BEGIN

insert into review_meeting(emp_id,r_project,r_location,r_type,period,start_period,end_period,reviewed_on,reviewed_by,file_name,file_ext,file_path) values(empid,project,location,rtype,daterange,startdate,enddate,reviewedon,reviewedby,filename,fileext,filepath);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showalldata_cd` ()  NO SQL
BEGIN
SELECT * FROM contract_document;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showfiles1_cd` (IN `empid` INT(20))  NO SQL
BEGIN
SELECT c_project,c_location,c_type,c_startdate,c_enddate,GROUP_CONCAT(DISTINCT CONCAT(file_path)) AS fullpath FROM contract_document WHERE emp_id = empid GROUP BY c_project;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showfiles1_rm` (IN `empid` BIGINT(10))  NO SQL
BEGIN

SELECT r_project,r_location,r_type,period,start_period,end_period,reviewed_on,reviewed_by,GROUP_CONCAT(DISTINCT CONCAT(file_path)) AS fullpath FROM review_meeting WHERE emp_id = empid GROUP BY r_project;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showfile_cd` (IN `empid` INT(20))  NO SQL
BEGIN

SELECT * ,GROUP_CONCAT(DISTINCT CONCAT(file_path)) as filelist FROM contract_document WHERE emp_id = empid GROUP by c_project;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_test_cd` (IN `project` VARCHAR(50), IN `file1` VARCHAR(150), IN `file2` VARCHAR(150), IN `file3` VARCHAR(150), IN `file4` VARCHAR(150), IN `ext` VARCHAR(150), IN `empid` BIGINT(10))  NO SQL
BEGIN

insert into test(c_project,file1,file2,file3,file4,ext,emp_id) values(project,file1,file2,file3,file4,ext,empid);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `billingtype`
--

CREATE TABLE `billingtype` (
  `id` int(10) NOT NULL,
  `billing_code` varchar(150) NOT NULL,
  `billing_type` varchar(150) NOT NULL,
  `billing_category` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billingtype`
--

INSERT INTO `billingtype` (`id`, `billing_code`, `billing_type`, `billing_category`, `status`) VALUES
(1, 'a', 'a', 'a', 'active'),
(2, '11', '11', '11', 'active'),
(3, '2', '2', '2', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` int(10) NOT NULL,
  `channel_name` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `channel_name`, `status`) VALUES
(1, 'sdfg', 'inactive'),
(2, 'Voice', 'active'),
(3, 'Email', 'active'),
(10, 'qqq', 'inactive'),
(11, 'sekhar', 'inactive'),
(12, 'Voice', 'inactive'),
(13, 'sdafsd', 'inactive'),
(14, '1', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `contract_document`
--

CREATE TABLE `contract_document` (
  `id` int(10) NOT NULL,
  `emp_id` bigint(10) NOT NULL,
  `c_project` varchar(300) NOT NULL,
  `c_location` varchar(300) NOT NULL,
  `c_type` varchar(300) NOT NULL,
  `c_startdate` date NOT NULL,
  `c_enddate` date NOT NULL,
  `c_filename` varchar(300) NOT NULL,
  `c_fileext` varchar(300) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract_document`
--

INSERT INTO `contract_document` (`id`, `emp_id`, `c_project`, `c_location`, `c_type`, `c_startdate`, `c_enddate`, `c_filename`, `c_fileext`, `file_path`, `status`) VALUES
(1, 115341, 'Alarm.com', 'Costa Rica', 'SOW', '2018-04-05', '2018-04-19', 'Weekly_Task', 'xlsx', 'multiple_uploads/Weekly_Task.xlsx', 'active'),
(2, 115341, 'Alarm.com', 'Costa Rica', 'SOW', '2018-04-05', '2018-04-19', 'Zempmas', 'XLSX', 'multiple_uploads/Zempmas.XLSX', 'active'),
(3, 7128, 'Activision', 'China', 'SOW', '2018-04-04', '2018-04-26', 'Annexure_A_Work_Environment_Standards', 'pdf', 'multiple_uploads/Annexure_A_Work_Environment_Standards.pdf', 'active'),
(4, 7128, 'Activision', 'China', 'SOW', '2018-04-04', '2018-04-26', 'Core_Portal-DB-Tbl-cols', 'xlsx', 'multiple_uploads/Core_Portal-DB-Tbl-cols.xlsx', 'active'),
(5, 7128, 'Activision', 'China', 'SOW', '2018-04-04', '2018-04-26', 'metric', 'csv', 'multiple_uploads/metric.csv', 'active'),
(6, 113124, 'Alarm.com', 'China', 'MSA', '2018-04-04', '2018-04-19', 'Annexure_A_Work_Environment_Standards', 'pdf', 'multiple_uploads/Annexure_A_Work_Environment_Standards.pdf', 'active'),
(7, 113124, 'Alarm.com', 'China', 'MSA', '2018-04-04', '2018-04-19', 'logout_sheet', 'xlsx', 'multiple_uploads/logout_sheet.xlsx', 'active'),
(8, 113124, 'Alarm.com', 'China', 'MSA', '2018-04-04', '2018-04-19', 'metric', 'csv', 'multiple_uploads/metric.csv', 'active'),
(9, 115341, 'Belkin', 'India', 'MSA', '2018-04-04', '2018-04-27', 'Annexure_A_Work_Environment_Standards', 'pdf', 'multiple_uploads/Annexure_A_Work_Environment_Standards.pdf', 'active'),
(10, 115341, 'Belkin', 'India', 'MSA', '2018-04-04', '2018-04-27', 'Zempmas', 'XLSX', 'multiple_uploads/Zempmas.XLSX', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `core_usergroup`
--

CREATE TABLE `core_usergroup` (
  `id` int(11) NOT NULL,
  `groupname` varchar(300) NOT NULL,
  `projectname` varchar(300) NOT NULL,
  `menu` varchar(500) NOT NULL,
  `status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `core_usergroup`
--

INSERT INTO `core_usergroup` (`id`, `groupname`, `projectname`, `menu`, `status`) VALUES
(1, 'mis', 'All', '1,2,3,4,5,6,11,12', 'active'),
(2, 'netgear', 'Netgear1', '1,2,3,4,7,8', 'active'),
(3, 'vonage', 'vonage1', '1,2,3,4,7,8,9,10,11', 'active'),
(4, 'netgear', 'Netgear2', '1,3,4,8,10', 'active'),
(5, 'vonage', 'Vonage2', '1,2,4,7,10,15', 'active'),
(6, 'corel', 'corel1', '1,2,3,6,10,13', 'active'),
(7, 'marketo', 'Marketo', '1,2,3,4,5,6,8,9,10,12', 'active'),
(8, 'belkin', 'Belkin', '1,2,3,5,8,9,10,11,12,13,14,15', 'active'),
(9, 'TRE', 'TRE', '1,2,3', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `cust_name` varchar(150) NOT NULL,
  `cust_sapno` varchar(150) NOT NULL,
  `cust_account_code` varchar(150) NOT NULL,
  `cust_market_segment` varchar(300) NOT NULL,
  `cust_hqaddress` varchar(150) NOT NULL,
  `cust_website` varchar(300) NOT NULL,
  `cust_sales_region` varchar(150) NOT NULL,
  `cust_contact_name` varchar(150) NOT NULL,
  `cust_contact_designation` varchar(150) NOT NULL,
  `cust_contact_email` varchar(150) NOT NULL,
  `cust_contact_phone` bigint(10) NOT NULL,
  `cust_contact_name1` varchar(150) NOT NULL,
  `cust_contact_designation1` varchar(150) NOT NULL,
  `cust_contact_email1` varchar(150) NOT NULL,
  `cust_contact_phone1` bigint(10) NOT NULL,
  `cust_startdate` date NOT NULL,
  `cust_enddate` date NOT NULL,
  `cust_billingaddress` varchar(150) NOT NULL,
  `cust_css_salesperson` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `cust_name`, `cust_sapno`, `cust_account_code`, `cust_market_segment`, `cust_hqaddress`, `cust_website`, `cust_sales_region`, `cust_contact_name`, `cust_contact_designation`, `cust_contact_email`, `cust_contact_phone`, `cust_contact_name1`, `cust_contact_designation1`, `cust_contact_email1`, `cust_contact_phone1`, `cust_startdate`, `cust_enddate`, `cust_billingaddress`, `cust_css_salesperson`, `status`) VALUES
(1, 'Belkin pvt ltd', '5', '2456123', '4', '5', 'belkin.com', '5', 'sekhar', 'Employee', 'sharma@gmail.com', 1234567890, 'reddy', 'employee', 'reddy@gmail.com', 1234567890, '2018-04-30', '2018-04-04', '1', 'Rajasekhar', 'active'),
(2, '4', '1', '1', '1', '1', '1', '1', '4', '4', '4', 4, '', '', '', 0, '2018-04-26', '2018-04-28', '1', '4', 'active'),
(3, '78', '65', '12', '90', '80', '32', '1', '1', '2', '1', 2, '', '', '', 0, '2018-04-12', '2018-04-12', '1', '2', 'active'),
(4, 'raja', '55', '123', 'som', 'som', 'www.som.com', 'Chennai', 'rajasekhar', 'Employee', 'sharma@gmail.com', 1234567890, '', '', '', 0, '2018-05-05', '2018-04-30', 'Chennai', 'Rajasekhar', 'active'),
(5, 'Belkin', '55', '456', 'som', 'som', 'belkin.com', 'Chennai', 'Sharma', 'Employee', 'sharma@gmail.com', 1234567890, '', '', '', 0, '2018-04-07', '2018-04-21', 'Chennai', 'Rajasekhar', 'active'),
(6, 'Belkin', '55', '456', 'som', 'som', 'belkin.com', 'Chennai', 'Sharma', 'Employee', 'sharma@gmail.com', 1234567890, '', '', '', 0, '2018-04-07', '2018-04-21', 'Chennai', 'Rajasekhar', 'active'),
(7, 'Belkin', '55', '456', 'som', 'som', 'belkin.com', 'Chennai', 'Sharma', 'Employee', 'sharma@gmail.com', 1234567890, '', '', '', 0, '2018-04-07', '2018-04-21', 'Chennai', 'Rajasekhar', 'active'),
(8, 'Belkin', '55', '456', 'som', 'som', 'belkin.com', 'Chennai', 'Sharma', 'Employee', 'sharma@gmail.com', 1234567890, '', '', '', 0, '2018-04-07', '2018-04-21', 'Chennai', 'Rajasekhar', 'active'),
(9, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active'),
(10, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active'),
(11, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active'),
(12, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active'),
(13, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active'),
(14, '1', '55', '1', '1', '1', '1', '1', '1', '1', '1', 1, '', '', '', 0, '2018-04-07', '2018-04-21', '1', '1', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `name`) VALUES
(1, 'SOW'),
(2, 'MSA'),
(3, 'LOI');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_no` varchar(150) NOT NULL,
  `emp_name` varchar(150) NOT NULL,
  `emp_password` varchar(300) NOT NULL,
  `emp_hiredate` date NOT NULL,
  `emp_emailid` varchar(150) NOT NULL,
  `emp_usertype` varchar(300) NOT NULL,
  `emp_usergroup` varchar(300) DEFAULT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_no`, `emp_name`, `emp_password`, `emp_hiredate`, `emp_emailid`, `emp_usertype`, `emp_usergroup`, `status`) VALUES
(1, '115341', 'rajasekhar', 'password', '2018-03-07', 'raja@csscorp.com', 'User', 'mis', 'active'),
(7, '108741', 'murali', 'password', '2018-02-08', 'murali@csscorp.com', 'User', 'mis', 'active'),
(8, '111222', 'vasu', 'password', '2018-01-11', 'vasu@csscorp.com', 'Admin,Super Admin,User', 'mis', 'active'),
(9, '111223', 'Sunish Podiyan', 'password', '2018-02-07', 'sunish.podiyan@csscorp.com', 'Admin,Super Admin,User', 'mis', 'active'),
(11, '111224', 'sampath', 'password', '2017-08-03', 'sampath@csscorp.com', 'Super Admin,User', 'netgear', 'active'),
(12, '111225', 'prakash', 'password', '2017-12-13', 'prakash@csscorp.com', 'Super Admin,User', 'vonage', 'active'),
(13, '111101', 'marketo employee', 'password', '2018-04-05', 'marketo1@gmail.com', 'Admin,User', 'marketo', 'active'),
(14, '111121', 'TRE1', 'password', '2018-05-02', 'TRE@csscorp.com', 'User', 'TRE', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(10) NOT NULL,
  `language_code` varchar(150) NOT NULL,
  `language_name` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `language_code`, `language_name`, `status`) VALUES
(1, 'TL', 'Telugu', 'active'),
(2, 'EN', 'English', 'active'),
(3, 'TN', 'Tamil', 'active'),
(5, '4', 'Russian', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(10) NOT NULL,
  `location_code` varchar(150) NOT NULL,
  `location_name` varchar(150) NOT NULL,
  `currency_code` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_code`, `location_name`, `currency_code`, `status`) VALUES
(1, '123', '111', '111', 'active'),
(2, 'afsdf1', 'asdf1', 'asdf1', 'inactive'),
(4, '33', '33', '33', 'active'),
(5, 'asdf', 'sdf', 'asdf', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `emp_id` varchar(20) NOT NULL,
  `emp_name` varchar(150) NOT NULL,
  `emp_password` varchar(150) NOT NULL,
  `img_path` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `emp_id`, `emp_name`, `emp_password`, `img_path`, `status`) VALUES
(1, '115341', 'Rajasekhar Reddy', 'asdf', 'baby.png', 'active'),
(2, '115342', 'Murali', 'asdf', 'angry.png', 'active'),
(3, '115343', 'Prakash', 'asdf', 'egg.png', 'active'),
(4, '115344', 'Vasu Raju', 'asdf', 'laugh.png', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(100) NOT NULL DEFAULT '#',
  `parent` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(300) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `link`, `parent`, `icon`, `status`) VALUES
(1, 'Home', 'home.php', 0, 'icon_house_alt', 'active'),
(2, 'Reports', 'reports.php', 0, 'icon_document_alt', 'active'),
(3, 'Dashboard', 'dashboard.php', 0, 'icon_desktop', 'active'),
(4, 'Data Repository', '', 0, 'icon_genius', 'active'),
(5, 'Masters', '', 0, 'icon_table', 'active'),
(6, 'Contract Documents', 'contract_documents.php', 4, NULL, 'active'),
(7, 'Review Meeting', 'review_meeting.php', 4, NULL, 'active'),
(8, 'Employee', 'employee.php', 5, NULL, 'active'),
(9, 'Customer', 'customer.php', 5, NULL, 'active'),
(10, 'Project', 'project.php', 5, NULL, 'active'),
(11, 'Channel', 'channel.php', 5, NULL, 'active'),
(12, 'Language', 'language.php', 5, NULL, 'active'),
(13, 'Location', 'location.php', 5, NULL, 'active'),
(14, 'Metrics', 'metrics.php', 5, NULL, 'active'),
(15, 'Billing', 'billing.php', 5, NULL, 'active'),
(16, 'WBS Structure', 'wbs.php', 5, NULL, 'active'),
(17, 'Role', 'role.php', 5, NULL, 'active'),
(18, 'User Group', 'usergroup.php', 5, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `metric`
--

CREATE TABLE `metric` (
  `id` int(50) NOT NULL,
  `project_code` varchar(150) NOT NULL,
  `customer_code` bigint(10) NOT NULL,
  `customer_name` varchar(300) NOT NULL,
  `project` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `channel` varchar(150) NOT NULL,
  `lob` varchar(150) NOT NULL,
  `metric_name` varchar(150) NOT NULL,
  `metric_project_name` varchar(150) NOT NULL,
  `contractual_metric` varchar(150) NOT NULL,
  `goal_sow` varchar(300) NOT NULL,
  `goal_internal` varchar(500) NOT NULL,
  `remarks` varchar(1000) NOT NULL,
  `formula` varchar(500) NOT NULL,
  `defination` varchar(500) NOT NULL,
  `account_status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metric`
--

INSERT INTO `metric` (`id`, `project_code`, `customer_code`, `customer_name`, `project`, `location`, `channel`, `lob`, `metric_name`, `metric_project_name`, `contractual_metric`, `goal_sow`, `goal_internal`, `remarks`, `formula`, `defination`, `account_status`) VALUES
(1, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '-', '120 secs', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(2, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Sales Conversion %', 'Sales Conversion %', 'No', '-', '4%', 'Total Sales/Calls Answered, Both inwarranty & Out of warranty customer  can be pitched for sale on different subscriptions', 'COUNT(Sales)/SUM(CallsAnswered)', '-', 'Active'),
(3, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '80 % for in Warranty non Sales Calls\n85 % Scored for contacts in which services or hardware was sold by company', '80 % for in Warranty non Sales Calls\n85 % Scored for contacts in which services or hardware was sold by company', 'It is the end user CSAT and the computation would differ account to account mostly', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(4, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'DSAT %', 'DSAT %', 'Yes', 'A score of equal or less then average of 5%', 'A score of equal or less then average of 5%', 'Currently not tracked but it is trackable & But it is presented to client in WOR', 'COUNT(DSAT)/COUNT(Surveys)', 'DSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(5, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', 'Equal or greater than 65% of all contacts requires no second contact with the company to issue resolution.', 'Equal or greater than 65% of all contacts requires no second contact with the company to issue resolution.', 'Currently not tracked but it is trackable & But it is presented to client in WOR', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(6, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '80%', '-', '-', 'Refer QMG Team', 'Active'),
(7, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(8, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85% in 120 Seconds', '85% in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(9, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Documentation %', 'Incidents Logged', 'Yes', 'Equal or greater than 99% of all incidents to be logged', 'Equal or greater than 99% of all incidents to be logged', '-', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(10, 'CTR|BEL-IN-0010', 600301, 'Belkin International Inc.', 'Belkin', 'India', 'Voice', 'All', 'Escalation %', 'Escalation Rate', 'Yes', '<3% Of all calls to be escalated to Belkin international or designee including but not limited to customer Assurance team by the company', '<3% Of all calls to be escalated to Belkin international or designee including but not limited to customer Assurance team by the company', 'Currently not tracked but it is trackable & But it is presented to client in WOR', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(11, 'CTR|WEB-IN-0025', 600398, 'CISCO SYSTEMS INC. – Webex', 'Webex', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', 'Less than 10% for all Phone conatacts', 'Less than 10% for all Phone conatacts', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(12, 'CTR|WEB-IN-0025', 600398, 'CISCO SYSTEMS INC. – Webex', 'Webex', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', 'On an average AHT should be 11 mins for all calls', 'On an average AHT should be 11 mins for all calls', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(13, 'CTR|WEB-IN-0025', 600398, 'CISCO SYSTEMS INC. – Webex', 'Webex', 'India', 'Voice', 'All', 'CSAT Weighted Score', 'CSAT WS', 'No', '4.3', '4.3', '-', 'Sum of OSAT Rating/Total number of Surveys', 'CSAT Weightage Score', 'Active'),
(14, 'CTR|WEB-IN-0025', 600398, 'CISCO SYSTEMS INC. – Webex', 'Webex', 'India', 'Voice', 'All', 'Service Level', 'SL%', 'No', '85% of the calls within 2 mins', '85% of the calls within 2 mins', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(15, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(16, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:06:30', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(17, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Average Hold Time', 'Hold Time', 'No', 'Hold Time (answered by agent NOT auto-attendant)', 'Hold Time (answered by agent NOT auto-attendant)', 'It is trackable and not shown separately in the report', 'Total Hold Time / Total Calls Answered', 'Average hold time the Agent spends while resolving the issue', 'Active'),
(18, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '-', '0:00:30', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(19, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Documentation %', 'Documentation %', 'No', 'Document 100 % of contacts in the Client CRM tool (based upon\ncontacts answered vs. contacts documented)', 'Document 100 % of contacts in the Client CRM tool (based upon\ncontacts answered vs. contacts documented)', '-', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(20, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'CSAT %', 'CSAT %', 'No', '>80% Target Goal for the Traditional Products', '>80% Target Goal for the Traditional Products', 'NPS parameter is not looked by the client, Changed to CSAT, It is based on client tool and the data will be sent by client. It can be tracked manualy once in a month', '(Promoter-Detractor)/(Promoter+Passive+Detractor)', 'Net Promoter Score', 'Active'),
(21, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Sales Conversion %', 'Sales Conversion %', 'No', '-', '13.00%', '-', 'COUNT(Sales)/SUM(CallsAnswered)', '-', 'Active'),
(22, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '85%', '85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(23, 'CTR|COR-IN-0029', 600329, 'Corel Corporation', 'Corel', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'No', '-', '80.00%', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(24, 'CTR|DEC-IN-0028', 600310, 'DECISIONONE CORPORATION', 'DecisionOne', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '', '< 5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(25, 'CTR|DEC-IN-0028', 600310, 'DECISIONONE CORPORATION', 'DecisionOne', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'Yes', '-', '0:05:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(26, 'CTR|DEC-IN-0028', 600310, 'DECISIONONE CORPORATION', 'DecisionOne', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '85.00%', '-', '-', 'Refer QMG Team', 'Active'),
(27, 'CTR|DEC-IN-0028', 600310, 'DECISIONONE CORPORATION', 'DecisionOne', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85% During 90 Day Ramp Period,90 % There after', '85% During 90 Day Ramp Period,90 % There after', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(28, 'CTR|DEC-IN-0028', 600310, 'DECISIONONE CORPORATION', 'DecisionOne', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'Yes', '-', '0:00:30', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(29, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<=10%', '<=10%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(30, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85% of the calls within 180 seconds', '85% of the calls within 180 seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(31, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'Yes', 'Less Than or Equal to 180 seconds.', 'Less Than or Equal to 180 seconds.', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(32, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'Yes', 'Less Than or Equal to 15 minutes', 'Less Than or Equal to 15 minutes', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(33, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '70% or Greater', '70% or Greater', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(34, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Escalation %', 'Escalation Percentage', 'Yes', 'Less Than or Equal 15% of cases handled', 'Less Than or Equal 15% of cases handled', '-', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(35, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Escalation %', 'Escalation process adherence', 'Yes', '100% of the time as defined in our Service\nImplementation Plan.', '100% of the time as defined in our Service\nImplementation Plan.', 'It’s a manual calculation hence not tracked', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(36, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Case Closure %', 'Case Closure', 'Yes', '100% of the time closed as per process\ndefined in Service Implementation Plan.', '100% of the time closed as per process\ndefined in Service Implementation Plan.', 'It is not tracked but can be tracked from ICT', 'Cases Closed/Cases Handled', '-', 'Active'),
(37, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Documentation %', 'Case Logged Percentage', 'Yes', '100% of the cases logged', '100% of the cases logged', '-', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(38, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80 % with in 60 seconds', '80 % with in 60 seconds', 'Not shown in the report but can be tracked', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(39, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Occupancy %', 'Occupancy Rate', 'Yes', '>80%', '>80%', 'Not shown in the report but can be tracked', 'SUM(Customer Interfacing Time)/SUM(Customer Interfacing Time+Availtime)', 'Percentage of total hours the agent has been Occupied', 'Active'),
(40, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(41, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'Sales Conversion %', 'Conversion Rate', 'Yes', '>28%', '>28%', 'It is the call converted into sales with the sales pitch to the out of warranty customers', 'COUNT(Sales)/SUM(CallsAnswered)', '-', 'Active'),
(42, 'CTR|SMS-IN-0027', 600414, 'Support Minds', 'Support Minds', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '>80%', '>80%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(43, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'CSAT T3B %', 'CSAT T3B %', 'Yes', '90% CSAT Overall Satisfaction', '90% CSAT Overall Satisfaction', 'CSAT Top 3 buckets', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(44, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'Communication Score', 'Communication', 'Yes', '90% Communication Score in CSAT Survey', '90% Communication Score in CSAT Survey', 'This is the agent communications taken based on end user survey', 'COUNT(Communication CSATT3B)/COUNT(Surveys)', 'Refer CSAT Survey', 'Active'),
(45, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'Knowledge Score', 'Knowledge Score', 'No', '90% Knowledge Score in CSAT Survey', '90% Knowledge score in CSAT Suvey', 'This is the agent knowledge taken based on end user survey', 'COUNT(Knowledge CSATT3B)/COUNT(Surveys)', 'Refer CSAT Survey', 'Active'),
(46, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'Average Handle Time', 'Live Chat AHT', 'Yes', '25 Minutes', '25 Minutes', '-', 'Chat handle Time / Total Chats handled', 'Average time the Agent spends in resolving the issue', 'Active'),
(47, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'First Chat Resolution', 'FCR %', 'Yes', '80%', '80%', 'Revised target to 80.00%', '# of Transactions resolved in first contact / Total Transactions', 'First Chat Resolution', 'Active'),
(48, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'Escalation %', 'Escalation %', 'Yes', '<20%', '0.2', 'Client provided target less than 20.00%', '# of Transactions Escalated / Total Transactions', 'Number of Cases escalated to US support', 'Active'),
(49, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'QA Score', 'QA Score %', 'No', '0.85', '0.85', '-', '-', 'Refer QMG Team', 'Active'),
(50, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'QA Communication Score %', 'QA Communication Score %', 'No', '90% QA Communication Score in QMG', '>=90%', 'Internal target to improve communication', '', 'Refer QMG Team', 'Active'),
(51, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Chat', 'All', 'Service Level', 'SL %', 'Yes', '0.9', '0.9', 'Service Level in Chats', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(52, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'Service Level', 'SL %', 'Yes', 'Priority Initial Response SLA /Update/ SLA\nP1 /1 hour 4 h/ours\nP2 /4 hours /3 days\nP3 /6 hours/ 3 days\n', 'Priority Initial Response SLA /Update/ SLA\nP1 /1 hour 4 h/ours\nP2 /4 hours /3 days\nP3 /6 hours/ 3 days\n', 'It is available in Sales force, Currently working with the team to fix the report to get this updated', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(53, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'Service Level', 'SL %', 'Yes', 'Priority Updated Response SLA /Update/ SLA\nP1 /1 hour 4 h/ours\nP2 /4 hours /3 days\nP3 /6 hours/ 3 days\n', 'Priority updated Response SLA /Update/ SLA\nP1 /1 hour 4 h/ours\nP2 /4 hours /3 days\nP3 /6 hours/ 3 days\n', 'It is available in Sales force, Currently working with the team to fix the report to get this updated', 'Total Emails Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(54, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'Communication Score', 'Communication', 'Yes', '90% Communication Score in CSAT Survey', '90% Communication Score in CSAT Survey', 'This is the agent communications taken based on end user survey', 'COUNT(Communication CSATT3B)/COUNT(Surveys)', 'Refer CSAT Survey', 'Active'),
(55, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'Knowledge Score', 'Knowledge Score', 'No', '90% Knowledge Score in CSAT Survey', '90% Knowledge score in CSAT Suvey', 'This is the agent knowledge taken based on end user survey', 'COUNT(Knowledge CSATT3B)/COUNT(Surveys)', 'Refer CSAT Survey', 'Active'),
(56, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'QA Score', 'QA Score %', 'No', '0.85', '0.85', '-', '-', 'Refer QMG Team', 'Active'),
(57, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'Escalation %', 'Escalation %', 'Yes', '<20%', '0.2', 'Client provided target less than 20.00%', '# of Transactions Escalated / Total Transactions', 'Number of Cases escalated to US support', 'Active'),
(58, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'First Contact Resolution', 'FCR %', 'No', '0.5', '0.5', 'First Contact Resolution in Emails', '# of Transactions resolved in first contact / Total Transactions', 'First Contact Resolution', 'Active'),
(59, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'CSAT %', 'CSAT %', 'Yes', '90 % With in Frist 45 days of go live', '90 % With in Frist 45 days of go live', 'It is available in Sales force, Currently working with the team to fix the report to get this updated', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(60, 'CTR|MAR-IN-0037', 605458, 'MARKETO, INC.', 'Marketo', 'India', 'Email', 'All', 'QA Communication Score %', 'Communication', 'Yes', '90 % With in Frist 45 days of go live', '90 % With in Frist 45 days of go live', 'It is available in Sales force, Currently working with the team to fix the report to get this updated', '-', 'Refer QMG Team', 'Active'),
(61, 'CTR|NES-US-0043', 600289, 'nestCARE Inc.', 'NestCare', 'Utah', 'Voice', 'All', 'QA Monitoring', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'Not tracked in QA Portal', '-', 'Refer QMG Team', 'Active'),
(62, 'CTR|NES-US-0043', 600289, 'nestCARE Inc.', 'NestCare', 'Utah', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '>=85%', '>=85%', 'Not tracked in QA Portal', '-', 'Refer QMG Team', 'Active'),
(63, 'CTR|NES-US-0043', 600289, 'nestCARE Inc.', 'NestCare', 'Utah', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80 % in 60 Seconds', '80 % in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(64, 'CTR|NES-US-0043', 600289, 'nestCARE Inc.', 'NestCare', 'Utah', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(65, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '5%', '5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(66, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '-', '60 secs', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(67, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'CSAT T3B %', 'CSAT T3B %', 'Yes', '90.00%', '90.00%', '-', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 3 scores when the product meets the expectation of the customer', 'Active'),
(68, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '>75%', '>75%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(69, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Nett Promoter Score', 'NPS %', 'Yes', '67.00%', '67.00%', '-', '(Promoter-Detractor)/(Promoter+Passive+Detractor)', 'Net Promoter Score', 'Active'),
(70, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(71, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'No', '-', '90% of the calls should be answered on 60 secs', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(72, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:25:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(73, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Escalation %', 'Escalation Rate to L2', 'No', '<1%', '<1%', 'No of calls escalated to the L2 team', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(74, 'CTR|NET-IN-0007', 600289, 'NETGEAR, INC.', 'Netgear', 'India', 'Voice', 'All', 'Customer Effort Score', 'Overall Customer Effort Score', 'No', '>7.12', '>7.12', 'Customer effort score (CES) is one of the questions asked in the survey for the customer to rate about the service', 'Sum of CES Weighted Score / Total # of Surveys', 'Customer Effort Score ', 'Active'),
(75, 'CTR|OCC-US-0032', 600314, 'Ocenture', 'Shared Team', 'Utah', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '22 Mins', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(76, 'CTR|OCC-US-0032', 600314, 'Ocenture', 'Shared Team', 'Utah', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '0:30', '0:00:30', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(77, 'CTR|OCC-US-0032', 600314, 'Ocenture', 'Shared Team', 'Utah', 'Voice', 'All', 'Loaded Average handle Time', 'Loaded AHT', 'No', '-', '0:18:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time + OB TalkTime)/ Total Calls Answered', 'Loaded AHT', 'Active'),
(78, 'CTR|OCC-US-0032', 600314, 'Ocenture', 'Shared Team', 'Utah', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80 % in 30 Seconds', '80 % in 30 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(79, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<=4%', '<=4%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(80, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '80%', '80%', 'Metrics not tracked and measured by client, Hence not focused but tracked for Internal', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(81, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Loaded Average handle Time', 'Loaded AHT', 'No', '-', '0:20:00', 'Metrics not tracked and measured by client, Hence not focused but tracked for Internal', '(Total Talk Time + Total ACW Time + Total Hold Time + OB TalkTime)/ Total Calls Answered', 'Loaded AHT', 'Active'),
(82, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(83, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '>65%', '>65%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(84, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '90%', '90%', '-', '-', 'Refer QMG Team', 'Active'),
(85, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Email', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '80%', '80%', 'Metrics not tracked and measured by client, Hence not focused but tracked for Internal', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(86, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Email', 'All', 'Service Level', 'SL %', 'No', '-', '80 % Within 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(87, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Email', 'All', 'First Call Resolution', 'FCR %', 'Yes', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(88, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Chat', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '80%', '80%', 'Metrics not tracked and measured by client, Hence not focused but tracked for Internal', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(89, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Chat', 'All', 'Service Level', 'SL %', 'Yes', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(90, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Chat', 'All', 'First Call Resolution', 'FCR %', 'Yes', '>65%', '>65%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(91, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Email', 'All', 'Average Handle Time', 'Email Response Time', 'Yes', 'Respond with 1 hour of case arrival-90% of daily volume/100% with in 24 hours', 'Respond with 1 hour of case arrival-90% of daily volume/100% with in 24 hours', '-', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(92, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Customer Effort Score', 'customer Effort(contacts per case)', 'Yes', '2', '2', 'Metrics not tracked and measured by client, Hence not focused & tracked', 'Sum of CES Weighted Score / Total # of Surveys', 'Customer Effort Score ', 'Active'),
(93, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'DSAT %', 'Overall DSAT', 'Yes', '(Down Box 0-10 scale)<=10%', '(Down Box 0-10 scale)<=10%', '-', 'COUNT(DSAT)/COUNT(Surveys)', 'DSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(94, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Survey Return %', 'Survey Return Rate', 'Yes', '>25%', '>25%', '-', 'COUNT(Surveys Received)/COUNT(Surveys Sent)', '-', 'Active'),
(95, 'CTR|PAR-IN-0016', 600313, 'Parallels International Gmbh', 'Parallels', 'India', 'Voice', 'All', 'Escalation %', 'Escalation Rate to Tier 2', 'Yes', '<=5%', '<=5%', '-', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(96, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(97, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '85%', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(98, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:24:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(99, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85 % in 120 Seconds', '80 % in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(100, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'QA Score', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'Not Tracked in MIS report but it is available in QA Portal', '-', 'Refer QMG Team', 'Active'),
(101, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Email', 'All', 'Average Handle Time', 'Email Response Time', 'Yes', '95% in 12 Hours', '95% in 12 Hours', 'Report unavailable in client CRM hence not tracked', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(102, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Chat', 'All', 'Average Handle Time', 'Chat Response Time', 'Yes', '85 % in 120 Seconds', '80 % in 120 Seconds', 'Report unavailable in client CRM hence not tracked', 'SUM (TSA)/SUM(Chats Offered)', 'Time Taken before the transaction being answered', 'Active'),
(103, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'CSAT %', 'CSAT %', 'Yes', '85% Top 2 Box', '85% Top 2 Box', 'Report unavailable in client CRM hence not tracked', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(104, 'CTR|QSE-IN-0050', 605539, 'Q-See Corp', 'Q-See PTS', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '70%', '70%', 'Report unavailable in client CRM hence not tracked', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(105, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Email', 'All', 'Average Handle Time', 'Email Response Time', 'Yes', '95% within 12 hours (100% within 24 hours)', '95% within 12 hours (100% within 24 hours)', 'Change in Calculation & Reporting, Working with client to fix the reports', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(106, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Chat', 'All', 'Average Handle Time', 'Chat Response Time', 'Yes', '85% within 30 seconds. Eventual goal of 15 seconds', '85% within 30 seconds. Eventual goal of 15 seconds', 'Change in Calculation & Reporting, Working with client to fix the reports', 'SUM (TSA)/SUM(Chats Offered)', 'Time Taken before the transaction being answered', 'Active'),
(107, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Chat', 'All', 'Abandon %', 'Abandon %', 'No', '<5%', '<5%', 'Change in Calculation & Reporting, Working with client to fix the reports', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(108, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Overall', 'All', 'QA Score', 'QA Score %', 'No', '>=85%', '>=85%', 'Change in Calculation & Reporting, Working with client to fix the reports', '-', 'Refer QMG Team', 'Active'),
(109, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'No', 'Voice >=85%\nEmail >=70%', 'Voice >=85%\nEmail >=70%', 'Change in Calculation & Reporting, Working with client to fix the reports', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(110, 'CTR|RHA-IN-0014', 600305, 'Rhapsody International Inc.', 'Rhapsody', 'India', 'Overall', 'All', 'CSAT %', 'CSAT %', 'Yes', '>=80%', '>=80%', 'Change in Calculation & Reporting, Working with client to fix the reports', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(111, 'CTR|RHE-US-0039', 605788, 'Rheem Manufacturing Company', 'Rheem', 'Utah', 'Voice', 'All', 'QA Monitoring', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(112, 'CTR|RHE-US-0039', 605788, 'Rheem Manufacturing Company', 'Rheem', 'Utah', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '>=85%', '>=85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(113, 'CTR|RHE-US-0039', 605788, 'Rheem Manufacturing Company', 'Rheem', 'Utah', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85% in 60 Seconds', '85% in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(114, 'CTR|RHE-US-0039', 605788, 'Rheem Manufacturing Company', 'Rheem', 'Utah', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<=5%', '<=5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(115, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '<10%', '<10%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(116, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Voice', 'All', 'After Call Work', 'ACW', 'No', '120 sec', '120 sec', '-', 'Total ACW Time / Total Calls Answered', 'Average time the Agent spends in documenting the case', 'Active'),
(117, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85% in 180 Seconds', '80% in 180 Seconds', 'Contractual goal is 80% in 180 secs', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(118, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '11:30 Mins', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(119, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Email', 'All', 'Service Level', 'SL %', 'Yes', '100% in 24 Hrs', '100% in 24 Hrs', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(120, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '70% Master', '70% Master', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(121, 'CTR|SEA-IN-0019', 600530, 'Seagate Technology LLC', 'Seagate', 'India', 'Email', 'All', 'QA Score', 'QA Score %', 'No', '70% Master', '70% Master', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(122, 'CTR|SEA-CN-0021', 600530, 'Seagate Technology LLC', 'Seagate', 'China', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '10%', '10%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(123, 'CTR|SEA-CN-0021', 600530, 'Seagate Technology LLC', 'Seagate', 'China', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '9 Mins', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(124, 'CTR|SEA-CN-0021', 600530, 'Seagate Technology LLC', 'Seagate', 'China', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '-', '7 Mins', '-', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(125, 'CTR|SEA-CN-0021', 600530, 'Seagate Technology LLC', 'Seagate', 'China', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80% in 120 Seconds', '80% in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(126, 'CTR|TRE-IN-0023', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', 'Category A =<10%\nCategory B =<10%\nCategory C =<15%\nCategory D =<10%', 'Category A =<10%\nCategory B =<10%\nCategory C =<15%\nCategory D =<10%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(127, 'CTR|TRE-IN-0023', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'India', 'Voice', 'All', 'Documentation %', 'Documentation %', 'No', '-', '98%', '-', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(128, 'CTR|TRE-IN-0023', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:05:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(129, 'CTR|TRE-IN-0023', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '85%', 'Not Tracked in MIS report but it is available in QA Portal', '-', 'Refer QMG Team', 'Active'),
(130, 'CTR|TRE-IN-0023', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'No', '-', '80%', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(131, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', 'less than 15%', '<15%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(132, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:03:30', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(133, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'Yes', 'Category A = 80% less the 20 Seconds\nCategory B =80% less the 30 Seconds\nCategory C =80% less the 60 Seconds\nCategory D =80% less the 30 Seconds', 'Category A = 80% less the 20 Seconds\nCategory B =80% less the 30 Seconds\nCategory C =80% less the 60 Seconds\nCategory D =80% less the 30 Seconds', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(134, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '-', '0:03:00', '-', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(135, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'Service Level', 'SL %', 'No', '-', '80%', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(136, 'CTR|TRE-US-0024', 600318, 'THE RETAIL EQUATION, INC', 'TRE', 'Utah', 'Voice', 'All', 'QA Monitoring', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(137, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<10%', '<10%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(138, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '85.00%', '-', '-', 'Refer QMG Team', 'Active'),
(139, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '>80% with in 120 seconds', '>80% with in 120 seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(140, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '>80%', '>80%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(141, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '0:20:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(142, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '-', '120 Secs', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(143, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'CSAT T3B %', 'CSAT T3B %', 'Yes', '>80%', '>80%', '-', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 3 scores when the product meets the expectation of the customer', 'Active'),
(144, 'CTR|TNT-IN-0026', 600327, 'TRENDnet', 'TrendNet', 'India', 'Voice', 'All', 'Documentation %', 'Case Logged', 'Yes', '>95%', '>95%', '-', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(145, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'Agent Weighted Score', 'Agent Score', 'Yes', '>90', '>90', 'Agents are graded based on multiple metrics mentioned in SOW', 'Calculated Agent Level Score', '-', 'Active'),
(146, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'QA Score', 'Agent Individual QA Score', 'Yes', '>85', '>85', 'A multiplier for the agent QC score is determined by looking at their average QC score for the applicable period. QC monitoring done at client end and the scores will be shared by them on a weekly basis', '-', 'Refer QMG Team', 'Active'),
(147, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'First Call Resolution', 'Agent FCR', 'Yes', '>70', '>70', 'It is based on client tool and available on weekly basis. It can be tracked manually inputing the data in AI portal', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(148, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'Agent Weighted Score', 'Overall Average Agent Score', 'Yes', '>100', '>100', 'It is a calculated score based on weightage hence not tracked in portal', 'Calculated Project Level Agent Score', '-', 'Active'),
(149, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'QA Score', 'Overall Average QA Score', 'Yes', '>85', '>85', 'It is based on client tool and available on weekly basis. It can be tracked manually inputing the data in AI portal', '-', 'Refer QMG Team', 'Active'),
(150, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'First Call Resolution', 'Overall FCR', 'Yes', '>70', '>70', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(151, 'CTR|TRI-IN-0038', 608866, 'Trion Worlds Inc.', 'Trion Worlds', 'India', 'Email', 'All', 'CSAT %', 'Overall CSAT', 'Yes', '17.5', '17.5', 'Measured on 20 scale rating', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(152, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'CS', 'Average Handle Time', 'AHT', 'No', '-', '0:10:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(153, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'CS', 'CSAT T2B %', 'CSAT T2B %', 'No', '-', '85%', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(154, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'CS', 'First Call Resolution', 'FCR %', 'No', '-', '73%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(155, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'CS', 'Issue Resolution', 'IR %', 'No', '-', '85%', '-', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(156, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'CS', 'QA Score', 'QA Score %', 'No', '-', '>=85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(157, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'TS', 'Average Handle Time', 'AHT', 'No', '-', '0:18:00', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(158, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'TS', 'CSAT T2B %', 'CSAT T2B %', 'No', '-', '85%', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(159, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'TS', 'First Call Resolution', 'FCR %', 'No', '-', '72%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(160, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'TS', 'QA Score', 'QA Score %', 'No', '-', '>=85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(161, 'CTR|VBS-US-0004', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Utah', 'Voice', 'TS', 'Issue Resolution', 'IR %', 'No', '-', '85%', '-', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(162, 'CTR|ROK-IN-0011', 600292, 'ROKU Inc.', 'Roku', 'India', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '780 Seconds', '885 Seconds', '-', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(163, 'CTR|ROK-IN-0011', 600292, 'ROKU Inc.', 'Roku', 'India', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '1005 Secs', '1005 Secs', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active');
INSERT INTO `metric` (`id`, `project_code`, `customer_code`, `customer_name`, `project`, `location`, `channel`, `lob`, `metric_name`, `metric_project_name`, `contractual_metric`, `goal_sow`, `goal_internal`, `remarks`, `formula`, `defination`, `account_status`) VALUES
(164, 'CTR|ROK-IN-0011', 600292, 'ROKU Inc.', 'Roku', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '>=85%', '>=85%', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(165, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Email', 'All', 'Average Handle Time', 'AHT', 'No', '660', '660', 'Metric is tracked', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Average time the Agent spends in resolving the issue', 'Active'),
(166, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Email', 'All', 'First Call Resolution', 'FCR %', 'No', '57%', '57%', 'Metric is tracked', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(167, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Email', 'All', 'CSAT T2B %', 'CSAT T2B %', 'No', '83%', '83%', 'Metric is tracked', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(168, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Email', 'All', 'Average Handle Time', 'Email Response Time', 'Yes', '90% within 4 Hours', '90% within 4 Hours', 'Metric is tracked', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(169, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice', 'All', 'Issue Resolution', 'IR %', 'No', '88%', '88%', 'Metric is tracked', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(170, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Chat', 'All', 'Average Handle Time', 'AHT', 'No', '875', '875', 'Metric is tracked', 'Chat handle Time / Total Chats handled', 'Average time the Agent spends in resolving the issue', 'Active'),
(171, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Chat', 'All', 'CSAT T2B %', 'CSAT T2B %', 'No', '88%', '88%', 'Metric is tracked', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(172, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Chat', 'All', 'First Call Resolution', 'FCR %', 'No', '80%', '80%', 'Metric is tracked', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(173, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Chat', 'All', 'Issue Resolution', 'IR %', 'No', '86%', '86%', 'Metric is tracked', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(174, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice/Email', 'All', 'Documentation %', 'All Incidents Logged', 'Yes', '100% email 93% Voice', '100% email 93% Voice', 'Vonage sends daily Interact dump and needs to be calculated manually.', '# of Transactions Documented / Total Transactions', 'Cases that has been documented for every transaction', 'Active'),
(175, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '80.00%', '80.00%', 'Metric is tracked', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(176, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '85%', '85%', 'Metric is tracked', '-', 'Refer QMG Team', 'Active'),
(177, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '88%', '88%', 'Metric is tracked', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(178, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Voice', 'All', 'Loaded Average handle Time', 'Loaded AHT', 'Yes', '732', '732', 'Metric is tracked', '(Total Talk Time + Total ACW Time + Total Hold Time + OB TalkTime)/ Total Calls Answered', 'Loaded AHT', 'Active'),
(179, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Overall', 'All', 'Utilization %', 'Utilization Factor', 'Yes', '70%', '70%', 'Intraday shares CMS data to track Utilization', 'Sum(Customer Interfacing time + Avail Time)/(Sum(StaffedTime) - General Break)', 'Percentage of total hours utilized by the agent', 'Active'),
(180, 'CTR|VON-IN-0001', 600285, 'Vonage Network LLC.', 'Vonage Res', 'India', 'Overall', 'All', 'Occupancy %', 'Occupancy to hit SLA', 'Yes', '90%', '90%', 'Intraday shares CMS data to track Occupancy', 'SUM(Customer Interfacing Time)/SUM(Customer Interfacing Time+Availtime)', 'Percentage of total hours the agent has been Occupied', 'Active'),
(181, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '<=4%', '<=4%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(182, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'Service Level', 'SL %', 'No', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(183, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'No', '>65%', '>65%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(184, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '90%', '90%', '-', '-', 'Refer QMG Team', 'Active'),
(185, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Email', 'All', 'Service Level', 'SL %', 'No', '-', '80%', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(186, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Email', 'All', 'First Call Resolution', 'FCR %', 'No', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(187, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Email', 'All', 'Average Handle Time', 'Email Response Time', 'No', 'Respond with 1 hour of case arrival-90% of daily volume/100% with in 24 hours', 'Respond with 1 hour of case arrival-90% of daily volume/100% with in 24 hours', '-', 'SUM(Total Speed of Answer)/SUM(Transactions Offered)', 'Total time before the email is being answered', 'Active'),
(188, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'DSAT %', 'Overall DSAT', 'No', '(Down Box 0-10 scale)<=10%', '(Down Box 0-10 scale)<=10%', '-', 'COUNT(DSAT)/COUNT(Surveys)', 'DSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(189, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'Survey Return %', 'Survey Return Rate', 'No', '>25%', '>25%', '-', 'COUNT(Surveys Received)/COUNT(Surveys Sent)', '-', 'Active'),
(190, 'CTR|PAR-CN-0017', 600313, 'Parallels International Gmbh', 'Parallels', 'China', 'Voice', 'All', 'Escalation %', 'Escalation Rate to Tier 2', 'No', '<=5%', '<=5%', '-', 'COUNT(EscalatedCases)/Total Transactions', '-', 'Active'),
(191, 'CTR|BLA-IN-0030', 600301, 'Blastworks Inc', 'Blastworks', 'India', 'Email', 'All', 'Email Offered', 'Email Offered', 'No', '-', '-', '-', '-', '-', 'Active'),
(192, 'CTR|BLA-IN-0030', 600301, 'Blastworks Inc', 'Blastworks', 'India', 'Email', 'All', 'Email Answered', 'Email Answered', 'No', '-', '-', '-', '-', '-', 'Active'),
(193, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Abandoned %', 'Abandoned %', 'No', '<=5%', '<=5%', '-', '-', '-', 'Active'),
(194, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Avg Speed of Answer', 'Avg Speed of Answer', 'No', '-', '0:00:40', '-', '-', '-', 'Active'),
(195, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Avg Handle Time', 'Avg Handle Time', 'No', '-', '0:06:30', '-', '-', '-', 'Active'),
(196, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Avg Talk Time', 'Avg Talk Time', 'No', '-', '0:06:00', '-', '-', '-', 'Active'),
(197, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Service Level %', 'Service Level %', 'No', '80% in 120 Seconds', '80% in 120 Seconds', '-', '-', '-', 'Active'),
(198, 'CTR|OPO-US-0034', 600326, 'Oracle America, Inc.', 'Shared Team', 'Utah', 'Voice', 'All', 'Documentation %', 'Documentation %', 'No', '-', '100%', '-', '-', '-', 'Active'),
(199, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'QA Score', 'QA Score %', 'Yes', '>=90%', '>=90%', 'Not tracked in QA Portal', '-', 'Refer QMG Team', 'Active'),
(200, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'Average Queue Wait Time', 'Average Queue Wait Time', 'Yes', '1:00', '1:00', '', '', '', 'Active'),
(201, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'Service Level', 'Voice Service Level', 'Yes', '85 % in 120 Seconds', '85 % in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(202, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<8%', '<8%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(203, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'CSAT %', 'CSAT %', 'Yes', '92%', '92%', '-', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(204, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'First Call Resolution', 'FCR %', 'Yes', '>=80%', '>=80%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(205, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'QA Score', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'Not tracked in QA Portal', '-', 'Refer QMG Team', 'Active'),
(206, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'Average Handle Time CS', 'Average Handle Time CS', 'Yes', '6:00', '6:00', '', '', '', 'Active'),
(207, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'Average Handle Time Webstore', 'Average Handle Time Webstore', 'Yes', '5:30', '5:30', '', '', '', 'Active'),
(208, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Voice', 'All', 'ACW', 'ACW', 'Yes', '1:30', '1:30', '', '', '', 'Active'),
(209, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Email', 'All', 'Service Level', 'Email Response Rate', 'Yes', '95 % in 12 Hours', '95 % in 12 Hours', 'Data not available to capture this input hence not tracked', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(210, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'Chat', 'All', 'Service Level', 'Chat Service Level', 'Yes', '85 % in 120 Seconds', '85 % in 120 Seconds', '', '', '', 'Active'),
(211, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'ASAT', 'ASAT', 'Yes', '92%', '92%', '', '', '', 'Active'),
(212, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'CES', 'CES', 'Yes', '92%', '92%', '', '', '', 'Active'),
(213, 'CTR|CSR-PH-0046', 609555, 'CORSAIR Components, Inc.', 'Corsair', 'Philippines', 'All', 'All', 'NPS', 'NPS', 'Yes', '65%', '65%', '', '', '', 'Active'),
(214, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Average Handle Time', 'AHT', 'Yes', '<=5 Mins', '<=5 Mins', 'Five 9', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(215, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'Yes', '30 Seconds', '30 Seconds', 'Five 9', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(216, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Max Delay', 'ASA Max Delay', 'Yes', '30 Seconds', '30 Seconds', 'Five 9', 'MAX(MaxDelay)', 'The maximum time that a caller waited in queue and ringing before being answered or abandoned', 'Active'),
(217, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<= 5%', '<= 5%', 'Five 9', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(218, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Abandoned % above 30 Sec', 'Abandoned % above 30 Sec', 'Yes', '<= 5%', '<= 5%', 'Five 10', 'TO BE CONFIRMED', 'Percentage of Calls Abandoned with wait time beyond 30 Sec', 'Active'),
(219, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80% in 30 Seconds', '80% in 30 Seconds', 'Five 9', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(220, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'Call Logging and Accuracy', 'Call Logging and Accuracy', 'Yes', '95%', '95%', 'Kayako/Closed and Locked Questions', 'TO BE PROVIDED BY CLIENT', 'TO BE PROVIDED BY CLIENT', 'Active'),
(221, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '85.00%', '85.00%', 'Five 9', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(222, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '90%', '90%', 'CSAT data from ', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(223, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '90.00%', '90.00%', 'CSS Quality', '-', 'Refer QMG Team', 'Active'),
(224, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'Average Handle Time', 'AHT', 'Yes', '5 Mins', '5 Mins', 'Five 9', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Average time the Agent spends in resolving the issue', 'Active'),
(225, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'Service Level', 'SL %', 'Yes', '80% in 4 Hours', '80% in 4 Hours', 'Client Tool : Provided daily by the Client', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(226, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'First Call Resolution', 'FCR %', 'Yes', '75.00%', '75.00%', 'The data is shown in the name of FER', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(227, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '90.00%', '90.00%', 'CSAT Format and Methodology to be mutually agreed upon', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(228, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'Invalid Escalations', 'Invalid Escalations', 'Yes', '<= 5%', '<= 5%', 'Kayako', 'TO BE PROVIDED BY CLIENT', 'TO BE PROVIDED BY CLIENT', 'Active'),
(229, 'CTR|JUS-PH-0031', 600315, 'JustAnswer LLC.,', 'Just Answer', 'Philippines', 'Email', 'All', 'QA Score', 'QA Score %', 'Yes', '90.00%', '90.00%', 'CSS Quality', '-', 'Refer QMG Team', 'Active'),
(230, 'CTR|NET-PH-0009', 600289, 'NETGEAR, INC.', 'Netgear', 'Philippines', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '-', '-', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(231, 'CTR|NET-PH-0009', 600289, 'NETGEAR, INC.', 'Netgear', 'Philippines', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '-', '-', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(232, 'CTR|NET-PH-0009', 600289, 'NETGEAR, INC.', 'Netgear', 'Philippines', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '-', '-', '-', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(233, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(234, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'Yes', '60 Seconds', '60 Seconds', '-', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(235, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'Average Handle Time', 'AHT', 'Yes', '13 Minutes', '13 Minutes', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(236, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '8.8', '8.8', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(237, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'Yes', '80%', '80%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(238, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '85%', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(239, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '80 % With in 60 Seconds', '80 % With in 60 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(240, 'CTR|RIN-PH-0018', 600317, 'RingCentral, Inc.', 'RingCentral', 'Philippines', 'Voice', 'All', 'DSAT %', 'DSAT %', 'Yes', '< = 6%', '< = 6%', '-', 'COUNT(DSAT)/COUNT(Surveys)', 'DSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(241, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '18%', '18%', '-', '-', '-', 'Active'),
(242, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'Average Speed of Answer', 'Average Speed of Answer', 'No', '3:00', '3:00', '-', '-', '-', 'Active'),
(243, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'Average Handle Time', 'Average Handle Time', 'No', '12:30', '12:30', '-', '-', '-', 'Active'),
(244, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'Average Talk Time', 'Average Talk Time', 'No', '10:30', '10:30', '-', '-', '-', 'Active'),
(245, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'After Call Work', 'After Call Work', 'No', '0:30', '0:30', '-', '-', '-', 'Active'),
(246, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Voice', 'All', 'Average Hold Time', 'Average Hold Time', 'No', '1:30', '1:30', '', '', '', 'Active'),
(247, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Chat', 'All', 'Abandon %', 'Abandon %', 'No', '15%', '15%', '', '', '', 'Active'),
(248, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'Chat', 'All', 'Average Handle Time', 'Average Handle Time', 'No', '8:15', '8:15', '', '', '', 'Active'),
(249, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'All', 'All', 'First Contact Resolution', 'FCR %', 'No', '79%', '79%', '', '', '', 'Active'),
(250, 'CTR|ROK-PH-0012', 600292, 'ROKU Inc.', 'Roku', 'Philippines', 'All', 'All', 'QA Score', 'QA Score %', 'Yes', '95.00%', '95.00%', 'CSS Quality', '', '', 'Active'),
(251, 'CTR|ADC-CR-0033', 600351, 'Alarm.com, Inc.', 'Alarm.com', 'Costa Rica', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '19 Mins', '19 Mins', '-', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(252, 'CTR|ADC-CR-0033', 600351, 'Alarm.com, Inc.', 'Alarm.com', 'Costa Rica', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '-', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(253, 'CTR|ADC-CR-0033', 600351, 'Alarm.com, Inc.', 'Alarm.com', 'Costa Rica', 'Voice', 'All', 'QA Monitoring', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'Not tracked in QA Portal', '-', 'Refer QMG Team', 'Active'),
(254, 'CTR|ADC-CR-0033', 600351, 'Alarm.com, Inc.', 'Alarm.com', 'Costa Rica', 'Voice', 'All', 'CSAT', 'CSAT', 'Yes', '85%', '85%', '', '', '', 'Active'),
(255, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Voice', 'All', 'Service Level', 'SL %', 'No', '80% in 60 seconds', '80% in 60 seconds', 'Non contractual metric', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(256, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<15 %', '<15 %', 'New Business, Yet to golive to track the data', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(257, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '375 Seconds', '375 Seconds', 'Non contractual metric', 'SUM (TSA)/SUM(Chats Offered)', 'Time Taken before the transaction being answered', 'Active'),
(258, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '90 Seconds', '90 Seconds', 'Non contractual metric', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(259, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Chat', 'All', 'Average Speed of Answer', 'ASA', 'Yes', '90 Seconds', '90 Seconds', '-', '(Average Speed of Answer for the interval * chats Answered for the interval)/ Total chats Answered', 'Time Taken before the transaction being answered', 'Active'),
(260, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Chat', 'All', 'First Call Resolution', 'FCR', 'Yes', '85%', '85%', 'Client calculates and provides this metric', '', 'No repeat contacts from same customer account within 7 days', 'Active'),
(261, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Chat', 'All', 'Quality Audit Score', 'QA', 'Yes', '85%', '85%', '-', '', '', 'Active'),
(262, 'CTR|MAJ-CR-0047', 610761, 'magicJack VocalTec, Ltd', 'Magicjack', 'Costa Rica', 'Chat', 'All', 'Customer Satissfaction', 'CSAT', 'Yes', '4.25', '4.25', '4.25 or above on survey rated on a zero to 5-point scale', '', '', 'Active'),
(263, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Email', 'All', 'CSAT T3B %', 'CSAT T3B %', 'No', '>=80%', '>=80%', 'Non contractual metric', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 3 scores when the product meets the expectation of the customer', 'Active'),
(264, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'Abandon %', 'Abandon %', 'No', '<=10%', '<=10%', 'Non contractual metric', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(265, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'Average Talk Time', 'ATT', 'No', '780 Seconds', '780 Seconds', 'Non contractual metric', 'Total Talk Time / Total Calls Answered', 'Average talk time the Agent spends in resolving the issue', 'Active'),
(266, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'Average Speed of Answer', 'ASA', 'No', '180 Seconds', '180 Seconds', 'Non contractual metric', '(Average Speed of Answer for the interval * Calls Answered for the interval)/ Total Calls Answered', 'Average time the call is being answered', 'Active'),
(267, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '1020 Seconds', '1020 Seconds', 'Non contractual metric', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(268, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'CSAT T3B %', 'CSAT T3B %', 'No', '>=80%', '>=80%', 'Non contractual metric', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 3 scores when the product meets the expectation of the customer', 'Active'),
(269, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Chat', 'All', 'CSAT T3B %', 'CSAT T3B %', 'No', '>=80%', '>=80%', 'Non contractual metric', 'COUNT(CSATT3B)/COUNT(Surveys)', 'Top 3 scores when the product meets the expectation of the customer', 'Active'),
(270, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'No', '85%', '85%', 'Non contractual metric', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(271, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'QA Score', 'QA Score %', 'No', '85', '85', 'It is not tracked in MIS report but available in QA portal', '-', 'Refer QMG Team', 'Active'),
(272, 'CTR|ROK-CR-0013', 600292, 'ROKU Inc.', 'Roku', 'Costa Rica', 'Voice', 'All', 'Service Level', 'SL %', 'No', '80 % With in 180 Seconds', '80 % With in 180 Seconds', 'Non contractual metric', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(273, 'CTR|VON-CR-0005', 600285, 'Vonage Network LLC.', 'Vonage Res', 'Costa Rica', 'Voice', 'All', 'Average Handle Time', 'AHT', 'No', '8:30', '8:30', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(274, 'CTR|VON-CR-0005', 600285, 'Vonage Network LLC.', 'Vonage Res', 'Costa Rica', 'Voice', 'All', 'CSAT T2B %', 'CSAT T2B %', 'No', '88%', '88%', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(275, 'CTR|VON-CR-0005', 600285, 'Vonage Network LLC.', 'Vonage Res', 'Costa Rica', 'Voice', 'All', 'First Call Resolution', 'FCR %', 'No', '78%', '78%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(276, 'CTR|VON-CR-0005', 600285, 'Vonage Network LLC.', 'Vonage Res', 'Costa Rica', 'Voice', 'All', 'Issue Resolution', 'IR %', 'No', '86%', '86%', 'Issue resolution % (One of the question in CSAT Survey)', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(277, 'CTR|VON-CR-0005', 600285, 'Vonage Network LLC.', 'Vonage Res', 'Costa Rica', 'Voice', 'All', 'After Call Work', 'ACW', 'No', '90 secs', '90 secs', '-', 'Total ACW Time / Total Calls Answered', 'Average time the Agent spends in documenting the case', 'Active'),
(278, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'After Call Work', 'ACW', 'No', '90 secs', '90 secs', '-', 'Total ACW Time / Total Calls Answered', 'Average time the Agent spends in documenting the case', 'Active'),
(279, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'Average Handle Time', 'AHT', 'No', '12:30', '12:30', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(280, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'CSAT T2B %', 'CSAT T2B %', 'No', '83%', '83%', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(281, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'First Call Resolution', 'FCR %', 'No', '75%', '75%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(282, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'Issue Resolution', 'IR %', 'No', '83%', '83%', '-', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(283, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Care', 'All', 'QA Score', 'QA Score %', 'No', '85%', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(284, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'After Call Work', 'ACW', 'No', '120 Secs', '90 Secs', '-', 'Total ACW Time / Total Calls Answered', 'Average time the Agent spends in documenting the case', 'Active'),
(285, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'Average Handle Time', 'AHT', 'No', '88%', '71%', '-', '(Total Talk Time + Total ACW Time + Total Hold Time)/ Total Calls Answered', 'Average time the Agent spends in resolving the issue', 'Active'),
(286, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '80%', '80%', '-', 'COUNT(CSATT2B)/COUNT(Surveys)', 'Top 2 scores when the product meets the expectation of the customer', 'Active'),
(287, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'First Call Resolution', 'FCR %', 'Yes', '75%', '75%', '-', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(288, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'Issue Resolution', 'IR %', 'Yes', '80%', '80%', '-', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(289, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Tech', 'All', 'QA Score', 'QA Score %', 'No', '85%', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(290, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', 'No SOW is shared', 'Abandon Count/Count', '', 'Active'),
(291, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'Average Handle Time', 'Average Handle Time', 'No', '75%', '75%', 'No SOW is shared', 'Chat Duration/86400/count', '', 'Active'),
(292, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'CSAT T2B %', 'CSAT T2B %', 'Yes', '85%', '85%', 'No SOW is shared', 'COUNT(CSATT2B)/COUNT(Surveys)', '', 'Active'),
(293, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'First Call Resolution', 'First Call Resolution', 'Yes', '70%', '70%', 'No SOW is shared', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(294, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'Issue Resolution', 'Issue Resolution', 'Yes', '75%', '75%', 'No SOW is shared', 'COUNT(IssueResolved)/ COUNT(Surveys)', 'Issue Resolution', 'Active'),
(295, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'Chat', 'All', 'QA Score', 'QA Score', 'No', '85%', '85%', 'No SOW is shared', '-', 'Refer QMG Team', 'Active'),
(296, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Offline', 'All', 'Email / Salesforce SLA', 'Email SLA', 'No', '100% Cases should be handled within 48 business hours ', '100% Cases should be handled within 48 business hours ', 'No SOW is shared', 'Salesforce tool is used', 'We use Salesforce tool to pull the report and use the excel formula to measure the SLA', 'Active'),
(297, 'CTR|VBS-CR-0006', 600285, 'Vonage Network LLC.', 'Vonage BS', 'Costa Rica', 'VBS Offline', 'All', 'Email / Salesforce SLA', 'Email SLA', 'No', '100% Cases should be handled within 5 business days', '100% Cases should be handled within 3 to 5 business days', 'No SOW is shared', 'Salesforce tool is used', 'We use Salesforce tool to pull the report and use the excel formula to measure the SLA', 'Active'),
(298, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Chat', 'All', 'Service Level', 'Service Level %', 'Yes', '80% in 120 Seconds', '80% in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(299, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Chat', 'All', 'Abandon %', 'Abandon %', 'Yes', '5%', '5%', '-', 'SUM(ChatsAbandoned) / SUM(ChatsOffered)', 'Percentage of Chatsabandoned while waiting to be answered', 'Active'),
(300, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Chat', 'All', 'Average Handle Time', 'AHT', 'Yes', '16 minutes', '16 minutes', '-', 'SUM (TSA)/SUM(Chats Offered)', 'Time Taken before the transaction being answered', 'Active'),
(301, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Social Media', 'All', 'Service Level', 'Service Level %', 'Yes', '90% in 2 Hours', '90% in 2 Hours', '-', 'Total Emails Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(302, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Social Media', 'All', 'Average Handle Time', 'AHT', 'Yes', '3 minutes', '3 minutes', '-', 'SUM (Email handle Time)/SUM(Emails Handled)', 'Total time before the email is being answered', 'Active'),
(303, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'All', 'All', 'Quality Audits', 'Quality Audits', 'Yes', '5% of all interactions', '5% of all interactions', '', '', '', 'Active'),
(304, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'All', 'All', 'QA Score', 'QA Score', 'Yes', '83%', '83%', '', '', '', 'Active'),
(305, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Chat', 'All', 'SSAT', 'SSAT', 'Yes', '8', '8', '', '', '', 'Active'),
(306, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'Social Media', 'All', 'SSAT', 'SSAT', 'Yes', '6.60%', '6.60%', '', '', '', 'Active'),
(307, 'CTR|ACT-CR-0049', 604222, 'Activision Blizzard, Inc.', 'Activision', 'Costa Rica', 'All', 'All', 'Escalation %', 'Escalation %', 'Yes', '<5%', '<5%', '', '', '', 'Active'),
(308, 'CTR|QSE-CR-0041', 605539, 'Q-See Corp', 'Q-See', 'Costa Rica', 'Voice', 'All', 'Abandon %', 'Abandon %', 'Yes', '<5%', '<5%', '-', 'SUM(CallsAbandoned) / SUM(CallsOffered)', 'Percentage of Calls abandoned while waiting to be answered', 'Active'),
(309, 'CTR|QSE-CR-0041', 605539, 'Q-See Corp', 'Q-See', 'Costa Rica', 'Voice', 'All', 'QA Score', 'QA Score %', 'Yes', '85%', '85%', '-', '-', 'Refer QMG Team', 'Active'),
(310, 'CTR|QSE-CR-0041', 605539, 'Q-See Corp', 'Q-See', 'Costa Rica', 'Voice', 'All', 'Service Level', 'SL %', 'Yes', '85 % in 120 Seconds', '85 % in 120 Seconds', '-', 'Total Calls Handled within the agreed SL/ Total Calls Offered', 'Percentage of Calls answered within the threshold time', 'Active'),
(311, 'CTR|QSE-CR-0041', 605539, 'Q-See Corp', 'Q-See', 'Costa Rica', 'Voice', 'All', 'QA Monitoring', 'Agent Quality Monitoring', 'Yes', '2 Per Agent per Week', '2 Per Agent per Week', 'Not Tracked in MIS report but it is available in QA Portal', '-', 'Refer QMG Team', 'Active'),
(312, 'CTR|QSE-CR-0041', 605539, 'Q-See Corp', 'Q-See', 'Costa Rica', 'Voice', 'All', 'CSAT %', 'CSAT %', 'Yes', '85% Top 2 Box', '85% Top 2 Box', 'Report unavailable in client CRM hence not tracked', 'COUNT(CSAT TB)/COUNT(Surveys)', 'CSAT is a measure to analyze if the product meets the customer expectation', 'Active'),
(313, 'CTR|SEA-CR-0020', 600530, 'Seagate Technology LLC', 'Seagate', 'Costa Rica', 'Email', 'All', 'First Call Resolution', 'FCR %', 'No', '70%', '70%', 'Report unavailable in client CRM hence not tracked', '# of Transactions resolved in first contact / Total Transactions', 'First Call Resolution', 'Active'),
(314, 'CTR|SEA-CR-0020', 600530, 'Seagate Technology LLC', 'Seagate', 'Costa Rica', 'Email', 'All', 'Avg Queue Time', 'Avg Queue Time', 'No', '-', '24 Hrs', '-', '-', '-', 'Active'),
(315, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Service Level %', 'Service Level %', 'Yes', 'Answer 80% of calls within 30sec', '80% within 30 Sec', '', '', '', 'Active'),
(316, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Abandoned %', 'Abandoned %', 'Yes', '<5 % Abandonment against all calls offered', '<=5%', '', '', '', 'Active'),
(317, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Answered %', 'Answered %', 'Yes', 'Answer 80% of calls within 30 seconds', '>=80%', '', '', '', 'Active'),
(318, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'CSAT %', 'CSAT %', 'Yes', 'Earn a >90% customer satisfaction (satisfied + very satisfied –\nTop 2 Box), as measured by outbound/online surveys each month\nfor previous month’s contacts', '>=90%', '', '', '', 'Active'),
(319, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'FCR%', 'FCR%', 'Yes', '>90% First call resolution', '>=90%', '', '', '', 'Active'),
(320, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'After Call Work', 'After Call Work', 'Yes', '<30 second After Call Work', '<30', '', '', '', 'Active'),
(321, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Average Hold Time', 'Average Hold Time', 'Yes', '<1 minute Average Hold Time', '0:01:00', '', '', '', 'Active'),
(322, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Average Handle Time', 'AHT', 'Yes', '20Mins', '20Mins', '', '', '', 'Active'),
(323, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'Average Talk Time', 'ATT', 'Yes', '15 minute average Total Talk Time', '0:15:00', '', '', '', 'Active'),
(324, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Voice', 'Voice', 'QA Score', 'QA Score', 'Yes', 'A minimum of 2 contacts per week per agent must be monitored\nto establish call quality; the minimum accepted score is 90%. The\npercentage scoring method to be agreed between ARRIS and\nvendor. Joint monitoring with calibration exercises between both\nparties will occur for no less than 1 hour per week', '>=90%', '', '', '', 'Active'),
(325, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Chat', 'Chat', 'Service Level %', 'Service Level %', 'Yes', 'SLA – respond to chat inquiry <5 minutes', '0:05:00', '', '', '', 'Active'),
(326, 'CTR|ARR-CR-0001', 608968, 'ARRIS', 'ARRIS', 'Costa Rica', 'Email', 'Email', 'Service Level %', 'Service Level %', 'Yes', 'SLA – respond to Email inquiry <24 hours', '24:00:00', '', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `metricdata`
--

CREATE TABLE `metricdata` (
  `id` int(10) NOT NULL,
  `project_code` varchar(150) NOT NULL,
  `customer_code` bit(10) NOT NULL,
  `customer_name` varchar(300) NOT NULL,
  `project` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `channel` varchar(150) NOT NULL,
  `lob` varchar(150) NOT NULL,
  `metric_name` varchar(150) NOT NULL,
  `metric_project_name` varchar(150) NOT NULL,
  `contractual_metric` varchar(150) NOT NULL,
  `goal_sow` varchar(500) NOT NULL,
  `goal_internal` varchar(800) NOT NULL,
  `remarks` varchar(1000) NOT NULL,
  `formula` varchar(800) NOT NULL,
  `definition` varchar(800) NOT NULL,
  `account_status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metricdata`
--

INSERT INTO `metricdata` (`id`, `project_code`, `customer_code`, `customer_name`, `project`, `location`, `channel`, `lob`, `metric_name`, `metric_project_name`, `contractual_metric`, `goal_sow`, `goal_internal`, `remarks`, `formula`, `definition`, `account_status`) VALUES
(1, '464', b'1111111111', 'Activision Blizzard, Inc.', 'ARRIS', 'China', 'VBS Offline', 'Chat', 'Abandoned %', '5', '5', '1', '1', '1', '1', '1', 'active'),
(2, '566', b'1111111111', 'Belkin International Inc.', 'Alarm.com', 'Costa Rica', 'VBS Offline', 'Chat', 'ACW', '6', '6', '4', '2', '4', '5', '5', 'inactive'),
(3, '566', b'1111111111', 'Alarm.com, Inc.', 'Activision', 'China', 'Email', 'Chat', 'ACW', '1', '1', '1', '1', '1', '1', '1', 'active'),
(4, '464', b'1111111111', 'ARRIS', 'Activision', 'China', 'All', 'All', 'Abandon %', '1', '1', '1', '1', '1', '1', '1', 'active'),
(5, '464', b'1111111111', 'ARRIS', 'Activision', 'China', 'All', 'All', 'Abandon %', '1', '1', '1', '1', '1', '1', '1', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `multiple_files`
--

CREATE TABLE `multiple_files` (
  `id` int(10) NOT NULL,
  `name` varchar(300) NOT NULL,
  `path` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `multiple_files`
--

INSERT INTO `multiple_files` (`id`, `name`, `path`) VALUES
(1, '1', 'D:Xampp1	mpphpED59.tmp'),
(2, '1', 'D:Xampp1	mpphpED6A.tmp'),
(3, '1', 'D:Xampp1	mpphpED7A.tmp'),
(4, '1', 'D:Xampp1	mpphpED7B.tmp'),
(5, '1', 'D:Xampp1	mpphpED7C.tmp');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `proj_name` varchar(150) NOT NULL,
  `proj_code` varchar(150) NOT NULL,
  `proj_delivery_location` varchar(150) NOT NULL,
  `proj_languages` varchar(150) NOT NULL,
  `proj_channel` varchar(150) NOT NULL,
  `proj_support_category` varchar(150) NOT NULL,
  `proj_support_level` varchar(150) NOT NULL,
  `proj_support_window` varchar(150) NOT NULL,
  `proj_billing_type` varchar(150) NOT NULL,
  `proj_startdate` date NOT NULL,
  `proj_enddate` date NOT NULL,
  `proj_contact_tool` varchar(150) NOT NULL,
  `proj_documentation_tool` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `proj_name`, `proj_code`, `proj_delivery_location`, `proj_languages`, `proj_channel`, `proj_support_category`, `proj_support_level`, `proj_support_window`, `proj_billing_type`, `proj_startdate`, `proj_enddate`, `proj_contact_tool`, `proj_documentation_tool`, `status`) VALUES
(2, 'Netgear', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(3, 'Vonage', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(4, 'MIS', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(5, 'All', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(6, 'Marketo', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(7, 'Belkin', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', 'active'),
(8, 'TRE', 'TRE001', 'A', 'Russian', 'Email', 'A', 'A', 'A', '11', '2018-05-02', '2018-06-28', 'A', 'A', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `review_meeting`
--

CREATE TABLE `review_meeting` (
  `id` int(10) NOT NULL,
  `emp_id` bigint(10) NOT NULL,
  `r_project` varchar(300) NOT NULL,
  `r_location` varchar(300) NOT NULL,
  `r_type` varchar(300) NOT NULL,
  `period` varchar(300) NOT NULL,
  `start_period` date NOT NULL,
  `end_period` date NOT NULL,
  `reviewed_on` date NOT NULL,
  `reviewed_by` varchar(300) NOT NULL,
  `file_name` varchar(300) NOT NULL,
  `file_ext` varchar(150) NOT NULL,
  `file_path` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_meeting`
--

INSERT INTO `review_meeting` (`id`, `emp_id`, `r_project`, `r_location`, `r_type`, `period`, `start_period`, `end_period`, `reviewed_on`, `reviewed_by`, `file_name`, `file_ext`, `file_path`) VALUES
(1, 115341, 'ARRIS', 'India', 'HBR', '03/09/2018 - 04/27/2018', '2018-03-09', '2018-04-27', '2018-04-28', 'Client', 'Annexure_A_Work_Environment_Standards', 'pdf', 'multiple_uploads/Annexure_A_Work_Environment_Standards.pdf'),
(2, 115341, 'ARRIS', 'India', 'HBR', '03/09/2018 - 04/27/2018', '2018-03-09', '2018-04-27', '2018-04-28', 'Client', 'logout_sheet', 'xlsx', 'multiple_uploads/logout_sheet.xlsx'),
(3, 115341, 'ARRIS', 'India', 'HBR', '03/09/2018 - 04/27/2018', '2018-03-09', '2018-04-27', '2018-04-28', 'Client', 'metric', 'csv', 'multiple_uploads/metric.csv'),
(4, 115341, 'Corel', 'Philippines', 'YBR', '04/02/2018 - 04/28/2018', '2018-04-02', '2018-04-28', '2018-04-27', 'Internal', 'Annexure_A_Work_Environment_Standards', 'pdf', 'multiple_uploads/Annexure_A_Work_Environment_Standards.pdf'),
(5, 115341, 'Corel', 'Philippines', 'YBR', '04/02/2018 - 04/28/2018', '2018-04-02', '2018-04-28', '2018-04-27', 'Internal', 'Weekly_Task', 'xlsx', 'multiple_uploads/Weekly_Task.xlsx'),
(6, 115341, 'Corel', 'Philippines', 'YBR', '04/02/2018 - 04/28/2018', '2018-04-02', '2018-04-28', '2018-04-27', 'Internal', 'Zempmas', 'XLSX', 'multiple_uploads/Zempmas.XLSX');

-- --------------------------------------------------------

--
-- Table structure for table `review_type`
--

CREATE TABLE `review_type` (
  `id` int(10) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_type`
--

INSERT INTO `review_type` (`id`, `name`) VALUES
(1, 'MBR'),
(2, 'QBR'),
(3, 'HBR'),
(4, 'YBR'),
(5, 'WOR');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `usertype` varchar(300) NOT NULL,
  `status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `usertype`, `status`) VALUES
(1, 'asdf', 'inactive'),
(2, 'asdf', 'inactive'),
(3, 'asdf', 'inactive'),
(4, 'asdf', 'inactive'),
(5, 'Admin', 'inactive'),
(6, 'User', 'inactive'),
(7, 'Super Admin', 'inactive'),
(8, 'Admin', 'active'),
(9, 'Super Admin', 'active'),
(10, 'User', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `upload_files`
--

CREATE TABLE `upload_files` (
  `id` int(10) NOT NULL,
  `file_name` varchar(300) NOT NULL,
  `file_type` varchar(300) NOT NULL,
  `file_size` bigint(50) NOT NULL,
  `file_ext` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_files`
--

INSERT INTO `upload_files` (`id`, `file_name`, `file_type`, `file_size`, `file_ext`) VALUES
(1, 'Annexure_A_Work_Environment_Standards.pdf', 'application/pdf', 67785, 'pdf'),
(2, 'logout sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11328, 'xlsx'),
(3, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(4, 'Weekly Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(5, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(6, 'Annexure_A_Work_Environment_Standards.pdf', 'application/pdf', 67785, 'pdf'),
(7, 'logout sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11328, 'xlsx'),
(8, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(9, 'Weekly Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(10, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(11, 'Annexure_A_Work_Environment_Standards.pdf', 'application/pdf', 67785, 'pdf'),
(12, 'logout sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11328, 'xlsx'),
(13, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(14, 'Weekly Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(15, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(16, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(17, 'Weekly Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(18, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(19, 'Annexure_A_Work_Environment_Standards.pdf', 'application/pdf', 67785, 'pdf'),
(20, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(21, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(22, '11 Weekly Task-FebSec.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16452, 'xlsx'),
(23, 'Belkin Sales Tracker.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 10968, 'xlsx'),
(24, 'brand.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 8532, 'xlsx'),
(25, 'brandcsv.csv', 'application/vnd.ms-excel', 213, 'csv'),
(26, 'category.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 8463, 'xlsx'),
(27, 'categorycsv.csv', 'application/vnd.ms-excel', 278, 'csv'),
(28, 'Copy of 10 Weekly Task-FebSec.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16161, 'xlsx'),
(29, 'CORE Portal - DB Fields.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 14157, 'xlsx'),
(30, 'CSSCorp_SR_Plan_Client_V 1.0.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 307661, 'xlsx'),
(31, 'Hardware Part number.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 12318, 'xlsx'),
(32, 'hardware.csv', 'application/vnd.ms-excel', 4841, 'csv'),
(33, 'latest sale db.sql', 'application/octet-stream', 30521, 'sql'),
(34, 'logout sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11676, 'xlsx'),
(35, 'metric.csv', 'application/vnd.ms-excel', 76070, 'csv'),
(36, 'productdetails.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 10923, 'xlsx'),
(37, 'productdetailscsv.csv', 'application/vnd.ms-excel', 2297, 'csv'),
(38, 'sales.sql', 'application/octet-stream', 1093, 'sql'),
(39, 'sales1.sql', 'application/octet-stream', 1017, 'sql'),
(40, 'Weekly Task-FebSec.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16385, 'xlsx'),
(41, 'Weekly Task-FebSec.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16385, 'xlsx'),
(42, 'Weekly Task-FebSec.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16385, 'xlsx'),
(43, 'hardware.csv', 'application/vnd.ms-excel', 4841, 'csv'),
(44, 'CSSCorp_SR_Plan_Client_V 1.0.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 307661, 'xlsx'),
(45, 'CSSCorp_SR_Plan_Client_V 1.0.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 307661, 'xlsx'),
(46, 'Annexure_A_Work_Environment_Standards.pdf', 'application/pdf', 67785, 'pdf'),
(47, 'Weekly Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(48, 'Weekly_Task.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16052, 'xlsx'),
(49, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(50, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(51, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(52, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(53, 'logout_sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11393, 'xlsx'),
(54, 'logout_sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11393, 'xlsx'),
(55, 'logout_sheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11393, 'xlsx'),
(56, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(57, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(58, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(59, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(60, 'xlsx.png', 'image/png', 25875, 'png'),
(61, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(62, 'Project_wise_details_V1_Recommendations.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 235261, 'xlsx'),
(63, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(64, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(65, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(66, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(67, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(68, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(69, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(70, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX'),
(71, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(72, 'metric.csv', 'application/vnd.ms-excel', 76064, 'csv'),
(73, 'Zempmas.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 379176, 'XLSX');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_gettwocolumns_cd`
-- (See below for the actual view)
--
CREATE TABLE `view_gettwocolumns_cd` (
`c_project` varchar(300)
,`file_path` varchar(300)
);

-- --------------------------------------------------------

--
-- Structure for view `view_gettwocolumns_cd`
--
DROP TABLE IF EXISTS `view_gettwocolumns_cd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_gettwocolumns_cd`  AS  select `contract_document`.`c_project` AS `c_project`,`contract_document`.`file_path` AS `file_path` from `contract_document` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billingtype`
--
ALTER TABLE `billingtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_document`
--
ALTER TABLE `contract_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_usergroup`
--
ALTER TABLE `core_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_no` (`emp_no`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metric`
--
ALTER TABLE `metric`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metricdata`
--
ALTER TABLE `metricdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiple_files`
--
ALTER TABLE `multiple_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_meeting`
--
ALTER TABLE `review_meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_type`
--
ALTER TABLE `review_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billingtype`
--
ALTER TABLE `billingtype`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `contract_document`
--
ALTER TABLE `contract_document`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `core_usergroup`
--
ALTER TABLE `core_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `metric`
--
ALTER TABLE `metric`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;
--
-- AUTO_INCREMENT for table `metricdata`
--
ALTER TABLE `metricdata`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `multiple_files`
--
ALTER TABLE `multiple_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `review_meeting`
--
ALTER TABLE `review_meeting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `review_type`
--
ALTER TABLE `review_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

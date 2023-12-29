/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `accessProfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profileName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagType` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileStatus` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeType` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTime` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTimePeriod` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `includeVenue` text COLLATE utf8mb4_unicode_ci,
  `includeBuilding` text COLLATE utf8mb4_unicode_ci,
  `includeFloor` text COLLATE utf8mb4_unicode_ci,
  `includeZone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excludeZone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peopleValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `gates` mediumtext COLLATE utf8mb4_unicode_ci,
  `holidayFlag` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `filterBylabel` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labelInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `labelExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterBycategory` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `categoryExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `dateRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateRangeFrom` date DEFAULT NULL,
  `dateRangeTo` date DEFAULT NULL,
  `timeRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeFrom` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeTo` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekDays` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_days` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyNumber` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isWebhook` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEmail` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailids` mediumtext COLLATE utf8mb4_unicode_ci,
  `isSms` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '1',
  `mobileNumbers` mediumtext COLLATE utf8mb4_unicode_ci,
  `disabledFlag` bit(1) NOT NULL DEFAULT b'0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `accessProfileAlertHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetType` enum('students','employees','visitors','assets','others') COLLATE utf8mb4_unicode_ci DEFAULT 'assets',
  `accessType` longtext COLLATE utf8mb4_unicode_ci,
  `closedFlag` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `openRemarks` longtext COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastSeenLat` decimal(20,17) DEFAULT NULL,
  `lastSeenLng` decimal(20,17) DEFAULT NULL,
  `openTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `closeTimeStamp` timestamp NULL DEFAULT NULL,
  `lastAlertTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminOrgAccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRoleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultAssetManager` tinyint(4) DEFAULT '0',
  `suspendedFlag` tinyint(4) DEFAULT '0',
  `subDepartmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminUserAccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminUserLoginHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` mediumtext COLLATE utf8mb4_unicode_ci,
  `userID` int(11) DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adminUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onesignalID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspendedFlag` tinyint(4) NOT NULL DEFAULT '0',
  `dashboardFields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adnItemInventory` (
  `adnItemInventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `adnItemInventoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','received','cancelled','stock-updated','stock-issued','stock-transferred','disposed','stock-moved','stock-removed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InventoryId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientSequenceNumber` int(11) DEFAULT NULL,
  `issueStatus` enum('issue-pending','stock-issued','pl-generated','dn-pending','dn-generated','transporter-assigned','delivered') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockIssueUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferStatus` enum('transfer-pending','stock-transferred','pl-generated','dn-pending','dn-generated','transporter-assigned','delivered') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockTransferUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickListUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNoteUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseVal` float DEFAULT NULL,
  `outboundPrice` float DEFAULT NULL,
  `invExpDate` date DEFAULT NULL,
  `invMfdDate` date DEFAULT NULL,
  `stockUpdatedAt` datetime DEFAULT NULL,
  `stockInTake` enum('external','internal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'internal',
  `invStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invTransporterUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockReceivingPerson` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrivalDate` date DEFAULT NULL,
  `location` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hierarchy` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lowestLevelUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salesPersonUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockMoveUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockAdjustmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposedUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposedStatus` enum('pending','cancelled','disposed','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `via` enum('bulkupload','transfer','integration','api','dashboard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dashboard',
  PRIMARY KEY (`adnItemInventoryId`),
  KEY `adnItemInventoryUUID` (`adnItemInventoryUUID`),
  KEY `adnItemInventoryId` (`adnItemInventoryId`),
  KEY `clientUUID` (`clientUUID`),
  KEY `adnUUID` (`adnUUID`),
  KEY `itemUUID` (`itemUUID`),
  KEY `stockIssueUUID` (`stockIssueUUID`),
  KEY `stockTransferUUID` (`stockTransferUUID`),
  KEY `pickListUUID` (`pickListUUID`),
  KEY `deliveryNoteUUID` (`deliveryNoteUUID`),
  KEY `invStoreUUID` (`invStoreUUID`),
  KEY `invTransporterUUID` (`invTransporterUUID`),
  KEY `location` (`location`),
  KEY `hierarchy` (`hierarchy`),
  KEY `zoneUUID` (`zoneUUID`),
  KEY `lowestLevelUUID` (`lowestLevelUUID`),
  KEY `customerUUID` (`customerUUID`),
  KEY `salesPersonUUID` (`salesPersonUUID`),
  KEY `stockMoveUUID` (`stockMoveUUID`),
  KEY `stockAdjustmentUUID` (`stockAdjustmentUUID`),
  KEY `disposedUUID` (`disposedUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adnItems` (
  `adnItemId` int(11) NOT NULL AUTO_INCREMENT,
  `adnItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemTracking` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mfDate` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','received','partiallyreceived','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `stockUpdateStatus` enum('pending','partially-updated','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `via` enum('bulkupload','transfer','integration','api','dashboard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dashboard',
  `stockInTake` enum('external','internal') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`adnItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adnItemTags` (
  `adnItemTagId` int(11) NOT NULL AUTO_INCREMENT,
  `adnItemTagUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adnUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemInventoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultTag` tinyint(4) NOT NULL DEFAULT '0',
  `tagType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `preDefinedTagUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`adnItemTagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adnItemUniqueFields` (
  `adnItemUniqueId` int(11) NOT NULL AUTO_INCREMENT,
  `adnItemUniqueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemInventoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueFieldUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueFieldValue` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adnItemUniqueId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `adnMaster` (
  `adnId` int(11) NOT NULL AUTO_INCREMENT,
  `adnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnNumber` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adnDeliveryDate` datetime DEFAULT NULL,
  `adnVendorUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adnTotalItems` int(11) NOT NULL,
  `adnCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adnCreatedAt` datetime DEFAULT NULL,
  `adnUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adnUpdatedAt` datetime DEFAULT NULL,
  `adnStatus` enum('pending','completed','inprogress','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `adnStockInTake` enum('internal','external') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'external',
  `via` enum('bulkupload','transfer','integration','api','dashboard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dashboard',
  `adnInvoiceNumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`adnId`),
  KEY `adnUUID` (`adnUUID`),
  KEY `adnClientUUID` (`adnClientUUID`),
  KEY `adnVendorUUID` (`adnVendorUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `advancedSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='advanced settings in management ';

CREATE TABLE IF NOT EXISTS `allocatedAssets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Can be Employee or Student',
  `allocatedAssetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetApprovalElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetApprovalHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldName` longtext COLLATE utf8mb4_unicode_ci,
  `oldValue` longtext COLLATE utf8mb4_unicode_ci,
  `newValue` longtext COLLATE utf8mb4_unicode_ci,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `approveStatus` enum('Approved','Pending','Rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assetUUID` (`assetUUID`),
  KEY `clientUUID` (`clientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetApprovalSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `approvalProcess` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevels` int(11) DEFAULT NULL,
  `approvalType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalFields` mediumtext COLLATE utf8mb4_unicode_ci,
  `userRole1` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole2` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole3` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole4` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID1` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID2` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID3` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID4` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acknowledgment` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetAuditElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetAuditHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagTypeID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seenZone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seenTime` datetime DEFAULT NULL,
  `seenLat` decimal(20,17) DEFAULT NULL,
  `seenLng` decimal(20,17) DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentDate` date DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tagTypeID` (`tagTypeID`) USING BTREE,
  KEY `tagType` (`tagType`) USING BTREE,
  KEY `currentDate` (`currentDate`),
  KEY `userUUID` (`userUUID`),
  KEY `assetUUID` (`assetUUID`),
  KEY `seenZone` (`seenZone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetCategoryElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainCategoryUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryOne` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryTwo` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryThree` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryFour` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryUUID` (`categoryUUID`),
  KEY `assetUUID` (`assetUUID`),
  KEY `mainCategoryUUID` (`mainCategoryUUID`),
  KEY `subCategoryOne` (`subCategoryOne`),
  KEY `subCategoryTwo` (`subCategoryTwo`),
  KEY `subCategoryThree` (`subCategoryThree`),
  KEY `subCategoryFour` (`subCategoryFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetCategoryMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryCode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `parentId` int(11) DEFAULT NULL,
  `categoryLevel` int(4) DEFAULT '0',
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetDeallocationElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deallocateUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deallocateStatus` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetDeallocationMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `initiatedDate` date NOT NULL,
  `initiatedBy` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deallocateDate` date DEFAULT NULL,
  `deallocateBy` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetDisabledFields` (
  `disabledId` int(11) NOT NULL AUTO_INCREMENT,
  `disabledUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disbaledClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabledFields` json NOT NULL,
  `disabledCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabledUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabledCreatedAt` datetime NOT NULL,
  `disabledUpdatedAt` datetime NOT NULL,
  `disabledStatus` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`disabledId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetDisposalDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disposalUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposalAction` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellValue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approvedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetDisposalMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disposalUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetList` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `disposalStatus` tinyint(1) NOT NULL DEFAULT '0',
  `initiatedDate` datetime NOT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `levelValue` text COLLATE utf8mb4_unicode_ci,
  `userRole` text COLLATE utf8mb4_unicode_ci,
  `approverUsers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetIdSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sameTagIdRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `sameTagType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `automatedIdRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `sectionLevels` int(11) DEFAULT NULL,
  `sectionType` text COLLATE utf8mb4_unicode_ci,
  `sectionTypeValue` text COLLATE utf8mb4_unicode_ci,
  `seperatorRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `seperatorType` enum('/','-') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetInventoryMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auditUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assetUUID` (`assetUUID`),
  KEY `zoneUUID` (`zoneUUID`),
  KEY `userUUID` (`userUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `auditUUID` (`auditUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetJournalComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_ci,
  `journalUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetJournalFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetJournals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetJournalName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPublish` bit(1) NOT NULL DEFAULT b'0',
  `hashTag` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetLabelElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `labelUUID` (`labelUUID`),
  KEY `assetUUID` (`assetUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetLabelMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labelName` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetLocationHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `transactionUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currentLocation` text COLLATE utf8mb4_unicode_ci,
  `currentVenueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentBuildingUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentFloorplanUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previousLocation` text COLLATE utf8mb4_unicode_ci,
  `previousVenueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previousBuildingUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previousFloorplanUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previousZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetManagerHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetManagerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previousAssetManagerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetName` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetIdentifier` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetSerialNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetOwner` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetManager` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 -assets ,1-student,2-employee,3-visitor,4-fleets  ',
  `assetRemovability` mediumtext COLLATE utf8mb4_unicode_ci,
  `venue` mediumtext COLLATE utf8mb4_unicode_ci,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `assetValue` decimal(10,2) DEFAULT NULL,
  `estimatedSalvageValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `serviceDate` date DEFAULT NULL,
  `periodicCalibration` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periodicDateIn` int(11) DEFAULT NULL,
  `depreciationStartDate` date DEFAULT NULL,
  `assetLifeTime` int(11) DEFAULT NULL,
  `accumulatedDepreciation` decimal(10,2) DEFAULT NULL,
  `assetCurrentValue` decimal(10,2) DEFAULT NULL,
  `assetPurchaseValue` decimal(10,2) DEFAULT NULL COMMENT 'asset purchase value',
  `endOfPeriod` date DEFAULT NULL,
  `eolDate` date DEFAULT NULL,
  `assetCriticality` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessUnitUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costCenterUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDepartmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplierUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciationUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isImport` tinyint(4) DEFAULT '0',
  `retirementFlag` tinyint(4) DEFAULT '0',
  `depreciationCalculated` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `retirementReason` text COLLATE utf8mb4_unicode_ci,
  `importUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrantyNotification` tinyint(4) DEFAULT '0',
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `PONumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ownershipRights` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseClassification` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrantyStartDate` date DEFAULT NULL,
  `warrantyEndDate` date DEFAULT NULL,
  `hireStartDate` date DEFAULT NULL,
  `hireEndDate` date DEFAULT NULL,
  `contractUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetMake` tinytext COLLATE utf8mb4_unicode_ci,
  `skuNum` tinytext COLLATE utf8mb4_unicode_ci,
  `model` tinytext COLLATE utf8mb4_unicode_ci,
  `assetCurrency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
 `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `clientUUID` (`clientUUID`),
  KEY `eolDate` (`eolDate`),
  KEY `ts` (`ts`),
  KEY `assetOwner` (`assetOwner`),
  KEY `assetManager` (`assetManager`),
  KEY `departmentUUID` (`departmentUUID`),
  KEY `subDepartmentUUID` (`subDepartmentUUID`),
  KEY `supplierUUID` (`supplierUUID`),
  KEY `businessUnitUUID` (`businessUnitUUID`),
  KEY `costCenterUUID` (`costCenterUUID`),
  KEY `depreciationUUID` (`depreciationUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetMasterFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '//image -> ',
  `fileSize` int(11) NOT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDefault` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetMobileSelectedFields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderedFieldList` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetOwnerHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetOwnerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previousAssetOwnerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `endTime` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `historyType` enum('bulkupload','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetOwners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guardian` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regNO` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueID` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '0',
  `emailID` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isImport` tinyint(4) DEFAULT '0',
  `importUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDepartmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `assetOwnerTransferElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transferUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusFlag` int(11) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `statusTimeStamp` datetime DEFAULT NULL,
  `confirmedStatus` enum('Pending','Confirmed','Acknowledged') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `fileURL` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Used for asset return & issual';

CREATE TABLE IF NOT EXISTS `assetOwnerTransferMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newAssetHolder` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `assetOwnerUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUserUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferAssetCount` int(11) DEFAULT '0',
  `newAssetLocation` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiatedVenueUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferStatus` enum('Pending','Rejected','Accepted','Cancelled','Approved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Inactive',
  `cancelFlag` int(11) DEFAULT '0',
  `source` enum('web','app') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTimestamp` datetime DEFAULT NULL,
  `cancelTimestamp` datetime DEFAULT NULL,
  `acknowledged` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `acknowledgedOn` datetime DEFAULT NULL,
  `transporterName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterDetails` text COLLATE utf8mb4_unicode_ci,
  `vehicleDetails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newAssetsCount` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `rejectionRemarks` text COLLATE utf8mb4_unicode_ci,
  `additionalDetails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferAcknowledgment` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferUpdated` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No' COMMENT 'Updated Yes only after the acknowledgement confirmation',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Used for asset return & issual';

CREATE TABLE IF NOT EXISTS `assetSpotAuditMaster` (
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ongoing','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ongoing',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startedOn` datetime NOT NULL,
  `endedOn` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`auditUUID`),
  KEY `venueUUID` (`venueUUID`),
  KEY `zoneUUID` (`zoneUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `auditUUID` (`auditUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetSpotAuditMechanism` (
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetFoundTime` datetime DEFAULT NULL,
  `assetFoundZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetFoundFlag` enum('via-audit-asset','via-extra-asset') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  KEY `auditUUID` (`auditUUID`),
  KEY `assetUUID` (`assetUUID`),
  KEY `venueUUID` (`venueUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `assetZoneUUID` (`assetZoneUUID`),
  KEY `assetFoundZoneUUID` (`assetFoundZoneUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetTrackingHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gatewayMacID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rssi` smallint(6) DEFAULT NULL,
  `ibeaconTxPower` smallint(6) DEFAULT NULL,
  `battery` smallint(6) DEFAULT NULL,
  `firstSeenTime` datetime DEFAULT NULL,
  `lastSeenTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `macID` (`macID`),
  KEY `gatewayMacID` (`gatewayMacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetTrackingMechanism` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagTypeID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bluzoneDeviceId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initialZone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentZone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previousZone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venue` mediumtext COLLATE utf8mb4_unicode_ci,
  `rssi` smallint(6) DEFAULT '-100',
  `lastSeenGatewayMacID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstSeenTime` datetime DEFAULT NULL,
  `lastSeenTime` datetime DEFAULT NULL,
  `lastSeenLat` decimal(20,17) DEFAULT NULL,
  `lastSeenLng` decimal(20,17) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `disabledFlag` tinyint(4) DEFAULT '0',
  `defaultTagType` tinyint(4) DEFAULT '0',
  `tagTypeIDexportFlag` tinyint(4) DEFAULT '0' COMMENT '0-exported,1-nonexported',
  PRIMARY KEY (`id`),
  KEY `tagTypeID` (`tagTypeID`),
  KEY `tagType` (`tagType`),
  KEY `ts` (`ts`),
  KEY `assetUUID` (`assetUUID`),
  KEY `currentZone` (`currentZone`),
  KEY `lastSeenGatewayMacID` (`lastSeenGatewayMacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assetTransactionElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `returnFlag` int(11) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `returnTimeStamp` datetime DEFAULT NULL,
  `returnUserUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `returnExpired` smallint(6) DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `confirmedStatus` enum('Pending','Confirmed','Acknowledged','direct-acknowledged') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `confirmedRemarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileURL` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assetUUID` (`assetUUID`),
  KEY `transactionUUID` (`transactionUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Used for asset return & issual';

CREATE TABLE IF NOT EXISTS `assetTransactionMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transactionName` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newAssetUser` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetOwnerUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUserUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignedPeriodValue` int(11) DEFAULT NULL,
  `assignedPeriodType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuedAssetCount` int(11) DEFAULT '0',
  `returnedAssetCount` int(11) DEFAULT '0',
  `source` enum('web','app') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferStatus` enum('Approved','Rejected','Pending','Cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `transferDate` datetime DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `transactionPeriodTimestamp` datetime DEFAULT NULL,
  `updatedTimestamp` datetime DEFAULT NULL,
  `newAssetLocation` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiatedVenueUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterDetails` text COLLATE utf8mb4_unicode_ci,
  `vehicleDetails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newAssetsCount` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `rejectionRemarks` text COLLATE utf8mb4_unicode_ci,
  `acknowledged` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `acknowledgedOn` datetime DEFAULT NULL,
  `additionalDetails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferAcknowledgment` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferUpdated` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No' COMMENT 'Updated Yes only after the acknowledgement  confirmation',
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used for asset return & issual';

CREATE TABLE IF NOT EXISTS `attendanceRules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ruleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetStatus` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCountType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCount` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTime` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTimePeriod` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zones` mediumtext COLLATE utf8mb4_unicode_ci,
  `peopleValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `gates` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterBylabel` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labelInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `labelExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterBycategory` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `categoryExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `dateRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateRangeFrom` date DEFAULT NULL,
  `dateRangeTo` date DEFAULT NULL,
  `timeRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeFrom` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeTo` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekDays` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_days` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyNumber` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isWebhook` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEmail` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailids` mediumtext COLLATE utf8mb4_unicode_ci,
  `isSms` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '1',
  `mobileNumbers` mediumtext COLLATE utf8mb4_unicode_ci,
  `disabledFlag` bit(1) NOT NULL DEFAULT b'0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `attendanceSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullAttendance` int(11) NOT NULL DEFAULT '0',
  `lateBuffer` int(11) NOT NULL DEFAULT '0',
  `assetType` int(11) NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `attendanceWorkingHourSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekStartDay` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultDayStartTime` time NOT NULL DEFAULT '00:00:00',
  `defaultDayEndTime` time NOT NULL DEFAULT '00:00:00',
  `defaultDayPeriodDuration` int(11) NOT NULL DEFAULT '0',
  `totalWorkingHours` int(11) NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `auditLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Client - clientUUID , Partner - PartnerUUID, administrator - null',
  `userUUID` char(100) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `appUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '//1=Customer //2-Partner',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `syschange` mediumtext COLLATE utf8mb4_unicode_ci,
  `processedInfo` mediumtext COLLATE utf8mb4_unicode_ci,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `portaltype` enum('Client','Partner','Administrator') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetList` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientID` (`clientUUID`),
  KEY `portaltype` (`appUUID`),
  KEY `emailID` (`userUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `barcodeRawData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mac_address` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antennaPort` int(11) DEFAULT NULL,
  `epc` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mac_address` (`mac_address`) USING BTREE,
  KEY `antennaPort` (`antennaPort`) USING BTREE,
  KEY `epc` (`epc`) USING BTREE,
  KEY `zone` (`zoneUUID`) USING BTREE,
  KEY `minute` (`clientUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `barcodeVisitData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epc` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentZone` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startingTime` datetime DEFAULT NULL,
  `endingTime` datetime DEFAULT NULL,
  `timegap` int(11) DEFAULT '1',
  `closed` int(11) NOT NULL DEFAULT '0',
  `previousZone` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `bleRawData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mac_address` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceName` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorNumber` int(11) DEFAULT NULL,
  `gatewayMacID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `longitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `rssi` smallint(6) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `localTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mac_address` (`mac_address`),
  KEY `floorNumber` (`floorNumber`),
  KEY `rssi` (`rssi`),
  KEY `gatewayMacID` (`gatewayMacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `bleVisitData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bleTagTypeID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gatewayMacID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentZone` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startingTime` datetime DEFAULT NULL,
  `endingTime` datetime DEFAULT NULL,
  `timegap` int(11) DEFAULT '1',
  `closed` int(11) NOT NULL DEFAULT '0',
  `previousZone` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `rssi` smallint(6) NOT NULL DEFAULT '-90',
  PRIMARY KEY (`id`),
  KEY `bleTagTypeID` (`bleTagTypeID`),
  KEY `floorplanUUID` (`floorplanUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `buildingMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buildingName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` mediumtext COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `longitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingShortCode` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `venueUUID` (`venueUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `businessUnitMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessUnitUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessUnitCode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessUnitName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `businessUnitUUID` (`businessUnitUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `categoryAssetManagers` (
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetManagerUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('org','venue','venue-default') COLLATE utf8mb4_unicode_ci NOT NULL,
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `CCWCustomerDetails` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccw_client_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccw_client_secret` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Enabled','Disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `CCWJobLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccwOrderID` int(11) NOT NULL,
  `ccwOrderUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `CCWOrderDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccwOrderUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccwPONumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccwSalesOrderID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccwWebOrderID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccwStatus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccwOrderInfo` longtext COLLATE utf8mb4_unicode_ci,
  `ccwOrderSerialNumberInfo` longtext COLLATE utf8mb4_unicode_ci,
  `createdTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `CCWOrderList` (
  `ccwOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `ccwOrderUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asnNumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyType` enum('SalesOrderID','PONumber','WebOrderID') COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyValue` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Ongoing','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ccwOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `clientFileMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bleHardwareType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bleHardwareAPIKey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merakiPushAPIKey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featureSet` int(11) DEFAULT '1023',
  `APISecret` text COLLATE utf8mb4_unicode_ci,
  `leafletEnable` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `clientSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingsId` int(11) NOT NULL DEFAULT '0',
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `clientWhiteLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationTitle` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileURL` text COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','Deleted') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `contractHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `contractMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintananceContractName` mediumtext COLLATE utf8mb4_unicode_ci,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `renewalReminder` tinyint(4) DEFAULT NULL,
  `vendor` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileUpload` text COLLATE utf8mb4_unicode_ci,
  `email` mediumtext COLLATE utf8mb4_unicode_ci,
  `sla` text COLLATE utf8mb4_unicode_ci,
  `vendorContact` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `contractMasterFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `relationType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '//image -> ',
  `fileSize` int(11) DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `costCenterMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessUnitUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costCenterUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costCenterCode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costCenterName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultCostCenter` tinyint(4) NOT NULL DEFAULT '0',
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `costCenterUUID` (`costCenterUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `currencyMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencySymbol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currencyName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `exchangeValue` float(10,5) NOT NULL DEFAULT '0.00000',
  `lastUpdatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFieldData` (
  `customFieldDataUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `customFieldUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `moduleUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sectionUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relatedUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldData` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldType` enum('text','number','select','checkbox-group','radio-group','textarea') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customFieldDataUUID`),
  KEY `customFieldUUID` (`customFieldUUID`),
  KEY `moduleUUID` (`moduleUUID`),
  KEY `sectionUUID` (`sectionUUID`),
  KEY `relatedUUID` (`relatedUUID`),
  KEY `clientUUID` (`clientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFieldMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `customUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fieldName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldData` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetFlag` int(11) NOT NULL DEFAULT '0',
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `assetUUID` (`assetUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFieldModules` (
  `moduleUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `displayFlag` enum('Show','Hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Show',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`moduleUUID`),
  KEY `urlKey` (`urlKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFields` (
  `customFieldUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLabel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sectionUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderNumber` int(11) NOT NULL,
  `fieldType` enum('text','number','select','checkbox-group','radio-group','textarea') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldOptions` json NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `clientUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customFieldUUID`) USING BTREE,
  KEY `customFieldUUID` (`customFieldUUID`) USING BTREE,
  KEY `clientUUID` (`clientUUID`) USING BTREE,
  KEY `module` (`moduleUUID`) USING BTREE,
  KEY `sectionUUID` (`sectionUUID`),
  KEY `orderNumber` (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFieldSections` (
  `sectionUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sectionName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlKey` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isCommon` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `displayFlag` enum('Show','Hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Show',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sectionUUID`),
  KEY `moduleUUID` (`moduleUUID`),
  KEY `urlKey` (`urlKey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customFieldSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customFieldUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `customFieldList` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `defaultSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buildingUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoneUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `deliveryNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferType` enum('Permanent','Temporary') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuedUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorisedUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberStartFrom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNoteNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `deliveryNotesSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNoteTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotedisclaimer` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Inactive',
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `departmentMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentCode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultDepartment` tinyint(4) DEFAULT '0',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentUUID` (`departmentUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `depreciationHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciationUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profilePeriod` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciationExpense` decimal(10,3) DEFAULT NULL,
  `assetCurrentValue` decimal(10,3) DEFAULT NULL,
  `retirementFlag` tinyint(4) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `depreciationProfileMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileLife` int(11) DEFAULT NULL,
  `acceleratedType` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileType` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profilePeriod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `disposalSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `approvalType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalDept` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelValue` text COLLATE utf8mb4_unicode_ci,
  `departmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `dummyAssets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dummyAssetId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `earMarkingApprovalHistory` (
  `historyUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` enum('anyone','all','hierarchical') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelType` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevel` int(2) DEFAULT '1',
  `roleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','rejected','cancelled','approved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`historyUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `earMarkingApprovals` (
  `requestUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingsUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oldCustomerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `newCustomerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `approveStatus` enum('approved','pending','rejected','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`requestUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `earMarkingApprovalSettings` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `approvalType` enum('anyone','all','hierarchical') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevels` int(11) DEFAULT NULL,
  `levelType` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelTypeUUID` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settingsType` enum('store','org') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `emailDeliveryLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailID` text COLLATE utf8mb4_unicode_ci,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `MessageId` text COLLATE utf8mb4_unicode_ci,
  `RequestId` text COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `emailRuleAlertHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruleHistoryID` int(11) DEFAULT NULL,
  `emailID` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `emergencyAlertSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailUsers` longtext COLLATE utf8mb4_unicode_ci,
  `smsUsers` longtext COLLATE utf8mb4_unicode_ci,
  `dashboardUsers` longtext COLLATE utf8mb4_unicode_ci,
  `webHookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `disabledFlag` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = absent, 1=present, 2 = late, 3= partial',
  `scheduleBased` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `scheduleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeAttendanceToggleDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toggleDetailsUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `liveScheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentZoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toggleStatus` enum('present','absent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toggleRemarks` text COLLATE utf8mb4_unicode_ci,
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `toggleDetailsUUID` (`toggleDetailsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeAttendanceWeeklyCompliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currentZone` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `scheduleStartTime` time NOT NULL DEFAULT '00:00:00',
  `scheduleEndTime` time NOT NULL DEFAULT '00:00:00',
  `liveStartTime` datetime DEFAULT NULL,
  `liveEndTime` datetime DEFAULT NULL,
  `status` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeEntryExit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employeeName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employeeID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` tinyint(4) DEFAULT NULL,
  `gateName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventTime` datetime DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeLogicalLabelMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logicalLabelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logicalLabelName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagMap` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `employeeScheduleMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `entryExitEmployeeDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeName` char(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `employeeUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `employeeID` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentUUID` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `departmentName` char(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `entryInfo` json NOT NULL,
  `lastTime` datetime NOT NULL,
  `lastAction` tinyint(4) NOT NULL DEFAULT '0',
  `finished` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `createdDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdDate` (`createdDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `entryExitSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateName` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exitZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coolOfTime` int(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `external_almasaood_GRNTrigger` (
  `triggerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemInvetoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiceNumber` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asnNumber` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GRNNumber` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`triggerUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `fleetDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fleetRegNumber` tinytext COLLATE utf8mb4_unicode_ci,
  `fleetChasisNumber` tinytext COLLATE utf8mb4_unicode_ci,
  `fleetVinNumber` tinytext COLLATE utf8mb4_unicode_ci,
  `fleetModel` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetColor` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetMake` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetFuel` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetEngineSize` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetIcons` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `fleetRuleActionHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `ruleAssetStatusType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zoneuuid or gatewayuuid',
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closedFlag` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `openTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `closeTimeStamp` timestamp NULL DEFAULT NULL,
  `lastAlertTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `fleetRules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ruleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetStatus` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetCountType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCount` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetTime` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTimePeriod` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zones` mediumtext COLLATE utf8mb4_unicode_ci,
  `gates` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterByTags` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagsInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `tagsExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterBycategory` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `categoryExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `dateRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateRangeFrom` date DEFAULT NULL,
  `dateRangeTo` date DEFAULT NULL,
  `timeRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeFrom` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeTo` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekDays` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_days` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyNumber` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isWebhook` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEmail` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailids` mediumtext COLLATE utf8mb4_unicode_ci,
  `isSms` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '0',
  `mobileNumbers` mediumtext COLLATE utf8mb4_unicode_ci,
  `disabledFlag` tinyint(4) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `events` json DEFAULT NULL,
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `floorplanMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanLevel` int(11) NOT NULL,
  `floorplanName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `floorplanCode` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `floorplanImage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageHeight` int(11) DEFAULT NULL,
  `imageWidth` int(11) DEFAULT NULL,
  `centerLat` decimal(20,17) DEFAULT '0.00000000000000000',
  `centerLng` decimal(20,17) DEFAULT '0.00000000000000000',
  `SWLat` decimal(20,17) DEFAULT '0.00000000000000000',
  `SWLng` decimal(20,17) DEFAULT '0.00000000000000000',
  `NELat` decimal(20,17) DEFAULT '0.00000000000000000',
  `NELng` decimal(20,17) DEFAULT '0.00000000000000000',
  `angle` decimal(20,17) DEFAULT '0.00000000000000000',
  `zoom` int(11) DEFAULT '19',
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quuppaCoordinateSystemUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quuppaCoordinateSystemCoordinates` text COLLATE utf8mb4_unicode_ci,
  `deactivatedFlag` int(11) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `floorplanZones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `points` polygon NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mustering` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `uuid` (`uuid`),
  KEY `floorplanUUID` (`floorplanUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `gatewayMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gatewayName` mediumtext COLLATE utf8mb4_unicode_ci,
  `gatewayType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gatewayMacID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antennaPort` int(11) DEFAULT NULL,
  `blufideviceId` int(11) DEFAULT NULL,
  `virtualBeaconUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `virtualBeaconMajor` int(11) DEFAULT NULL,
  `virtualBeaconMinor` int(11) DEFAULT NULL,
  `lat` decimal(20,15) DEFAULT '0.000000000000000',
  `lng` decimal(20,15) DEFAULT '0.000000000000000',
  `lastPushedAt` datetime DEFAULT NULL,
  `activatedFlag` tinyint(4) NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isImport` tinyint(4) DEFAULT '0',
  `importUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `gatewayLocation` enum('floor','fleet') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'floor',
  PRIMARY KEY (`id`),
  KEY `gatewayMacID` (`gatewayMacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `gpsAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `longitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `localTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `gpsRawData` (
  `gpsraw_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `longitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `speed` decimal(20,15) DEFAULT '0.000000000000000',
  `angle` decimal(20,15) DEFAULT '0.000000000000000',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gatewayUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gpsTime` datetime DEFAULT NULL,
  PRIMARY KEY (`gpsraw_id`) USING BTREE,
  KEY `imei` (`imei`),
  KEY `clientUUID` (`clientUUID`),
  KEY `gatewayUUID` (`gatewayUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `gpsZones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneName` mediumtext COLLATE utf8mb4_unicode_ci,
  `points` polygon NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `incrementCounterSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `instantActionsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetStatus` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `timeType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assetTime` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zones` mediumtext COLLATE utf8mb4_unicode_ci,
  `gates` mediumtext COLLATE utf8mb4_unicode_ci,
  `notify` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyNumber` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isWebhook` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isMqtt` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mqtt` mediumtext COLLATE utf8mb4_unicode_ci,
  `disabledFlag` bit(1) NOT NULL DEFAULT b'0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryAuditMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reportName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buildingUUID` text COLLATE utf8mb4_unicode_ci,
  `floorUUID` text COLLATE utf8mb4_unicode_ci,
  `assignUserUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Upcoming','Ongoing','Completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` text COLLATE utf8mb4_unicode_ci,
  `assetType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCategory` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areaUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `createdUserUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processedStatus` enum('Pending','Processed') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryAuditUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `auditUUID` (`auditUUID`) USING BTREE,
  KEY `userUUID` (`userUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryBulkUpload` (
  `bulkUploadUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `awsUrl` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cronStatus` enum('pending','processed','running') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `totalRecords` int(11) NOT NULL DEFAULT '0',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemProcess` enum('add','edit','add-or-edit','nothing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `levelsProcess` enum('add','edit','add-or-edit','nothing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `storeItemMappingsProcess` enum('add','edit','add-or-edit','nothing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `storeItemLevelMappingProcess` enum('add','edit','add-or-edit','nothing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `asnProcess` enum('add','edit','add-or-edit','nothing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `flowType` enum('single-flow','multiple-flow') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'multiple-flow',
  `itemExisting` enum('skip-all','consider-remaining') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip-all',
  `uploadedAt` datetime NOT NULL,
  `uploadedBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bulkUploadUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryBulkUploadDetails` (
  `bulkUploadDetailsUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulkUploadUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rowData` json DEFAULT NULL,
  `status` enum('pending','processing','processed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryCreatedAt` datetime DEFAULT NULL,
  `entryStartedProcessingAt` datetime DEFAULT NULL,
  `entryFinishedProcessingAt` datetime DEFAULT NULL,
  `itemPartNumber` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStatus` enum('pending','running','created','skipped','existing','error') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemReason` text COLLATE utf8mb4_unicode_ci,
  `itemLog` json DEFAULT NULL,
  `levelStatus` enum('pending','created','skipped','existing','error','running') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdLevelUUIDs` json DEFAULT NULL,
  `editedLevelUUIDs` json DEFAULT NULL,
  `levelReason` text COLLATE utf8mb4_unicode_ci,
  `levelLog` json DEFAULT NULL,
  `itemStoreMappingStatus` enum('pending','created','skipped','existing','error','running','success') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreMappingReason` text COLLATE utf8mb4_unicode_ci,
  `itemStoreMappingLog` json DEFAULT NULL,
  `itemStoreMappingUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreLevelMappingStatus` enum('pending','created','skipped','existing','error','running','success') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreLevelMappingReason` text COLLATE utf8mb4_unicode_ci,
  `itemStoreLevelMappingLog` json DEFAULT NULL,
  `itemStoreLevelMappingUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asnStatus` enum('pending','created','error','running','success','failed','skipped') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asnLog` json DEFAULT NULL,
  `asnData` json DEFAULT NULL,
  `asnUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asnReason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`bulkUploadDetailsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryCategoryFields` (
  `fieldId` int(11) NOT NULL AUTO_INCREMENT,
  `fieldUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldCategoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldType` enum('static','custom') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldCreatedAt` datetime DEFAULT NULL,
  `fieldUpdatedAt` datetime DEFAULT NULL,
  `fieldCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldStatus` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryCategoryMaster` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryShortName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryDesc` text COLLATE utf8mb4_unicode_ci,
  `categoryCreatedAt` datetime DEFAULT NULL,
  `categoryCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryUpdatedAt` datetime DEFAULT NULL,
  `categoryUpdatedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryStatus` tinyint(4) NOT NULL DEFAULT '1',
  `categoryClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryAutoGenerateCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryCustomFieldValues` (
  `customFieldId` int(11) NOT NULL AUTO_INCREMENT,
  `customFieldUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectType` enum('item') COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectCategoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectValue` longtext COLLATE utf8mb4_unicode_ci,
  `valueCreatedAt` datetime DEFAULT NULL,
  `valueCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueUpdatedAt` datetime DEFAULT NULL,
  `valueUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customFieldStatus` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`customFieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryDeliveryNoteFields` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderedFieldList` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('issue','transfer') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryDeliveryNotes` (
  `deliveryNoteID` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryNoteUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliveryNoteNumber` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('stock-issue','stock-transfer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCount` int(11) NOT NULL DEFAULT '0',
  `pickListUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporterUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryPerson` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','to-be-delivered','delivery-completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`deliveryNoteID`),
  UNIQUE KEY `deliveryNoteUUID` (`deliveryNoteUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryDeliveryNotesSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('stock-issue','stock-transfer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noteDisclaimer` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryFiles` (
  `inventoryFileID` int(11) NOT NULL AUTO_INCREMENT,
  `inventoryFileUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileType` enum('delivery-note') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery-note',
  `fileTypeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`inventoryFileID`),
  UNIQUE KEY `inventoryFileUUID` (`inventoryFileUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryTagSettings` (
  `settingsUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`settingsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `inventoryTrackingHistory` (
  `trackingUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionType` enum('adn','issue','transfer','disposal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionTypeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickListUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNoteUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `historyType` enum('adn','adn-item','adn-inventory','issue','issue-item','issue-inventory','transfer','transfer-item','transfer-inventory','disposal-approved','disposal-rejected','disposal-cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionMessage` mediumtext COLLATE utf8mb4_unicode_ci,
  `actionCreatedAt` datetime DEFAULT NULL,
  `actionUpdatedAt` datetime DEFAULT NULL,
  `actionCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` json DEFAULT NULL,
  PRIMARY KEY (`trackingUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `itemMaster` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemAutoGenerateCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCategoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCategoryDesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `itemName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemSkuNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemTracking` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `itemUniqueFields` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemInventoryFields` mediumtext COLLATE utf8mb4_unicode_ci,
  `itemDesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `itemShortName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemMfdDate` date DEFAULT NULL,
  `itemDimension` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemExpDate` date DEFAULT NULL,
  `itemBrandName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemReorderLevel` int(11) DEFAULT NULL,
  `itemPurchasePrice` float DEFAULT NULL,
  `itemMaxLevel` int(11) DEFAULT NULL,
  `itemMinLevel` int(11) DEFAULT NULL,
  `itemStockUOM` enum('qty','box','volume','weight') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemSparePartTag` json DEFAULT NULL,
  `itemLinked` json DEFAULT NULL,
  `priceMethod` enum('weighted-average','input-value') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueCalcMethod` enum('fifo','lifo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ageField` enum('inv-age','mfg-date','exp-date') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemCreatedAt` datetime DEFAULT NULL,
  `itemCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemUpdatedAt` datetime DEFAULT NULL,
  `itemUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStatus` tinyint(4) NOT NULL DEFAULT '1',
  `dimension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subItem` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentItemUUID` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`itemId`) USING BTREE,
  KEY `itemUUID` (`itemUUID`),
  KEY `itemClientUUID` (`itemClientUUID`),
  KEY `itemCategoryUUID` (`itemCategoryUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `itemNotificationSettings` (
  `itemNotificationUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invAge` json DEFAULT NULL,
  `mfgDate` json DEFAULT NULL,
  `expDate` json DEFAULT NULL,
  `moveStock` json DEFAULT NULL,
  `createdAt` timestamp NOT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemNotificationUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `itemStoreLevels` (
  `itemStoreLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `itemStoreLevelUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoneUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `levelUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemStoreLevelCreatedAt` datetime DEFAULT NULL,
  `itemStoreLevelUpdatedAt` datetime DEFAULT NULL,
  `itemStoreLevelCreatedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreLevelUpdatedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreLevelStatus` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`itemStoreLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `itemStores` (
  `itemStoreId` int(11) NOT NULL AUTO_INCREMENT,
  `itemStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemStoreCreatedAt` datetime DEFAULT NULL,
  `itemStoreUpdatedAt` datetime DEFAULT NULL,
  `itemStoreCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemStoreUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`itemStoreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `licenseMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trialFlag` tinyint(4) NOT NULL DEFAULT '0',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bleGatewayCount` mediumint(9) NOT NULL DEFAULT '0',
  `rfidReaderCount` int(11) NOT NULL DEFAULT '0',
  `bleTagCount` int(11) NOT NULL DEFAULT '0',
  `gpsTagCount` int(11) NOT NULL DEFAULT '0',
  `rfidTagCount` int(11) NOT NULL DEFAULT '0',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `expiredFlag` tinyint(4) NOT NULL DEFAULT '0',
  `encdata` text COLLATE utf8mb4_unicode_ci,
  `createdTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `liveAttendanceScheduleDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liveScheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `scheduleDetailsId` int(11) DEFAULT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` text COLLATE utf8mb4_unicode_ci,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `previousZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneToggleRemarks` text COLLATE utf8mb4_unicode_ci,
  `zoneToggleFlag` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0 = Default, 1 = Changed',
  `zoneStatusFlag` enum('temporary','permanent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendenceToggleFlag` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 = Default, 1 = Changed',
  `timeOff` tinyint(4) DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleFlag` tinyint(4) DEFAULT '0',
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUpdatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUpdatedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uuid` (`liveScheduleUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `logicalLabelManagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logicalLabelName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `logicalLabelLevel` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `logicalLabelScheduleMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `logicalLabelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eduFlag` tinyint(4) DEFAULT NULL COMMENT '1= student 2=employee',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceAgent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agentName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` json DEFAULT NULL,
  `reportingUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultContact` enum('email','phone') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `superAgent` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceCheckList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkListUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checklistName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkListOptions` json NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`checkListUUID`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceDepartment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agentUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceMasterFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationType` char(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '//image -> ',
  `fileSize` int(11) NOT NULL,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDefault` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceRateChart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rateUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateTitle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskType` enum('generic','taskbased') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'generic',
  `taskUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rateFor` enum('role','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRoleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ratePerHour` float DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rateUUID`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceTaskCost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenanceTaskUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costDescription` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenanceCost` float NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceTaskSettings` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` enum('assets','people','inventory') COLLATE utf8mb4_unicode_ci DEFAULT 'assets',
  `settingsData` json DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingsTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `maintenanceWorkflowMaster` (
  `workflowUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workflowName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `workflowData` json DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `triggerCategory` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `triggerItem` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `triggerStatus` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` enum('asset','people','warehouse') COLLATE utf8_unicode_ci DEFAULT 'warehouse',
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workflowUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mobileAppDevices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceUniqueID` mediumtext COLLATE utf8mb4_unicode_ci,
  `appOSType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appOSVersion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebaseID` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `mobileApplicationNotificationSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startOfTheDay` tinyint(4) NOT NULL DEFAULT '0',
  `endOfTheDay` tinyint(4) NOT NULL DEFAULT '0',
  `scheduleSlotStart` tinyint(4) NOT NULL DEFAULT '0',
  `scheduleSlotEnd` tinyint(4) NOT NULL DEFAULT '0',
  `repeats` tinyint(4) NOT NULL DEFAULT '0',
  `dayStartTimeInterval` int(11) NOT NULL DEFAULT '0',
  `dayPeriodTimeInterval` int(11) NOT NULL DEFAULT '0',
  `dayEndTimeInterval` int(11) NOT NULL DEFAULT '0',
  `scheduleSlotStartTimeInterval` int(11) NOT NULL DEFAULT '0',
  `scheduleSlotEndTimeInterval` int(11) NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `musteringMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `musteringStartTime` datetime DEFAULT NULL,
  `musteringEndTime` datetime DEFAULT NULL,
  `musteredEmployeeNumber` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `notificationChangeHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notificationType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `objectUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectType` enum('asset','employee','student','fleet','inventory') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changeDetails` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','completed','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `errorMessage` longtext COLLATE utf8mb4_unicode_ci,
  `dbError` longtext COLLATE utf8mb4_unicode_ci,
  `importedTime` datetime DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `notificationSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `notificationType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notificationStatus` enum('on','off') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipientType` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipients` json NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `parentAssets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `parentVisitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partnerName` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `partnerUserLoginHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` mediumtext COLLATE utf8mb4_unicode_ci,
  `userID` int(11) DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `partnerUserRoleMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleFeatures` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `partnerUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `partnerUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onesignalID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspendedFlag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `partnerUsersOrgAccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnerUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnerUserRoleUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspendedFlag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `peopleCategoryElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainCategoryUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryOne` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryTwo` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryThree` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subCategoryFour` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `categoryUUID` (`categoryUUID`) USING BTREE,
  KEY `assetUUID` (`assetUUID`) USING BTREE,
  KEY `mainCategoryUUID` (`mainCategoryUUID`) USING BTREE,
  KEY `subCategoryOne` (`subCategoryOne`) USING BTREE,
  KEY `subCategoryTwo` (`subCategoryTwo`) USING BTREE,
  KEY `subCategoryThree` (`subCategoryThree`) USING BTREE,
  KEY `subCategoryFour` (`subCategoryFour`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `peopleCategoryMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryName` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryCode` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `parentId` int(11) DEFAULT NULL,
  `categoryLevel` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE,
  KEY `categoryName` (`categoryName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `permanentTransferWorkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalUserUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approverLevel` tinyint(4) NOT NULL DEFAULT '0',
  `approvalStatus` enum('Pending','Approved','Rejected','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `approvalRequest` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `createdDate` datetime NOT NULL,
  `approvedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `pickListMaster` (
  `pickListID` int(11) NOT NULL AUTO_INCREMENT,
  `pickListUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickListNumber` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('stock-issue','stock-transfer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCount` int(11) NOT NULL DEFAULT '0',
  `status` enum('open','assigned-to-queue','partial','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pickListID`),
  UNIQUE KEY `pickListUUID` (`pickListUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `preDefinedTagFiles` (
  `tagUploadFileUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tagFileName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagType` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s3Path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `localPath` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploadStatus` enum('success','partial','failed') COLLATE utf8mb4_unicode_ci DEFAULT 'success',
  `totalCount` int(11) NOT NULL DEFAULT '0',
  `proccessedCount` int(11) NOT NULL DEFAULT '0',
  `skippedCount` int(11) NOT NULL DEFAULT '0',
  `skippedData` json DEFAULT NULL,
  PRIMARY KEY (`tagUploadFileUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `preDefinedTags` (
  `preDefindTagUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagFileUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventoryID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagType` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagStatus` enum('added','exist','skipped','removed','assigned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'added',
  `tagCreatedAt` datetime DEFAULT NULL,
  `tagUpdatedAt` datetime DEFAULT NULL,
  `tagCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`preDefindTagUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `reportsFilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reportName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filterValue` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `retriggerApis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiType` enum('internal','external','retry') COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tableName` text COLLATE utf8mb4_unicode_ci,
  `defaultColums` text COLLATE utf8mb4_unicode_ci,
  `apiURL` text COLLATE utf8mb4_unicode_ci,
  `module` enum('asset','warehouse') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'asset',
  `condition` text COLLATE utf8mb4_unicode_ci,
  `apiMethod` enum('GET','POST') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiAuthType` enum('basic','bearertoken') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiUserName` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiPassword` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiBearerToken` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rfidRawData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gateway` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antennaPort` int(11) DEFAULT NULL,
  `epc` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floorplanUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `antennaPort` (`antennaPort`),
  KEY `epc` (`epc`),
  KEY `mac_address` (`gateway`) USING BTREE,
  KEY `zone` (`zoneUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rfidVisitData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `epc` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentGateway` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startingTime` datetime DEFAULT NULL,
  `endingTime` datetime DEFAULT NULL,
  `timegap` int(11) DEFAULT '1',
  `count` int(11) DEFAULT '0',
  `closed` int(11) NOT NULL DEFAULT '0',
  `previousZone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ruleActionHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `ruleAssetStatusType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zoneuuid or gatewayuuid',
  `assetUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `openRemarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `closedFlag` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `openTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `closeTimeStamp` timestamp NULL DEFAULT NULL,
  `lastAlertTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rule_id` (`rule_id`),
  KEY `assetUUID` (`assetUUID`),
  KEY `closedFlag` (`closedFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruleName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetStatus` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCountType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetCount` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTime` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTimePeriod` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zones` mediumtext COLLATE utf8mb4_unicode_ci,
  `enteringZone` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exitingZone` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gates` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterByTags` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagsInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `tagsExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `filterBycategory` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryInclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `categoryExclude` mediumtext COLLATE utf8mb4_unicode_ci,
  `dateRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateRangeFrom` date DEFAULT NULL,
  `dateRangeTo` date DEFAULT NULL,
  `timeRange` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeFrom` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeRangeTo` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekDays` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_days` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruleNotification` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `notify` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyNumber` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isWebhook` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEmail` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailids` mediumtext COLLATE utf8mb4_unicode_ci,
  `isSms` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '0',
  `mobileNumbers` mediumtext COLLATE utf8mb4_unicode_ci,
  `disabledFlag` bit(1) NOT NULL DEFAULT b'0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `scheduleDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` text COLLATE utf8mb4_unicode_ci,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `zone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeOff` tinyint(4) DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleFlag` tinyint(4) DEFAULT '0',
  `venueUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `scheduleMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleDescription` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Active 1-Inactive',
  `lock` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0- Unlock 1-Lock',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullAttendance` int(11) DEFAULT NULL,
  `lateBufferMin` int(11) DEFAULT NULL,
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scheduleType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-BLE Based, 1- GPS Based',
  `scheduleStartTime` time DEFAULT NULL,
  `scheduleEndTime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `securityAlertEnableList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alertType` enum('asset-alert','people-alert','access-profile-alert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `securityAlertRemarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `securityAlertUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionHandledBy` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionHandledAt` datetime NOT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarkType` enum('acknowldged','closed','remark') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `securityAlerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetType` enum('employees','students','visitors','assets','others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accessType` longtext COLLATE utf8mb4_unicode_ci,
  `closedFlag` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `openRemarks` longtext COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastSeenLat` decimal(20,17) DEFAULT NULL,
  `lastSeenLng` decimal(20,17) DEFAULT NULL,
  `openTimeStamp` timestamp NULL DEFAULT NULL,
  `closeTimeStamp` timestamp NULL DEFAULT NULL,
  `lastAlertTimeStamp` timestamp NULL DEFAULT NULL,
  `alertType` enum('asset-alert','people-alert','access-profile-alert') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alertStatus` enum('new','closed','acknowldged') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `securityAlertSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailUsers` longtext COLLATE utf8mb4_unicode_ci,
  `smsUsers` longtext COLLATE utf8mb4_unicode_ci,
  `dashboardUsers` longtext COLLATE utf8mb4_unicode_ci,
  `webHookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `disabledFlag` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `selfAuditDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditid` int(11) NOT NULL DEFAULT '0',
  `assetholder` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentAssets` mediumtext COLLATE utf8mb4_unicode_ci,
  `responseAssets` mediumtext COLLATE utf8mb4_unicode_ci,
  `missingAssets` mediumtext COLLATE utf8mb4_unicode_ci,
  `newAssets` mediumtext COLLATE utf8mb4_unicode_ci,
  `responseStatus` tinyint(1) NOT NULL DEFAULT '0',
  `escalation` tinyint(1) NOT NULL DEFAULT '0',
  `totalAssets` int(11) DEFAULT '0',
  `newAssetsCount` int(11) DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `selfAuditMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditName` mediumtext COLLATE utf8mb4_unicode_ci,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `departmentUUID` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetholder` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `selfAuditSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8mb4_unicode_ci,
  `reminderMail` longtext COLLATE utf8mb4_unicode_ci,
  `reminderDays` tinyint(1) DEFAULT NULL,
  `reminderInputOne` tinyint(1) DEFAULT NULL,
  `reminderInputTwo` tinyint(1) DEFAULT NULL,
  `reminderInputThree` tinyint(1) DEFAULT NULL,
  `escalationEmail` longtext COLLATE utf8mb4_unicode_ci,
  `emailType` longtext COLLATE utf8mb4_unicode_ci,
  `auditapprovalDept` longtext COLLATE utf8mb4_unicode_ci,
  `auditdepartmentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `afterDays` tinyint(4) DEFAULT NULL,
  `afterType` longtext COLLATE utf8mb4_unicode_ci,
  `auditFrequency` tinyint(4) DEFAULT NULL,
  `frequencyType` longtext COLLATE utf8mb4_unicode_ci,
  `userRole` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `smsSendInfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `to` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Sms Send Details ';

CREATE TABLE IF NOT EXISTS `stockAdjustment` (
  `stockAdjustmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockRequestCode` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCount` int(11) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stockAdjustmentUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `itemUUID` (`itemUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockAdjustmentItems` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockAdjustmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `removedStatus` enum('pending','removed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `stockAdjustmentUUID` (`stockAdjustmentUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `itemUUID` (`itemUUID`),
  KEY `inventoryItemUUID` (`inventoryItemUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockIssue` (
  `stockIssueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockIssueNumber` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `stockIssueStatus` enum('pending','partially-issued','issued','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `itemCount` int(11) NOT NULL,
  `totalQuantity` int(11) NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stockIssueUUID`),
  KEY `stockIssueNumber` (`stockIssueNumber`),
  KEY `stockIssueStatus` (`stockIssueStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockIssueDetails` (
  `stockIssueDetailsUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockIssueUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestedQuantity` int(11) NOT NULL DEFAULT '0',
  `approvedQuantity` int(11) NOT NULL DEFAULT '0',
  `status` enum('Open','Completed','Partial','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastIssuedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastIssuedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`stockIssueDetailsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockMovedItems` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockMoveUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentLocation` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentLevel` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `newLocation` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newLevel` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moveStatus` enum('pending','moved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `stockMoveUUID` (`stockMoveUUID`),
  KEY `clientUUID` (`clientUUID`),
  KEY `itemUUID` (`itemUUID`),
  KEY `storeUUID` (`storeUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockMovement` (
  `stockMoveUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockRequestCode` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemCount` int(11) NOT NULL DEFAULT '0',
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stockMoveUUID`) USING BTREE,
  KEY `stockMoveUUIDD` (`stockMoveUUID`) USING BTREE,
  KEY `clientUUID` (`clientUUID`),
  KEY `itemUUID` (`itemUUID`),
  KEY `storeUUID` (`storeUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockTransfer` (
  `stockTransferID` int(11) NOT NULL AUTO_INCREMENT,
  `stockTransferUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockTransferNumber` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','partially-transferred','transferred','cancelled','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `itemCount` int(11) NOT NULL,
  `totalQuantity` int(11) NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stockTransferID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stockTransferApprovalHistory` (
  `historyUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` enum('anyone','all','hierarchical') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelType` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevel` int(2) DEFAULT '1',
  `roleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`historyUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `stockTransferApprovals` (
  `requestUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transferUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approvalStatus` enum('approved','pending','rejected','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`requestUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `stockTransferDetails` (
  `stockTransferDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `stockTransferDetailsUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockTransferUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toStoreUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestedQuantity` int(11) NOT NULL,
  `approvedQuantity` int(11) NOT NULL,
  `status` enum('Open','Completed','Partial','Cancelled','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`stockTransferDetailsID`),
  UNIQUE KEY `stockTransferDetailsUUID` (`stockTransferDetailsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `storeLevels` (
  `storeLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `storeLevelUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeLevelName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeLevelCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeLevelGroupUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeLevelNumber` int(11) NOT NULL DEFAULT '1',
  `storeLevelParentUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeLevelParentId` int(11) DEFAULT NULL,
  `storeLevelLowest` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `storeLevelCapacity` int(11) DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `via` enum('dashboard','bulkupload') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dashboard',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`storeLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `storeMaster` (
  `storeId` int(11) NOT NULL AUTO_INCREMENT,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeAutoGenerateCode` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeShortName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeDesc` text COLLATE utf8mb4_unicode_ci,
  `storeLocation` text COLLATE utf8mb4_unicode_ci,
  `storeCountry` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeCity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeZip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeVenueUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeLevel` enum('venue','building','floor','zone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeBuildingUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeFloorUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeStatus` enum('enable','disable') COLLATE utf8mb4_unicode_ci DEFAULT 'enable',
  `storeDisabledStatus` tinyint(4) DEFAULT '1',
  `storeCreatedAt` datetime DEFAULT NULL,
  `storeUpdatedAt` datetime DEFAULT NULL,
  `storeUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeLicenseKey` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`storeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `storeUserRoles` (
  `storeUserRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `storeUserRoleUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleCount` tinyint(4) DEFAULT NULL,
  `selectedCount` tinyint(4) DEFAULT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUserRoleCreatedAt` datetime DEFAULT NULL,
  `storeUserRoleUpdatedAt` datetime DEFAULT NULL,
  `storeUserRoleCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUserRoleUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabledStatus` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`storeUserRoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `structureCollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floorkey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `structureCollection` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `trudePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trudeFile` blob,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentAttendancePercentage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentAttendanceDetailsUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendancePercentage` int(11) DEFAULT '0',
  `presentCount` int(11) DEFAULT '0',
  `absentCount` int(11) DEFAULT '0',
  `lateCount` int(11) DEFAULT '0',
  `totalDays` int(11) DEFAULT '0',
  `scheduleStartDate` date DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentAttendanceToggleDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toggleDetailsUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `liveScheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentZoneUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toggleStatus` enum('present','absent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toggleRemarks` text COLLATE utf8mb4_unicode_ci,
  `updatedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `toggleDetailsUUID` (`toggleDetailsUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentAttendanceWeeklyCompliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currentZone` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `scheduleStartTime` time NOT NULL DEFAULT '00:00:00',
  `scheduleEndTime` time NOT NULL DEFAULT '00:00:00',
  `liveStartTime` datetime DEFAULT NULL,
  `liveEndTime` datetime DEFAULT NULL,
  `status` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `statusChange` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0- not changed, 1-changed',
  `statusChangedBy` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusChangedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentEmployeePersonal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinytext COLLATE utf8mb4_unicode_ci,
  `email` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validTill` datetime DEFAULT NULL,
  `companyName` text COLLATE utf8mb4_unicode_ci,
  `accessProfileUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentLogicalLabelMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logicalLabelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logicalLabelName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagMap` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentMonthlyAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `scheduleBased` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `scheduleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentParentMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentParentMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `parentName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `emailID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parentStatus` enum('Enable','Disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Enable',
  `resetTime` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `studentScheduleMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `studentUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduleUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `subDepartmentMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subDepartmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subDepartmentCode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDepartmentName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultSubDepartment` tinyint(4) DEFAULT '0',
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subDepartmentUUID` (`subDepartmentUUID`),
  KEY `departmentUUID` (`departmentUUID`),
  KEY `clientUUID` (`clientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `superAdminUserLoginHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` mediumtext COLLATE utf8mb4_unicode_ci,
  `userID` int(11) DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `superAdminUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onesignalID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspendedFlag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `supplierMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierCode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplierName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierDescription` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplierUUID` (`supplierUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `taskAssetElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assetUUID` (`assetUUID`),
  KEY `taskUUID` (`taskUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `tasksComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_ci,
  `taskUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `tasksEscalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeEscalation` enum('role','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escalationTrigger` int(11) DEFAULT NULL,
  `escalationBase` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `tasksHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `syschange` mediumtext COLLATE utf8mb4_unicode_ci,
  `processedInfo` mediumtext COLLATE utf8mb4_unicode_ci,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tasksMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` enum('todo','inprogress','completed','cancelled','postponed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` enum('low','high','normal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskModule` enum('assets','people','inventory','generic') COLLATE utf8mb4_unicode_ci DEFAULT 'assets',
  `taskEscalation` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` enum('onetime','hourly','daily','weekly','monthly','yearly') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignedTo` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observers` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `deadlineMin` int(11) DEFAULT NULL,
  `reqHours` int(11) DEFAULT NULL,
  `reqMin` int(11) DEFAULT NULL,
  `hourlyRate` int(11) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `checkListUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checklistData` json DEFAULT NULL,
  `actionStatus` json DEFAULT NULL,
  `completedActionStatus` int(11) DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templateUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `via` enum('dashboard','url') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dashboard',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tasksTemplateAssets` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `templateUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` enum('assets','people','inventory') COLLATE utf8mb4_unicode_ci DEFAULT 'assets',
  `templateAssociated` enum('preventive','corrective','transfer','contracts','eol','generic-asset','rules','inventoryaudit','generic','accessprofile','delivery','pickup') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetTags` json DEFAULT NULL,
  `assetCategory` json DEFAULT NULL,
  `assetDepartment` json DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tasksTemplateEscalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `templateUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeEscalation` enum('role','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escalationTrigger` int(11) DEFAULT NULL,
  `escalationBase` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tasksTemplateMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templateTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `priority` enum('low','high','normal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskEscalation` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` enum('onetime','hourly','daily','weekly','monthly','yearly') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templateModule` enum('assets','people','inventory','generic') COLLATE utf8mb4_unicode_ci DEFAULT 'generic',
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadlineMin` int(11) DEFAULT NULL,
  `reqHours` int(11) DEFAULT NULL,
  `reqMin` int(11) DEFAULT NULL,
  `hourlyRate` int(11) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `checkListUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actionStatus` json DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `taskTypeEscalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeEscalation` enum('role','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escalationTrigger` int(11) DEFAULT NULL,
  `escalationBase` mediumtext COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `taskTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeTask` enum('recurring','manual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `parentTypeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeEscalation` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeStatus` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeUUID` (`typeUUID`),
  KEY `parentTypeUUID` (`parentTypeUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tempAssetMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetName` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetIdentifier` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetSerialNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetOwner` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetOwnerEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetManager` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetManagerEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `eduFlag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 -assets ,1-student,2-employee,3-visitor,4-fleets  ',
  `assetRemovability` mediumtext COLLATE utf8mb4_unicode_ci,
  `venue` mediumtext COLLATE utf8mb4_unicode_ci,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `assetValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `estimatedSalvageValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `serviceDate` date DEFAULT NULL,
  `periodicCalibration` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periodicDateIn` int(11) DEFAULT NULL,
  `depreciationStartDate` date DEFAULT NULL,
  `assetLifeTime` int(11) DEFAULT NULL,
  `accumulatedDepreciation` decimal(10,2) DEFAULT NULL,
  `assetCurrentValue` decimal(10,2) DEFAULT NULL,
  `assetPurchaseValue` decimal(10,2) DEFAULT NULL COMMENT 'asset purchase value',
  `endOfPeriod` date DEFAULT NULL,
  `eolDate` date DEFAULT NULL,
  `assetCriticality` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessUnitUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `costCenterUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `departmentUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `subDepartmentUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `categorycode` mediumtext COLLATE utf8mb4_unicode_ci,
  `category` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategorycodeOne` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategorycodeTwo` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategorycodeThree` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategorycodeFour` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategoryOne` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategoryTwo` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategoryThree` mediumtext COLLATE utf8mb4_unicode_ci,
  `subcategoryFour` mediumtext COLLATE utf8mb4_unicode_ci,
  `supplierCode` mediumtext COLLATE utf8mb4_unicode_ci,
  `supplierUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `supplieremail` mediumtext COLLATE utf8mb4_unicode_ci,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciationUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isImport` tinyint(4) DEFAULT '0',
  `retirementFlag` tinyint(4) DEFAULT '0',
  `depreciationCalculated` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `retirementReason` text COLLATE utf8mb4_unicode_ci,
  `importUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrantyNotification` tinyint(4) DEFAULT '0',
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `PONumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ownershipRights` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseClassification` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warrantyEndDate` date DEFAULT NULL,
  `hireStartDate` date DEFAULT NULL,
  `hireEndDate` date DEFAULT NULL,
  `contractUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venueUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `buildingUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `floorplanUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `zoneUUID` mediumtext COLLATE utf8mb4_unicode_ci,
  `assetMake` tinytext COLLATE utf8mb4_unicode_ci,
  `skuNum` tinytext COLLATE utf8mb4_unicode_ci,
  `model` tinytext COLLATE utf8mb4_unicode_ci,
  `cubicle` text COLLATE utf8mb4_unicode_ci,
  `originalPurchaseCurrency` text COLLATE utf8mb4_unicode_ci,
  `originalPurchaseValue` text COLLATE utf8mb4_unicode_ci,
  `exchangeRate` text COLLATE utf8mb4_unicode_ci,
  `tagType` text COLLATE utf8mb4_unicode_ci,
  `tagTypeID` text COLLATE utf8mb4_unicode_ci,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `assetCurrency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetLabel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processedFlag` tinyint(3) DEFAULT '0',
  `errorFlag` tinyint(3) DEFAULT '0',
  `errorDescription` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `temporaryTransferWorkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalUserUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approverLevel` tinyint(4) NOT NULL DEFAULT '0',
  `approvalStatus` enum('Pending','Approved','Rejected','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `approvalRequest` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `createdDate` datetime NOT NULL,
  `approvedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `testJob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `transferVenueApprovalSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferType` enum('Temporary','Permanent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `approvalType` enum('Role','User') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalDept` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDepartmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole1` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole2` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole3` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole4` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID1` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID2` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID3` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID4` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotes` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotesNumberType` enum('Sequential','Random') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberStartFrom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefixType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefixValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffix` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffixType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffixValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Inactive',
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `venueUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='managing both permanent transfer and temporary transfer venue settings';

CREATE TABLE IF NOT EXISTS `transferWorkflowApprovalSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferType` enum('Temporary','Permanent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `approvalType` enum('Role','User') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalDept` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDepartmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole1` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole2` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole3` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole4` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID1` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID2` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID3` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userUUID4` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotes` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotesNumberType` enum('Sequential','Random') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberStartFrom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefixType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefixValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffix` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffixType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffixValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Inactive',
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `acknowledgment` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='managing both permanent transfer and temporary transfer settings';

CREATE TABLE IF NOT EXISTS `translationMaster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourceString` mediumtext COLLATE utf8mb4_unicode_ci,
  `langCode` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translatedString` mediumtext COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `transporterMaster` (
  `transporterID` int(11) NOT NULL AUTO_INCREMENT,
  `transporterUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporterAutoGeneratedID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporterAddress` longtext COLLATE utf8mb4_unicode_ci,
  `transporterCountry` mediumtext COLLATE utf8mb4_unicode_ci,
  `transporterCity` mediumtext COLLATE utf8mb4_unicode_ci,
  `transporterZip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterContactName` text COLLATE utf8mb4_unicode_ci,
  `transporterConatctEmail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterContactPhone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterStatus` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `transporterCreatedAt` date DEFAULT NULL,
  `transporterUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporterUpdatedAt` date DEFAULT NULL,
  `transporterClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`transporterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `transporterVehicleMaster` (
  `vechileID` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicleTransporterUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicleNumber` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vechicleType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicleModel` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicleStatus` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `vehicleCreatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicleCreatedAt` date DEFAULT NULL,
  `vehicleUpdatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicleUpdatedAt` date DEFAULT NULL,
  `vehicleClientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vechileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `userAlerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Client - clientUUID',
  `userUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `subject` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `readStatus` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `userDashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultDashboard` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `userDefaultCustomFields` (
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetCustomField` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleetCustomField` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peopleCustomField` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invetoryCustomField` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenanceCustomField` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `clientUUID` (`clientUUID`),
  KEY `userUUID` (`userUUID`),
  KEY `assetCustomField` (`assetCustomField`),
  KEY `fleetCustomField` (`fleetCustomField`),
  KEY `peopleCustomField` (`peopleCustomField`),
  KEY `invetoryCustomField` (`invetoryCustomField`),
  KEY `maintenanceCustomField` (`maintenanceCustomField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `userRoleMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleFeatures` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleType` enum('maintenance','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `venueDeliveryNotesSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNoteTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryNotedisclaimer` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `fileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileSize` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Inactive',
  `ts` datetime DEFAULT CURRENT_TIMESTAMP,
  `venueUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `venueDisposalSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `approvalType` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalDept` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelValue` text COLLATE utf8mb4_unicode_ci,
  `departmentUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalProcess` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `venueUUID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `venueMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venueName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` mediumtext COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `longitude` decimal(20,17) DEFAULT '0.00000000000000000',
  `orgUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `externalIntegrationID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `virtualBeaconVisitData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gatewayUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `virtualBeaconUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `virtualBeaconMajor` smallint(6) DEFAULT NULL,
  `virtualBeaconMinor` smallint(6) DEFAULT NULL,
  `firstSeenTime` datetime DEFAULT NULL,
  `lastSeenTime` datetime DEFAULT NULL,
  `visitDuration` int(11) DEFAULT '0',
  `visitClosedFlag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `visitorLogicalLabelMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitorName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logicalLabelUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logicalLabelName` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagMap` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouseAuditMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reportName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneUUID` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Upcoming','Ongoing','Completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ItemUUID` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startingDate` date DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `createdUserUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processedStatus` enum('Pending','Processed') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseAuditMechanism` (
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventryItemLevel` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventryItemZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventryItemFoundTime` datetime DEFAULT NULL,
  `inventryItemFoundZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventryItemFoundLevel` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryitemFoundFlag` enum('via-audit-item','via-extra-item') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseAuditUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `wareHouseCustomers` (
  `customerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoGenerationCode` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`customerUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouseDisposalHistory` (
  `disposalHistoryUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disposalUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingsUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionStatus` enum('pending','cancelled','disposed','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `disposedType` enum('sell','scrap','writeoff','charity') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellValue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposedRemarks` text COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`disposalHistoryUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseDisposalMaster` (
  `disposalUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `valueType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userRole` text COLLATE utf8mb4_unicode_ci,
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `levelValue` text COLLATE utf8mb4_unicode_ci,
  `approvalType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposalStatus` enum('pending','cancelled','ongoing','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`disposalUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseDisposalSettings` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approvalLevels` tinyint(4) DEFAULT NULL,
  `approvalType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelValue` text COLLATE utf8mb4_unicode_ci,
  `userRole` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalRequired` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `settingsType` enum('store','org') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseIntegrationLog` (
  `integrationUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiType` enum('inbound','outbound') COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiData` json DEFAULT NULL,
  `proccesedData` json DEFAULT NULL,
  `apiDataCount` int(11) NOT NULL DEFAULT '0',
  `processedCount` int(11) NOT NULL DEFAULT '0',
  `logStatus` enum('pending','processing','completed','error','partial-completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `logType` enum('ASN-UPDATE','ASN-CREATE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASN-CREATE',
  `errorMessage` text COLLATE utf8mb4_unicode_ci,
  `errorData` json DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `runingMode` enum('cron','webhook','manual','api') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'api',
  `asnUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referenceUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`integrationUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouseIntegrationLogData` (
  `integrationDataUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrationUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemSkuNumber` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemCategory` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemDesc` text COLLATE utf8mb4_unicode_ci,
  `itemQuantity` int(11) DEFAULT NULL,
  `itemPrice` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customFields` json DEFAULT NULL,
  `asnData` json DEFAULT NULL,
  `itemStatus` enum('pending','success','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `itemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `asnStatus` enum('pending','success','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `asnUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `errorMessage` longtext COLLATE utf8mb4_unicode_ci,
  `errorData` json DEFAULT NULL,
  `status` enum('pending','success','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`integrationDataUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `wareHouseLicense` (
  `licenseUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partnerUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeCount` int(11) NOT NULL,
  `usedCount` int(11) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`licenseUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `wareHouseLicensePackages` (
  `packageUUID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageCapacity` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `createdBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`packageUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouseRules` (
  `ruleUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruleName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruleDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `ruleCategory` mediumtext COLLATE utf8mb4_unicode_ci,
  `ruleItems` mediumtext COLLATE utf8mb4_unicode_ci,
  `ruleFilter` mediumtext COLLATE utf8mb4_unicode_ci,
  `ruleStartDate` date DEFAULT NULL,
  `ruleEndDate` date DEFAULT NULL,
  `ruleStartTime` time DEFAULT NULL,
  `ruleEndTime` time DEFAULT NULL,
  `ruleDays` text COLLATE utf8mb4_unicode_ci,
  `ruleNotify` enum('Once in','Only once') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyPeriod` int DEFAULT NULL,
  `notifyType` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webHook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifyEmails` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ruleUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `wareHouseSalesperson` (
  `salesPersonUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesPersonName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoGenerationCode` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`salesPersonUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `warehouseSpotAuditMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoneUUID` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Ongoing','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ongoing',
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startedOn` datetime NOT NULL,
  `endedOn` datetime DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseSpotAuditMechanism` (
  `auditUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `inventoryItemUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventryItemZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventryItemFoundTime` datetime DEFAULT NULL,
  `inventryItemFoundZoneUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventoryitemFoundFlag` enum('via-audit-item','via-extra-item') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `warehouseTransferApprovalSettings` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approvalRequired` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `approvalType` enum('anyone','all','hierarchical') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalLevels` int(11) DEFAULT NULL,
  `levelType` enum('user','role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelTypeUUID` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settingsType` enum('store','org') COLLATE utf8mb4_unicode_ci DEFAULT 'org',
  `storeUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `webhookLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logUUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetData` text COLLATE utf8mb4_unicode_ci,
  `errorFlag` int(11) DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `requestTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `webhookMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetAdd` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `assetAddType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetAddURL` text COLLATE utf8mb4_unicode_ci,
  `assetUpdate` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `assetUpdateType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assetUpdateURL` text COLLATE utf8mb4_unicode_ci,
  `permanentTransfer` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `permanentTransferType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanentTransferURL` text COLLATE utf8mb4_unicode_ci,
  `temporaryTransfer` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `temporaryTransferType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temporaryTransferURL` text COLLATE utf8mb4_unicode_ci,
  `tagUpdate` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `tagUpdateType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagUpdateURL` text COLLATE utf8mb4_unicode_ci,
  `wareHouseStockUpdate` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `wareHouseStockUpdateType` enum('externalwebhook','internalwebhook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wareHouseStockUpdateURL` text COLLATE utf8mb4_unicode_ci,
  `clientUUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `weeklyHoliday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientUUID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additionalHolidayDate` date DEFAULT NULL,
  `holidayFlag` tinyint(4) DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
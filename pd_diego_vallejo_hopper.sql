CREATE DATABASE  IF NOT EXISTS `pd_diego_vallejo_hopper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pd_diego_vallejo_hopper`;
-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: pd_diego_vallejo_hopper
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `bill_number` varchar(10) NOT NULL,
  `period_year` int NOT NULL,
  `period_month` int NOT NULL,
  `amount_bill` decimal(15,2) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id_bill`),
  KEY `fk_bills_clients` (`id_client`),
  CONSTRAINT `fk_bills_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `bills_chk_1` CHECK ((`amount_bill` >= 0)),
  CONSTRAINT `bills_chk_2` CHECK ((`paid_amount` >= 0)),
  CONSTRAINT `bills_chk_3` CHECK ((`period_year` > 2000)),
  CONSTRAINT `bills_chk_4` CHECK ((`period_month` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'FAC7068',2024,6,39940.00,0.00,1),(2,'FAC6577',2024,6,76145.00,75145.00,2),(3,'FAC5707',2024,6,179217.00,179217.00,3),(4,'FAC7188',2024,7,52267.00,51767.00,4),(5,'FAC7289',2024,6,157001.00,156501.00,5),(6,'FAC2190',2024,7,33428.00,32428.00,6),(7,'FAC6207',2024,7,75801.00,0.00,7),(8,'FAC1691',2024,7,17870.00,16870.00,8),(9,'FAC4680',2024,6,22294.00,21794.00,9),(10,'FAC8010',2024,6,193307.00,0.00,10),(11,'FAC1328',2024,7,159093.00,0.00,11),(12,'FAC8140',2024,6,175018.00,0.00,12),(13,'FAC4679',2024,7,110754.00,0.00,13),(14,'FAC3589',2024,6,163283.00,0.00,14),(15,'FAC6122',2024,7,22161.00,22161.00,15),(16,'FAC4870',2024,7,196275.00,195775.00,16),(17,'FAC5322',2024,6,20824.00,20824.00,17),(18,'FAC8663',2024,7,191634.00,0.00,18),(19,'FAC4380',2024,6,62979.00,0.00,19),(20,'FAC5128',2024,6,37472.00,0.00,20),(21,'FAC7986',2024,6,128381.00,127881.00,21),(22,'FAC7543',2024,6,26817.00,0.00,22),(23,'FAC7964',2024,7,147864.00,147364.00,23),(24,'FAC1309',2024,6,153404.00,153404.00,24),(25,'FAC8025',2024,7,14710.00,0.00,25),(26,'FAC8943',2024,6,49512.00,49012.00,26),(27,'FAC1190',2024,7,40302.00,40302.00,27),(28,'FAC4264',2024,7,27833.00,27833.00,28),(29,'FAC1462',2024,7,30813.00,0.00,29),(30,'FAC6381',2024,7,134884.00,134884.00,30),(31,'FAC8571',2024,7,29482.00,28982.00,31),(32,'FAC7018',2024,6,158030.00,158030.00,32),(33,'FAC4082',2024,7,196509.00,196009.00,33),(34,'FAC5756',2024,6,69026.00,68526.00,34),(35,'FAC9278',2024,6,166287.00,0.00,35),(36,'FAC6223',2024,6,179265.00,178265.00,36),(37,'FAC8510',2024,7,98069.00,98069.00,37),(38,'FAC4305',2024,6,153650.00,153150.00,38),(39,'FAC9358',2024,6,87402.00,0.00,39),(40,'FAC1208',2024,7,97457.00,96457.00,40),(41,'FAC5492',2024,7,145586.00,0.00,41),(42,'FAC6585',2024,7,163925.00,163425.00,42),(43,'FAC2187',2024,7,186218.00,186218.00,43),(44,'FAC7545',2024,7,160000.00,159000.00,44),(45,'FAC9699',2024,7,94554.00,94554.00,45),(46,'FAC2512',2024,7,153659.00,0.00,46),(47,'FAC1330',2024,6,165021.00,0.00,47),(48,'FAC9310',2024,7,115066.00,0.00,48),(49,'FAC9524',2024,6,161529.00,0.00,49),(50,'FAC7938',2024,7,167924.00,167924.00,50),(51,'FAC8649',2024,6,147991.00,0.00,51),(52,'FAC4348',2024,7,124048.00,124048.00,52),(53,'FAC9905',2024,7,138162.00,0.00,53),(54,'FAC5210',2024,6,161137.00,161137.00,54),(55,'FAC8033',2024,6,35669.00,0.00,55),(56,'FAC7850',2024,7,68367.00,0.00,56),(57,'FAC7378',2024,7,58242.00,0.00,57),(58,'FAC3104',2024,7,114319.00,113319.00,58),(59,'FAC2382',2024,6,37708.00,37708.00,59),(60,'FAC6022',2024,7,54969.00,0.00,60),(61,'FAC3529',2024,6,51911.00,0.00,61),(62,'FAC1856',2024,6,45733.00,45233.00,62),(63,'FAC5678',2024,7,100426.00,0.00,63),(64,'FAC7474',2024,7,32072.00,31572.00,64),(65,'FAC9956',2024,7,123720.00,0.00,65),(66,'FAC7570',2024,6,17171.00,0.00,66),(67,'FAC2909',2024,6,57259.00,0.00,67),(68,'FAC2139',2024,7,197548.00,0.00,68),(69,'FAC8752',2024,6,93635.00,0.00,69),(70,'FAC8107',2024,7,58585.00,58585.00,70),(71,'FAC7475',2024,6,87244.00,0.00,71),(72,'FAC3660',2024,6,55572.00,0.00,72),(73,'FAC9573',2024,6,51213.00,50713.00,73),(74,'FAC2238',2024,6,129980.00,129480.00,74),(75,'FAC6979',2024,6,42157.00,41657.00,75),(76,'FAC8740',2024,6,127084.00,0.00,76),(77,'FAC9872',2024,6,191436.00,0.00,77),(78,'FAC9634',2024,6,78561.00,78561.00,78),(79,'FAC9210',2024,6,163844.00,162844.00,79),(80,'FAC3888',2024,7,80735.00,0.00,80),(81,'FAC7110',2024,6,158138.00,0.00,81),(82,'FAC5649',2024,6,102093.00,101593.00,82),(83,'FAC1490',2024,7,104241.00,103741.00,83),(84,'FAC5439',2024,6,41300.00,0.00,84),(85,'FAC4962',2024,6,90456.00,0.00,85),(86,'FAC8801',2024,7,165402.00,165402.00,86),(87,'FAC1904',2024,6,107189.00,106689.00,87),(88,'FAC7503',2024,7,23411.00,22411.00,88),(89,'FAC7561',2024,6,11359.00,11359.00,89),(90,'FAC5390',2024,6,79808.00,0.00,90),(91,'FAC1760',2024,7,43148.00,42648.00,91),(92,'FAC3395',2024,6,102468.00,0.00,92),(93,'FAC1926',2024,6,116488.00,0.00,93),(94,'FAC7521',2024,7,61920.00,0.00,94),(95,'FAC6693',2024,7,142010.00,141510.00,95),(96,'FAC1513',2024,6,39792.00,39792.00,96),(97,'FAC3039',2024,7,88189.00,0.00,97),(98,'FAC3709',2024,6,179739.00,0.00,98),(99,'FAC3914',2024,6,106611.00,0.00,99),(100,'FAC8875',2024,6,142787.00,141787.00,100);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastname_1` varchar(20) NOT NULL,
  `lastname_2` varchar(20) DEFAULT NULL,
  `identification_numb` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `identification_numb` (`identification_numb`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Angel','Daniel','',149186547,'USNS Davis\nFPO AP 78518','(873)222-2692x09480','rmiller@boyer.com'),(2,'Matthew','Wilson','',475925688,'42023 Barrett Path Suite 281\nJeremyborough, OH 72889','(264)225-7425','matthew15@ramirez.com'),(3,'Jennifer','Phelps','',112231541,'392 Smith Corners Apt. 737\nEast Angeltown, MO 64086','248.695.2117','echristian@hotmail.com'),(4,'Jonathan','Cook','',708283326,'657 Landry Way Suite 966\nRobinsonfurt, CA 22461','0756633727','zjones@yahoo.com'),(5,'Lindsay','Garcia','',959234562,'906 Justin Locks Apt. 838\nPort Timothyview, AR 68865','001-158-358-0277','juliamatthews@carpenter.com'),(6,'Eric','Klein','',243553915,'0571 Carroll Cliffs\nDavisstad, WI 00721','9179003714','acostajoshua@hotmail.com'),(7,'Ashley','Adams','',7005498,'660 Marcus Camp Suite 262\nPort Stevenmouth, NC 10819','(224)273-1751x2329','elambert@cook.info'),(8,'Meghan','Nguyen','',724330039,'259 Jared Manor\nBrownville, AZ 52844','767.278.8207','hhughes@randolph-ingram.com'),(9,'Ryan','Richards','',643387222,'695 Francis Cliffs\nPort Bryantown, VT 33873','001-398-345-1521x215','phillipcarter@hotmail.com'),(10,'Janice','Alexander','',215716832,'81268 Hamilton Fort\nFitzgeraldfort, ID 71489','+1-411-073-0697x704','matthew55@leach-blackburn.com'),(11,'Katherine','Dunn','',92651576,'837 Schneider Spur Suite 656\nDarrellmouth, WI 33323','6081126986','golson@davis.info'),(12,'Brett','Odom','',724488250,'952 Barbara Turnpike\nJacquelinebury, MO 71346','550.725.0901','colemanjames@chavez.info'),(13,'Jenna','Scott','',265881315,'Unit 1694 Box 1865\nDPO AE 26667','404-358-1223x371','rogerseric@hotmail.com'),(14,'Andrew','Johns','',401149568,'62457 Booth Mews Apt. 453\nLake Vincentport, DE 49208','894-499-5852x2479','lorinelson@hotmail.com'),(15,'Christine','Curtis','',778029406,'2480 Jesse Unions Suite 534\nEast Antonioshire, MS 71510','554.861.0493x592','christopherferguson@acevedo-robertson.info'),(16,'Madison','Jones','',307805784,'USNS Ferguson\nFPO AP 50263','149.766.5747','wattsdavid@morgan-wheeler.com'),(17,'Tracy','Simmons','',484837788,'76775 Jennifer Orchard Apt. 758\nPort Lance, NH 53890','0383343588','bryan30@williams.com'),(18,'Shelby','Wolf','',962795476,'613 Billy Radial Suite 171\nSouth Benjamin, WY 15230','7506854443','daniel46@gmail.com'),(19,'Kyle','Jackson','',965030358,'24896 Helen Rapid Suite 758\nNew Joseph, MN 97017','001-392-237-6541x8420','pwheeler@yahoo.com'),(20,'Linda','Shepard','',644042817,'4947 Reynolds Islands\nKathleenburgh, DE 96988','2931087130','munozcharles@yahoo.com'),(21,'Kathleen','Brady','',689720635,'Unit 6453 Box 5308\nDPO AA 48049','2253893664','victoria31@gmail.com'),(22,'Bobby','Luna','',800125157,'2923 Michael Fords Suite 316\nDustinton, IN 31032','001-549-919-1859','kathryn43@hotmail.com'),(23,'Richard','Lopez','',268619593,'6875 Hill Forks\nTeresaland, AL 58910','+1-418-560-8033x44588','justinallen@quinn.info'),(24,'Ralph','Bush','',625774276,'03975 Mills Square Apt. 322\nPort Claudia, MI 34792','+1-866-778-9252x6524','bradleyamy@doyle.com'),(25,'David','Webb','',569906245,'3613 Laura Ridges Suite 762\nSouth Theresa, VA 98493','993.305.1410','stevenrodriguez@gmail.com'),(26,'Kim','Russell','',328037408,'887 Kelley Walk Apt. 960\nEast Martha, CT 59649','001-136-251-3102x24346','cindy11@wood.com'),(27,'Michael','Holt','',969677194,'3499 David Lake Suite 745\nSouth Dylan, AK 03041','882-041-3572','rmiller@hubbard-benitez.com'),(28,'Mr.','Justin','Cook',796337665,'Unit 9907 Box 4757\nDPO AE 46640','737.675.5823','ofritz@richards.com'),(29,'Timothy','Wood','',636808209,'836 Bates Points\nPort Andrewshire, GA 83721','001-948-037-6474','christina78@yahoo.com'),(30,'Yolanda','Hines','',975617669,'812 Mccarthy Viaduct Apt. 376\nKristinamouth, AL 43563','(659)333-4905','cscott@hotmail.com'),(31,'Jasmine','Kelly','',569390187,'697 Reynolds Dam Apt. 423\nJacobland, MO 89387','843-277-1394','fitzgeraldelizabeth@yahoo.com'),(32,'Robert','Smith','',325459789,'Unit 2774 Box 4368\nDPO AE 01041','001-595-596-1706x9253','smithtimothy@wallace.com'),(33,'Jonathan','Smith','',325603096,'322 Smith Pines Suite 052\nLake Scotthaven, NM 11543','796.397.5185x7448','debragriffin@hotmail.com'),(34,'Erin','Marshall','',819212515,'04382 Edward Mountains Suite 369\nGeorgeberg, ME 94518','793.145.6997x893','sethsmith@robinson.com'),(35,'Mark','Ford','',444056964,'07900 Friedman Ferry Suite 170\nSouth Christina, WV 53142','+1-407-009-2402','millerricardo@hotmail.com'),(36,'Cynthia','Lee','',717643055,'368 Jones Estates Apt. 059\nJonesstad, NY 59968','+1-822-188-2029x6929','christinaflores@jones.org'),(37,'Sean','Hood','',30122773,'7426 Middleton Hill Suite 303\nMillerview, CO 23232','+1-348-069-6954x792','cynthiaevans@hernandez.com'),(38,'Kim','Stephens','',622536043,'12967 Ryan Shoals Apt. 994\nPort Jesse, MO 86007','(092)586-3570x54204','karen28@johnson.com'),(39,'Adam','Mckinney','',747822485,'572 Tammy Forest\nYoungside, SD 92567','813.559.4153x962','fwilliams@lewis-wu.org'),(40,'Valerie','Brown','',857630459,'2739 Hood Rest Apt. 962\nJohnburgh, UT 27169','869.591.7228','qmcgee@gmail.com'),(41,'Jason','Pace','',204909440,'19964 Edwards Pines\nSouth Jeremystad, AZ 79080','001-517-371-6236x2223','tjohnson@yahoo.com'),(42,'Gregory','Anderson','',241114561,'5395 Brandon Freeway Apt. 858\nNorth Melissa, OR 60184','+1-282-173-3048x555','julie98@cortez.com'),(43,'Rebecca','Avila','',494808313,'78969 Mcguire Springs Suite 562\nPort Christopher, NJ 29478','773.248.1617','pwilson@sanchez.com'),(44,'Morgan','Leon','',315164793,'853 Virginia Cape Suite 757\nWilsonport, SC 89614','001-853-081-5933x565','miranda94@yahoo.com'),(45,'Fernando','Hunt','',505327194,'9609 Conner Track Apt. 859\nKristenberg, MD 40765','5863279231','abigailkelly@johnson.net'),(46,'Jason','Luna','',892962448,'204 Laura Hill\nCraigland, OK 08760','600.123.2569x570','rodriguezrhonda@yahoo.com'),(47,'Gregory','Howell','',394523505,'036 Tyler Groves Suite 302\nDanielsfurt, WV 45483','213-496-7129x11054','david12@young.org'),(48,'Miguel','Sharp','MD',763963140,'47921 Johnson Expressway Suite 742\nOliviaport, PA 16931','001-600-899-5324','sgeorge@ramos-acevedo.net'),(49,'Stephanie','Acosta','',594590875,'7067 Henderson Knoll\nJoshuashire, NJ 84213','001-365-629-8075x05840','joshuahenderson@pierce-ramos.com'),(50,'Julia','Davis','',25832528,'0246 Brown Roads Suite 606\nNorth Luisburgh, WI 38462','674-440-7862','barkerbrent@berg-dougherty.com'),(51,'Amy','Woods','',97866586,'247 Sheila Centers\nNorth Troybury, WA 43836','2338512573','paul38@byrd.info'),(52,'Julie','Dunn','',79987146,'758 Ruth Mall\nBriggstown, MA 48538','883-656-1878x6532','melissawebb@gmail.com'),(53,'Nicole','Mcdonald','',520620439,'7229 Michelle Forges Suite 411\nHardyview, VT 06858','+1-692-758-5774x3951','frederickmarshall@evans.biz'),(54,'Jennifer','Mendoza','',260613460,'11916 Katherine Creek\nKathleenport, ND 68479','203-605-2009x1103','susanchapman@gmail.com'),(55,'Rachel','Fisher','',511962082,'38507 Newman Loop Suite 268\nTommyberg, UT 25108','650-424-8808','bgarcia@johnson.org'),(56,'Jorge','Thomas','',527088924,'013 Tabitha Cliff\nStevenmouth, NJ 04089','921-668-1704x3013','jason19@yahoo.com'),(57,'Robert','Hicks','',181982363,'1639 Delacruz Park\nEast Linda, DC 18242','(335)290-8992','powelllarry@hotmail.com'),(58,'Terry','Watson','',87147005,'0047 Lori Square\nEast Josechester, KS 29146','(426)053-2668','kaiserwilliam@hotmail.com'),(59,'Carlos','Wood','',623072602,'53828 Laura Spurs\nLauraville, DE 53316','440-516-4972x0722','hillwilliam@hotmail.com'),(60,'Richard','Weiss','',729577216,'316 Robert Dam\nNorth Christina, MA 15552','521-212-3209x2220','carla37@gmail.com'),(61,'Sarah','Clark','',696739719,'04967 Nguyen Circle Suite 871\nLake Andrea, NY 87021','853.981.8171','wsanchez@christian.com'),(62,'Briana','Wu','',520971718,'534 Campbell View\nSandersland, FL 59798','(177)732-3856x95766','rachelsmith@frey.com'),(63,'Raven','Jordan','',785949232,'6132 Spencer Corner Apt. 383\nLake Loriberg, MA 96874','001-870-036-3211','rayalexa@yahoo.com'),(64,'Angelica','Gibbs','',519768710,'68574 Coleman Villages Suite 522\nNorth Erikaton, CA 83413','+1-378-867-9488x99135','yarnold@smith-bruce.com'),(65,'Tammy','Jacobs','',64271785,'57458 Collier Junctions Suite 288\nLake Nicholas, CT 00530','227.597.0062','scottroger@gmail.com'),(66,'Michael','Evans','',357901640,'921 Ramirez Mount\nNew Anthonyville, ND 52047','6777129275','steven80@yahoo.com'),(67,'Tony','Pham','',830210363,'Unit 3715 Box 5620\nDPO AA 18266','001-094-782-5703','kendrapena@yahoo.com'),(68,'Miss','Carrie','Underwood',696962875,'USNV Morris\nFPO AA 49085','0792914312','amy45@hotmail.com'),(69,'Ryan','Russell','',896950954,'70003 Tiffany Drives\nRobertchester, IA 05998','001-266-212-7928x22281','michael78@walters.com'),(70,'Kimberly','Bennett','',196811583,'70851 Daniel Station Apt. 975\nHernandezton, IL 77476','(083)724-9058x016','smithmichelle@gmail.com'),(71,'Joshua','Neal','',893866597,'1324 William Glens\nNew Jenniferland, IL 16679','001-256-341-5493x0374','wheelerbrandon@hotmail.com'),(72,'Robert','Rodriguez','',291010345,'9483 Patricia Greens Suite 612\nWest Daniel, CT 37484','562-175-6225x4306','steven70@gmail.com'),(73,'Blake','Ford','',915064128,'933 Casey Court Apt. 193\nLake Douglas, AL 33325','276-740-5323x764','wrightsally@hotmail.com'),(74,'Chad','Garcia','',11426912,'195 Rollins Land Suite 478\nNorth Angelastad, IN 84674','(530)211-7419','john27@schaefer.com'),(75,'Autumn','Webb','',174039328,'198 Frazier Branch Suite 399\nSouth Sharon, AR 75490','907-357-6151x4325','davidreed@hotmail.com'),(76,'Elizabeth','Singleton','',565067343,'87020 Horton Valleys\nRodriguezfurt, WV 03348','173.672.3805','jeffreyhahn@dawson-myers.biz'),(77,'Sarah','Thompson','',333387701,'Unit 0218 Box 2805\nDPO AA 08015','+1-444-121-3206x307','williamchavez@yahoo.com'),(78,'Sarah','Martin','',355405632,'5963 Strong Points\nLake Kayla, SC 51830','406-810-6283','earllee@gmail.com'),(79,'Pamela','Herrera','',71585472,'3416 Gregory Rapids Suite 629\nNorth Nicolehaven, IL 93329','539.557.9029','cardenasthomas@yahoo.com'),(80,'Shannon','Horn','',708960117,'USNS Buchanan\nFPO AA 82885','(297)388-2854','brian88@pitts-bush.com'),(81,'Christopher','Edwards','',626043010,'32230 Jeffery Via Apt. 616\nWest Tanya, WA 77567','(204)535-1285x920','pmcclain@castro-humphrey.com'),(82,'Brandon','Hester','',326481119,'0169 Summers Vista\nWest Stuart, UT 98685','836.687.2362x166','huertatracie@yahoo.com'),(83,'Mariah','Jackson','',599800533,'558 Bryan Isle\nNew Raymond, AL 55316','(382)120-4674','eperry@wilson.com'),(84,'Carol','Lawson','',492953650,'747 Miller Point\nGeorgeton, UT 90920','783.291.2840','joneskelsey@hotmail.com'),(85,'Heather','Collins','',573712035,'7878 Nelson Stravenue\nNew Jacob, NE 62801','+1-960-564-8502x177','thomashansen@hotmail.com'),(86,'Joshua','Delgado','',56103750,'741 Morgan Underpass\nSouth Sheila, IL 16740','101-802-6501x00181','greenbrandon@gmail.com'),(87,'Jerry','Greene','',867865303,'60823 Lauren Wall Apt. 074\nNew Kellyside, MI 21097','(703)649-5080x4789','jay56@white-wiggins.com'),(88,'Connor','Wagner','',355813998,'506 Brandy Rapid\nDawsonberg, RI 42470','0195959907','haley03@boyd-harris.com'),(89,'Marcia','Randolph','',118434130,'327 Roberts Neck\nGonzalezshire, WA 18952','508.559.9292','huntrussell@smith.com'),(90,'John','Price','',779362405,'PSC 5622, Box 3709\nAPO AA 38900','546-202-9331x88558','daniel62@powell.com'),(91,'Bill','Hopkins','',499561637,'54675 Matthew Key\nTorresstad, ME 64087','288-662-8572','briannaweeks@gmail.com'),(92,'Ryan','Harrison','',179287266,'66252 Trevor Harbor Apt. 887\nLake Ambertown, TN 81820','001-320-723-6362x5909','carrie64@hotmail.com'),(93,'Donald','Young','',667230218,'223 Dawson Mall Suite 571\nSmithburgh, MS 75952','929-112-6985x483','stanleyhall@hotmail.com'),(94,'Louis','Gilbert','',311310607,'530 Brown Corner\nThompsontown, WV 70738','461.203.7672x451','pgreene@hotmail.com'),(95,'Marcus','Martin','',319413369,'PSC 6227, Box 1600\nAPO AP 14578','+1-071-678-3536x79738','jamesjenkins@harmon-randall.com'),(96,'Sharon','Ingram','',861461933,'132 Vargas Turnpike\nDanielbury, DE 40715','270.214.8473x8548','seanbishop@yahoo.com'),(97,'Kyle','Martinez','',61660425,'USS Greene\nFPO AA 26511','676-110-6562x32575','haleronald@vargas-hernandez.info'),(98,'Elizabeth','Rodriguez','',603449840,'3551 Rodriguez Port Apt. 808\nLake Charles, WI 24322','(677)161-5260x6354','kathyrodriguez@thompson.biz'),(99,'Christopher','Gomez','',917844640,'875 Jennifer Oval Suite 067\nWest Phillipmouth, IL 91337','001-066-886-7181x1777','marcus34@hotmail.com'),(100,'Brian','Morton','',843106189,'431 Rodriguez Estate Suite 894\nNew Christopherview, TN 74616','+1-352-961-6835x0739','garnold@bender-caldwell.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `general_nequi_report`
--

DROP TABLE IF EXISTS `general_nequi_report`;
/*!50001 DROP VIEW IF EXISTS `general_nequi_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `general_nequi_report` AS SELECT 
 1 AS `transaction_id`,
 1 AS `trans_date_hour`,
 1 AS `amount_transaction`,
 1 AS `transaction_type`,
 1 AS `platform`,
 1 AS `bill_number`,
 1 AS `period_year`,
 1 AS `period_month`,
 1 AS `amount_bill`,
 1 AS `paid_amount`,
 1 AS `Full Name Client`,
 1 AS `Client Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `id_platform` int NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`id_platform`),
  UNIQUE KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Daviplata',1),(2,'Nequi',1);
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Completada'),(2,'Fallida'),(3,'Pendiente');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_transfered_per_status`
--

DROP TABLE IF EXISTS `total_transfered_per_status`;
/*!50001 DROP VIEW IF EXISTS `total_transfered_per_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_transfered_per_status` AS SELECT 
 1 AS `Trans. Status`,
 1 AS `Trans. Amount`,
 1 AS `Total Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(10) NOT NULL,
  `trans_date_hour` datetime NOT NULL,
  `amount_transaction` decimal(15,2) DEFAULT NULL,
  `id_trans_status` int NOT NULL,
  `transaction_type` varchar(20) NOT NULL,
  `id_platform` int NOT NULL,
  `id_bill` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaction`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `fk_transactions_status` (`id_trans_status`),
  KEY `fk_transactions_platforms` (`id_platform`),
  KEY `fk_transactions_bills` (`id_bill`),
  CONSTRAINT `fk_transactions_bills` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`),
  CONSTRAINT `fk_transactions_platforms` FOREIGN KEY (`id_platform`) REFERENCES `platforms` (`id_platform`),
  CONSTRAINT `fk_transactions_status` FOREIGN KEY (`id_trans_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `transactions_chk_1` CHECK ((`amount_transaction` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'TXN001','2024-06-01 10:00:00',38940.00,3,'Pago de Factura',2,1,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(2,'TXN002','2024-07-09 12:00:00',75145.00,3,'Pago de Factura',1,2,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(3,'TXN003','2024-06-13 10:00:00',179217.00,2,'Pago de Factura',1,3,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(4,'TXN004','2024-07-26 13:00:00',51767.00,2,'Pago de Factura',1,4,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(5,'TXN005','2024-07-28 06:00:00',156501.00,1,'Pago de Factura',1,5,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(6,'TXN006','2024-07-16 21:00:00',32428.00,1,'Pago de Factura',2,6,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(7,'TXN007','2024-07-26 22:00:00',75301.00,3,'Pago de Factura',1,7,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(8,'TXN008','2024-06-17 16:00:00',16870.00,3,'Pago de Factura',2,8,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(9,'TXN009','2024-07-10 23:00:00',21794.00,2,'Pago de Factura',2,9,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(10,'TXN010','2024-06-19 23:00:00',193307.00,1,'Pago de Factura',1,10,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(11,'TXN011','2024-06-01 06:00:00',159093.00,1,'Pago de Factura',1,11,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(12,'TXN012','2024-07-12 19:00:00',174518.00,3,'Pago de Factura',2,12,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(13,'TXN013','2024-07-04 12:00:00',110254.00,2,'Pago de Factura',1,13,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(14,'TXN014','2024-07-12 04:00:00',162283.00,3,'Pago de Factura',2,14,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(15,'TXN015','2024-06-21 12:00:00',22161.00,3,'Pago de Factura',1,15,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(16,'TXN016','2024-07-08 12:00:00',195775.00,3,'Pago de Factura',1,16,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(17,'TXN017','2024-06-27 03:00:00',20824.00,2,'Pago de Factura',2,17,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(18,'TXN018','2024-07-09 05:00:00',191134.00,1,'Pago de Factura',2,18,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(19,'TXN019','2024-06-16 20:00:00',62979.00,1,'Pago de Factura',1,19,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(20,'TXN020','2024-06-08 22:00:00',36472.00,2,'Pago de Factura',1,20,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(21,'TXN021','2024-06-16 06:00:00',127881.00,1,'Pago de Factura',2,21,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(22,'TXN022','2024-07-30 03:00:00',26317.00,2,'Pago de Factura',1,22,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(23,'TXN023','2024-07-27 01:00:00',147364.00,3,'Pago de Factura',2,23,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(24,'TXN024','2024-06-26 01:00:00',153404.00,3,'Pago de Factura',1,24,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(25,'TXN025','2024-07-07 10:00:00',14210.00,1,'Pago de Factura',2,25,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(26,'TXN026','2024-06-08 19:00:00',49012.00,1,'Pago de Factura',1,26,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(27,'TXN027','2024-06-28 06:00:00',40302.00,2,'Pago de Factura',1,27,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(28,'TXN028','2024-07-03 01:00:00',27833.00,3,'Pago de Factura',1,28,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(29,'TXN029','2024-07-29 02:00:00',30313.00,2,'Pago de Factura',2,29,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(30,'TXN030','2024-07-26 20:00:00',134884.00,2,'Pago de Factura',1,30,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(31,'TXN031','2024-07-03 10:00:00',28982.00,1,'Pago de Factura',2,31,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(32,'TXN032','2024-06-15 17:00:00',158030.00,3,'Pago de Factura',2,32,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(33,'TXN033','2024-06-24 08:00:00',196009.00,2,'Pago de Factura',1,33,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(34,'TXN034','2024-06-22 17:00:00',68526.00,3,'Pago de Factura',1,34,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(35,'TXN035','2024-06-23 12:00:00',165287.00,1,'Pago de Factura',2,35,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(36,'TXN036','2024-06-28 11:00:00',178265.00,2,'Pago de Factura',2,36,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(37,'TXN037','2024-07-23 18:00:00',98069.00,1,'Pago de Factura',2,37,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(38,'TXN038','2024-07-28 00:00:00',153150.00,1,'Pago de Factura',2,38,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(39,'TXN039','2024-06-05 12:00:00',86902.00,3,'Pago de Factura',1,39,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(40,'TXN040','2024-06-28 04:00:00',96457.00,3,'Pago de Factura',2,40,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(41,'TXN041','2024-06-07 20:00:00',145586.00,2,'Pago de Factura',1,41,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(42,'TXN042','2024-07-15 19:00:00',163425.00,2,'Pago de Factura',2,42,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(43,'TXN043','2024-07-26 02:00:00',186218.00,3,'Pago de Factura',2,43,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(44,'TXN044','2024-07-12 01:00:00',159000.00,2,'Pago de Factura',1,44,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(45,'TXN045','2024-07-21 21:00:00',94554.00,3,'Pago de Factura',1,45,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(46,'TXN046','2024-07-26 11:00:00',152659.00,2,'Pago de Factura',1,46,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(47,'TXN047','2024-06-05 17:00:00',165021.00,3,'Pago de Factura',1,47,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(48,'TXN048','2024-06-10 10:00:00',115066.00,1,'Pago de Factura',1,48,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(49,'TXN049','2024-06-03 20:00:00',161029.00,1,'Pago de Factura',1,49,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(50,'TXN050','2024-07-29 03:00:00',167924.00,1,'Pago de Factura',2,50,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(51,'TXN051','2024-07-24 19:00:00',147991.00,3,'Pago de Factura',1,51,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(52,'TXN052','2024-07-26 11:00:00',124048.00,1,'Pago de Factura',2,52,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(53,'TXN053','2024-07-13 23:00:00',138162.00,1,'Pago de Factura',2,53,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(54,'TXN054','2024-06-28 00:00:00',161137.00,2,'Pago de Factura',2,54,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(55,'TXN055','2024-06-17 03:00:00',35669.00,2,'Pago de Factura',1,55,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(56,'TXN056','2024-07-06 07:00:00',67867.00,2,'Pago de Factura',2,56,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(57,'TXN057','2024-07-25 20:00:00',58242.00,2,'Pago de Factura',2,57,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(58,'TXN058','2024-06-09 20:00:00',113319.00,3,'Pago de Factura',2,58,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(59,'TXN059','2024-07-11 23:00:00',37708.00,1,'Pago de Factura',1,59,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(60,'TXN060','2024-07-20 16:00:00',54969.00,3,'Pago de Factura',2,60,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(61,'TXN061','2024-07-08 23:00:00',51411.00,1,'Pago de Factura',1,61,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(62,'TXN062','2024-07-17 05:00:00',45233.00,1,'Pago de Factura',2,62,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(63,'TXN063','2024-06-10 01:00:00',99926.00,2,'Pago de Factura',2,63,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(64,'TXN064','2024-06-20 12:00:00',31572.00,1,'Pago de Factura',2,64,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(65,'TXN065','2024-06-14 03:00:00',123720.00,3,'Pago de Factura',2,65,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(66,'TXN066','2024-07-29 14:00:00',17171.00,2,'Pago de Factura',1,66,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(67,'TXN067','2024-07-23 09:00:00',56259.00,2,'Pago de Factura',1,67,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(68,'TXN068','2024-06-20 22:00:00',196548.00,2,'Pago de Factura',1,68,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(69,'TXN069','2024-06-20 18:00:00',93635.00,1,'Pago de Factura',1,69,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(70,'TXN070','2024-07-15 21:00:00',58585.00,1,'Pago de Factura',1,70,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(71,'TXN071','2024-06-06 18:00:00',86244.00,1,'Pago de Factura',1,71,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(72,'TXN072','2024-07-18 20:00:00',55572.00,2,'Pago de Factura',2,72,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(73,'TXN073','2024-06-21 06:00:00',50713.00,2,'Pago de Factura',2,73,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(74,'TXN074','2024-06-29 18:00:00',129480.00,1,'Pago de Factura',2,74,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(75,'TXN075','2024-07-03 20:00:00',41657.00,1,'Pago de Factura',1,75,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(76,'TXN076','2024-06-15 11:00:00',126084.00,1,'Pago de Factura',1,76,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(77,'TXN077','2024-06-04 07:00:00',190936.00,2,'Pago de Factura',2,77,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(78,'TXN078','2024-06-21 21:00:00',78561.00,2,'Pago de Factura',2,78,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(79,'TXN079','2024-07-23 11:00:00',162844.00,1,'Pago de Factura',2,79,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(80,'TXN080','2024-06-29 15:00:00',80235.00,2,'Pago de Factura',2,80,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(81,'TXN081','2024-06-18 00:00:00',158138.00,3,'Pago de Factura',1,81,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(82,'TXN082','2024-06-06 15:00:00',101593.00,3,'Pago de Factura',1,82,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(83,'TXN083','2024-06-22 03:00:00',103741.00,3,'Pago de Factura',1,83,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(84,'TXN084','2024-07-04 02:00:00',41300.00,3,'Pago de Factura',1,84,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(85,'TXN085','2024-06-19 11:00:00',89956.00,1,'Pago de Factura',1,85,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(86,'TXN086','2024-07-13 05:00:00',165402.00,1,'Pago de Factura',2,86,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(87,'TXN087','2024-07-04 09:00:00',106689.00,3,'Pago de Factura',2,87,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(88,'TXN088','2024-06-14 11:00:00',22411.00,1,'Pago de Factura',2,88,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(89,'TXN089','2024-06-27 05:00:00',11359.00,3,'Pago de Factura',1,89,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(90,'TXN090','2024-06-08 10:00:00',79808.00,3,'Pago de Factura',2,90,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(91,'TXN091','2024-07-05 21:00:00',42648.00,3,'Pago de Factura',2,91,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(92,'TXN092','2024-06-03 05:00:00',101468.00,3,'Pago de Factura',1,92,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(93,'TXN093','2024-06-21 17:00:00',115488.00,3,'Pago de Factura',1,93,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(94,'TXN094','2024-07-26 00:00:00',61920.00,1,'Pago de Factura',1,94,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(95,'TXN095','2024-07-23 20:00:00',141510.00,2,'Pago de Factura',2,95,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(96,'TXN096','2024-07-08 19:00:00',39792.00,3,'Pago de Factura',1,96,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(97,'TXN097','2024-07-09 05:00:00',87689.00,1,'Pago de Factura',1,97,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(98,'TXN098','2024-07-06 00:00:00',178739.00,2,'Pago de Factura',2,98,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(99,'TXN099','2024-07-27 10:00:00',105611.00,2,'Pago de Factura',1,99,'2025-08-14 01:45:22','2025-08-14 01:45:22'),(100,'TXN100','2024-07-11 07:00:00',141787.00,2,'Pago de Factura',1,100,'2025-08-14 01:45:22','2025-08-14 01:45:22');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pd_diego_vallejo_hopper'
--

--
-- Dumping routines for database 'pd_diego_vallejo_hopper'
--

--
-- Final view structure for view `general_nequi_report`
--

/*!50001 DROP VIEW IF EXISTS `general_nequi_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `general_nequi_report` AS select `t`.`transaction_id` AS `transaction_id`,`t`.`trans_date_hour` AS `trans_date_hour`,`t`.`amount_transaction` AS `amount_transaction`,`t`.`transaction_type` AS `transaction_type`,`p`.`platform` AS `platform`,`b`.`bill_number` AS `bill_number`,`b`.`period_year` AS `period_year`,`b`.`period_month` AS `period_month`,`b`.`amount_bill` AS `amount_bill`,`b`.`paid_amount` AS `paid_amount`,concat(`c`.`name`,' ',`c`.`lastname_1`,' ',`c`.`lastname_2`) AS `Full Name Client`,`c`.`email` AS `Client Email` from (((`transactions` `t` join `platforms` `p` on((`t`.`id_platform` = `p`.`id_platform`))) join `bills` `b` on((`t`.`id_bill` = `b`.`id_bill`))) join `clients` `c` on((`b`.`id_client` = `c`.`id_client`))) where (`p`.`platform` = 'Nequi') order by `b`.`period_year`,`b`.`period_month`,`t`.`amount_transaction` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_transfered_per_status`
--

/*!50001 DROP VIEW IF EXISTS `total_transfered_per_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_transfered_per_status` AS select `s`.`status` AS `Trans. Status`,count(0) AS `Trans. Amount`,sum(`t`.`amount_transaction`) AS `Total Amount` from (`transactions` `t` join `status` `s` on((`t`.`id_trans_status` = `s`.`id_status`))) group by `s`.`status` order by `s`.`status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-13 22:38:42

if not exists(select * from sys.databases where name = 'DAT601_Jacob_Stringer')

create database DAT601_Jacob_Stringer

Go

Use DAT601_Jacob_Stringer;

Go

ALTER TABLE EnviromentData DROP CONSTRAINT If EXISTS FKEnviroment861432;
ALTER TABLE MaximumRoamingArea DROP CONSTRAINT If EXISTS FKMaximumRoa487176;
ALTER TABLE BTDrone DROP CONSTRAINT If EXISTS FKBTDrone109523;
ALTER TABLE SensedData DROP CONSTRAINT If EXISTS FKSensedData880894;
ALTER TABLE MaintenanceLog DROP CONSTRAINT If EXISTS FKMaintenanc408904;
ALTER TABLE Part DROP CONSTRAINT If EXISTS FKPart384850;
ALTER TABLE CameraViews DROP CONSTRAINT If EXISTS FKCameraView1665;
ALTER TABLE UserAccount DROP CONSTRAINT If EXISTS FKUserAccoun255447;
ALTER TABLE CameraViews DROP CONSTRAINT If EXISTS FKCameraView568865;
ALTER TABLE SubscriberDetails DROP CONSTRAINT If EXISTS FKSubscriber246917;
ALTER TABLE Subscriptions DROP CONSTRAINT If EXISTS FKSubscripti69494;
ALTER TABLE Subscriptions DROP CONSTRAINT If EXISTS FKSubscripti878096;
ALTER TABLE Subscriptions DROP CONSTRAINT If EXISTS FKSubscripti767405;
ALTER TABLE UserSubscription DROP CONSTRAINT If EXISTS FKUserSubscr669343;
ALTER TABLE UserSubscription DROP CONSTRAINT If EXISTS FKUserSubscr544169;
ALTER TABLE BTDrone DROP CONSTRAINT If EXISTS FKBTDrone741885;
ALTER TABLE DrovingSize DROP CONSTRAINT If EXISTS FKDrovingSiz189925;
ALTER TABLE DrovingSize DROP CONSTRAINT If EXISTS FKDrovingSiz754157;
ALTER TABLE SalesStaff DROP CONSTRAINT If EXISTS FKSalesStaff875378;
ALTER TABLE Contract DROP CONSTRAINT If EXISTS FKContract79453;
ALTER TABLE BTDrone DROP CONSTRAINT If EXISTS FKBTDrone766250;
ALTER TABLE DrovingZone DROP CONSTRAINT If EXISTS FKDrovingZon467857;
ALTER TABLE ContractSubscriptionType DROP CONSTRAINT If EXISTS FKContractSu698338;
ALTER TABLE ContractSubscriptionType DROP CONSTRAINT If EXISTS FKContractSu481702;
ALTER TABLE Contract DROP CONSTRAINT If EXISTS FKContract919821;
ALTER TABLE AdminStaff DROP CONSTRAINT If EXISTS FKAdminStaff954121;
ALTER TABLE SalesStaff DROP CONSTRAINT If EXISTS FKSalesStaff455199;
ALTER TABLE Subscriptions DROP CONSTRAINT If EXISTS FKSubscripti231495;
ALTER TABLE StaffAddress DROP CONSTRAINT If EXISTS FKStaffAddre786116;
ALTER TABLE StallAddress DROP CONSTRAINT If EXISTS FKStallAddre409617;
ALTER TABLE ContracteeAddress DROP CONSTRAINT If EXISTS FKContractee681832;
ALTER TABLE SupplierAddress DROP CONSTRAINT If EXISTS FKSupplierAd818119;
ALTER TABLE SensedData DROP CONSTRAINT If EXISTS FKSensedData781097;
ALTER TABLE PartSupplier DROP CONSTRAINT If EXISTS FKPartSuppli229213;
ALTER TABLE PartSupplier DROP CONSTRAINT If EXISTS FKPartSuppli973703;
DROP TABLE EnviromentData;
DROP TABLE MaximumRoamingArea;
DROP TABLE BTDrone;
DROP TABLE StreamingDetails;
DROP TABLE SensedData;
DROP TABLE MaintenanceLog;
DROP TABLE Part;
DROP TABLE Suppliers;
DROP TABLE SupplierAddress;
DROP TABLE CameraViews;
DROP TABLE UserAccount;
DROP TABLE SubscriberDetails;
DROP TABLE Subscriptions;
DROP TABLE UserSubscription;
DROP TABLE DrovingZone;
DROP TABLE DrovingSizeDetails;
DROP TABLE DrovingSize;
DROP TABLE SalesStaff;
DROP TABLE AdminStaff;
DROP TABLE StaffAddress;
DROP TABLE Stall;
DROP TABLE StallAddress;
DROP TABLE Contract;
DROP TABLE ContractSubscriptionType;
DROP TABLE Contractees;
DROP TABLE ContracteeAddress;
DROP TABLE Staff;
DROP TABLE PartSupplier;

DROP PROCEDURE If Exists dbo.Add_Forign_Keys, dbo.Create_Tables, dbo.Insert_Statements, dbo.Add_Constraints, Add_Indexes,Sold_Subscriptions,
                         Contract_Drone_Data,Drone_Parts,Contract_Drone_Locations,Drone_Viewers,Create_New_Subscriber,
						 Update_Location_And_Reagion_Of_Drone,Delete_Contract_Saved_Data,Store_Data;

Go

Create procedure Create_Tables

AS

CREATE TABLE EnviromentData (
  BTDroneDroneID       int NOT NULL, 
  Longitude            int NULL, 
  Latitude             int NULL, 
  Altitude             int NULL, 
  Temperature          decimal(5, 2) DEFAULT 8 NULL, 
  Humidity             int NULL, 
  AmbientLightStrength int NULL, 
  PRIMARY KEY (BTDroneDroneID));

CREATE TABLE MaximumRoamingArea (
  BTDroneDroneID   int NOT NULL, 
  MaximumAltitude  int NOT NULL, 
  MaximumLatitude  int NOT NULL, 
  MaximumLongitude int NOT NULL, 
  PRIMARY KEY (BTDroneDroneID));

CREATE TABLE BTDrone (
  DroneID                       int IDENTITY NOT NULL, 
  StreamingDetailsVideoStreamID int NULL, 
  DrovingZoneRegionID             int NOT NULL, 
  ContractContractID            int NULL, 
  ContractContracteesCompany    varchar(30) NULL, 
  PRIMARY KEY (DroneID));

CREATE TABLE StreamingDetails (
  VideoStreamID int IDENTITY NOT NULL, 
  Time          datetime NULL, 
  PRIMARY KEY (VideoStreamID));

CREATE TABLE SensedData (
  SensedDataID               int IDENTITY NOT NULL UNIQUE, 
  BTDroneDroneID             int NOT NULL, 
  Altitude                   int NOT NULL, 
  Latitude                   int NOT NULL, 
  Longitude                  int NOT NULL, 
  Temperature                decimal(5, 2) DEFAULT 8 NULL,
  Humidity                   int NOT NULL, 
  AmbientLightStrength       int NOT NULL, 
  ContractContractID         int NULL, 
  ContractContracteesCompany varchar(30) NULL, 
  PRIMARY KEY (SensedDataID, BTDroneDroneID));
  

CREATE TABLE MaintenanceLog (
  BTDroneDroneID int NOT NULL, 
  Status         varchar(30) NOT NULL, 
  [Date]         datetime DEFAULT '4' NOT NULL, 
  Comments       varchar(250) NULL, 
  PRIMARY KEY (BTDroneDroneID));

CREATE TABLE Part (
  PartID                       int IDENTITY NOT NULL, 
  PartName                     varchar(50) NOT NULL, 
  PartStatus                   varchar(50) NOT NULL, 
  MaintenanceLogBTDroneDroneID int NOT NULL, 
  PRIMARY KEY (PartID));

CREATE TABLE Suppliers (
  CompanyName varchar(30) NOT NULL, 
  PhoneNo     int NOT NULL, 
  Email       varchar(50) NOT NULL, 
  PRIMARY KEY (CompanyName));

CREATE TABLE SupplierAddress (
  SuppliersCompanyName varchar(30) NOT NULL, 
  LetterBoxNumber      int NOT NULL, 
  Street               char(30) NOT NULL, 
  Town                 char(30) NOT NULL, 
  City                 char(30) NOT NULL, 
  PostCode             int NOT NULL, 
  PRIMARY KEY (SuppliersCompanyName));

CREATE TABLE CameraViews (
  CameraView          int IDENTITY NOT NULL, 
  BTDroneDroneID      int NOT NULL, 
  UserAccountUserName varchar(30) NULL, 
  PRIMARY KEY (CameraView));

CREATE TABLE UserAccount (
  UserName       varchar(30) NOT NULL, 
  Email          varchar(50) NOT NULL, 
  PhoneNo        int NOT NULL, 
  BTDroneDroneID int NULL, 
  PRIMARY KEY (UserName));

CREATE TABLE SubscriberDetails (
  UserAccountUserName varchar(30) NOT NULL, 
  FirstName           varchar(30) NOT NULL, 
  LastName            varchar(30) NOT NULL, 
  LetterBoxNumber     int NOT NULL, 
  Street              char(30) NOT NULL, 
  Town                char(30) NOT NULL, 
  City                char(30) NOT NULL, 
  PostCode            int NOT NULL, 
  PRIMARY KEY (UserAccountUserName));

CREATE TABLE Subscriptions (
  ReceiptNumber             int IDENTITY NOT NULL, 
  SubscriptionType          varchar(30) NOT NULL, 
  Cost                      money NOT NULL, 
  BTDroneDroneID            int NULL, 
  CameraViewsCameraViews    int NULL, 
  CameraViewsCameraViews2   int NULL, 
  SalesStaffStaffEmployeeNo int NULL, 
  PRIMARY KEY (ReceiptNumber));

CREATE TABLE UserSubscription (
  UserAccountUserName       varchar(30) NOT NULL UNIQUE, 
  SubscriptionsReciptNumber int NOT NULL UNIQUE, 
  PRIMARY KEY (UserAccountUserName, 
  SubscriptionsReciptNumber));

CREATE TABLE DrovingZone (
  RegionID                   int IDENTITY NOT NULL, 
  Region                     varchar(50) NOT NULL, 
  RegionType                 varchar(50) NOT NULL, 
  ContractContractID         int NULL, 
  ContractContracteesCompany varchar(30) NULL, 
  PRIMARY KEY (RegionID));

CREATE TABLE DrovingSizeDetails (
  RegionSizeID    int IDENTITY NOT NULL, 
  Latitude        int NOT NULL, 
  Longitude       int NOT NULL, 
  MaximumAltitude int NOT NULL, 
  MinimumAltitude int NOT NULL, 
  PRIMARY KEY (RegionSizeID));

CREATE TABLE DrovingSize (
  DrovingSizeDetailsRegionSizeID int NOT NULL UNIQUE, 
  DrovingZoneRegionID            int NOT NULL UNIQUE, 
  PRIMARY KEY (DrovingSizeDetailsRegionSizeID, 
  DrovingZoneRegionID));

CREATE TABLE SalesStaff (
  StaffEmployeeNo int NOT NULL, 
  Discount        varchar(3) NOT NULL, 
  StallStallNo    int NOT NULL, 
  PRIMARY KEY (StaffEmployeeNo));

CREATE TABLE AdminStaff (
  StaffEmployeeNo int NOT NULL, 
  Discount        varchar(3) NOT NULL, 
  PRIMARY KEY (StaffEmployeeNo));

CREATE TABLE StaffAddress (
  StaffEmployeeNo int NOT NULL, 
  LetterBoxNumber int NOT NULL, 
  Street          char(30) NOT NULL, 
  Town            char(30) NOT NULL, 
  City            char(30) NOT NULL, 
  PostCode        int NOT NULL, 
  PRIMARY KEY (StaffEmployeeNo));

CREATE TABLE Stall (
  StallNo int IDENTITY NOT NULL, 
  PhoneNo int NOT NULL, 
  PRIMARY KEY (StallNo));

CREATE TABLE StallAddress (
  StallStallNo    int NOT NULL, 
  LetterBoxNumber int NOT NULL, 
  Street          char(30) NOT NULL, 
  Town            char(30) NOT NULL, 
  City            char(30) NOT NULL, 
  PostCode        int NOT NULL, 
  PRIMARY KEY (StallStallNo));

CREATE TABLE Contract (
  ContractID                int NOT NULL UNIQUE, 
  ContracteesCompany        varchar(30) NOT NULL UNIQUE, 
  AdminStaffStaffEmployeeNo int NOT NULL, 
  PRIMARY KEY (ContractID, 
  ContracteesCompany));

CREATE TABLE ContractSubscriptionType (
  ContractContractID         int NOT NULL UNIQUE, 
  ContractContracteesCompany varchar(30) NOT NULL UNIQUE, 
  SubscriptionsReciptNumber  int NOT NULL UNIQUE, 
  PRIMARY KEY (ContractContractID, 
  ContractContracteesCompany, 
  SubscriptionsReciptNumber));

CREATE TABLE Contractees (
  Company   varchar(30) NOT NULL, 
  FirstName varchar(30) NOT NULL, 
  LastName  varchar(30) NOT NULL, 
  PhoneNo   int NOT NULL, 
  PRIMARY KEY (Company));

CREATE TABLE ContracteeAddress (
  ContracteesCompany varchar(30) NOT NULL, 
  LetterBoxNumber    int NOT NULL, 
  Street             char(30) NOT NULL, 
  Town               char(30) NOT NULL, 
  City               char(30) NOT NULL, 
  PostCode           int NOT NULL, 
  PRIMARY KEY (ContracteesCompany));

CREATE TABLE Staff (
  EmployeeNo int IDENTITY NOT NULL, 
  FirstName  varchar(30) NOT NULL, 
  LastName   varchar(30) NOT NULL, 
  PhoneNo    int NOT NULL, 
  DOB        datetime NOT NULL, 
  PRIMARY KEY (EmployeeNo));

CREATE TABLE PartSupplier (
  PartPartID           int NOT NULL, 
  SuppliersCompanyName varchar(30) NOT NULL, 
  PRIMARY KEY (PartPartID, 
  SuppliersCompanyName));

  Go


  Create procedure Add_Forign_Keys

  As

ALTER TABLE EnviromentData ADD CONSTRAINT FKEnviroment861432 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE MaximumRoamingArea ADD CONSTRAINT FKMaximumRoa487176 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE BTDrone ADD CONSTRAINT FKBTDrone109523 FOREIGN KEY (StreamingDetailsVideoStreamID) REFERENCES StreamingDetails (VideoStreamID);

ALTER TABLE SensedData ADD CONSTRAINT FKSensedData880894 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE MaintenanceLog ADD CONSTRAINT FKMaintenanc408904 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE Part ADD CONSTRAINT FKPart384850 FOREIGN KEY (MaintenanceLogBTDroneDroneID) REFERENCES MaintenanceLog (BTDroneDroneID);

ALTER TABLE CameraViews ADD CONSTRAINT FKCameraView1665 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE UserAccount ADD CONSTRAINT FKUserAccoun255447 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE CameraViews ADD CONSTRAINT FKCameraView568865 FOREIGN KEY (UserAccountUserName) REFERENCES UserAccount (UserName);

ALTER TABLE SubscriberDetails ADD CONSTRAINT FKSubscriber246917 FOREIGN KEY (UserAccountUserName) REFERENCES UserAccount (UserName);

ALTER TABLE Subscriptions ADD CONSTRAINT FKSubscripti69494 FOREIGN KEY (BTDroneDroneID) REFERENCES BTDrone (DroneID);

ALTER TABLE Subscriptions ADD CONSTRAINT FKSubscripti878096 FOREIGN KEY (CameraViewsCameraViews) REFERENCES CameraViews (CameraView);

ALTER TABLE Subscriptions ADD CONSTRAINT FKSubscripti767405 FOREIGN KEY (CameraViewsCameraViews2) REFERENCES CameraViews (CameraView);

ALTER TABLE UserSubscription ADD CONSTRAINT FKUserSubscr669343 FOREIGN KEY (SubscriptionsReciptNumber) REFERENCES Subscriptions (ReceiptNumber);

ALTER TABLE UserSubscription ADD CONSTRAINT FKUserSubscr544169 FOREIGN KEY (UserAccountUserName) REFERENCES UserAccount (UserName);

ALTER TABLE BTDrone ADD CONSTRAINT FKBTDrone741885 FOREIGN KEY (DrovingZoneRegionID) REFERENCES DrovingZone (RegionID);

ALTER TABLE DrovingSize ADD CONSTRAINT FKDrovingSiz189925 FOREIGN KEY (DrovingZoneRegionID) REFERENCES DrovingZone (RegionID);

ALTER TABLE DrovingSize ADD CONSTRAINT FKDrovingSiz754157 FOREIGN KEY (DrovingSizeDetailsRegionSizeID) REFERENCES DrovingSizeDetails (RegionSizeID);

ALTER TABLE SalesStaff ADD CONSTRAINT FKSalesStaff875378 FOREIGN KEY (StallStallNo) REFERENCES Stall (StallNo);

ALTER TABLE Contract ADD CONSTRAINT FKContract79453 FOREIGN KEY (AdminStaffStaffEmployeeNo) REFERENCES AdminStaff (StaffEmployeeNo);

ALTER TABLE BTDrone ADD CONSTRAINT FKBTDrone766250 FOREIGN KEY (ContractContractID, ContractContracteesCompany) REFERENCES Contract (ContractID, ContracteesCompany);

ALTER TABLE DrovingZone ADD CONSTRAINT FKDrovingZon467857 FOREIGN KEY (ContractContractID, ContractContracteesCompany) REFERENCES Contract (ContractID, ContracteesCompany);

ALTER TABLE ContractSubscriptionType ADD CONSTRAINT FKContractSu698338 FOREIGN KEY (ContractContractID, ContractContracteesCompany) REFERENCES Contract (ContractID, ContracteesCompany);

ALTER TABLE ContractSubscriptionType ADD CONSTRAINT FKContractSu481702 FOREIGN KEY (SubscriptionsReciptNumber) REFERENCES Subscriptions (ReceiptNumber);

ALTER TABLE Contract ADD CONSTRAINT FKContract919821 FOREIGN KEY (ContracteesCompany) REFERENCES Contractees (Company);

ALTER TABLE AdminStaff ADD CONSTRAINT FKAdminStaff954121 FOREIGN KEY (StaffEmployeeNo) REFERENCES Staff (EmployeeNo);

ALTER TABLE SalesStaff ADD CONSTRAINT FKSalesStaff455199 FOREIGN KEY (StaffEmployeeNo) REFERENCES Staff (EmployeeNo);

ALTER TABLE Subscriptions ADD CONSTRAINT FKSubscripti231495 FOREIGN KEY (SalesStaffStaffEmployeeNo) REFERENCES SalesStaff (StaffEmployeeNo);

ALTER TABLE StaffAddress ADD CONSTRAINT FKStaffAddre786116 FOREIGN KEY (StaffEmployeeNo) REFERENCES Staff (EmployeeNo);

ALTER TABLE StallAddress ADD CONSTRAINT FKStallAddre409617 FOREIGN KEY (StallStallNo) REFERENCES Stall (StallNo);

ALTER TABLE ContracteeAddress ADD CONSTRAINT FKContractee681832 FOREIGN KEY (ContracteesCompany) REFERENCES Contractees (Company);

ALTER TABLE SupplierAddress ADD CONSTRAINT FKSupplierAd818119 FOREIGN KEY (SuppliersCompanyName) REFERENCES Suppliers (CompanyName);

ALTER TABLE SensedData ADD CONSTRAINT FKSensedData781097 FOREIGN KEY (ContractContractID, ContractContracteesCompany) REFERENCES Contract (ContractID, ContracteesCompany);

ALTER TABLE PartSupplier ADD CONSTRAINT FKPartSuppli229213 FOREIGN KEY (PartPartID) REFERENCES Part (PartID);

ALTER TABLE PartSupplier ADD CONSTRAINT FKPartSuppli973703 FOREIGN KEY (SuppliersCompanyName) REFERENCES Suppliers (CompanyName);


GO


Create procedure Insert_Statements

As

Insert Into dbo.StreamingDetails (Time)
Values ('12pm');

Insert Into dbo.StreamingDetails (Time)
Values ('4pm');

Insert Into dbo.StreamingDetails (Time)
Values ('10am');

Insert Into dbo.StreamingDetails (Time)
Values ('7pm');

Insert Into dbo.StreamingDetails (Time)
Values ('8am');






Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Bobs Company',23,'Bob Street', 'Richmond', 'Nelson', 7020);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Robs Company',21,'Rob Street', 'Nelson', 'Nelson', 7020);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Joes Company',19,'Joe Street', 'Richmond', 'Christchurch', 7010);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Freds Company',10,'Fred Street', 'Richmond', 'Auckland', 7000);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Todds Company',7,'Tod Street', 'Richmond', 'Wellington', 7040);






Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Bobs Company','Bob','Ross',111111);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Robs Company','Rob','Dob',222222);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Joes Company','Joe','Mo',333333);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Freds Company','Fred','Jeb',444444);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Todds Company','Todd','Mat',555555);







Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (1,'Bobs Company',1);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (2,'Robs Company',2);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (3,'Joes Company',3);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (4,'Freds Company',4);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (5,'Todds Company',5);







Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (1,'2%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (2,'3%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (3,'1%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (4,'0%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (5,'3%');







Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Jeff','Mate',9141140,'1995-12-04');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Yousif','Mustafa',1232068,'1991-09-02');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Caroline','Hurst',0675502,'1991-09-10');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Aleyna','Mccoy',3990604,'1992-04-08');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Amrita','Velez',3720697,'1992-06-24');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Jemma','Nieves',6129067,'1992-11-06');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Indi','Macias',3036808,'1993-09-07');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Myron','Lovell',2372337,'1995-03-10');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Nelson','Goulding',9537430,'1995-03-14');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Kiaan','Simon',8739522,'1995-07-07');







Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (6,'3%',1);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (7,'2%',2);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (8,'1%',3);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (9,'0%',4);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (10,'1%',5);







Insert Into dbo.Stall (PhoneNo)
Values (9312695);

Insert Into dbo.Stall (PhoneNo)
Values (4140684);

Insert Into dbo.Stall (PhoneNo)
Values (3892761);

Insert Into dbo.Stall (PhoneNo)
Values (1299267);

Insert Into dbo.Stall (PhoneNo)
Values (2823310);







Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (1,12,'Rose Street','Lakeshore','Auckland',7812);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (2,12,'North Avenue','Perthlochry','Wellington',7591);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (3,12,'Spring Street','Coombe','Nelson',7248);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (4,12,'Summit Street','Shepshed','Denedin',7394);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (5,12,'Center Street','Foolshope','Christchurch',7197);







Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (1,38,'7th Street', 'Appleby', 'Auckland', 7947);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (2,4,'Wood Street', 'Ramshorn ', 'Wellington', 7357);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (3,63,'Canterbury Court', 'Cumdivock', 'Nelson', 7654);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (4,51,'Briarwood Court', 'Craydon', 'Denedin', 7987);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (5,80,'Schoolhouse Lane', 'Ilragorn', 'Christchurch', 7279);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (6,81,'Canterbury Road', 'Timeston', 'Nelson', 7167);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (7,52,'Water Street', 'Farncombe', 'Christchurch', 7349);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (8,86,'4th Street South', 'Tillicoultry', 'Nelson', 7649);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (9,18,'Valley View Road', 'Firebend ', 'Wellington', 7782);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (10,67,'Olive Street', 'Peterborough', 'Auckland', 7673);







Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (1,1,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (2,2,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (3,3,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (4,4,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (5,5,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,6,1,'Bobs Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,7,2,'Robs Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,8,3,'Joes Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,9,4,'Freds Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,10,5,'Todds Company');







Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Belfast','Snow',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Causeway Coast','Forest',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Alaska','Snow',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Julian Alps','Mountains',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Languedoc-Roussillon','Ocean',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Kii Peninsula','Green Land',1,'Bobs Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Lipari','Mountains',2,'Robs Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Aeolian Islands','Coast Line',3,'Joes Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('The Deep South','Snow',4,'Freds Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Lahaul','Coast Line',5,'Todds Company');







Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (1,1);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (2,2);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (3,3);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (4,4);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (5,5);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (6,6);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (7,7);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (8,8);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (9,9);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (10,10);







Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,2000,2000,1000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,2000,2000,1000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (3000,3000,3000,1500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (4000,4000,4000,2000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,1000,2000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (3000,3000,2000,1500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (5000,5000,5000,3000);







Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (1,1000,189,1000,25,70,100,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (2,2000,750,2000,30,80,200,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (3,3000,1500,750,15,90,150,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (4,1500,1500,500,10,77,175,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (5,4000,1000,250,17,89,220,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (6,1000,1200,250,15,89,300,1,'Bobs Company');

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (7,3000,1500,200,7,89,500,2,'Robs Company');

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (8,2000,5000,350,9,89,150,3,'Joes Company');

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (9,6000,12000,1000,5,89,170,4,'Freds Company');

Insert Into dbo.SensedData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (10,7000,2000,862,20,89,155,5,'Todds Company');







Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (1,10000,5000,2000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (2,20000,10000,5000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (3,10000,5000,2000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (4,50000,5000,10000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (5,20000,3000,3000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (6,80000,7000,5000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (7,40000,7000,6000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (8,90000,5000,6000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (9,10000,2000,1000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (10,50000,3000,1000);







Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (1,1000,189,1000,25,70,100);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (2,2000,750,2000,30,80,200);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (3,3000,1500,750,15,90,150);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (4,1500,1500,500,10,77,175);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (5,4000,1000,250,17,89,220);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (6,1000,1200,250,15,89,300);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (7,3000,1500,200,7,89,500);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (8,2000,5000,350,9,89,150);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (9,6000,12000,1000,5,89,170);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (10,7000,2000,862,20,89,155);






Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (1,'Good','2010-09-17','Good Stuff and bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (2,'Needs Work','2011-01-24','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (3,'Good','2012-04-04','bla bla blaa');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (4,'Ok','2012-08-16','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (5,'Needs Reair','2013-08-09','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (6,'Good','2013-08-20','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (7,'Good','2015-06-11','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (8,'Bad','2016-07-20','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (9,'Ok','2017-09-13','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (10,'Good','2017-11-03','bla bla bla');







Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Standard Prop','Good',1);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Brushless Motors','Good',2);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Pusher Prop','Good',3);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Motor Mount','Good',4);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Landing Gear','Good',5);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Boom','Good',6);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Drone Body ','Good',7);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Electronic Speed Controllers','Good',8);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Flight Controller','Good',9);

Insert Into dbo.Part(PartName,PartStatus, MaintenanceLogBTDroneDroneID)
Values ('GPS Module','Good',10);







Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (1,'Tigress Productions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (6,'Tigress Productions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (2,'Grottolutions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (7,'Grottolutions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (3,'Tuliproductions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (8,'Tuliproductions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (4,'Spirittube');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (9,'Spirittube');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (5,'Omegashack');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (10,'Omegashack');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (6,'Omegashack');








Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Tigress Productions',111111,'Tigress@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Grottolutions',222222,'Grottolutions@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Tuliproductions',333333,'Tuliproductions@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Spirittube',444444,'Spirittube@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Omegashack',555555,'Omegashack@.com');









Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Tigress Productions',38,'Sunset Avenue', 'Kelna', 'Denedin', 7672);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Grottolutions',58,'Olive Street', 'Larton', 'Christchurch', 7947);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Tuliproductions',18,'Carriage Drive', 'Findochty', 'Wellington', 7148);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Spirittube',30,'Mill Street', 'Gloucester', 'Auckland', 7337);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Omegashack',24,'West Street', 'Drumnacanvy', 'Nelson', 7178);







Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (1,'drinking');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (2,'fomalhaut');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (3,'spotify');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (4,'colleagues');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (5,'girth');







Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('cajole','cajole@gmail',111111,6);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('placebo','placebo@gmail',222222,7);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('space','space@gmail',333333,8);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('chamaeleon','chamaeleon@gmail',444444,9);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('heredity','heredity@gmail',555555,10);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('drinking','drinking@gmail',666666,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('fomalhaut','fomalhaut@gmail',777777,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('spotify','spotify@gmail',888888,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('colleagues','colleagues@gmail',999999,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('girth','girth@gmail',000000,null);







Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('girth','Keaton','Jordan',12,'Church Street North','Dundee','Auckland',7954);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('drinking','Caitlan','Mustafa',18,'Cross Street','Strathmore','Nelson',7248);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('fomalhaut','Saarah','Corrigan',24,'Eagle Street','Nuxvar ','Wellington',7924);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('spotify','Anisah','Strickland',48,'East Street','Pontybridge','Denidin',7427);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('colleagues','Parker','Bloom',32,'Chestnut Street','Thralkeld','Queens Town',7038);









Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('drinking',1);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('fomalhaut',2);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('spotify',3);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('colleagues',4);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('girth',5);







Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',6);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Gold',$50.00,null,'1','1',7);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',8);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Platinum',$100.00,4,'1','1',9);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',10);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,6,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,7,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,8,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,9,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,10,'1','1',null);







Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (1,'Bobs Company',6);

Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (2,'Robs Company',7);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (3,'Joes Company',8);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (4,'Freds Company',9);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (5,'Todds Company',10);


Go

Create procedure Insert_Statements

As

Insert Into dbo.StreamingDetails (Time)
Values ('12pm');

Insert Into dbo.StreamingDetails (Time)
Values ('4pm');

Insert Into dbo.StreamingDetails (Time)
Values ('10am');

Insert Into dbo.StreamingDetails (Time)
Values ('7pm');

Insert Into dbo.StreamingDetails (Time)
Values ('8am');






Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Bobs Company',23,'Bob Street', 'Richmond', 'Nelson', 7020);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Robs Company',21,'Rob Street', 'Nelson', 'Nelson', 7020);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Joes Company',19,'Joe Street', 'Richmond', 'Christchurch', 7010);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Freds Company',10,'Fred Street', 'Richmond', 'Auckland', 7000);

Insert Into dbo.ContracteeAddress (ContracteesCompany, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Todds Company',7,'Tod Street', 'Richmond', 'Wellington', 7040);






Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Bobs Company','Bob','Ross',111111);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Robs Company','Rob','Dob',222222);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Joes Company','Joe','Mo',333333);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Freds Company','Fred','Jeb',444444);

Insert Into dbo.Contractees (Company,FirstName,LastName,PhoneNo)
Values ('Todds Company','Todd','Mat',555555);







Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (1,'Bobs Company',1);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (2,'Robs Company',2);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (3,'Joes Company',3);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (4,'Freds Company',4);

Insert Into dbo.Contract (ContractID,ContracteesCompany,AdminStaffStaffEmployeeNo)
Values (5,'Todds Company',5);







Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (1,'2%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (2,'3%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (3,'1%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (4,'0%');

Insert Into dbo.AdminStaff (StaffEmployeeNo,Discount)
Values (5,'3%');







Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Jeff','Mate',9141140,'1995-12-04');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Yousif','Mustafa',1232068,'1991-09-02');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Caroline','Hurst',0675502,'1991-09-10');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Aleyna','Mccoy',3990604,'1992-04-08');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Amrita','Velez',3720697,'1992-06-24');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Jemma','Nieves',6129067,'1992-11-06');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Indi','Macias',3036808,'1993-09-07');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Myron','Lovell',2372337,'1995-03-10');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Nelson','Goulding',9537430,'1995-03-14');

Insert Into dbo.Staff (FirstName,LastName,PhoneNo,DOB)
Values ('Kiaan','Simon',8739522,'1995-07-07');







Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (6,'3%',1);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (7,'2%',2);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (8,'1%',3);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (9,'0%',4);

Insert Into dbo.SalesStaff (StaffEmployeeNo,Discount,StallStallNo)
Values (10,'1%',5);







Insert Into dbo.Stall (PhoneNo)
Values (9312695);

Insert Into dbo.Stall (PhoneNo)
Values (4140684);

Insert Into dbo.Stall (PhoneNo)
Values (3892761);

Insert Into dbo.Stall (PhoneNo)
Values (1299267);

Insert Into dbo.Stall (PhoneNo)
Values (2823310);







Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (1,12,'Rose Street','Lakeshore','Auckland',7812);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (2,12,'North Avenue','Perthlochry','Wellington',7591);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (3,12,'Spring Street','Coombe','Nelson',7248);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (4,12,'Summit Street','Shepshed','Denedin',7394);

Insert Into dbo.StallAddress (StallStallNo,LetterBoxNumber,Street,Town,City,PostCode)
Values (5,12,'Center Street','Foolshope','Christchurch',7197);







Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (1,38,'7th Street', 'Appleby', 'Auckland', 7947);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (2,4,'Wood Street', 'Ramshorn ', 'Wellington', 7357);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (3,63,'Canterbury Court', 'Cumdivock', 'Nelson', 7654);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (4,51,'Briarwood Court', 'Craydon', 'Denedin', 7987);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (5,80,'Schoolhouse Lane', 'Ilragorn', 'Christchurch', 7279);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (6,81,'Canterbury Road', 'Timeston', 'Nelson', 7167);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (7,52,'Water Street', 'Farncombe', 'Christchurch', 7349);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (8,86,'4th Street South', 'Tillicoultry', 'Nelson', 7649);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (9,18,'Valley View Road', 'Firebend ', 'Wellington', 7782);

Insert Into dbo.StaffAddress (StaffEmployeeNo, LetterBoxNumber, Street, Town, City, PostCode)
Values (10,67,'Olive Street', 'Peterborough', 'Auckland', 7673);







Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (1,1,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (2,2,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (3,3,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (4,4,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (5,5,null,null);

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,6,1,'Bobs Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,7,2,'Robs Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,8,3,'Joes Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,9,4,'Freds Company');

Insert Into dbo.BTDrone (StreamingDetailsVideoStreamID,DrovingZoneRegionID,ContractContractID,ContractContracteesCompany)
Values (null,10,5,'Todds Company');







Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Belfast','Snow',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Causeway Coast','Forest',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Alaska','Snow',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Julian Alps','Mountains',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Languedoc-Roussillon','Ocean',null,null);

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Kii Peninsula','Green Land',1,'Bobs Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Lipari','Mountains',2,'Robs Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Aeolian Islands','Coast Line',3,'Joes Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('The Deep South','Snow',4,'Freds Company');

Insert Into dbo.DrovingZone(Region,RegionType,ContractContractID,ContractContracteesCompany)
Values ('Lahaul','Coast Line',5,'Todds Company');







Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (1,1);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (2,2);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (3,3);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (4,4);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (5,5);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (6,6);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (7,7);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (8,8);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (9,9);

Insert Into dbo.DrovingSize(DrovingZoneRegionID,DrovingSizeDetailsRegionSizeID)
Values (10,10);







Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,2000,2000,1000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,2000,2000,1000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (3000,3000,3000,1500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (4000,4000,4000,2000);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (1000,1000,1000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (2000,1000,2000,500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (3000,3000,2000,1500);

Insert Into dbo.DrovingSizeDetails(Latitude,Longitude,MaximumAltitude,MinimumAltitude)
Values (5000,5000,5000,3000);







Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (1,1,1000,189,1000,25,70,100,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (2,2,2000,750,2000,30,80,200,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (3,3,3000,1500,750,15,90,150,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (4,4,1500,1500,500,10,77,175,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (5,5,4000,1000,250,17,89,220,null,null);

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (6,6,1000,1200,250,15,89,300,1,'Bobs Company');

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (7,7,3000,1500,200,7,89,500,2,'Robs Company');

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (8,8,2000,5000,350,9,89,150,3,'Joes Company');

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (9,9,6000,12000,1000,5,89,170,4,'Freds Company');

Insert Into dbo.SensedData(BTDroneDroneID,SensedDataID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength,ContractContractID,ContractContracteesCompany)
Values (10,10,7000,2000,862,20,89,155,5,'Todds Company');







Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (1,10000,5000,2000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (2,20000,10000,5000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (3,10000,5000,2000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (4,50000,5000,10000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (5,20000,3000,3000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (6,80000,7000,5000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (7,40000,7000,6000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (8,90000,5000,6000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (9,10000,2000,1000);

Insert Into dbo.MaximumRoamingArea(BTDroneDroneID,MaximumAltitude,MaximumLatitude,MaximumLongitude)
Values (10,50000,3000,1000);







Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (1,1000,189,1000,25,70,100);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (2,2000,750,2000,30,80,200);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (3,3000,1500,750,15,90,150);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (4,1500,1500,500,10,77,175);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (5,4000,1000,250,17,89,220);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (6,1000,1200,250,15,89,300);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (7,3000,1500,200,7,89,500);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (8,2000,5000,350,9,89,150);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (9,6000,12000,1000,5,89,170);

Insert Into dbo.EnviromentData(BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values (10,7000,2000,862,20,89,155);






Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (1,'Good','2010-09-17','Good Stuff and bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (2,'Needs Work','2011-01-24','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (3,'Good','2012-04-04','bla bla blaa');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (4,'Ok','2012-08-16','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (5,'Needs Reair','2013-08-09','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (6,'Good','2013-08-20','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (7,'Good','2015-06-11','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (8,'Bad','2016-07-20','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (9,'Ok','2017-09-13','bla bla bla');

Insert Into dbo.MaintenanceLog(BTDroneDroneID,Status,Date,Comments)
Values (10,'Good','2017-11-03','bla bla bla');







Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',1);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',2);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',3);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',4);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',5);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',6);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',7);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',8);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',9);

Insert Into dbo.Part(PartStatus, MaintenanceLogBTDroneDroneID)
Values ('Good',10);







Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (1,'Tigress Productions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (6,'Tigress Productions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (2,'Grottolutions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (7,'Grottolutions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (3,'Tuliproductions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (8,'Tuliproductions');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (4,'Spirittube');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (9,'Spirittube');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (5,'Omegashack');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (10,'Omegashack');

Insert Into dbo.PartSupplier(PartPartID, SuppliersCompanyName)
Values (6,'Omegashack');








Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Tigress Productions',111111,'Tigress@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Grottolutions',222222,'Grottolutions@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Tuliproductions',333333,'Tuliproductions@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Spirittube',444444,'Spirittube@.com');

Insert Into dbo.Suppliers(CompanyName, PhoneNo, Email)
Values ('Omegashack',555555,'Omegashack@.com');









Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Tigress Productions',38,'Sunset Avenue', 'Kelna', 'Denedin', 7672);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Grottolutions',58,'Olive Street', 'Larton', 'Christchurch', 7947);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Tuliproductions',18,'Carriage Drive', 'Findochty', 'Wellington', 7148);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Spirittube',30,'Mill Street', 'Gloucester', 'Auckland', 7337);

Insert Into dbo.SupplierAddress (SuppliersCompanyName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('Omegashack',24,'West Street', 'Drumnacanvy', 'Nelson', 7178);







Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (1,'drinking');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (2,'fomalhaut');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (3,'spotify');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (4,'colleagues');

Insert Into dbo.CameraViews (BTDroneDroneID,UserAccountUserName)
Values (5,'girth');







Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('cajole','cajole@gmail',111111,6);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('placebo','placebo@gmail',222222,7);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('space','space@gmail',333333,8);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('chamaeleon','chamaeleon@gmail',444444,9);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('heredity','heredity@gmail',555555,10);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('drinking','drinking@gmail',666666,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('fomalhaut','fomalhaut@gmail',777777,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('spotify','spotify@gmail',888888,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('colleagues','colleagues@gmail',999999,null);

Insert Into dbo.UserAccount (UserName,Email,PhoneNo,BTDroneDroneID)
Values ('girth','girth@gmail',000000,null);







Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('girth','Keaton','Jordan',12,'Church Street North','Dundee','Auckland',7954);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('drinking','Caitlan','Mustafa',18,'Cross Street','Strathmore','Nelson',7248);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('fomalhaut','Saarah','Corrigan',24,'Eagle Street','Nuxvar ','Wellington',7924);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('spotify','Anisah','Strickland',48,'East Street','Pontybridge','Denidin',7427);

Insert Into dbo.SubscriberDetails (UserAccountUserName,FirstName,LastName, LetterBoxNumber, Street, Town, City, PostCode)
Values ('colleagues','Parker','Bloom',32,'Chestnut Street','Thralkeld','Queens Town',7038);









Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('drinking',1);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('fomalhaut',2);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('spotify',3);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('colleagues',4);

Insert Into dbo.UserSubscription (UserAccountUserName,SubscriptionsReciptNumber)
Values ('girth',5);







Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',6);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Gold',$50.00,null,'1','1',7);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',8);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Platinum',$100.00,4,'1','1',9);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,'1','2',10);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,6,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,7,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,8,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,9,'1','1',null);

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2, SalesStaffStaffEmployeeNo)
Values ('Super Platinum',$250.00,10,'1','1',null);







Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (1,'Bobs Company',6);

Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (2,'Robs Company',7);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (3,'Joes Company',8);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (4,'Freds Company',9);


Insert Into dbo.ContractSubscriptionType (ContractContractID,ContractContracteesCompany,SubscriptionsReciptNumber)
Values (5,'Todds Company',10);

Go

Create procedure Add_Constraints

AS

Alter Table BTDrone
ADD CONSTRAINT CHK_DroneIDOnlyNumberDroneID
CHECK (DroneID NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataLongitude
CHECK (Longitude NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataLatitude
CHECK (Latitude NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataAltitude
CHECK (Altitude NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataTemperature
CHECK (Temperature NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataHumidity
CHECK (Humidity NOT LIKE '%(^0-9]%');

Alter Table EnviromentData
ADD CONSTRAINT CHK_DataIsOnlyNumberEnviromentDataAmbientLightStrength
CHECK (AmbientLightStrength NOT LIKE '%(^0-9]%');

Alter Table StreamingDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberVideoStreamID
CHECK (VideoStreamID NOT LIKE '%(^0-9]%');

Alter Table StreamingDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberTime
CHECK (Time NOT LIKE '%(^0-9]%');

Alter Table MaximumRoamingArea
ADD CONSTRAINT CHK_DataIsOnlyNumberMaximumAltitude
CHECK (MaximumAltitude NOT LIKE '%(^0-9]%');

Alter Table MaximumRoamingArea
ADD CONSTRAINT CHK_DataIsOnlyNumberMaximumLatitude
CHECK (MaximumLatitude NOT LIKE '%(^0-9]%');

Alter Table MaximumRoamingArea
ADD CONSTRAINT CHK_DataIsOnlyNumberMaximumLongitude
CHECK (MaximumLongitude NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataLongitude
CHECK (Longitude NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataLatitude
CHECK (Latitude NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataAltitude
CHECK (Altitude NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataTemperature
CHECK (Temperature NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataHumidity
CHECK (Humidity NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataAmbientLightStrength
CHECK (AmbientLightStrength NOT LIKE '%(^0-9]%');

Alter Table SensedData
ADD CONSTRAINT CHK_DataIsOnlyNumberSensedDataID
CHECK (SensedDataID NOT LIKE '%(^0-9]%');

Alter Table Subscriptions
ADD CONSTRAINT CHK_DataIsOnlyNumberReceiptNumber
CHECK (ReceiptNumber NOT LIKE '%(^0-9]%');

Alter Table Subscriptions
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriptionType
CHECK (SubscriptionType NOT LIKE '%(^A-Z]%');

Alter Table Subscriptions
ADD CONSTRAINT CHK_DataIsOnlyNumberCost
CHECK (Cost NOT LIKE '%(^0-9]%');

Alter Table MaintenanceLog
ADD CONSTRAINT CHK_DataIsOnlyLetterStatus
CHECK (Status NOT LIKE '%(^A-Z]%');

Alter Table MaintenanceLog
ADD CONSTRAINT CHK_DataIsOnlyLetterComments
CHECK (Comments NOT LIKE '%(^A-Z]%');

Alter Table Part
ADD CONSTRAINT CHK_DataIsOnlyLetterPartStatus
CHECK (PartStatus NOT LIKE '%(^A-Z]%');

Alter Table Part
ADD CONSTRAINT CHK_DataIsOnlyNumberPartID
CHECK (PartID NOT LIKE '%(^0-9]%');

Alter Table Suppliers
ADD CONSTRAINT CHK_DataIsOnlyLetterAndNumberCompanyName
CHECK (CompanyName NOT LIKE '%(^A-Z 0-9]%');

Alter Table Suppliers
ADD CONSTRAINT CHK_DataIsOnlyLetterAndNumberSuppliersEmail
CHECK (Email NOT LIKE '%(^A-Z 0-9]%');

Alter Table Suppliers
ADD CONSTRAINT CHK_DataIsOnlyNumberSuppliersPhoneNo
CHECK (PhoneNo NOT LIKE '%(^0-9]%');

Alter Table SupplierAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterSupplierAddressLetterBoxNumber
CHECK (LetterBoxNumber NOT LIKE '%(^A-Z 0-9]%');

Alter Table SupplierAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterSupplierAddressStreet
CHECK (Street NOT LIKE '%(^A-Z]%');

Alter Table SupplierAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterSupplierAddressTown
CHECK (Town NOT LIKE '%(^A-Z]%');

Alter Table SupplierAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterSupplierAddressCity
CHECK (City NOT LIKE '%(^A-Z]%');

Alter Table SupplierAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberSupplierAddressPostCode
CHECK (PostCode NOT LIKE '%(^0-9]%');

Alter Table DrovingZone
ADD CONSTRAINT CHK_DataIsOnlyLetterAndNumberRegion
CHECK (Region NOT LIKE '%(^A-Z 0-9]%');

Alter Table DrovingZone
ADD CONSTRAINT CHK_DataIsOnlyLetterRegionType
CHECK (RegionType NOT LIKE '%(^A-Z]%');

Alter Table DrovingSizeDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberRegionSizeID
CHECK (RegionSizeID NOT LIKE '%(^0-9]%');

Alter Table DrovingSizeDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberDrovingSizeDetailsLatitude
CHECK (Latitude NOT LIKE '%(^0-9]%');

Alter Table DrovingSizeDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberDrovingSizeDetailsLongitude
CHECK (Longitude NOT LIKE '%(^0-9]%');

Alter Table DrovingSizeDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberDrovingSizeDetailsMaximumAltitude
CHECK (MaximumAltitude NOT LIKE '%(^0-9]%');

Alter Table DrovingSizeDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberDrovingSizeDetailsMinimumAltitude
CHECK (MinimumAltitude NOT LIKE '%(^0-9]%');

Alter Table CameraViews
ADD CONSTRAINT CHK_DataIsOnlyNumberCameraView
CHECK (CameraView NOT LIKE '%(^0-9]%');

Alter Table CameraViews
ADD CONSTRAINT CHK_DataIsOnlyNumberCameraViewsBTDroneDroneID
CHECK (BTDroneDroneID <= 100); 

Alter Table UserAccount
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterUserName
CHECK (UserName NOT LIKE '%(^0-9 A-Z]%');

Alter Table UserAccount
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterUserAccountEmail
CHECK (Email NOT LIKE '%(^0-9 A-Z]%');

Alter Table UserAccount
ADD CONSTRAINT CHK_DataIsOnlyNumberUserAccountPhoneNo
CHECK (PhoneNo NOT LIKE '%(^0-9]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriberDetailsFirstName
CHECK (FirstName NOT LIKE '%(^A-Z]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriberDetailsLastName
CHECK (LastName NOT LIKE '%(^A-Z]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterSubscriberDetailsLetterBoxNumber
CHECK (LetterBoxNumber NOT LIKE '%(^A-Z 0-9]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriberDetailsStreet
CHECK (Street NOT LIKE '%(^A-Z]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriberDetailsTown
CHECK (Town NOT LIKE '%(^A-Z]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyLetterSubscriberDetailsCity
CHECK (City NOT LIKE '%(^A-Z]%');

Alter Table SubscriberDetails
ADD CONSTRAINT CHK_DataIsOnlyNumberSubscriberDetailsPostCode
CHECK (PostCode NOT LIKE '%(^0-9]%');

Alter Table Contract
ADD CONSTRAINT CHK_DataIsOnlyNumberContractID
CHECK (ContractID NOT LIKE '%(^0-9]%');

Alter Table Contractees
ADD CONSTRAINT CHK_DataIsOnlyLetterCompany
CHECK (Company NOT LIKE '%(^A-Z]%');

Alter Table Contractees
ADD CONSTRAINT CHK_DataIsOnlyLetterContracteesFirstName
CHECK (FirstName NOT LIKE '%(^A-Z]%');

Alter Table Contractees
ADD CONSTRAINT CHK_DataIsOnlyLetterContracteesLastName
CHECK (LastName NOT LIKE '%(^A-Z]%');

Alter Table Contractees
ADD CONSTRAINT CHK_DataIsOnlyNumberContracteesPhoneNo
CHECK (PhoneNo NOT LIKE '%(^0-9]%');

Alter Table ContracteeAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterContracteeAddressLetterBoxNumber
CHECK (LetterBoxNumber NOT LIKE '%(^A-Z 0-9]%');

Alter Table ContracteeAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterContracteeAddressStreet
CHECK (Street NOT LIKE '%(^A-Z]%');

Alter Table ContracteeAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterContracteeAddressTown
CHECK (Town NOT LIKE '%(^A-Z]%');

Alter Table ContracteeAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterContracteeAddressCity
CHECK (City NOT LIKE '%(^A-Z]%');

Alter Table ContracteeAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberContracteeAddressPostCode
CHECK (PostCode NOT LIKE '%(^0-9]%');

Alter Table AdminStaff
ADD CONSTRAINT CHK_DataIsOnlyNumberAdminStaffDiscount
CHECK (Discount NOT LIKE '%(^0-9]%');

Alter Table Staff
ADD CONSTRAINT CHK_DataIsOnlyLetterStaffFirstName
CHECK (FirstName NOT LIKE '%(^A-Z]%');

Alter Table Staff
ADD CONSTRAINT CHK_DataIsOnlyLetterStaffLastName
CHECK (LastName NOT LIKE '%(^A-Z]%');

Alter Table Staff
ADD CONSTRAINT CHK_DataIsOnlyNumberStaffPhoneNo
CHECK (PhoneNo NOT LIKE '%(^0-9]%');

Alter Table Staff
ADD CONSTRAINT CHK_DataIsOnlyNumber
CHECK (EmployeeNo NOT LIKE '%(^0-9]%');

Alter Table SalesStaff
ADD CONSTRAINT CHK_DataIsOnlyNumberSalesStaffDiscount
CHECK (Discount NOT LIKE '%(^0-9]%');

Alter Table StaffAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterStaffAddressLetterBoxNumber
CHECK (LetterBoxNumber NOT LIKE '%(^A-Z 0-9]%');

Alter Table StaffAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStaffAddressStreet
CHECK (Street NOT LIKE '%(^A-Z]%');

Alter Table StaffAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStaffAddressTown
CHECK (Town NOT LIKE '%(^A-Z]%');

Alter Table StaffAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStaffAddressCity
CHECK (City NOT LIKE '%(^A-Z]%');

Alter Table StaffAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberStaffAddressPostCode
CHECK (PostCode NOT LIKE '%(^0-9]%');

Alter Table Stall
ADD CONSTRAINT CHK_DataIsOnlyNumberStallNo
CHECK (StallNo NOT LIKE '%(^0-9]%');

Alter Table Stall
ADD CONSTRAINT CHK_DataIsOnlyNumberStallPhoneNo
CHECK (PhoneNo NOT LIKE '%(^0-9]%');

Alter Table StallAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberAndLetterStallAddressLetterBoxNumber
CHECK (LetterBoxNumber NOT LIKE '%(^A-Z 0-9]%');

Alter Table StallAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStallAddressStreet
CHECK (Street NOT LIKE '%(^A-Z]%');

Alter Table StallAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStallAddressTown
CHECK (Town NOT LIKE '%(^A-Z]%');

Alter Table StallAddress
ADD CONSTRAINT CHK_DataIsOnlyLetterStallAddressCity
CHECK (City NOT LIKE '%(^A-Z]%');

Alter Table StallAddress
ADD CONSTRAINT CHK_DataIsOnlyNumberStallAddressPostCode
CHECK (PostCode NOT LIKE '%(^0-9]%');

Alter Table SalesStaff
ADD CONSTRAINT CHK_CHK_DiscountOnlyAllowedUpTo3SalesStaff
CHECK (Discount <='3%');

Alter Table AdminStaff
ADD CONSTRAINT CHK_DiscountOnlyAllowedUpTo3AdminStaff
CHECK (Discount <='3%');






Go



Create procedure Add_Indexes

AS


CREATE UNIQUE INDEX EnviromentData_BTDroneDroneID 
  ON EnviromentData (BTDroneDroneID);

CREATE UNIQUE INDEX MaximumRoamingArea_BTDroneDroneID 
  ON MaximumRoamingArea (BTDroneDroneID);

CREATE UNIQUE INDEX BTDrone_DroneID 
  ON BTDrone (DroneID);

CREATE INDEX BTDrone_DrovingZoneRegionID 
  ON BTDrone (DrovingZoneRegionID);

CREATE INDEX BTDrone_ContractContractID 
  ON BTDrone (ContractContractID);

CREATE INDEX BTDrone_ContractContracteesCompany 
  ON BTDrone (ContractContracteesCompany);

CREATE UNIQUE INDEX StreamingDetails_VideoStreamID 
  ON StreamingDetails (VideoStreamID);

CREATE INDEX SensedData_BTDroneDroneID 
  ON SensedData (BTDroneDroneID);

CREATE UNIQUE INDEX SensedData_SensedDataID 
  ON SensedData (SensedDataID);

CREATE INDEX SensedData_ContractContractID 
  ON SensedData (ContractContractID);

CREATE INDEX SensedData_ContractContracteesCompany 
  ON SensedData (ContractContracteesCompany);

CREATE UNIQUE INDEX MaintenanceLog_BTDroneDroneID 
  ON MaintenanceLog (BTDroneDroneID);

CREATE UNIQUE INDEX Part_PartID 
  ON Part (PartID);

CREATE INDEX Part_MaintenanceLogBTDroneDroneID 
  ON Part (MaintenanceLogBTDroneDroneID);

CREATE INDEX Part_PartName 
  ON Part (PartName);

CREATE UNIQUE INDEX Suppliers_CompanyName 
  ON Suppliers (CompanyName);

CREATE UNIQUE INDEX SupplierAddress_SuppliersCompanyName 
  ON SupplierAddress (SuppliersCompanyName);

CREATE INDEX SupplierAddress_Town 
  ON SupplierAddress (Town);

CREATE INDEX SupplierAddress_City 
  ON SupplierAddress (City);

CREATE INDEX SupplierAddress_PostCode 
  ON SupplierAddress (PostCode);

CREATE UNIQUE INDEX CameraViews_CameraView 
  ON CameraViews (CameraView);

CREATE INDEX CameraViews_BTDroneDroneID 
  ON CameraViews (BTDroneDroneID);

CREATE UNIQUE INDEX UserAccount_UserName 
  ON UserAccount (UserName);

CREATE UNIQUE INDEX SubscriberDetails_UserAccountUserName 
  ON SubscriberDetails (UserAccountUserName);

CREATE INDEX SubscriberDetails_FirstName 
  ON SubscriberDetails (FirstName);

CREATE INDEX SubscriberDetails_LastName 
  ON SubscriberDetails (LastName);

CREATE INDEX SubscriberDetails_PostCode 
  ON SubscriberDetails (PostCode);

CREATE UNIQUE INDEX Subscriptions_ReceiptNumber 
  ON Subscriptions (ReceiptNumber);

CREATE INDEX Subscriptions_SubscriptionType 
  ON Subscriptions (SubscriptionType);

CREATE UNIQUE INDEX DrovingZone_Region 
  ON DrovingZone (Region);

CREATE INDEX DrovingZone_RegionType 
  ON DrovingZone (RegionType);

CREATE INDEX DrovingZone_ContractContractID 
  ON DrovingZone (ContractContractID);

CREATE INDEX DrovingZone_ContractContracteesCompany 
  ON DrovingZone (ContractContracteesCompany);

CREATE UNIQUE INDEX DrovingSizeDetails_RegionSizeID 
  ON DrovingSizeDetails (RegionSizeID);

CREATE UNIQUE INDEX SalesStaff_StaffEmployeeNo 
  ON SalesStaff (StaffEmployeeNo);

CREATE INDEX SalesStaff_StallStallNo 
  ON SalesStaff (StallStallNo);

CREATE UNIQUE INDEX AdminStaff_StaffEmployeeNo 
  ON AdminStaff (StaffEmployeeNo);

CREATE UNIQUE INDEX StaffAddress_StaffEmployeeNo 
  ON StaffAddress (StaffEmployeeNo);

CREATE INDEX StaffAddress_Town 
  ON StaffAddress (Town);

CREATE INDEX StaffAddress_City 
  ON StaffAddress (City);

CREATE INDEX StaffAddress_PostCode 
  ON StaffAddress (PostCode);

CREATE UNIQUE INDEX Stall_StallNo 
  ON Stall (StallNo);

CREATE INDEX Stall_PhoneNo 
  ON Stall (PhoneNo);

CREATE INDEX StallAddress_Town 
  ON StallAddress (Town);

CREATE INDEX StallAddress_City 
  ON StallAddress (City);

CREATE INDEX StallAddress_PostCode 
  ON StallAddress (PostCode);

CREATE UNIQUE INDEX Contract_ContractID 
  ON Contract (ContractID);

CREATE UNIQUE INDEX Contract_ContracteesCompany 
  ON Contract (ContracteesCompany);

CREATE UNIQUE INDEX Contractees_Company 
  ON Contractees (Company);

CREATE UNIQUE INDEX ContracteeAddress_ContracteesCompany 
  ON ContracteeAddress (ContracteesCompany);

CREATE INDEX ContracteeAddress_Town 
  ON ContracteeAddress (Town);

CREATE INDEX ContracteeAddress_City 
  ON ContracteeAddress (City);

CREATE INDEX ContracteeAddress_PostCode 
  ON ContracteeAddress (PostCode);

CREATE UNIQUE INDEX Staff_EmployeeNo 
  ON Staff (EmployeeNo);

CREATE INDEX Staff_FirstName 
  ON Staff (FirstName);

CREATE INDEX Staff_LastName 
  ON Staff (LastName);

  Go

    --Query B--

Create Procedure Sold_Subscriptions

@prFirstName varchar(30),

@prLastName varchar(30)

As

Begin

SELECT        SalesStaff.Discount, SubscriberDetails.FirstName, SubscriberDetails.LastName, SubscriberDetails.LetterBoxNumber, SubscriberDetails.Street, SubscriberDetails.Town, SubscriberDetails.City, SubscriberDetails.PostCode
FROM            Staff INNER JOIN
                         SalesStaff ON Staff.EmployeeNo = SalesStaff.StaffEmployeeNo INNER JOIN
                         Subscriptions ON SalesStaff.StaffEmployeeNo = Subscriptions.SalesStaffStaffEmployeeNo INNER JOIN
                         UserSubscription ON Subscriptions.ReceiptNumber = UserSubscription.SubscriptionsReciptNumber INNER JOIN
                         UserAccount ON UserSubscription.UserAccountUserName = UserAccount.UserName INNER JOIN
                         SubscriberDetails ON UserAccount.UserName = SubscriberDetails.UserAccountUserName

Where Staff.FirstName = @prFirstName And Staff.LastName = @prLastName


 End

 Go

  --Query D--

 Create Procedure Contract_Drone_Data

@prCompany varchar(30)

As

Begin

SELECT        Contract.ContracteesCompany AS Company, BTDrone.DroneID, EnviromentData.Temperature, EnviromentData.Humidity, EnviromentData.AmbientLightStrength
FROM            Contract INNER JOIN
                         BTDrone ON Contract.ContractID = BTDrone.ContractContractID AND Contract.ContracteesCompany = BTDrone.ContractContracteesCompany INNER JOIN
                         EnviromentData ON BTDrone.DroneID = EnviromentData.BTDroneDroneID
WHERE        (Contract.ContracteesCompany = @prCompany)
ORDER BY Company, BTDrone.DroneID, EnviromentData.Temperature, EnviromentData.Humidity, EnviromentData.AmbientLightStrength



End

Go

  --Query F --

Create Procedure Drone_Parts

@prDroneID int

As

Begin

SELECT        BTDrone.DroneID, Part.PartName, Suppliers.CompanyName
FROM            BTDrone INNER JOIN
                         MaintenanceLog ON BTDrone.DroneID = MaintenanceLog.BTDroneDroneID INNER JOIN
                         Part ON MaintenanceLog.BTDroneDroneID = Part.MaintenanceLogBTDroneDroneID INNER JOIN
                         PartSupplier ON Part.PartID = PartSupplier.PartPartID INNER JOIN
                         Suppliers ON PartSupplier.SuppliersCompanyName = Suppliers.CompanyName
WHERE        (BTDrone.DroneID = @prDroneID)




End

Go

--Query C--

Create Procedure Contract_Drone_Locations

As

Begin

SELECT        Contract.ContracteesCompany AS Company, BTDrone.DroneID, EnviromentData.Longitude, EnviromentData.Latitude
FROM            Contract INNER JOIN
                         BTDrone ON Contract.ContractID = BTDrone.ContractContractID AND Contract.ContracteesCompany = BTDrone.ContractContracteesCompany INNER JOIN
                         EnviromentData ON BTDrone.DroneID = EnviromentData.BTDroneDroneID






End

Go

--Query E--

Create Procedure Drone_Viewers

As

Begin

SELECT        BTDrone.DroneID, BTDrone.StreamingDetailsVideoStreamID AS StreamID, CameraViews.UserAccountUserName AS UserName
FROM            BTDrone INNER JOIN
                         CameraViews ON BTDrone.DroneID = CameraViews.BTDroneDroneID
ORDER BY BTDrone.DroneID, UserName, StreamID






End

Go

--Query A--

Create Procedure Create_New_Subscriber

@prSalesID int,
@prUserName varchar (30),
@prEmail varchar (50),
@prPhoneNo int,
@prFirstName varchar (30),
@prLastName varchar (30),
@prLetterBoxNo int,
@prStreet char (30),
@prTown char (30),
@prCity char (30),
@prPostCode int,
@prDroneID int

As

Begin

Insert Into dbo.Subscriptions (SubscriptionType,Cost,BTDroneDroneID,CameraViewsCameraViews,CameraViewsCameraViews2,SalesStaffStaffEmployeeNo)
Values ('Standard',$25.00,null,2,1,@prSalesID);

Insert Into dbo.UserAccount(UserName,Email,PhoneNo,BTDroneDroneID)
Values (@prUserName,@prEmail,@prPhoneNo,@prDroneID);

Insert Into dbo.UserSubscription(UserAccountUserName,SubscriptionsReciptNumber)
Values (@prUserName,11);

Insert Into dbo.SubscriberDetails(UserAccountUserName,FirstName,LastName,LetterBoxNumber,Street,Town,City,PostCode)
Values (@prUserName,@prFirstName,@prLastName,@prLetterBoxNo,@prStreet,@prTown,@prCity,@prPostCode);




End

Go

--Query G--

Create Procedure Update_Location_And_Reagion_Of_Drone

@prDroneID int,
@prLongitude int,
@prLatitude int,
@prRegion varchar (50),
@prRegionType varchar (50)


As

Begin

DECLARE @RegionID int

SELECT @RegionID = DrovingZoneRegionID FROM BTDrone Where DroneID = @prDroneID

Update DrovingZone
SET Region = @prRegion  , RegionType = @prRegionType
Where RegionID = @RegionID;



Update EnviromentData
SET Latitude = @prLatitude , Longitude = @prLongitude
Where BTDroneDroneID = @prDroneID;



End

Go

--Query H--

Create Procedure Delete_Contract_Saved_Data

@prContractID int

As

Begin

DELETE FROM SensedData

Where ContractContractID = @prContractID

End

Go

--Query I--

Create Procedure Store_Data

@prDroneID int

As

Begin

DECLARE @Longitude int
DECLARE @Latitude int
DECLARE @Altitude int
DECLARE @Temperature decimal(5,2)
DECLARE @Humidity int
DECLARE @AmbientLightStrength int

SELECT @Longitude = Longitude FROM EnviromentData Where BTDroneDroneID = @prDroneID
SELECT @Latitude = Latitude FROM EnviromentData Where BTDroneDroneID = @prDroneID
SELECT @Altitude = Altitude FROM EnviromentData Where BTDroneDroneID = @prDroneID
SELECT @Temperature = Temperature FROM EnviromentData Where BTDroneDroneID = @prDroneID
SELECT @Humidity = Humidity FROM EnviromentData Where BTDroneDroneID = @prDroneID
SELECT @AmbientLightStrength = AmbientLightStrength FROM EnviromentData Where BTDroneDroneID = @prDroneID


Insert INTO SensedData (BTDroneDroneID,Altitude,Latitude,Longitude,Temperature,Humidity,AmbientLightStrength)
Values(@prDroneID,@Altitude,@Latitude,@Longitude,@Temperature,@Humidity,@AmbientLightStrength)


End

Go



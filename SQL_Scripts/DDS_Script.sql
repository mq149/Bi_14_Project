Create database ETL_DDS
go
Use ETL_DDS
go
Create table Fact_Casualties(
	CasualtyIndex int,
	TimeOfDay int,
	CasualtyType int,
	AgeBand int,
	Gender int,
	JourneyPurpose int,
	BuiltUpRoad int,
	RoadType int,
	UrbanOrRuralArea int,
	VehicleType int,
	LocalAuthorityDistrict int,
	CasualtySeverity int,
	TownCity int,
	[Day] varchar(20),
	AgeGroup int,
	PRIMARY KEY (CasualtyIndex)
)
go
Create table Dim_TimeOfDay(
	TimeOfDayIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (TimeOfDayIndex)
)
go
Create table Dim_AgeBand(
	AgeBandIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (AgeBandIndex)
)
go
Create table Dim_JourneyPurpose(
	JourneyPurposeIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (JourneyPurposeIndex)
)
go
Create table Dim_RoadType(
	RoadTypeIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (RoadTypeIndex)
)
Go
Create table Dim_VehicleType(
	VehicleTypeIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (VehicleTypeIndex)
)
Go
Create table Dim_CasualtySeverity(
	CasualtySeverityIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (CasualtySeverityIndex)
)
Go
Create table Dim_Date(
	DateIndex varchar(20),
	FullDate date,
	[Day] int,
	[Month] int,
	[Quarter] int,
	[Year] int,
	PRIMARY KEY (DateIndex)
)
Go
Create table Country(
	CountryIndex int,
	CountryCode varchar(20),
	CountryName Varchar(20),
	PRIMARY KEY (CountryIndex)
)
Go
Create table Region(
	RegionIndex int,
	RegionCode varchar(20),
	RegionName varchar(50),
	Country int,
	PRIMARY KEY (RegionIndex)
)
Go
Create table County(
	CountyIndex int,
	CountyName varchar(50),
	Region int,
	PRIMARY KEY (CountyIndex)
)
Go
Create table Dim_TownCity(
	TownCityIndex int,
	Postcode varchar(20),
	lsoa varchar(20),
	CityName Varchar(50),
	County int,
	PRIMARY KEY (TownCityIndex)
)
Go
Create table Dim_AgeGroup(
	AgeGroupIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (AgeGroupIndex)
)
Go
Create table Dim_LocalAuthorityDistrict(
	LADIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (LADIndex)
)
Go
Create table Dim_UrbanOrRuralArea(
	UrbanOrRuralIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (UrbanOrRuralIndex)
)
Go
Create table Dim_BuiltUpRoad(
	BuiltUpRoadIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (BuiltUpRoadIndex)
)
Go
Create table Dim_Gender(
	GenderIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (GenderIndex)
)
Go
Create table Dim_CasualtyType(
	CasualtyTypeIndex int,
	Code int,
	[Label] varchar(100),
	PRIMARY KEY (CasualtyTypeIndex)
)
Go
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_TimeOfDay
  FOREIGN KEY (TimeOfDay)
  REFERENCES Dim_TimeOfDay (TimeOfDayIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_CasualtyType
  FOREIGN KEY (CasualtyType)
  REFERENCES Dim_CasualtyType (CasualtyTypeIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_AgeBand
  FOREIGN KEY (AgeBand)
  REFERENCES Dim_AgeBand (AgeBandIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_Gender
  FOREIGN KEY (Gender)
  REFERENCES Dim_Gender (GenderIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_JourneyPurpose
  FOREIGN KEY (JourneyPurpose)
  REFERENCES Dim_JourneyPurpose (JourneyPurposeIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_BuiltUpRoad
  FOREIGN KEY (BuiltUpRoad)
  REFERENCES Dim_BuiltUpRoad (BuiltUpRoadIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_AgeGroup
  FOREIGN KEY (AgeGroup)
  REFERENCES Dim_AgeGroup (AgeGroupIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_RoadType
  FOREIGN KEY (RoadType)
  REFERENCES Dim_RoadType (RoadTypeIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_UrbanOrRuralArea
  FOREIGN KEY (UrbanOrRuralArea)
  REFERENCES Dim_UrbanOrRuralArea (UrbanOrRuralIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_VehicleType
  FOREIGN KEY (VehicleType)
  REFERENCES Dim_VehicleType (VehicleTypeIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_LocalAuthorityDistrict
  FOREIGN KEY (LocalAuthorityDistrict)
  REFERENCES Dim_LocalAuthorityDistrict (LADIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_CasualtySeverity
  FOREIGN KEY (CasualtySeverity)
  REFERENCES Dim_CasualtySeverity (CasualtySeverityIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_TownCity
  FOREIGN KEY (TownCity)
  REFERENCES Dim_TownCity (TownCityIndex);
ALTER TABLE Fact_Casualties
ADD CONSTRAINT fk_Casualties_Day
  FOREIGN KEY ([Day])
  REFERENCES Dim_Date (DateIndex);
ALTER TABLE Dim_TownCity
ADD CONSTRAINT fk_Dim_TownCity_County
  FOREIGN KEY (County)
  REFERENCES County (CountyIndex);
ALTER TABLE County
ADD CONSTRAINT fk_County_Region
  FOREIGN KEY (Region)
  REFERENCES Region (RegionIndex);
ALTER TABLE Region
ADD CONSTRAINT fk_Region_Country
  FOREIGN KEY (Country)
  REFERENCES Country (CountryIndex);

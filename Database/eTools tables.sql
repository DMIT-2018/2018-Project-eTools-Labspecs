use model
go
drop database eTools
go 
create database eTools
go
USE eTools
GO

CREATE TABLE Positions
(
	PositionID	int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Position_PositionID PRIMARY KEY CLUSTERED ,
	Description nvarchar(50) NOT NULL
) 
GO

CREATE TABLE Provinces(
	ProvinceID nchar(2) NOT NULL
	CONSTRAINT PK_Provinces_ProvinceCode PRIMARY KEY CLUSTERED,
	Description nvarchar(50) NOT NULL
)
GO

CREATE TABLE Coupons(
	CouponID int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Coupons_CouponID PRIMARY KEY CLUSTERED,
	CouponIDValue nvarchar(10) NOT NULL
	CONSTRAINT UQ_Coupons_CouponIDValue Unique,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	CouponDiscount int NOT NULL
	CONSTRAINT CK_Coupons_CouponDiscount CHECK  (CouponDiscount >(0) AND CouponDiscount <=100)
)
go

CREATE TABLE Customers(
	CustomerID int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Custoemrs_CustomerID PRIMARY KEY CLUSTERED,
	LastName nvarchar(50) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	Address nvarchar(75) NOT NULL,
	City nvarchar(30) NOT NULL,
	ProvinceID nchar(2) NOT NULL
	CONSTRAINT FK_CustomersProvinces_ProvinceID FOREIGN KEY(ProvinceID)
		REFERENCES Provinces (ProvinceID),
	PostalCode nchar(6) NOT NULL,
	ContactPhone nchar(12) NOT NULL,
	EmailAddress nvarchar(50) NULL,
	AcceptableStatus bit NOT NULL,
)
GO

CREATE TABLE Employees
(
	EmployeeID		int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Employee_EmployeeID PRIMARY KEY CLUSTERED,
	FirstName		nvarchar(25) NOT NULL,
	LastName		nvarchar(25) NOT NULL,
	DateHired		datetime NOT NULL,
	DateReleased	datetime NULL,
	PositionID		int NOT NULL
	CONSTRAINT FK_EmployeesPositions_PositionID FOREIGN KEY REFERENCES Positions(PositionID),
	LoginID			nvarchar(30) NULL,
	Address			nvarchar(75) NOT NULL,
	City			nvarchar(30) NOT NULL,
	ContactPhone	nchar(12) NOT NULL,
	PostalCode		nchar(6) NOT NULL
	
) 

GO

CREATE TABLE Vendors
(
	VendorID	int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Vendors_VendorID PRIMARY KEY CLUSTERED ,
	VendorName	nvarchar(100) NOT NULL,
	Phone		nvarchar(12) NOT NULL
	CONSTRAINT CK_Vendors_Phone CHECK  (Phone like '[1-9][0-9][0-9].[1-9][0-9][0-9].[0-9][0-9][0-9][0-9]'),
	Address		nvarchar(30) NOT NULL,
	City varchar(50) NOT NULL,
	ProvinceID	nchar(2) NOT NULL
	CONSTRAINT CK_VendorsProvinces_ProvinceID FOREIGN KEY (ProvinceID)
	REFERENCES Provinces(ProvinceID),
	PostalCode	nchar(6) NOT NULL
	CONSTRAINT CK_Vendors_PostalCode CHECK  (PostalCode like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]')
) 
GO

CREATE TABLE Categories
(
	CategoryID int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Category_CategoryID PRIMARY KEY CLUSTERED,
	Description varchar(50) NOT NULL
) 

GO

CREATE TABLE  StockItems
(
	StockItemID			int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_StockItems_StockItemID PRIMARY KEY CLUSTERED ,
	Description			nvarchar(50) NOT NULL,
	SellingPrice		smallmoney NOT NULL
	CONSTRAINT CK_StockItems_SellingPrice  CHECK  (SellingPrice>=0.00),
	PurchasePrice		smallmoney NOT NULL
	CONSTRAINT CK_StockItems_PurchasePrice CHECK  (PurchasePrice>=0.00),
	QuantityOnHand		int NOT NULL
	CONSTRAINT CK_StockItems_QuantityOnHand CHECK  (QuantityOnHand>=0),
	QuantityOnOrder		int NOT NULL
	CONSTRAINT CK_StockItems_QuantityOnOrder CHECK  (QuantityOnOrder>=0),
	ReOrderLevel		int NOT NULL
	CONSTRAINT CK_StockItems_ReOrderLevel CHECK  (ReOrderLevel>=0),
	Discontinued		bit NOT NULL,
	VendorID			int NOT NULL
	CONSTRAINT FK_StockItemsVendors_VendorID FOREIGN KEY REFERENCES Vendors(VendorID),
	VendorStockNumber	nvarchar(25) NULL,
	CategoryID			int NOT NULL
	CONSTRAINT FK_StockItemsCategories_CategoryID FOREIGN KEY REFERENCES Categories(CategoryID)
 
) 

GO

CREATE TABLE RentalEquipment(
	RentalEquipmentID	int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_RentalEquipment PRIMARY KEY CLUSTERED,
	ModelNumber			nvarchar(20) NOT NULL,
	SerialNumber		nvarchar(20) NOT NULL,
	Description			nvarchar(50) NOT NULL,
	DailyRate			smallmoney NOT NULL
	CONSTRAINT CK_RentalEquipment_DailyRate CHECK  (DailyRate > 0.0),
	Condition			nvarchar(100) NULL,
	Available			bit NOT NULL,
	Retired				bit NOT NULL
)
GO

CREATE TABLE UnOrderedItems(
	ItemID			int IDENTITY(1,1) NOT NULL
	CONSTRAINT [PK_UnOrderedItems_ItemID] PRIMARY KEY CLUSTERED,
	ItemName		nvarchar(50) NOT NULL,
	VendorProductID nvarchar(25) NOT NULL,
	Quantity		int NOT NULL
	CONSTRAINT CK_UnOrderedItems_Quantity CHECK  (Quantity > 0)
)
GO

CREATE TABLE Sales
(
	SaleID			int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Sales_SaleNumber PRIMARY KEY CLUSTERED,
	SaleDate			datetime  NOT NULL DEFAULT getdate(),
	PaymentType			nchar(1) NOT NULL
	Constraint CK_Sales_PaymentType CHECK (PaymentType in ('D','C','M')),
	EmployeeID			int  NOT NULL
	CONSTRAINT FK_SalesEmployees_EmployeeID FOREIGN KEY (EmployeeID)
	REFERENCES Employees(EmployeeID),
	TaxAmount			smallmoney  NOT NULL
	CONSTRAINT CK_Sales_TaxAmount CHECK  (TaxAmount>=0.00),
	SubTotal			money  NOT NULL
	CONSTRAINT CK_Sales_SubTotal CHECK  (SubTotal>=0.00),
	CouponID			int NULL
	CONSTRAINT FK_SalesCoupons_CouponID FOREIGN KEY (CouponID)
	REFERENCES Coupons(CouponID),
	PaymentToken		uniqueidentifier NULL
 )
GO

CREATE TABLE SaleDetails
(
	SaleDetailID		int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_SaleDetails_SaleDetailsID PRIMARY KEY CLUSTERED,
	SaleID				int  NOT NULL
	CONSTRAINT FK_SaleDetailsSales_SaleID FOREIGN KEY (SaleID) 
		REFERENCES Sales (SaleID),
	StockItemID		int NOT NULL
	CONSTRAINT FK_SaleDetailsStockItems_StockItemID FOREIGN KEY (StockItemID)
		REFERENCES StockItems (StockItemID),
	SellingPrice	smallmoney NOT NULL
	CONSTRAINT CK_SaleDetails_SellingPrice CHECK  (SellingPrice>=0.00),
	Quantity		int NOT NULL
	CONSTRAINT CK_SaleDetails_Quantity CHECK  (Quantity>0)
	
)

GO

CREATE TABLE SaleRefunds(
	SaleRefundID int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_SaleRefunds_SaleRefundID PRIMARY KEY CLUSTERED,
	SaleRefundDate datetime NOT NULL DEFAULT (getdate()),
	SaleID int NOT NULL
	CONSTRAINT FK_SaleRefundsSales_SaleID FOREIGN KEY(SaleID)
		REFERENCES Sales (SaleID),
	EmployeeID int NOT NULL 
	CONSTRAINT FK_SaleRefundsEmployees_EmployeeID FOREIGN KEY(EmployeeID)
		REFERENCES Employees (EmployeeID),
	TaxAmount money NOT NULL
	CONSTRAINT CK_SaleRefunds_TaxAmount CHECK  (TaxAmount >= 0.00),
	SubTotal money NOT NULL
	CONSTRAINT CK_SaleRefunds_SubTotal CHECK  (SubTotal >= 0.00)
)
GO

CREATE TABLE SaleRefundDetails(
	SaleRefundDetailID	int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_SaleRefundDetails_SaleRefundDetailID PRIMARY KEY CLUSTERED,
	SaleRefundID		int NOT NULL
	CONSTRAINT FK_SaleRefundDetailsSaleRefunds_SaleRefundID FOREIGN KEY(SaleRefundID)
		REFERENCES SaleRefunds (SaleRefundID),
	StockItemID			int NOT NULL
	CONSTRAINT FK_SaleRefundDetailsStockItems_StockItemID FOREIGN KEY(StockItemID)
		REFERENCES StockItems (StockItemID),
	SellingPrice		money NOT NULL
	CONSTRAINT CK_SaleRefundDetails_SellingPrice CHECK  (SellingPrice >= 0.00),
	Quantity			int NOT NULL
	CONSTRAINT CK_SaleRefundDetails_Quantity CHECK  (Quantity > 0)
)
GO

CREATE TABLE PurchaseOrders
(
	PurchaseOrderID		int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_PurchaseOrders_PurchaseOrderID PRIMARY KEY CLUSTERED,
	OrderDate		datetime  NULL,
	VendorID		int  NOT NULL
	CONSTRAINT FK_PurchaseOrdersVendors_VendorID FOREIGN KEY (VendorID)
		REFERENCES Vendors(VendorID),
	EmployeeID		int  NOT NULL
	CONSTRAINT FK_PurchaseOrdersEmployees_EmployeeID FOREIGN KEY (EmployeeID)
		REFERENCES Employees(EmployeeID),
	TaxAmount		money  NOT NULL
	CONSTRAINT CK_PurchaseOrders_TaxAmount CHECK  (TaxAmount>=0.00),
	SubTotal		money  NOT NULL
	CONSTRAINT CK_PurchaseOrders_SubTotal CHECK  (SubTotal>=0.00),
	Closed			bit	NOT NULL,
	Notes			nvarchar(100) NULL
)

GO

CREATE TABLE PurchaseOrderDetails(
	PurchaseOrderDetailID int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_PurchaseOrderDetails_OrderDetailID PRIMARY KEY CLUSTERED,
	PurchaseOrderID int NOT NULL
	CONSTRAINT FK_PurchaseOrderDetailsPurchaseOrders_OrderID FOREIGN KEY(PurchaseOrderID)
		REFERENCES PurchaseOrders (PurchaseOrderID),
	StockItemID int NOT NULL
	CONSTRAINT FK_PurchaseOrderDetailsStockItems_StockItemID FOREIGN KEY(StockItemID)
		REFERENCES StockItems (StockItemID),
	PurchasePrice money NOT NULL
	CONSTRAINT CK_PurchaseOrderDetails_PurchasePrice CHECK  (PurchasePrice >= 0.00),
	Quantity int NOT NULL
	CONSTRAINT CK_PurchaseOrderDetails_Quantity CHECK  (Quantity >= 0.00)
)
GO

CREATE TABLE ReceiveOrders(
	ReceiveOrderID int IDENTITY(1,2) NOT NULL
	CONSTRAINT PK_ReceiveOrders_ReceiveOrderID PRIMARY KEY CLUSTERED,
	PurchaseOrderID int NOT NULL
	CONSTRAINT FK_ReceiveOrdersPurchaseOrders_OrderID FOREIGN KEY(PurchaseOrderID)
		REFERENCES PurchaseOrders (PurchaseOrderID),
	ReceiveDate datetime NULL,
	EmployeeID int NULL
	CONSTRAINT FK_ReceiveOrdersEmployees_EmployeeID FOREIGN KEY(EmployeeID)
		REFERENCES Employees (EmployeeID)
)
GO

CREATE TABLE ReceiveOrderDetails(
	ReceiveOrderDetailID int IDENTITY(2,2) NOT NULL
	CONSTRAINT PK_ReceiveOrderDetails PRIMARY KEY CLUSTERED,
	ReceiveOrderID int NOT NULL
	CONSTRAINT FK_ReceiveOrderDetailsReceiveOrders_ReceiveOrderID FOREIGN KEY(ReceiveOrderID)
		REFERENCES ReceiveOrders (ReceiveOrderID),
	PurchaseOrderDetailID int NOT NULL
	CONSTRAINT FK_ReceiveOrderDetailsPurchaseOrderDetails_OrderDetailID FOREIGN KEY(PurchaseOrderDetailID)
		REFERENCES PurchaseOrderDetails (PurchaseOrderDetailID),
	QuantityReceived int NOT NULL
	CONSTRAINT CK_ReceiveOrderDetails_QuantityReceived CHECK  (QuantityReceived > 0)
)
GO

CREATE TABLE ReturnedOrderDetails(
	ReturnedOrderDetailID	int IDENTITY(5,5) NOT NULL
	CONSTRAINT PK_ReturnedOrderDetails PRIMARY KEY CLUSTERED ,
	ReceiveOrderID			int NOT NULL
	CONSTRAINT FK_ReturnedOrderDetailsReceiveOrders_ReceiveOrder FOREIGN KEY(ReceiveOrderID)
		REFERENCES ReceiveOrders (ReceiveOrderID),
	PurchaseOrderDetailID	int NULL
	CONSTRAINT FK_ReturnedOrderDetailsPurchaseOrderDetails_OrderDetailID FOREIGN KEY(PurchaseOrderDetailID)
		REFERENCES PurchaseOrderDetails (PurchaseOrderDetailID),
	ItemDescription			nvarchar(50) NULL,
	Quantity				int NOT NULL
	CONSTRAINT CK_ReturnedOrderDetails_Quantity CHECK  (Quantity > 0),
	Reason					nvarchar(50) NOT NULL,
	VendorStockNumber		nvarchar(15) NULL
 
)
GO

CREATE TABLE Rentals(
	RentalID		int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Rentals_RentalID PRIMARY KEY CLUSTERED ,
	CustomerID		int NOT NULL
	CONSTRAINT FK_RentalsCustomers_CustomerID FOREIGN KEY(CustomerID)
		REFERENCES Customers (CustomerID),
	EmployeeID		int NOT NULL
	CONSTRAINT FK_RentalsEmployees_EmployeeID FOREIGN KEY(EmployeeID)
		REFERENCES Employees (EmployeeID),
	CouponID		int NULL
	CONSTRAINT FK_RentalsCoupons_CouponID FOREIGN KEY(CouponID)
		REFERENCES Coupons (CouponID),
	SubTotal		smallmoney NOT NULL,
	TaxAmount		smallmoney NOT NULL,
	RentalDateOut	datetime NOT NULL,
	RentalDateIn	datetime NOT NULL,
	PaymentType		nchar(1) NOT NULL
	CONSTRAINT CK_Rentals_PaymentType CHECK  (PaymentType='M' OR PaymentType='D' OR PaymentType='C'),
	CONSTRAINT CK_RentalDates_RentalDateOutRentalDateIn CHECK  (RentalDateIn >= RentalDateOut)
)
GO

CREATE TABLE RentalDetails(
	RentalDetailID		int IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_RentalDetails_RentalDetailID PRIMARY KEY CLUSTERED ,
	RentalID			int NOT NULL
	CONSTRAINT FK_RentalDetailsRentals_RentalID FOREIGN KEY(RentalID)
		REFERENCES Rentals (RentalID),
	RentalEquipmentID	int NOT NULL
	CONSTRAINT FK_RentalDetailsRentalEquipemnt_RentalEquipmentID FOREIGN KEY(RentalEquipmentID)
		REFERENCES RentalEquipment (RentalEquipmentID),
	RentalDays			decimal(5, 2) NOT NULL DEFAULT (0.0)
	CONSTRAINT CK_RentalDetails_RentalDays CHECK  (RentalDays >= 0.00),
	RentalRate			money NOT NULL DEFAULT (0.0)
	CONSTRAINT CK_RentalDetails_RentalRate CHECK  (RentalRate >= 0.00),
	OutCondition		nvarchar(100) NOT NULL,
	InCondition			nvarchar(100) NOT NULL,
	DamageRepairCost	money NOT NULL DEFAULT (0.0)
	CONSTRAINT CK_RentalDetails_DamageRepairCost CHECK  (DamageRepairCost >= 0.00),
	Comments			nvarchar(500) NULL
)
GO
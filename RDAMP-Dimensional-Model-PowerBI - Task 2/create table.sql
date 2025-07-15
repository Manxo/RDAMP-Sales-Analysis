CREATE TABLE [dbo].[dim_category](
	[category] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[dim_customer](
	[Customer_ID] [nvarchar](50) NOT NULL,
	[Postal_Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dim_locations](
	[City] [nvarchar](50) NOT NULL,
	[Postal_Code] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dim_locations] PRIMARY KEY CLUSTERED 
(
	[Postal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dim_order_mode](
	[Order_Mode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dim_order_mode] PRIMARY KEY CLUSTERED 
(
	[Order_Mode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dim_product](
	[Product_ID] [varchar](50) NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[Segement] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Sub_Category] [varchar](max) NOT NULL,
 CONSTRAINT [PK_dim_product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[dim_sales](
	[Order_ID] [nvarchar](50) NOT NULL,
	[Order_Date] [date] NOT NULL,
	[Order_Mode] [nvarchar](50) NOT NULL,
	[Customer_ID] [nvarchar](50) NOT NULL,
	[Product_ID] [nvarchar](50) NOT NULL,
	[Sales] [decimal](18, 10) NOT NULL,
	[Cost_Price] [decimal](18, 10) NOT NULL,
	[Quantity] [tinyint] NOT NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_dim_salesu] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



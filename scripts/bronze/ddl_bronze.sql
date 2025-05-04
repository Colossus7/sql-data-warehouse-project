IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info

CREATE TABLE [bronze].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_material_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL
)

IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info

CREATE TABLE [bronze].[crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[prd_nm] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_start_dt] [date] NULL,
	[prd_end_dt] [date] NULL
)

/****** Object:  Table [bronze].[crm_sales_details]    Script Date: 03/05/2025 16:35:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bronze].[crm_sales_details]') AND type in (N'U'))
DROP TABLE [bronze].[crm_sales_details]
GO

/****** Object:  Table [bronze].[crm_sales_details]    Script Date: 03/05/2025 16:35:23 ******/

CREATE TABLE [bronze].[crm_sales_details](
	[sls_ord_num] [nvarchar](50) NULL,
	[sls_prd_key] [nvarchar](50) NULL,
	[sls_cust_id] [int] NULL,
	[sls_order_dt] [int] NULL,
	[sls_ship_dt] [int] NULL,
	[sls_due_dt] [int] NULL,
	[sls_sales] [int] NULL,
	[sls_quantity] [int] NULL,
	[sls_price] [int] NULL
)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bronze].[erp_CUST_AZ12]') AND type in (N'U'))
DROP TABLE [bronze].[erp_CUST_AZ12]
GO

/****** Object:  Table [bronze].[erp_CUST_AZ12]    Script Date: 03/05/2025 16:35:59 ******/

CREATE TABLE [bronze].[erp_CUST_AZ12](
	[cid] [nvarchar](50) NULL,
	[bdate] [date] NULL,
	[gen] [nvarchar](15) NULL
)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bronze].[erp_LOC_A101]') AND type in (N'U'))
DROP TABLE [bronze].[erp_LOC_A101]
GO

/****** Object:  Table [bronze].[erp_LOC_A101]    Script Date: 03/05/2025 16:36:18 ******/

CREATE TABLE [bronze].[erp_LOC_A101](
	[cid] [nvarchar](50) NULL,
	[cntry] [nvarchar](50) NULL
)

ALTER TABLE [bronze].[erp_PX_CAT_G1V2] DROP CONSTRAINT [check_maintenance]
GO

/****** Object:  Table [bronze].[erp_PX_CAT_G1V2]    Script Date: 03/05/2025 16:36:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bronze].[erp_PX_CAT_G1V2]') AND type in (N'U'))
DROP TABLE [bronze].[erp_PX_CAT_G1V2]
GO

/****** Object:  Table [bronze].[erp_PX_CAT_G1V2]    Script Date: 03/05/2025 16:36:41 ******/

CREATE TABLE [bronze].[erp_PX_CAT_G1V2](
	[id] [nvarchar](50) NULL,
	[cat] [nvarchar](50) NULL,
	[subcat] [nvarchar](50) NULL,
	[maintenance] [nvarchar](5) NULL
)

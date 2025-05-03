USE [Data_Warehouse]
GO

/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 03/05/2025 16:24:03 ******/
/*
=========================================================
Stored Proceduree: Load Bronze Layer (Source -> Bronze)

Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external csv files.
	It performs the following actions:
	- Truncates the bronze tables before loading data.
	- Use the 'Bulk Insert' command to load data from csv files to bronze tables.

Parameter :
	None
   This store procedure does not accept any parameters or return any values.

Usage Example : EXEC bronze.load_bronze

=========================================================
*/

CREATE PROCEDURE [bronze].[load_bronze] as 
BEGIN
	DECLARE @start_time DATETIME , @end_time DATETIME, @batch_start_time datetime, @batch_end_time datetime
	BEGIN TRY
	set @batch_start_time = GETDATE();
		Print('=========================================');
		PRINT('Loading Bronze Layer');
		Print('=========================================');

		Print('-----------------------------------------');
		Print('Print CRM Table ');
		Print('-----------------------------------------');

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Bulk Insert  Table : bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>> Bulk Insert  Table : bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>> Bulk Insert  Table : bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		Print('-----------------------------------------');
		Print('Print ERP Table ');
		Print('-----------------------------------------');

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12
		PRINT '>> Bulk Insert  Table : bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101
		PRINT '>> Bulk Insert  Table : bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_LOC_A101
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		set @start_time = GETDATE();
		PRINT '>> Truncating  Table : bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2
		PRINT '>> Bulk Insert  Table : bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		from 'C:\SQL Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time,@end_time) as NVARCHAR) + ' seconds';
		print '----------------------------';

		SET @batch_end_time = GETDATE();
		print'==============================';
		print'Loading Bronze Layer is Completed';
		PRINt ' - Total Load Duration ' + CAST(DATEDIFF(second, @batch_start_time,@batch_end_time) as nvarchar) + ' seconds'
		print'==============================';
	END TRY
BEGIN CATCH
	PRINT '===========================================';
	PRINT 'Error occured during loading bronze layer'
	print 'Error Message' + ERROR_MESSAGE();
	print 'Error Message' + CAST(ERROR_MESSAGE() as NVARCHAR);
	PRINT '===========================================';
END CATCH
end
GO



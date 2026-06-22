/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT 'LOADING BRONZE LAYER';
		PRINT 'LOADING CRM TABLES';
		PRINT '>>TRUNCATING TABLE:bronze.crm_cust_info';
		SET @start_time = GETDATE();
		PRINT '>>INSERTING DATA INTO :bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info; 
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT '>>TRUNCATING TABLE:bronze.crm_prd_info';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info; 
		PRINT '>>INSERTING DATA INTO:bronze.crm_prd_info';

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';
		SET @start_time = GETDATE();
		PRINT '>>TRUNCATING TABLE:bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>INSERTING DATA INTO:bronze.crm_sales_details';

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT 'LOADING ERP TABLES';
		SET @start_time = GETDATE();
		PRINT '>>TRUNCATING TABLE:bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12; 
		PRINT '>>INSERTING DATA INTO:bronze.erp_CUST_AZ12';

		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';


		SET @start_time = GETDATE();
		PRINT '>>TRUNCATING TABLE:bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;

		PRINT '>>INSERTING DATA INTO:bronze.erp_LOC_A101';

		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';

		SET @start_time = GETDATE();
		PRINT '>>TRUNCATING TABLE:bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2; 
		PRINT '>>INSERTING DATA INTO:bronze.erp_PX_CAT_G1V2';

		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\lazytechno\Desktop\datawarehouse_project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>>load Duration: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' seconds';

		SET @batch_end_time = GETDATE();
		PRINT 'loading bronze layer completed';
		PRINT '>>total load Duration: '+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) +' seconds';
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'EROOR MESSAGE' + ERROR_MESSAGE();
		PRINT 'EROOR MESSAGE' + CAST(ERROR_NUMBER () AS NVARCHAR);
		PRINT 'EROOR MESSAGE' + CAST(ERROR_STATE()AS NVARCHAR);
	END CATCH
END

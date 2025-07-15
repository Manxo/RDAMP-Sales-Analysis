select * from [dbo].[dim_category];

select * from [dbo].[dim_customer];

select * from [dbo].[dim_locations];

select * from [dbo].[dim_order_mode];

select * from [dbo].[dim_product];

select * from [dbo].[dim_segment];

select * from [dbo].[dim_subcategory];


EXEC sp_rename 'dim_segment.column1', 'segment', 'COLUMN';

DELETE FROM [AceStoredb].[dbo].[dim_segment]
WHERE segment = 'Segement';

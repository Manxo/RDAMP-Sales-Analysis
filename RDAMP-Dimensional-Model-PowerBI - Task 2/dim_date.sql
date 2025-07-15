-- Ensure the table exists
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    quarter_name VARCHAR(10),
    year INT,
    day_of_week INT,
    day_name VARCHAR(20),
    week_of_year INT,
    is_weekend BIT,
    is_holiday BIT
);

-- Populate dim_date from 2022 to 2026
DECLARE @Date DATE = '2022-01-01';
DECLARE @EndDate DATE = '2026-12-31';

WHILE @Date <= @EndDate
BEGIN
    INSERT INTO dim_date (
        date_key,
        full_date,
        day,
        month,
        month_name,
        quarter,
        quarter_name,
        year,
        day_of_week,
        day_name,
        week_of_year,
        is_weekend,
        is_holiday
    )
    VALUES (
        CONVERT(INT, FORMAT(@Date, 'yyyyMMdd')),
        @Date,
        DAY(@Date),
        MONTH(@Date),
        DATENAME(MONTH, @Date),
        DATEPART(QUARTER, @Date),
        'Q' + CAST(DATEPART(QUARTER, @Date) AS VARCHAR),
        YEAR(@Date),
        DATEPART(WEEKDAY, @Date),
        DATENAME(WEEKDAY, @Date),
        DATEPART(WEEK, @Date),
        CASE WHEN DATENAME(WEEKDAY, @Date) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END,
        0 -- Holiday flag; default to 0 unless linked to external holiday table
    );

    SET @Date = DATEADD(DAY, 1, @Date);
END;
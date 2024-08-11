-- Exploratory Data Analysis
-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers
SELECT * 
FROM layoffs_staging2;

#lets look at total_laid_off
SELECT MAX(total_laid_off)
FROM layoffs_staging2;

#lets add percentage laid off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

--- lets look at which companies are these that have 1%
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

-- lets see which company had largest laid off
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Lets look at funds raised,which company had alot of funding
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

#company which had most layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- lets look at date ranges
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- lets look at which industry had many layoffs
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- lets look at which country was hit hard
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- lets look at which dates were hit hard
SELECT `date`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `date`
ORDER BY 1 DESC;
#to make it easy lets do year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- lets check the stage of the company at which it was when being hit
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- lets do a rolling sum or progression of layoffs
#lets do a roll of based on month of layoffs
SELECT SUBSTRING(`date`,6,2) AS `MONTH` ,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `MONTH`;
#Lets do it based on year and month
SELECT SUBSTRING(`date`,1,7) AS `MONTH` ,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `MONTH`;

-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(`date`,1,7) AS `MONTH` ,SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- lets use CTEs
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH` ,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

#lets look at company laying off per year
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC
;

-- Lets rank which years they laid off most employees by use of CTEs
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS 
(SELECT *, 
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;













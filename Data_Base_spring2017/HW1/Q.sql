-- 1
SELECT * FROM `Programs`
-- 2
SELECT `DEVELOPER` FROM `Programs`
-- 3
SELECT 'ID', 'PROGRAMID' FROM `Ads` WHERE CATEGORYID = 2
-- 4
SELECT DISTINCT `NAME` 
FROM `Categories` 
WHERE ID IN (
	SELECT CATEGORYID 
	FROM `Ads` 
	WHERE ID IN (
		SELECT ADID 
		FROM `ProgramAds` 
		WHERE ID IN (
			SELECT PROGRAMADID 
			FROM Views 
			GROUP BY PROGRAMADID 
			HAVING COUNT(PROGRAMADID) > 100)
		)
	)
-- 5
SELECT _FIRST.NAME, (_FIRST.total + _SECOND.total + _THIRD.total) as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
    	WHERE ProgramAds.ID = Downloads.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID
        AND Ads.CATEGORYID = 2 -- 2 is equal to farhangi
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME 
    ) as _FIRST,

    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.CLICKPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
    	WHERE ProgramAds.ID = Clicks.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID 
        AND Ads.CATEGORYID = 2 -- 2 is equal to farhangi
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.VISITPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Views`
    	WHERE ProgramAds.ID = Views.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID
        AND Ads.CATEGORYID = 2 -- 2 is equal to farhangi
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME AND (_FIRST.total + _SECOND.total + _THIRD.total) > 1000 -- 1000 means 1million

-- 6
SELECT _FIRST.NAME, _FIRST.total + _SECOND.total + _THIRD.total as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
        WHERE ProgramAds.ID = Downloads.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
    ) as NEW
    GROUP BY NEW.PNAME) as _FIRST,

    (SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.VISITPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Views`
        WHERE ProgramAds.ID = Views.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
     ) as NEW
GROUP BY NEW.PNAME) as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.CLICKPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
        WHERE ProgramAds.ID = Clicks.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
     ) as NEW
    GROUP BY NEW.PNAME) as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME  AND _FIRST.NAME = "APP-2" -- APP-2 is equal to khorus jangi

-- 7
SELECT Name 
FROM Programs 
WHERE ID in (
    SELECT `ProgramAds.PROGRAMID`
    FROM `ProgramAds`, `Ads`
    WHERE `ProgramAds.ADID` = `Ads.ID` AND `ProgramAds.PROGRAMID` = `Ads.PROGRAMID`)

-- 8
SELECT Programs.NAME, Ads.ID, Ads.VISITPRICE*COUNT(*)
FROM `Ads`,`Programs`,`ProgramAds`,`Views`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Views.PROGRAMADID AND ProgramAds.ADID = Ads.ID AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 9
SELECT Programs.NAME, Ads.ID, Ads.CLICKPRICE*COUNT(*)
FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Clicks.PROGRAMADID AND ProgramAds.ADID = Ads.ID AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 10
SELECT Programs.NAME, Ads.ID, Ads.DOWNLOADPRICE*COUNT(*)
FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Downloads.PROGRAMADID AND ProgramAds.ADID = Ads.ID AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 11
SELECT _FIRST.NAME, _FIRST.total + _SECOND.total + _THIRD.total as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
    	WHERE ProgramAds.ID = Downloads.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID    
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME 
    ) as _FIRST,

    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.CLICKPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
    	WHERE ProgramAds.ID = Clicks.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID    
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.VISITPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Views`
    	WHERE ProgramAds.ID = Views.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID   
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME

-- 12
SELECT Programs.NAME, Ads.VISITPRICE*COUNT(*) as total_from_ad1
FROM `Ads`,`Programs`,`ProgramAds`,`Views`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Views.PROGRAMADID AND ProgramAds.ADID = 1 AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 13
SELECT Programs.NAME, Ads.CLICKPRICE*COUNT(*) as total_from_ad1
FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Clicks.PROGRAMADID AND ProgramAds.ADID = 1 AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 14
SELECT Programs.NAME, Ads.DOWNLOADPRICE*COUNT(*) as total_from_ad1
FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
WHERE Ads.PROGRAMID = Programs.ID AND ProgramAds.ID = Downloads.PROGRAMADID AND ProgramAds.ADID = 1 AND ProgramAds.PROGRAMID = Programs.ID
GROUP By ProgramAds.ID

-- 15
SELECT Programs.ID from ProgramAds,Programs where ProgramAds.ADID=1 and ProgramAds.PROGRAMID=Programs.ID

-- 16
SELECT Name 
FROM Programs 
WHERE ID in (
	SELECT ProgramAds.PROGRAMID 
	from Ads,ProgramAds 
	where ProgramAds.ADID = Ads.ID and Ads.PROGRAMID=1)

-- 17
SELECT _FIRST.NAME, _FIRST.total + _SECOND.total + _THIRD.total as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
    	WHERE ProgramAds.ID = Downloads.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID
        AND Programs.ID <> Ads.PROGRAMID    
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME 
    ) as _FIRST,

    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.CLICKPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
    	WHERE ProgramAds.ID = Clicks.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID  
        AND Programs.ID <> Ads.PROGRAMID      
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.VISITPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Views`
    	WHERE ProgramAds.ID = Views.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID
        AND Programs.ID <> Ads.PROGRAMID       
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME

-- 18
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Clicks`
WHERE Ads.ID = ProgramAds.ADID
AND Clicks.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID HAVING cnt >= all (SELECT COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Clicks`
WHERE Ads.ID = ProgramAds.ADID
AND Clicks.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID)

-- 19
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Views`
WHERE Ads.ID = ProgramAds.ADID
AND Views.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID HAVING cnt >= all (SELECT COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Views`
WHERE Ads.ID = ProgramAds.ADID
AND Views.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID)

-- 20
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Downloads`
WHERE Ads.ID = ProgramAds.ADID
AND Downloads.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID HAVING cnt >= all (SELECT COUNT(*) as cnt
FROM `Ads`,`ProgramAds`,`Downloads`
WHERE Ads.ID = ProgramAds.ADID
AND Downloads.PROGRAMADID = ProgramAds.ID
GROUP BY Ads.ID)


-- 21
SELECT ss.ADID, ss.cnt
FROM (
	SELECT Ads.ID as ADID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Clicks`
			WHERE Ads.ID = ProgramAds.ADID
			AND Clicks.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Clicks`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Clicks.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Clicks`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Clicks.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as ss
WHERE ss.cnt >= all (
	SELECT main.cnt FROM (
			SELECT Ads.ID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Clicks`
			WHERE Ads.ID = ProgramAds.ADID
			AND Clicks.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Clicks`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Clicks.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Clicks`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Clicks.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as main
)

-- 22
SELECT ss.ADID, ss.cnt
FROM (
	SELECT Ads.ID as ADID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Views`
			WHERE Ads.ID = ProgramAds.ADID
			AND Views.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Views`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Views.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Views`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Views.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as ss
WHERE ss.cnt >= all (
	SELECT main.cnt FROM (
			SELECT Ads.ID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Views`
			WHERE Ads.ID = ProgramAds.ADID
			AND Views.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Views`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Views.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Views`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Views.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as main
)

-- 23
SELECT ss.ADID, ss.cnt
FROM (
	SELECT Ads.ID as ADID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Downloads`
			WHERE Ads.ID = ProgramAds.ADID
			AND Downloads.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Downloads`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Downloads.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Downloads`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Downloads.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as ss
WHERE ss.cnt >= all (
	SELECT main.cnt FROM (
			SELECT Ads.ID, COUNT(*) as cnt
			FROM `Ads`,`ProgramAds`,`Downloads`
			WHERE Ads.ID = ProgramAds.ADID
			AND Downloads.PROGRAMADID = ProgramAds.ID
			AND Ads.ID NOT IN (
			    SELECT f.ADID FROM (
			        SELECT Ads.ID as ADID, COUNT(*) as cnt2
			        FROM `Ads`,`ProgramAds`,`Downloads`
			        WHERE Ads.ID = ProgramAds.ADID
			        AND Downloads.PROGRAMADID = ProgramAds.ID
			        GROUP BY Ads.ID HAVING cnt2 >= all (
			            SELECT COUNT(*) as cnt2
			            FROM `Ads`,`ProgramAds`,`Downloads`
			            WHERE Ads.ID = ProgramAds.ADID
			            AND Downloads.PROGRAMADID = ProgramAds.ID
			            GROUP BY Ads.ID
			    )
			) as f
		)
		GROUP BY Ads.ID
	) as main
)

-- 24
SELECT Ads.ID, COUNT(*) as cnt 
FROM `Ads`,`Clicks`,`ProgramAds` 
WHERE Ads.ID = ProgramAds.ID 
AND Clicks.PROGRAMADID = ProgramAds.ID 
GROUP BY Ads.ID 
ORDER BY cnt DESC LIMIT 5

-- 25
SELECT old.PNAME, SUM(total) as T
FROM (
    SELECT Programs.NAME as PNAME, Ads.ID, Ads.VISITPRICE*COUNT(*) as total
	FROM `Ads`,`Programs`,`ProgramAds`,`Views`
	WHERE Ads.PROGRAMID = Programs.ID 
    AND ProgramAds.ID = Views.PROGRAMADID 
    AND ProgramAds.ADID = Ads.ID 
    AND ProgramAds.PROGRAMID = Programs.ID
	GROUP By ProgramAds.ID) as old
GROUP BY old.PNAME ORDER BY T ASC LIMIT 5

-- 26
SELECT _FIRST.NAME, _FIRST.total + _SECOND.total + _THIRD.total as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
    	WHERE ProgramAds.ID = Downloads.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID    
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME 
    ) as _FIRST,

    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.CLICKPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
    	WHERE ProgramAds.ID = Clicks.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID    
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (
        SELECT Programs.NAME as PNAME, Ads.VISITPRICE*COUNT(*) as INCOME
    	FROM `Ads`,`Programs`,`ProgramAds`,`Views`
    	WHERE ProgramAds.ID = Views.PROGRAMADID 
        AND ProgramAds.ADID = Ads.ID 
        AND ProgramAds.PROGRAMID = Programs.ID   
    	GROUP By ProgramAds.ID
    ) as NEW
    GROUP BY NEW.PNAME
    )  as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME ORDER BY total DESC LIMIT 1

-- 27
SELECT _FIRST.NAME, _FIRST.total + _SECOND.total + _THIRD.total as total
FROM 
(
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.DOWNLOADPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Downloads`
        WHERE ProgramAds.ID = Downloads.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
    ) as NEW
    GROUP BY NEW.PNAME) as _FIRST,

    (SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.VISITPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Views`
        WHERE ProgramAds.ID = Views.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
     ) as NEW
GROUP BY NEW.PNAME) as _SECOND,
    
    (
    SELECT NEW.PNAME as NAME, SUM(NEW.INCOME) as total
    FROM
    (       
        SELECT Programs.NAME as PNAME, Ads.ID, Ads.CLICKPRICE*COUNT(*) as INCOME
        FROM `Ads`,`Programs`,`ProgramAds`,`Clicks`
        WHERE ProgramAds.ID = Clicks.PROGRAMADID
        AND Ads.ID = ProgramAds.ADID
        AND Ads.PROGRAMID = Programs.ID
        GROUP BY Ads.ID
     ) as NEW
    GROUP BY NEW.PNAME) as _THIRD
)
WHERE _FIRST.NAME = _SECOND.NAME AND _SECOND.NAME = _THIRD.NAME ORDER BY total DESC LIMIT 1

-- 28
SELECT Ads.ID, COUNT(*) 
FROM `Ads`,`Views`,`ProgramAds` 
WHERE Ads.ID = ProgramAds.ADID 
AND ProgramAds.ID = Views.PROGRAMADID
GROUP BY Ads.ID

-- 29
SELECT Ads.ID, COUNT(*) 
FROM `Ads`,`Clicks`,`ProgramAds` 
WHERE Ads.ID = ProgramAds.ADID 
AND ProgramAds.ID = Clicks.PROGRAMADID
GROUP BY Ads.ID

-- 30
SELECT Ads.ID, COUNT(*) 
FROM `Ads`,`Downloads`,`ProgramAds` 
WHERE Ads.ID = ProgramAds.ADID 
AND ProgramAds.ID = Downloads.PROGRAMADID
GROUP BY Ads.ID

-- 31
SELECT COUNT(*) FROM Views

-- 32
SELECT COUNT(*) FROM Clicks

-- 33
SELECT COUNT(*) FROM Downloads

-- 34
SELECT Ads.ID 
SELECT Ads.ID, COUNT(*)
FROM `Ads`,`Clicks`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Clicks.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Clicks`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Clicks`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Clicks.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Clicks`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID

-- 35
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`Clicks`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Clicks.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Clicks`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Clicks`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Clicks.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Clicks`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID ORDER BY cnt DESC LIMIT 1

-- 36
SELECT Ads.ID 
SELECT Ads.ID, COUNT(*)
FROM `Ads`,`Views`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Views.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Views`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Views`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Views.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Views`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID

-- 37
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`Views`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Views.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Views`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Views`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Views.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Views`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID ORDER BY cnt DESC LIMIT 1

-- 38
SELECT Ads.ID 
SELECT Ads.ID, COUNT(*)
FROM `Ads`,`Downloads`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Downloads.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Downloads`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Downloads`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Downloads.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Downloads`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID

-- 39
SELECT Ads.ID, COUNT(*) as cnt
FROM `Ads`,`Downloads`,`ProgramAds`,(
    SELECT Ads.ID, MIN(Downloads.A_TIMESTAMP) as minT
	FROM `Ads`,`ProgramAds`,`Downloads`
	WHERE Ads.ID = ProgramAds.ADID 
	AND `Downloads`.`PROGRAMADID` = ProgramAds.ID
	GROUP BY Ads.ID) as good
WHERE CAST(good.minT AS DATE) = CAST(Downloads.A_TIMESTAMP AS DATE)
AND Ads.ID = ProgramAds.ADID 
AND `Downloads`.`PROGRAMADID` = ProgramAds.ID
GROUP BY Ads.ID ORDER BY cnt DESC LIMIT 1
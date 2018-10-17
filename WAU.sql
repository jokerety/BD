use DB;

WITH RECURSIVE cte AS	
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 DAY FROM cte
		WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT WEEK(cte.dt) AS week, COUNT(DISTINCT user_id) AS user_cnt
	FROM cte LEFT JOIN sessions ON cte.dt = CAST(begin_dttm AS DATE)
	GROUP BY week
	ORDER BY week;
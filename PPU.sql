use DB;
 
WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
        UNION ALL
	SELECT cte.dt + INTERVAL 1 DAY
		FROM cte
		WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM payments)
),
pu_for_day AS
(
	SELECT CAST(payment_dttm AS DATE) AS dt, COUNT(DISTINCT user_id) as user_cnt
		FROM payments
		GROUP BY dt
),
dau_for_day AS
(
	SELECT CAST(begin_dttm AS DATE) AS dt, COUNT(distinct user_id) AS user_cnt
		FROM sessions
		GROUP BY dt
 
)
SELECT cte.dt, COALESCE(pu.user_cnt, 0) / COALESCE(dau.user_cnt, 1) AS PPU
	FROM cte
	LEFT JOIN pu_for_day AS pu ON cte.dt = pu.dt
	LEFT JOIN dau_for_day AS dau ON cte.dt = dau.dt;
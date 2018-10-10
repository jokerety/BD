USE `DB`;

SELECT AVG(sessions_count) AS avg_sessions
FROM (SELECT users.user_id, IF(sessions.user_id IS NULL, 0, COUNT(*)) as sessions_count FROM users LEFT JOIN sessions ON (users.user_id = sessions.user_id) 
GROUP BY users.user_id) AS NB;
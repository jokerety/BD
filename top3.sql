USE `DB`;

SELECT login FROM users JOIN payments ON (users.user_id = payments.user_id)
GROUP BY login 
ORDER BY SUM(payment_sum)
LIMIT 3;






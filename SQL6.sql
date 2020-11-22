-- SELECT * FROM t9;
DROP TABLE IF EXISTS t10;
CREATE TABLE t10
SELECT user_id, n, d, s,
  CASE WHEN n < 2 THEN "1"
       WHEN n >=2 AND n <4 THEN "2"
       ELSE "3" 
  END AS F,

  CASE WHEN s < 5000 THEN '1'
     WHEN s >= 5000 AND s < 20000 THEN '2'
     ELSE '3'
END AS M,

CASE WHEN d < 30 THEN '3'
     WHEN d >= 30 AND d < 60 THEN '2'
     ELSE '1'
END AS R
FROM t9;


SELECT * FROM t10;
DROP TABLE IF EXISTS t11;
CREATE TABLE t11
SELECT user_id, CONCAT(F, M, R) b FROM t10;

DROP TABLE IF EXISTS t12;
CREATE TABLE t12
SELECT user_id, b,
  CASE WHEN b = 111 OR b = 211 THEN "Vip"
       WHEN b = 333 OR b = 332 OR b = 322 THEN "Lost"
       ELSE "Regular" 
  END AS STATUS
  FROM t11;

SELECT * FROM t11;
SELECT COUNT(user_id), STATUS FROM t12 GROUP BY STATUS;
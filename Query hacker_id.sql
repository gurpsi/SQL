/*
 Write a query to print the hacker_id, name, and the total number of challenges created by each
 student. Sort your results by the total number of challenges in descending order. If more than
 one student created the same number of challenges, then sort the result by hacker_id. If more 
 than one student created the same number of challenges and the count is less than the 
 maximum number of challenges created, then exclude those students from the result.
*/


SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as C_count
FROM hackers H
JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING C_count = 
    (
    SELECT MAX(y.num)
    FROM (
            SELECT COUNT(hacker_id) AS num
            FROM Challenges
            GROUP BY hacker_id
         ) y
    )
    OR C_count in
    (
    SELECT v.cnt
    FROM
        (
        SELECT COUNT(*) as cnt
        FROM Challenges
        GROUP BY hacker_id
        ) v
    GROUP BY v.cnt
    HAVING COUNT(v.cnt) = 1
    )
ORDER BY COUNT(C.challenge_id) DESC, H.hacker_id ASC;

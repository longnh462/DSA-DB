DELETE FROM Person
WHERE id IN (
SELECT id FROM Person A
WHERE EXISTS (
SELECT 1 FROM Person P
WHERE   P.email = A.email
AND P.id    < A.id
)
)
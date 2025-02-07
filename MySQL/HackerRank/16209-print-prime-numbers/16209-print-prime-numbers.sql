WITH RECURSIVE numbers(n) AS (
    SELECT 2
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 1000
),
primes AS (
    SELECT n FROM numbers
    WHERE NOT EXISTS (
        SELECT 1 FROM numbers AS divs
        WHERE divs.n > 1 AND divs.n * divs.n <= numbers.n AND numbers.n % divs.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&') AS PrimeNumbers FROM primes;

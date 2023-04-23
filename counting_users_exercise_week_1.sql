-- Counting users Week I

/*
----- Exercise 1
Understanding the data by printing the table
*/

SELECT *
FROM dsv1069.users;

/*
----- Exercise 2
Number of users added each day
*/

SELECT
    COUNT(DISTINCT id),
    DATE(created_at) AS day
FROM dsv1069.users
GROUP BY day
ORDER BY day;

-- if you want just the raw number of users per day (i.e., allow for double counting)
SELECT
    COUNT(id),
    DATE(created_at) AS day
FROM dsv1069.users
GROUP BY day
ORDER BY day;

/*
----- Exercise 3
Count the merged or deleted users
*/

SELECT
    COUNT(id),
    DATE(created_at) AS day
FROM dsv1069.users
WHERE deleted_at IS NULL OR merged_at IS NULL
GROUP BY day
ORDER BY day;

/*
----- Exercise 4
*/


/*
----- Exercise 5 / Exercise 6
Build table with users created, users deleted, and users merged per day (exercise 5)
and replace NULL with zero (exercise 6)
*/

SELECT
    tbl_created.day,
    tbl_created.users_created,
    -- add counted deleted users and replace no count with zero
    (CASE 
        WHEN tbl_deleted.users_deleted IS NULL THEN 0
        ELSE tbl_deleted.users_deleted
        END
    ),
    -- add counted merged users and replace no count with zero
    (CASE
        WHEN tbl_merged.users_merged IS NULL THEN 0
        ELSE tbl_merged.users_merged
        END
    )
-- generate table for created users
FROM (
        SELECT
            COUNT(id) AS users_created,
            DATE(created_at) AS day
        FROM dsv1069.users
        GROUP BY day
    ) AS tbl_created
-- add table for deleted users
LEFT JOIN
    (
        SELECT
            COUNT(id) AS users_deleted,
            DATE(deleted_at) AS day
        FROM dsv1069.users
        GROUP BY day
    ) AS tbl_deleted
    ON tbl_created.day = tbl_deleted.day
-- add table for merged users
LEFT JOIN
    (
        SELECT
            COUNT(id) AS users_merged,
            DATE(merged_at) AS day
        FROM dsv1069.users
        GROUP BY day
    ) AS tbl_merged
    ON tbl_created.day = tbl_merged.day;
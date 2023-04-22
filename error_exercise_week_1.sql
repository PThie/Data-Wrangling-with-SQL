-- Error Code Exercise Week I

/*
----- Exercise 1
Goal: Here we use users table to pull a list of user email addresses. Edit
the query to pull email addresses, but only for non-deleted users.
*/

SELECT *
FROM dsv1069.users
WHERE deleted_at IS NULL;

/*
----- Exercise 2
Goal: Use the items table to count the number of items for sale in each category
*/

SELECT
    category,
    COUNT(*)
FROM dsv1069.items
GROUP BY category;

/*
----- Exercise 3
Goal: Select all of the columns from the result when you JOIN the users table to the orders
table
*/


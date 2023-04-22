-- Error Code Exercise Week I

/*
----- Exercise 1
Goal: Here we use users table to pull a list of user email addresses. Edit
the query to pull email addresses, but only for non-deleted users.
*/

SELECT email_address
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

SELECT *
FROM dsv1069.users AS users
    INNER JOIN dsv1069.orders AS orders
    ON users.parent_user_id = orders.user_id;

/*
----- Exercise 4
Goal: Check out the query below. This is not the right way to count the number of viewed_item
events. Determine what is wrong and correct the error.
*/

SELECT
    COUNT(DISTINCT event_id) AS events
FROM dsv1069.events
WHERE event_name = 'view_item';

/*
----- Exercise 5
Compute the number of items in the items table which have been ordered. The query
below runs, but it isn’t right. Determine what is wrong and correct the error or start from scratch
*/

SELECT
    COUNT(DISTINCT id) as item_count
FROM dsv1069.orders
    INNER JOIN dsv1069.items
    ON orders.item_id = items.id;

/*
----- Exercise 6
Goal: For each user figure out IF a user has ordered something, and when their first purchase
was. The query below doesn’t return info for any of the users who haven’t ordered anything.
*/

SELECT
    users.id AS user_id,
    MIN(orders.paid_at) AS first_purchase
FROM
    dsv1069.users AS users
LEFT JOIN
    dsv1069.orders AS orders
    ON users.id = orders.user_id
WHERE orders.paid_at IS NOT NULL
GROUP BY users.id;

/*
----- Exercise 7
Goal: Figure out what percent of users have ever viewed the user profile page, but this query
isn’t right. Check to make sure the number of users adds up, and if not, fix the query.
*/
-- 1. List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT DISTINCT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00
AND b.waiter_no IN (
    SELECT r.headwaiter
    FROM restRoom_management r
    WHERE r.headwaiter = (
        SELECT staff_no FROM restStaff WHERE first_name = 'Charles' AND surname = 'Watson'
    )
);

-- 2. A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT s.first_name, s.surname
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE r.room_date = 160111
AND  (
    SELECT 1 FROM restBill b WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
);

-- 3. What are the names of customers with the smallest bill?
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total) FROM restBill
);

-- 5. Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, r.room_name
FROM restBill b
JOIN restRoom_management r ON b.table_no = r.room_name
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
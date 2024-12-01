-- 1. List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2. On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.
SELECT r.room_date
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND r.room_name = 'Green' 
AND r.room_date BETWEEN 160201 AND 160229;

-- 3. List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restStaff z ON z.headwaiter = s.headwaiter
WHERE z.first_name = 'Zoe' AND z.surname = 'Ball';

-- 4. List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.
SELECT b.cust_name, b.bill_total, w.first_name || ' ' || w.surname AS waiter_name
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
ORDER BY b.bill_total DESC;

-- 5. List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT w.first_name, w.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
WHERE b.bill_no IN (00014, 00017)
AND b.table_no IN (SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017));

-- 6. List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT s.first_name, s.surname
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE r.room_name = 'Blue' AND r.room_date = 160312
UNION
SELECT w.first_name, w.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
WHERE b.table_no IN (SELECT table_no FROM restRest_table WHERE room_name = 'Blue')
AND b.bill_date = 160312;
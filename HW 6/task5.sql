-- 1. Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates, and the number of bills they have taken.
SELECT s.first_name AS waiter_first_name, s.surname AS waiter_surname, b.bill_date AS date_of_bill, COUNT(b.bill_no) AS number_of_bills_taken
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2. List the rooms with tables that can serve more than 6 people and how many of such tables they have.
SELECT r.room_name AS restaurant_room, COUNT(t.table_no) AS number_of_large_tables
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.number_of_seats > 6
GROUP BY r.room_name

-- 3. List the names of the rooms and the total amount of bills in each room.
SELECT r.room_name AS room_in_restaurant, SUM(b.bill_total) AS total_bill_amount_in_room
FROM restBill b
JOIN restRoom_management r ON b.room_name = r.room_name
GROUP BY r.room_name;

-- 4. List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
SELECT s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount_taken_by_waiters
FROM restStaff s
JOIN restBill b ON b.waiter_no IN (SELECT waiter_no FROM restStaff WHERE headwaiter = s.staff_no)
GROUP BY s.first_name, s.surname
ORDER BY total_bill_amount_taken_by_waiters DESC

-- 5. List any customers who have spent more than £400 on average.
SELECT b.cust_name AS Customer_Name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;


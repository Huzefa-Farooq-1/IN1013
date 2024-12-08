-- Question 1)
CREATE VIEW samsBills AS
SELECT 
    rs.first_name,
    rs.surname,
    b.bill_date,
    b.cust_name,
    b.bill_total
FROM 
    restStaff rs
JOIN 
    restBill b
ON 
    rs.staff_no = b.waiter_number
WHERE 
    rs.first_name = 'Sam' AND s.surname = 'Pitt';

-- Question 2)

SELECT 
    first_name,
    surname,
    bill_date,
    cust_name,
    bill_total
FROM 
    samsBills
WHERE 
    bill_total > 400;

-- Question 3)

CREATE VIEW roomTotals AS
SELECT 
    rt.room_name,
    SUM(b.bill_total) AS Total_Sum
FROM 
    restRest_table rt
JOIN 
    restBill b
ON 
    rt.Table_no = b.Table_no
GROUP BY 
    rt.Room_Name;

-- Question 4)

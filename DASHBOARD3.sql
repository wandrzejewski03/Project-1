/*
IN THIS QUERY WE WANT TO KNOW WHO WORKED WHEN, FOR HOW MANY HOURS, AND WHAT IS STAFF COST US
*/

SELECT 
rot.date_ AS "date",
staff.first_name,
staff.last_name,
staff.hourly_rate,
shift.start_time,
shift.end_time,
HOUR(TIMEDIFF(shift.end_time, shift.start_time)) + MINUTE(TIMEDIFF(shift.end_time, shift.start_time)) * 0.01 AS hours_in_shift,
(HOUR(TIMEDIFF(shift.end_time, shift.start_time)) + MINUTE(TIMEDIFF(shift.end_time, shift.start_time)) * 0.01) * staff.hourly_rate AS staff_cost

FROM rota rot LEFT JOIN staff ON staff.staff_id = rot.staff_id
LEFT JOIN shift ON shift.shift_id = rot.shift_id



use hotel;
select * from hotel_reservation;

-- 1. What is the total number of reservations in the dataset?
select count(Booking_ID) as total_booking from hotel_reservation;

--  2 Which meal plan is the most popular among guests?
select type_of_meal_plan,count(Booking_ID) as total_booking from hotel_reservation 
group by type_of_meal_plan;

-- 3 What is the average price per room for reservations involving children?
select ROUND(AVG(avg_price_per_room),2) as avg_price from hotel_reservation 
where no_of_children>0;


-- 4  How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS year, COUNT(Booking_ID) AS total_booking 
FROM hotel_reservation 
GROUP BY YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y'));

-- 5 What is the most commonly booked room type?
select room_type_reserved,count(Booking_ID) as total_booking from hotel_reservation 
group by room_type_reserved
order by total_booking desc limit 1 ;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(no_of_weekend_nights) as total_booking from hotel_reservation 
where no_of_weekend_nights>0;

-- 7 What is the highest and lowest lead time for reservations?
select max(lead_time) as highest,min(lead_time) as lowest from hotel_reservation;

-- 8. What is the most common market segment type for reservations?
select market_segment_type,count(Booking_ID) as total_booking from hotel_reservation 
group by market_segment_type
order by total_booking desc limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?
select count(Booking_ID) as total_booking from hotel_reservation 
where booking_status="Not_Canceled";

-- 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults,sum(no_of_children) as total_children from hotel_reservation;

-- 11. What is the average number of weekend nights for reservations involving children?

select ROUND(AVG(no_of_weekend_nights),2) as avg_night from hotel_reservation 
where no_of_children>0 ;


-- 12. How many reservations were made in each month of the year?
select * from hotel_reservation;

SELECT month(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month,COUNT(*) AS total_booking 
FROM hotel_reservation 
GROUP BY month(STR_TO_DATE(arrival_date, '%d-%m-%Y'))
order by month;

-- 13 What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,ROUND(AVG(no_of_weekend_nights+no_of_week_nights),2) as avg_weekday_night from hotel_reservation 
group by room_type_reserved;

-- 14 For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved,count(*)as total_booking,ROUND(AVG(avg_price_per_room),2) as avg_price from hotel_reservation 
where no_of_children>0
group by room_type_reserved
order by total_booking desc ;

-- 15 Find the market segment type that generates the highest average price per room.
select market_segment_type,ROUND(AVG(avg_price_per_room),2) as avg_price from hotel_reservation 
group by market_segment_type
order by avg_price desc limit 1;


-- end of the project




create database ola;
use ola;
select*from bookings;

#1. Retrieve all successful bookings:
create view successful_booking as
select*from bookings where booking_status="success";

#2. Find the average ride distance for each vehicle type:
create view avg_ride_distance_for_each_vehicle as 
select Vehicle_Type,avg(Ride_Distance) as Avg_Ride_Distance from bookings group by Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
create view number_of_cancelled_rides_by_customers as
select count(*) as no_of_cancelled_rides from bookings where booking_status="Canceled by Customer";

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers_with_highest_number_of_rides as
select Customer_ID,count(booking_id) as total_rides from bookings group by Customer_ID order by count(booking_id) desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_due_to_personal_and_car_related_issues as 
select count(*) as total_rides_cancelled from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view maximum_and_minimum_driver_ratings_for_Prime_Sedan as 
select max(Driver_Ratings) as max_ratings,min(Driver_Ratings) as min_ratings 
from bookings where Vehicle_Type='Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
create view payment_made_using_UPI as 
select*from bookings where Payment_Method='UPI';

#8. Find the average customer rating per vehicle type:
create view average_customer_rating_per_vehicle_type as
select vehicle_type,round(avg(Customer_Rating),2) as avg_customer_rating 
from bookings group by vehicle_type order by round(avg(Customer_Rating),2) desc;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_of_rides_completed_successfully as
select sum(Booking_Value) as Booking_Value 
from bookings where Booking_Status='Success' group by Booking_Status;

#10. List all incomplete rides along with the reason
create view incomplete_rides_with_reason as 
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides='yes';

#1. Retrieve all successful bookings:
select*from successful_booking;

#2. Find the average ride distance for each vehicle type:
select*from avg_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
select*from number_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
select*from top_5_customers_with_highest_number_of_rides;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select*from rides_cancelled_due_to_personal_and_car_related_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select*from maximum_and_minimum_driver_ratings_for_Prime_Sedan;

#7. Retrieve all rides where payment was made using UPI:
select*from payment_made_using_UPI;

#8. Find the average customer rating per vehicle type:
select*from average_customer_rating_per_vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
select*from total_booking_value_of_rides_completed_successfully;

#10. List all incomplete rides along with the reason
select*from incomplete_rides_with_reason;

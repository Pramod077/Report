create database Ola
Use Ola;

select * from [dbo].[Ola sales];
1. Retrieve all successful bookings
create view Successful_Bookings as
select * from [Ola sales]
where Booking_Status='Success';

select * from Successful_Bookings;

2.Find the average ride distance for each vehicle type:
Create view Ride_distance_for_each_vehicle as 
select Vehicle_Type, Avg(Ride_Distance) as Avg_distance
from [Ola sales]
Group by Vehicle_Type;

select * from Ride_distance_for_each_vehicle;

3.Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) as Total_cancelled_rides
from [Ola sales] 
where Booking_Status='Canceled by Customer';

select * from cancelled_rides_by_customers;

4.List the top 5 customers who booked the highest number of rides:
Create view top_5_customers as
select top 5 Customer_ID, count(Booking_ID) as Total_rides
from [Ola sales]
group by Customer_ID 
Order by Total_rides Desc ;

select * from top_5_customers;

5.Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_drivers as
select count(*) as cancel_rides_by_drivers
from [Ola sales]
where Canceled_Rides_by_Driver='Personal & Car related issue';

select * from Rides_cancelled_by_drivers;

6.Find the maximum and minimum driver ratings for Prime Sedan bookings
create view max_and_min_driver_ratings as
select max(Driver_Ratings) as Max_rating, min(Driver_Ratings) as Min_rating
from [Ola sales]
where Vehicle_Type='Prime Sedan';

select * from max_and_min_driver_ratings;

7.Retrieve all rides where payment was made using UPI
create view UPI_Payment_Rating as 
select * from [Ola sales]
where Payment_Method='UPI';

select * from UPI_Payment_Rating;

8.Find the average customer rating per vehicle type:
create view Customer_rating_per_vehicle_type as
select Vehicle_Type, avg(Customer_Rating) as Avg_customer_rating
from [Ola sales]
group by Vehicle_Type;

select * from Customer_rating_per_vehicle_type;

9.Calculate the total booking value of rides completed successfully:
create view Total_successful_booking_value as
select sum(Booking_Value) as Successful_ride_value
from [Ola sales]
where Booking_Status='Success';

select * from Total_successful_booking_value;

10.	List all incomplete rides along with the reason
Create view Incomplete_Rides_reason as
select Booking_ID,Incomplete_Rides_Reason
from [Ola sales]
where Incomplete_Rides='Yes';

select * from Incomplete_Rides_reason;
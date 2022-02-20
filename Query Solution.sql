use TravelOnTheGo;

#3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT 
    Gender, COUNT(Passenger_name) AS count_passenger
FROM
    passenger
WHERE
    distance > 599
GROUP BY gender;

#Find the minimum ticket price for Sleeper Bus.

SELECT 
    bus_type, Distance, MIN(Price)
FROM
    Price
WHERE
    bus_type = 'Sleeper';
    
#Select passenger names whose names start with character 'S'

SELECT 
    Passenger_name
FROM
    Passenger
WHERE
    Passenger_name LIKE 's%';
    
#6) Calculate price charged for each passenger displaying Passenger name, 
#Boarding City,Destination City, Bus_Type, Price in the output

SELECT 
    ps.Passenger_name,
    ps.boarding_city,
    ps.destination_city,
    ps.bus_type,
    pc.price
FROM
    Passenger ps
        INNER JOIN
    price pc ON ps.distance = pc.distance
        AND ps.bus_type = pc.bus_type;
        
#What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
#for a distance of 1000 KM s
 
 SELECT 
    ps.Passenger_name,
    ps.boarding_city,
    ps.destination_city,
    ps.bus_type,
    pc.price
FROM
    Passenger ps
        INNER JOIN
    price pc ON ps.distance = pc.distance
        AND ps.bus_type = pc.bus_type
where ps.bus_type ="Sitting" and ps.Distance>=1000;

#What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

 SELECT 
    ps.Passenger_name,
    ps.boarding_city,
    ps.destination_city,
    pc.bus_type,
    pc.price
FROM
    Passenger ps
        INNER JOIN
    price pc ON ps.distance = pc.distance
     where ps.Passenger_name="pallavi";

#List the distances from the "Passenger" table which are unique (non-repeated
#distances) in descending order.

SELECT 
    distance
FROM
    Passenger
GROUP BY distance
HAVING COUNT(distance) = 1
order by distance desc;

#10) Display the passenger name and percentage of distance travelled by that passenger
#from the total distance travelled by all passengers without using user variables

SELECT 
    passenger_name,
    (distance / (SELECT 
            SUM(distance)
        FROM
            Passenger)) * 100 AS Percentage_of_distance
FROM
    passenger; 

#11) Display the distance, price in three categories in table Price
#a) Expensive if the cost is more than 1000 (criteria given here is more than 1000 so kept the condition >1000)
#b) Average Cost if the cost is less than 1000 and greater than 500 (criteria given here is less than 1000 so kept the condition <1000)
#c) Cheap otherwise( Since 1000 does not fall in above two criteria 1000 will go as Cheap)

select distance, price , case
when price>1000 then "Expensive"
when price<1000 and price>500 then "Average Cost"
else "Cheap"
end as categories
from price;
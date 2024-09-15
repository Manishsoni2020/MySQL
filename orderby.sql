-- Q.1 find top 5 samsung phones with biggest screen size
-- select brand_name,screen_size from campusx.smartphones
-- where brand_name ='samsung' 
-- order by screen_size desc limit 5

-- Q.2 sort all the phone in decending order of number of total cameras
-- select model,num_front_cameras+num_rear_cameras as 'total_camera'
-- from campusx.smartphones
-- order by total_camera desc

-- Q.3 find the phone with 2nd largest battery
-- select model,battery_capacity 
-- from campusx.smartphones
-- order by battery_capacity desc limit 1,1

-- Q.4 find the name and ratting of the worst rated apple phone
-- select model,rating 
-- from campusx.smartphones
-- where brand_name ='apple'
-- order by rating asc limit 1

-- Q.5 Sort phones alphabetically and then on the basic of rating in desc order
-- select brand_name,model,rating from campusx.smartphones
-- order by brand_name asc, rating desc


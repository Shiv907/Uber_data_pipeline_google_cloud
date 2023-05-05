CREATE OR REPLACE TABLE my-project-uber-385411.uber_data_engg_sg.tbl_analytics AS (

SELECT 

f.trip_distance_id,
f.VendorID,
d.tpep_dropoff_datetime,
d.tpep_pickup_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
dropof.dropoff_latitude,
dropof.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

FROM

`my-project-uber-385411.uber_data_engg_sg.fact_table` f
JOIN `my-project-uber-385411.uber_data_engg_sg.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `my-project-uber-385411.uber_data_engg_sg.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `my-project-uber-385411.uber_data_engg_sg.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `my-project-uber-385411.uber_data_engg_sg.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `my-project-uber-385411.uber_data_engg_sg.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `my-project-uber-385411.uber_data_engg_sg.dropoff_location_dim` dropof ON dropof.dropoff_location_id=f.dropoff_location_id
JOIN `my-project-uber-385411.uber_data_engg_sg.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
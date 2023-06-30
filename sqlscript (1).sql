REM   Script: table weather
REM   tempreture

INSERT INTO Station  
VALUES(13,'PHOENIX','AZ',33,112);

CREATE TABLE Station (  
ID int primary key,  
CITY CHAR(20),  
STATE CHAR(2),  
LAT_N int, 
LONG_W int);

INSERT INTO Station   
VALUES (66,'CARIBOU','ME',47,68);

INSERT INTO Station  
VALUES (44,'DENBER','CO',40,105);

select * from Station;

select * from Station  
where LAT_N > 39.7;

CREATE TABLE STATS ( 
  ID int, 
  MONTH int check (MONTH between 1 and 12), 
  TEMP_F real check (TEMP_F between -80 and 150), 
  RAIN_I real check (RAIN_I between 0 and 100), 
  primary key (ID, MONTH), 
  FOREIGN KEY (ID) REFERENCES Station (ID) 
);

INSERT INTO STATS VALUES (13, 1, 57.4, 0.31);

INSERT INTO STATS VALUES (13, 7, 91.7, 5.15);

INSERT INTO STATS VALUES (44, 1, 27.3, 0.18);

INSERT INTO STATS VALUES (44, 7, 74.8, 2.11);

INSERT INTO STATS VALUES (66, 1, 6.7, 2.1);

INSERT INTO STATS VALUES (66, 7, 65.8, 4.52);

SELECT * FROM STATS;

select *from station, stats where station.ID = stats.ID;

select MONTH, ID, RAIN_I, TEMP_F from stats 
 order by MONTH, RAIN_I desc;

select TEMP_F, CITY, LAT_N from stats, station 
  where MONTH = 7 
  and stats.ID = station.ID 
  order by TEMP_F;

select ID, MONTH, 
 (TEMP_F-32)*5/9 AS TEMP_F, 
  RAIN_I * 0.3937 AS RAIN_I 
  from stats;

select ID, MONTH, 
 (TEMP_F-32)*5/9 AS TEMP_F, 
  RAIN_I * 0.3937 AS RAIN_I 
  from stats;

update stats 
  set RAIN_I = RAIN_I - 0.01;

update stats 
  set TEMP_F = 74.9 
 where MONTH = 7 and ID = 44;


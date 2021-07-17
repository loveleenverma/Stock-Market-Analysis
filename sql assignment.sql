#to create a schema names as assignment
create schema assignment;

use assignment;

#to check all the information in the tables created after importing csv file 
select * from bajaj_auto;
select * from eicher_motors;
select * from hero_motocorp;
select * from infosys;
select * from tcs;
select * from tvs_motors;


#to create a column format_date in each of the six tables with default datetime format in mysql

alter table bajaj_auto add format_date date;

update bajaj_auto set format_date = str_to_date(date, '%d-%M-%Y');

alter table eicher_motors add format_date date;

update eicher_motors set format_date = str_to_date(date, '%d-%M-%Y');

alter table hero_motocorp add format_date date;

update hero_motocorp set format_date = str_to_date(date, '%d-%M-%Y');

alter table infosys add format_date date;

update infosys set format_date = str_to_date(date, '%d-%M-%Y');

alter table tcs add format_date date;

update tcs set format_date = str_to_date(date, '%d-%M-%Y');

alter table tvs_motors add format_date date;

update tvs_motors set format_date = str_to_date(date, '%d-%M-%Y');


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)
create table bajaj1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from bajaj_auto);
  
select * from bajaj1;
 
# ignoring values as calculation is inappropriate where row_num<50
delete from bajaj1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table bajaj1 drop column row_num;

#to check all the information in the table sorted by date column in ascending order
select * from bajaj1 order by 'date';


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)

create table eicher1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from eicher_motors);
  
select * from eicher1;
 
 #ignoring values as calculation is inappropriate where row_num<50
delete from eicher1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table eicher1 drop column row_num;

#to check all the information in the table sorted by date column in ascending order  
select * from eicher1 order by 'date';


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)
create table hero1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from hero_motocorp);
  
select * from hero1;

#ignoring values as calculation is inappropriate where row_num<50  
delete from hero1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table hero1 drop column row_num;
 
 #to check all the information in the table sorted by date column in ascending order  
select * from hero1 order by 'date';


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)
create table infosys1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from infosys);
  
select * from infosys1;

#ignoring values as calculation is inappropriate where row_num<50   
delete from infosys1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table infosys1 drop column row_num;

#to check all the information in the table sorted by date column in ascending order 
select * from infosys1 order by 'date';


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)
create table tcs1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from tcs);
  
select * from tcs1;

#ignoring values as calculation is inappropriate where row_num<50   
delete from tcs1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table tcs1 drop column row_num;

#to check all the information in the table sorted by date column in ascending order
select * from tcs1 order by 'date';


#Create a new table named 'bajaj1' containing the date, close price, 20 Day MA
# and 50 Day MA. (This has to be done for all 6 stocks)
create table tvs1
  as (select format_date as 'date', `Close Price` as  'close_price' , 
  avg(`Close Price`) over (order by format_date asc rows 19 preceding) as '20_day_ma',
  avg(`Close Price`) over (order by format_date asc rows 49 preceding) as '50_day_ma',
  row_number()     over (order by `format_date` ) as 'row_num'
  from tvs_motors);
  
select * from tvs1;

#ignoring values as calculation is inappropriate where row_num<50  
delete from tvs1 where  row_num < 50;

#dropping row_num as we no longer need that
alter table tvs1 drop column row_num;

#to check all the information in the table sorted by date column in ascending order
select * from tvs1 order by 'date';

## 2. Create a master table containing the date and close price of all the six stocks. 
#(Column header for the price is the name of the stock)

create table master
select baj.format_date as Date , baj.`Close Price` as Bajaj , tcs.`Close Price` as TCS , 
tvs.`Close Price` as TVS , inf.`Close Price` as Infosys , eic.`Close Price` as Eicher , her.`Close Price` as Hero
from bajaj_auto baj
inner join tcs tcs on tcs.format_date = baj.format_date
inner join tvs_motors tvs on tvs.format_date = baj.format_date
inner join infosys inf on inf.format_date = baj.format_date
inner join eicher_motors eic on eic.format_date = baj.format_date
inner join hero_motocorp her on her.format_date = baj.format_date ;

select * from master order by `Date`;

## 3. Use the table created in Part(1) to generate buy and sell signal. Store 
#this in another table named 'bajaj2'. Perform this operation for all stocks.
######### creating temporary tables to get the previous day value for 20day MA and 50day MA ############

create table bajajtemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from bajaj1
window w as (order by Date);
select * from bajajtemp;

create table eichertemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from eicher1
window w as (order by Date);
select * from eichertemp;

create table herotemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from hero1
window w as (order by Date);
select * from herotemp;

create table infosystemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from infosys1
window w as (order by Date);
select * from infosystemp;

create table tcstemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from tcs1
window w as (order by Date);
select * from tcstemp;

create table tvstemp
select Date, `close_price`, `20_day_ma`, lag(`20_day_ma`,1) over w as 20_MA_prev, `50_day_ma`, lag(`50_day_ma`,1) over w as 50_MA_prev
from tvs1
window w as (order by Date);
select * from tvstemp;



############## Generating BUY/SELL/HOLD signal tables ##################

### For Bajaj ###
create table bajaj2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from bajajtemp;
select * from bajaj2 limit 100;

### For Eicher motors ###
create table eicher2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from eichertemp;
select * from eicher2 limit 100;

### For Hero motocorp ###
create table hero2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from herotemp;
select * from hero2 limit 100;

### For Infosys ###
create table infosys2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from infosystemp;
select * from infosys2 limit 100;

### For TCS ###
create table tcs2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from tcstemp;
select * from tcs2 limit 100;

### For TVS ###
create table tvs2
select Date,`close_price`,
(case when `20_day_ma` > `50_day_ma` and 20_MA_prev < 50_MA_prev then 'BUY'
	 when `20_day_ma` < `50_day_ma` and 20_MA_prev > 50_MA_prev then 'SELL'
else 'HOLD' end) as 'Signal'
from tvstemp;
select * from tvs2 limit 100;

###################################################################################################################
##################  4 UDF for taking date as input and return Signal of that day for Bajaj ########################
###################################################################################################################

delimiter $$

create function get_signal( input_date date)

returns varchar(10)

deterministic

begin

declare signal_value varchar(10);

select `Signal` into signal_value 
from bajaj2
where `Date` = input_date;

return signal_value;

end $$

delimiter ;

# date format - yyyy-mm-dd  
# Test function for all three signals
select get_signal('2015-09-29') as day_signal;  # result - hold
select get_signal('2015-08-24') as day_signal; # result - sell
select get_signal('2015-05-18') as day_signal; # result - buy


## Remove format_date from all tables to have tables as original record

alter table `bajaj_auto`
drop column format_date;
alter table `eicher_motors`
drop column format_date;
alter table `hero_motocorp`
drop column format_date;
alter table `infosys`
drop column format_date;
alter table `tcs`
drop column format_date;
alter table `tvs_motors`
drop column format_date;


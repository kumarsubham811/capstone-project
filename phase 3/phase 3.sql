
-- phase 3
-- requirement 3.1
create database phase3;
-- here i imported table crimes 42_District_wise_crimes_committed_against_women_2001_2012:-
use phase3;
select * from crimesagainstwomen;
select `state/ut`,district,year,rape,`kidnapping and abduction` from crimesagainstwomen ;

-- To find max rape and max kidnapping and abduction cases:-
select max(rape),max(`kidnapping and abduction`) from crimesagainstwomen;

-- To find max rape and max kidnapping and abduction cases in states:-
select max(rape),max(`kidnapping and abduction`) from crimesagainstwomen group by `state/ut`;


-- requirement 3.2:-
-- To see max rape cases its state/ut, district, year , rape , kidnapping and abduction:-
select `state/ut` , district , year , `rape` , `kidnapping and abduction` from crimesagainstwomen where `rape` =(select max(`rape`) from crimesagainstwomen); 

-- To see max kidnapping and abduction cases and its state/ut,district , year , rape , kidnapping and abduction:-
select `state/ut`,district,year ,rape ,`kidnapping and abduction` from crimesagainstwomen where `kidnapping and abduction`=(select max(`kidnapping and abduction`) from crimesagainstwomen) ;



-- requirement 3.3:-
-- To see min rape cases its state/ut, district, year , rape , kidnapping and abduction:-
select `state/ut` , district , year , `rape` , `kidnapping and abduction` from crimesagainstwomen where `rape` =(select min(`rape`) from crimesagainstwomen); 

-- To see min kidnapping and abduction cases its state/ut, district, year , rape , kidnapping and abduction:-
select `state/ut`,district,year ,rape ,`kidnapping and abduction` from crimesagainstwomen where `kidnapping and abduction`=(select min(`kidnapping and abduction`) from crimesagainstwomen) ;



-- requirement 3.4:-
-- here import table 02_District_wise_crimes_committed_against_ST_2001_2012 from excel csv file from table data import wizard:-
select * from crimesagainstst;


-- requirement 3.5:-
-- To find  highest no. of dacoity in crimesagainstst and see state , district , year , dacoity and robbery:-
select `state/ut`,district,year ,dacoity ,robbery from crimesagainstst where dacoity=(select max(dacoity) from crimesagainstst) ;


-- To find  highest no. of robbery in crimesagainstst and see state , district , year , dacoity and robbery:-
select `state/ut`,district,year ,dacoity ,robbery from crimesagainstst where robbery=(select max(robbery) from crimesagainstst) ;



-- requirement 3.6:-
-- To find lowest no. of murders in all districts and also see state , year , murder:-
select `state/ut`,district,year ,murder from crimesagainstst where murder=(select min(murder) from crimesagainstst) ;



-- requirement 3.7:-
-- To find murders in ascending order with district ,year and state present.
select `state/ut` ,district , year,murder from crimesagainstst order by murder asc;



-- requirement 3.8.1:-
-- here import 01_District_wise_crimes_committed_IPC_2001_2012 file from table data import wizard and select only the required columns:-
-- which are state/ut , district , year , murder , attempt to murder and rape (tick only these) and untick other columns and import table
select * from crimes_committed_ipc



 -- requirement 3.8.2:-
 -- to find highest no. of murders in districts in state yearwise showing state/ut , district , year ,murder
 select max(murder) , year ,district,`state/ut` from crimes_committed_ipc group by year,district,`state/ut`;
 
 
 
 -- requirement 3.8.3:-
 -- storing the result in dataframe(a new table) 
 create table crimes_committed_ipc2 as select max(murder) , year ,district,`state/ut` from crimes_committed_ipc group by year,district,`state/ut`;
 select * from crimes_committed_ipc2;
 
 
 -- to check how many districts are present in 3 or more yrs
 select district,count(year),`state/ut`  from crimes_committed_ipc2 group by district ,`state/ut` ;
 
 
 -- order by desc 
 select district,count(year),`state/ut`  from crimes_committed_ipc2 group by district ,year,`state/ut` order by year desc;
 
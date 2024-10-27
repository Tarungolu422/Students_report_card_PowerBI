use powerbi_project;

select * from student;

select * from parent;

select * from student where _id is null;

select * , concat(`Firts Name`," ", `Last Name`) as Full_name from student;

select * from student
where userscore <> "" and resultstatus ='Absent';

update student 
set resultstatus ='Present'
where userscore <> "" and resultstatus ='Absent';

select * from student
where userscore <> "" and resultstatus ='Absent';

create table final_data as 
select * , concat(`Firts Name`," ", `Last Name`) as Full_name from student;

select *,userscore - (physics+chemistry) as maths_new from final_data;
alter table final_data add column maths__new int;

select * from final_data;

update final_data
set maths__new =userscore - (physics+chemistry);

alter table final_data drop `Last Name` ;

with cte as (
	select physics + chemistry + maths__new as new_total, userscore from final_data)
select * from cte 
where new_total <> userscore;

alter table final_data add column new_total int;

update final_data 
set new_total = physics + chemistry + maths__new;

select * from final_data as a
join parent as  b
on a._id = b._id;

create table new_final_data as 
select a.*, b.phone,b.name,b.password
from final_data as a 
join parent as b on a._id = b._id;

select * from new_final_data

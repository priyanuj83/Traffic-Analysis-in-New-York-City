create table traffic_volume_count(
	RequestID int,
	Boro varchar(15),
	Date_of_record Date,
	Time_of_record varchar(10),
	Vol int,
	SegmentID int,
	WktGeom varchar(100) ,
	street varchar(75),
	fromSt varchar(75),
	toSt varchar(75),
	Direction varchar(5)
);

alter table traffic_volume_count
alter column street type varchar(255),
alter column fromSt type varchar(255),
alter column toSt type varchar(255);

select * from traffic_volume_count;
	
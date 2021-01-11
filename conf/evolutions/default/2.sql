# --- Sample dataset

# --- !Ups

insert into company (id,name) values (  1,'Apple');
insert into company (id,name) values ( 2,'Sony');
insert into company (id,name) values ( 3,'Hewlett-Packard');
insert into company (id,name) values ( 4,'Lenovo');
insert into company (id,name) values ( 5,'ASUS');
insert into company (id,name) values ( 6,'HTC');
insert into company (id,name) values ( 7,'Samsung');
insert into company (id,name) values ( 8,'Acer');

insert into computer (id,name,introduced,discontinued,company_id) values (  1,'MacBook Pro 15.4 inch','2001-01-01',null,1);
insert into computer (id,name,introduced,discontinued,company_id) values (  2,'Sony VAIO Fit A SVF15N2M2R',null,'2020-01-02',2);
insert into computer (id,name,introduced,discontinued,company_id) values (  3,'HP Pavilion','2001-01-03',null,3);
insert into computer (id,name,introduced,discontinued,company_id) values (  4,'Lenovo idea pab',null,'1991-01-04',4);
insert into computer (id,name,introduced,discontinued,company_id) values (  5,'Asus zen book','2006-01-05',null,5);
insert into computer (id,name,introduced,discontinued,company_id) values (  6,'HTC Pro',null,'2010-01-06',6);
insert into computer (id,name,introduced,discontinued,company_id) values (  7,'Samsung vx','2030-01-07',null,7);
insert into computer (id,name,introduced,discontinued,company_id) values (  8,'Acer vx15',null,'2011-01-08',8);
insert into computer (id,name,introduced,discontinued,company_id) values (  9,'Apple IIGS','1998-01-09',null,1);
insert into computer (id,name,introduced,discontinued,company_id) values ( 10,'Sony VAIO SVS1511X9R',null,'1989-01-10',2);
insert into computer (id,name,introduced,discontinued,company_id) values ( 11,'HP Pro book','2015-01-11',null,3);
insert into computer (id,name,introduced,discontinued,company_id) values ( 12,'Lenovo thik pad',null,'1991-01-12',4);
insert into computer (id,name,introduced,discontinued,company_id) values ( 13,'Asus ROG strix','2021-01-13',null,5);
insert into computer (id,name,introduced,discontinued,company_id) values ( 14,'HTC desire',null,'2009-01-14',6);
insert into computer (id,name,introduced,discontinued,company_id) values ( 15,'Samsung Machine','2014-01-15',null,7);
insert into computer (id,name,introduced,discontinued,company_id) values ( 16,'Acer nitro',null ,'1994-01-16',8);
insert into computer (id,name,introduced,discontinued,company_id) values ( 17,'MacBook Air','1996-01-17',null ,1);
insert into computer (id,name,introduced,discontinued,company_id) values ( 18,'Sony VAIO VGN-TT299PBB','2013-01-18',null,2);
insert into computer (id,name,introduced,discontinued,company_id) values ( 19,'HP Elit book',null ,'2011-01-19',3);
insert into computer (id,name,introduced,discontinued,company_id) values ( 20,'Lenovo legion','2022-01-20',null,4);
insert into computer (id,name,introduced,discontinued,company_id) values ( 21,'asus rog max',null ,'2032-01-21',5);
insert into computer (id,name,introduced,discontinued,company_id) values ( 22,'HTC II','1987-01-22',null,6);
insert into computer (id,name,introduced,discontinued,company_id) values ( 23,'Samsung Plus',null ,'2003-01-23',7);
insert into computer (id,name,introduced,discontinued,company_id) values ( 24,'Acer turbo gaming','1994-01-24',null,8);
insert into computer (id,name,introduced,discontinued,company_id) values ( 25,'iMac','1991-01-25',null,1);
insert into computer (id,name,introduced,discontinued,company_id) values ( 26,'Sony VAIO Duo 13 SVD1321K4R',null ,'2016-01-26',2);
insert into computer (id,name,introduced,discontinued,company_id) values ( 27,'HP Gaming pro','1991-01-27',null,3);
insert into computer (id,name,introduced,discontinued,company_id) values ( 28,'Lenovo ultra book',null ,'1991-01-28',4);
insert into computer (id,name,introduced,discontinued,company_id) values ( 29,'Asus zenmax','1991-01-01','2006-01-01',5);
insert into computer (id,name,introduced,discontinued,company_id) values ( 30,'HTC gaming laptop','1995-01-05',null,6);
insert into computer (id,name,introduced,discontinued,company_id) values ( 31,'Samsung mobile',null,null,7);
insert into computer (id,name,introduced,discontinued,company_id) values ( 32,'Acer prosto aser',null,'1994-01-05',8);


# --- !Downs

delete from computer;
delete from company;
show databases;
use hospital
show tables;
/* creating admin table */
create table admin_tbl (
admin_id int(1) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);

use hospital;
select * from appointment_tbl

/* inserting data to admin table */
insert into admin_tbl (name,phone,address,password) values("ahmad",8347576778,"rajkot","ahmad")
/* insert into admin_tbl (name,phone,address,password) values(?,?,?,?) */
select * from admin_tbl;

/* login query */
SELECT Name, Password FROM admin_tbl WHERE Name = "ahmad" AND Password ="ahmad"

/* updating query */
UPDATE admin_tbl 
SET 
    password = 'khan'
WHERE
    admin_id = 1;
    
    
        /* Creating dept table */
      create table dept(
      dept_id int(3) primary key AUTO_INCREMENT,
      dept_name varchar(30) not null
      );
    drop table dept
    
    /* Creating doctor table */
    CREATE table doctor_tbl(
doc_id int(5) primary key AUTO_INCREMENT,
name varchar(20) not null,
age int(3) not null,
gender varchar(10),
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null,
dept_id int(3) not null,
CONSTRAINT fk_dept FOREIGN KEY (dept_id)  
  REFERENCES dept(dept_id)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
);

    /* inserting data to doctor table */
    insert into doctor_tbl (name,age,gender,phone,address,password,dept_id) value("Mansoor",21,"male",999922,"kabul","mansoor",2)
    insert into doctor_tbl (name,age,gender,phone,address,password,dept_id) value(?,?,?,?,?,?)
    select * from doctor_tbl
    

/* inserting data to dept*/
    insert into dept (dept_name) value("pediatrics")
	insert into dept (dept_name) value("surgery")
	insert into dept (dept_name) value("neurolgy")
    select * from dept;
    
    /* showing data from both tables */
select doctor_tbl.name,dept.dept_name from doctor_tbl inner join dept on dept.dept_id=doctor_tbl.dept_id

/* creating disease table */
  create table disease(
      dis_id int(3) primary key AUTO_INCREMENT,
      dis_name varchar(30) not null
      );
      
      
/* inserting data to disease table */
       insert into disease (dis_name) value("fever")
        insert into disease (dis_name) value("sore throt")



/* creating patient table */
  CREATE table patient_tbl(
pat_id int(5) primary key AUTO_INCREMENT,
name varchar(20) not null,
age int(3) not null,
weight int(3) not null,
gender varchar(10),
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null,
disease_id int(3) not null,
CONSTRAINT fk_dis FOREIGN KEY (disease_id)  
  REFERENCES disease(dis_id)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
)

/* inserting data to patient table */
  insert into patient_tbl (name,age,weight,gender,phone,address,password,disease_id) values("barish",21,40,"male",999922,"kabul","mansoor",1)
select * from patient_tbl


/* creating Inpatient table */
  CREATE table inpatient_tbl(
inpat_id int(5) primary key AUTO_INCREMENT,
room_no int(5) not null,
date_of_adm date,
lab_no int(3),
FOREIGN KEY (room_no) REFERENCES room_tbl(room_no), 
FOREIGN KEY (lab_no) REFERENCES lab_tbl(lab_id) 
  )
  
  /* creating outpatient table */
    CREATE table outpatient_tbl(
outpat_id int(5) primary key AUTO_INCREMENT,
date_of_adm date,
lab_no int(3),
FOREIGN KEY (lab_no) REFERENCES lab_tbl(lab_id) 
)
  
  
  /* creating medicine table */
   CREATE table medicine_tbl(
   medicine_id int(10) primary key AUTO_INCREMENT,
   name  varchar(30),
   cost int(5),
   quantity int(5)
   )
   
    /* creating given medicine table */
       CREATE table gmedicine_tbl(
   gmed_id int(10) primary key AUTO_INCREMENT,
   pat_id int(5),
   FOREIGN KEY (pat_id) REFERENCES patient_tbl(pat_id)
   )
   
/* creating appointment table */
       CREATE table appointment_tbl(
   app_id int(10) primary key AUTO_INCREMENT,
   doc_id int(5) not null,
   pat_id int(5) not null,
   FOREIGN KEY (doc_id) REFERENCES doctor_tbl(doc_id),
   FOREIGN KEY (pat_id) REFERENCES patient_tbl(pat_id)
   )
   
   /* inserting in appointment table */
   select * from appointment_tbl
   insert into appointment_tbl (doc_id,pat_id) values(?,?)
   insert into appointment_tbl  (doc_id,pat_id) values(1,1)
   update appointment_tbl set doc_id=? && pat_id=? where app_id=?
   
   
   
   /* creating bill table */
          CREATE table bill_tbl(
   bill_id int(10) primary key AUTO_INCREMENT,
   pat_id int(5) not null,
   doc_charge bigint(10),
   room_charge bigint(10),
   med_charge bigint(10),
   lab_charge bigint(10),
   nurse_charge bigint(10),
    FOREIGN KEY (pat_id) REFERENCES patient_tbl(pat_id)
    )
    
    
  /* creating bill table */
            CREATE table payment_tbl(
   pay_id int(10) primary key AUTO_INCREMENT,
   bill_id int(10) not null,
   status varchar(20),
     FOREIGN KEY (bill_id) REFERENCES bill_tbl(bill_id)
     )
	

/* creating room table */
  CREATE table room_tbl(
  room_no int(4)  primary key,
  type varchar(30),
  status varchar(30),
  nurse_id int(4),
  FOREIGN KEY (nurse_id) REFERENCES nurse_tbl(nur_id)
  )
 


        
/* creating labratory table */
	create table lab_tbl(
  lab_id int(3) primary key AUTO_INCREMENT,
  pat_id int(5) not null,
  doc_id int(5) not null,
  ch_date date ,
  amount bigint(20),
FOREIGN KEY (pat_id) REFERENCES patient_tbl(pat_id),
  FOREIGN KEY (doc_id) REFERENCES doctor_tbl(doc_id)
  )
  
  /* inserting data to lab table */
  insert into lab_tbl(pat_id,doc_id,ch_date,amount) values (1,1,"2021-3-22",2000)
    
      select * from lab_tbl  
        
/* creating Reception table */
create table reception_tbl (
rec_id int(3) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);

/* inserting data to reception table */
insert into reception_tbl (name,phone,address,password) values("ahmad",8347576778,"rajkot","ahmad")



/* creating nurse table */
create table nurse_tbl (
nur_id int(4) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);
  /* inserting data to nurse table */
  insert into nurse_tbl (name,phone,address,password) values("ahmad",8347576778,"rajkot","ahmad")
  
  
  
  
/* creating Accountant table */
create table accountant_tbl (
acc_id int(2) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);
  /* inserting data to accountant table */
  
  insert into accountant_tbl (name,phone,address,password) values("ahmad",8347576778,"rajkot","ahmad")
  
/* creating Labratorist table */
create table labratorist_tbl (
labrat_id int(3) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);

  /* inserting data to labratorist table */
  insert into labratorist_tbl (name,phone,address,password) values("ahmad",8347576778,"rajkot","ahmad")
       
       /* creating pharmacist table */
       create table pharmacist_tbl (
phar_id int(3) primary key auto_increment,
name varchar(20) not null,
phone bigint(15) not null,
address varchar(20) not null,
password varchar(20) not null
);
        
        
        
        
        
        
        
        
        
    
    
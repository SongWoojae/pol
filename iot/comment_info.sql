use iot_test;

select * from comment_info;
select * from user_info;
Select * from board;


create table comment_info(
num int(5) auto_increment primary key,
content text ,
board_num int(7) not null,
user_num int(3) not null,
reg_datetime Datetime not null,
foreign key (board_num) references board(num),
foreign key (user_num) references user_info(num));

insert into comment_info(content,board_num,user_num,reg_datetime)
values ('댓글3',18,2,now());

select num, content, board_num, user_num, reg_datetime from comment_info


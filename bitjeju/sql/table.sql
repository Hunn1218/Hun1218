drop sequence member_seq;
drop sequence lectures_seq;
drop sequence recruit_seq;
drop sequence notice_seq;
drop table grade;
drop table board2;
drop table lectures;
drop table attendance;
drop table notice;
drop table recruit;
drop table member;
drop table bitjejudept;

create table bitjejudept(
		dept varchar2(20) primary key,
		lvl number unique not null
);
-- �μ��� ���ѷ����� ���� ���̺�, 6���� �μ��� ������

insert into bitjejudept values ('�Ϲ�ȸ��',0);
insert into bitjejudept values ('�����',1);
insert into bitjejudept values ('������',2);
insert into bitjejudept values ('����',3);
insert into bitjejudept values ('����',4);
insert into bitjejudept values ('����',5);
insert into bitjejudept values ('������',6);

select * from bitjejudept;

create sequence member_seq;
create table member(					
	num number primary key, 			
	id_email varchar2(50) unique not null,
	name varchar2(15),					
	lvl number(1) default 0,			
	password varchar2(15) not null, 	
	phone varchar2(15),					
	lecture varchar2(50),					
	foreign key(lvl) references bitjejudept(lvl)
);

commit

select * from MEMBER;
select * from member where dept='������';

insert into member values (member_seq.nextval,'tmsisj@email.com','����',6,'tmsisj','01012341234','');
insert into member values (member_seq.nextval,'sales@email.com','�̿���',4,'password','01012341234', null);
insert into member values (member_seq.nextval,'staff@email.com','������',5,'password','01012341234', null);
insert into member values (member_seq.nextval,'teacher@email.com','�迵��',3,'password','01012341234', null);
insert into member values (member_seq.nextval,'test@email.com','�Ϲ�',1,'password','01012341234', null);

insert into member values (member_seq.nextval,'text2@email.com','ö��2',2,'password','01012341234','JAVA');

insert into member values (member_seq.nextval,'teacher4@email.com','���μ�',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher5@email.com','Ȳ����',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher6@email.com','������',3,'password','01012341235',null);

create table attendance( --�⼮���̺� 
		nalja date not null,
		num number,
		state varchar2(10),
		foreign key(num) references member(num) on delete cascade -- foreign key ����, member���̺� num����
);

insert into attendance value('2020-08-04',11,'attend');
insert into attendance value('2020-08-04',22,'attend');
insert into attendance value('2020-08-04',33,'absent');


commit;

select * from attendance;




create table grade(        -- �������̺�
		num number primary key,   -- ȸ�� ��ȣ�� ������ �ĺ���, ������̺� num ����
		exam1 number,			-- ���輺��
		exam2 number,
		exam3 number,			-- ��������� ������û �޾��ָ� ���� 1>>2�� �ø���, �������̺��� �̸��� �ѹ� insert
		foreign key(num) references member(num) on delete cascade
);

create sequence lectures_seq;
create table lectures(						-- �������̺� A1 B2 C3
		lecture_name varchar2(50),			-- ���¸�
		start_day date,						-- �����Ⱓ
		end_day date,						
		num number,							-- ȸ����ȣ/./��簭���� ȸ����ȣ�� ��
		lecture_room number,				-- ���ǽ� ��ȣ
		lecture_num number primary key,
		foreign key(num) references member(num) on delete cascade
);

select lecture_name,start_day,end_day,num,lecture_room,lecture_num,recruit_num from lectures full outer join recruit on recruit_num = lecture_num;

insert into lectures values ('������������A', sysdate,sysdate,22,401,lectures_seq.nextval);
insert into lectures values ('UI/UX ������ ����', sysdate,sysdate,22,401,lectures_seq.nextval);
insert into lectures values ('�ȵ���̵� ������ ����', sysdate,sysdate,22,401,lectures_seq.nextval);

create table recruit (--���������Խ���>>select * from lecture; >>> �������� ���ε� �ϴ� form >> �Է� >> ������Ʈ���̺��� insert
			recruit_file_name varchar2(200),
			recruit_num number primary key,
			foreign key(recruit_num) references lectures(lecture_num) on delete cascade
);

insert into recruit values ('naver.png', 1);
select * from recruit;
select * from recruit natural join lectures where recruit_num = lecture_num;
-- ������� >> �ݹ��� �޴� ������ >> ������û�� ��� >> select * from member where lvl <= 1 and lecture is not null;
-- �Ϲ�ȸ�� lvl = 0
-- ����� -- lvl = 1
-- ������û��ư�� ������ 0�� ȸ���� ������ �ִ�
-- �Ϲ�ȸ���� ������û ��ư �������� update member set lecture = '��û�� ���¸�' where num <=1(����� or �Ϲ�ȸ��)

-- ���� ��¥�� �⼮üũ ������Ʈ ������ // ���ó�¥�� �Ѿ.

--�ڷ�� �Խ��� ����
create sequence dataroom_seq;

create table dataroom(
	drNum number primary key,
	drTitle varchar2(200) default '�������',
	num number,
	drDate date,
	fileName varchar2(300),
	drContent varchar2(2048),
	foreign key (num) references member(num)
);


--�������� �Խ���
create sequence notice_seq;
create table notice(                          
   ntnum number primary key,
   title varchar2(100) not null,
   name varchar2(30),
   num number,
   wtime date,
   content varchar2(3000),
   foreign key (num) references member(num)
);

insert into notice values (notice_seq.nextval, 'bitcom','bitttt',1,sysdate,'null');
create database sos;
use sos;


-- user_info
CREATE TABLE user_info (
	id           INT         NOT NULL COMMENT 'id', -- id
	user_id      varchar(20) NULL     COMMENT '���̵�', -- ���̵�
	password     varchar(20) NULL     COMMENT '��й�ȣ', -- ��й�ȣ
	phone_number varchar(20) NULL     COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	email        varchar(50) NULL     COMMENT '�̸���' -- �̸���
)
COMMENT 'user_info';

-- user_info
ALTER TABLE user_info
	ADD CONSTRAINT PK_user_info -- user_info �⺻Ű
		PRIMARY KEY (
			id -- id
		);

-- job_cate
CREATE TABLE job_cate (
	job_cate_id   INT         NOT NULL COMMENT '������з�id', -- ������з�id
	job_cate_code VARCHAR(30) NOT NULL COMMENT '������з��ڵ�', -- ������з��ڵ�
	job_cate_name VARCHAR(50) NULL     COMMENT '������з���' -- ������з���
)
COMMENT 'job_cate';

-- job_cate
ALTER TABLE job_cate
	ADD CONSTRAINT PK_job_cate -- job_cate �⺻Ű
		PRIMARY KEY (
			job_cate_id -- ������з�id
		);

-- profile
CREATE TABLE profile (
	profile_id       INT           NOT NULL COMMENT '������id', -- ������id
	user_detail      INT           NULL     COMMENT 'id', -- id
	job_cate_id      INT           NULL     COMMENT '������з�id', -- ������з�id
	job_cate_sub_id  INT           NULL     COMMENT '�����Һз�id', -- �����Һз�id
	career           INT           NULL     COMMENT '���', -- ���
	location1        VARCHAR(20)   NULL     COMMENT '��ȣ����1', -- ��ȣ����1
	start_time1      DATETIME      NULL     COMMENT '��ȣ����1���۽ð�', -- ��ȣ����1���۽ð�
	end_time1        DATETIME      NULL     COMMENT '��ȣ����1���ð�', -- ��ȣ����1���ð�
	location2        VARCHAR(20)   NULL     COMMENT '��ȣ����2', -- ��ȣ����2
	start_time2      DATETIME      NULL     COMMENT '��ȣ����2���۽ð�', -- ��ȣ����2���۽ð�
	end_time2        DATETIME      NULL     COMMENT '��ȣ����2���ð�', -- ��ȣ����2���ð�
	location3        VARCHAR(20)   NULL     COMMENT '��ȣ����3', -- ��ȣ����3
	start_time3      DATETIME      NULL     COMMENT '��ȣ����3���۽ð�', -- ��ȣ����3���۽ð�
	end_time3        DATETIME      NULL     COMMENT '��ȣ����3���ð�', -- ��ȣ����3���ð�
	simple_introduce VARCHAR(255)  NULL     COMMENT '�����ڱ�Ұ�', -- �����ڱ�Ұ�
	detail_introduce VARCHAR(2000) NULL     COMMENT '�󼼼Ұ�' -- �󼼼Ұ�
)
COMMENT 'profile';

-- profile
ALTER TABLE profile
	ADD CONSTRAINT PK_profile -- profile �⺻Ű
		PRIMARY KEY (
			profile_id -- ������id
		);

-- job_cate_sub
CREATE TABLE job_cate_sub (
	job_cate_sub_id   INT         NOT NULL COMMENT '�����Һз�id', -- �����Һз�id
	job_cate_sub_code VARCHAR(30) NULL     COMMENT '�����Һз��ڵ�id', -- �����Һз��ڵ�id
	job_cate_sub_name VARCHAR(50) NULL     COMMENT '�����Һз���id', -- �����Һз���id
	job_cate_id       INT         NULL     COMMENT '������з�id' -- ������з�id
)
COMMENT 'job_cate_sub';

-- job_cate_sub
ALTER TABLE job_cate_sub
	ADD CONSTRAINT PK_job_cate_sub -- job_cate_sub �⺻Ű
		PRIMARY KEY (
			job_cate_sub_id -- �����Һз�id
		);

-- profile
ALTER TABLE profile
	ADD CONSTRAINT FK_user_info_TO_profile -- user_info -> profile
		FOREIGN KEY (
			user_detail -- id
		)
		REFERENCES user_info ( -- user_info
			id -- id
		);

-- profile
ALTER TABLE profile
	ADD CONSTRAINT FK_job_cate_TO_profile -- job_cate -> profile
		FOREIGN KEY (
			job_cate_id -- ������з�id
		)
		REFERENCES job_cate ( -- job_cate
			job_cate_id -- ������з�id
		);

-- profile
ALTER TABLE profile
	ADD CONSTRAINT FK_job_cate_sub_TO_profile -- job_cate_sub -> profile
		FOREIGN KEY (
			job_cate_sub_id -- �����Һз�id
		)
		REFERENCES job_cate_sub ( -- job_cate_sub
			job_cate_sub_id -- �����Һз�id
		);

-- job_cate_sub
ALTER TABLE job_cate_sub
	ADD CONSTRAINT FK_job_cate_TO_job_cate_sub -- job_cate -> job_cate_sub
		FOREIGN KEY (
			job_cate_id -- ������з�id
		)
		REFERENCES job_cate ( -- job_cate
			job_cate_id -- ������з�id
		);
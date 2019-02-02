create database sos;
use sos;


-- user_info
CREATE TABLE user_info (
	id           INT         NOT NULL COMMENT 'id', -- id
	user_id      varchar(20) NULL     COMMENT '아이디', -- 아이디
	password     varchar(20) NULL     COMMENT '비밀번호', -- 비밀번호
	phone_number varchar(20) NULL     COMMENT '전화번호', -- 전화번호
	email        varchar(50) NULL     COMMENT '이메일' -- 이메일
)
COMMENT 'user_info';

-- user_info
ALTER TABLE user_info
	ADD CONSTRAINT PK_user_info -- user_info 기본키
		PRIMARY KEY (
			id -- id
		);

-- job_cate
CREATE TABLE job_cate (
	job_cate_id   INT         NOT NULL COMMENT '업종대분류id', -- 업종대분류id
	job_cate_code VARCHAR(30) NOT NULL COMMENT '업종대분류코드', -- 업종대분류코드
	job_cate_name VARCHAR(50) NULL     COMMENT '업종대분류명' -- 업종대분류명
)
COMMENT 'job_cate';

-- job_cate
ALTER TABLE job_cate
	ADD CONSTRAINT PK_job_cate -- job_cate 기본키
		PRIMARY KEY (
			job_cate_id -- 업종대분류id
		);

-- profile
CREATE TABLE profile (
	profile_id       INT           NOT NULL COMMENT '프로필id', -- 프로필id
	user_detail      INT           NULL     COMMENT 'id', -- id
	job_cate_id      INT           NULL     COMMENT '업종대분류id', -- 업종대분류id
	job_cate_sub_id  INT           NULL     COMMENT '업종소분류id', -- 업종소분류id
	career           INT           NULL     COMMENT '경력', -- 경력
	location1        VARCHAR(20)   NULL     COMMENT '선호지역1', -- 선호지역1
	start_time1      DATETIME      NULL     COMMENT '선호지역1시작시간', -- 선호지역1시작시간
	end_time1        DATETIME      NULL     COMMENT '선호지역1끝시간', -- 선호지역1끝시간
	location2        VARCHAR(20)   NULL     COMMENT '선호지역2', -- 선호지역2
	start_time2      DATETIME      NULL     COMMENT '선호지역2시작시간', -- 선호지역2시작시간
	end_time2        DATETIME      NULL     COMMENT '선호지역2끝시간', -- 선호지역2끝시간
	location3        VARCHAR(20)   NULL     COMMENT '선호지역3', -- 선호지역3
	start_time3      DATETIME      NULL     COMMENT '선호지역3시작시간', -- 선호지역3시작시간
	end_time3        DATETIME      NULL     COMMENT '선호지역3끝시간', -- 선호지역3끝시간
	simple_introduce VARCHAR(255)  NULL     COMMENT '한줄자기소개', -- 한줄자기소개
	detail_introduce VARCHAR(2000) NULL     COMMENT '상세소개' -- 상세소개
)
COMMENT 'profile';

-- profile
ALTER TABLE profile
	ADD CONSTRAINT PK_profile -- profile 기본키
		PRIMARY KEY (
			profile_id -- 프로필id
		);

-- job_cate_sub
CREATE TABLE job_cate_sub (
	job_cate_sub_id   INT         NOT NULL COMMENT '업종소분류id', -- 업종소분류id
	job_cate_sub_code VARCHAR(30) NULL     COMMENT '업종소분류코드id', -- 업종소분류코드id
	job_cate_sub_name VARCHAR(50) NULL     COMMENT '업종소분류명id', -- 업종소분류명id
	job_cate_id       INT         NULL     COMMENT '업종대분류id' -- 업종대분류id
)
COMMENT 'job_cate_sub';

-- job_cate_sub
ALTER TABLE job_cate_sub
	ADD CONSTRAINT PK_job_cate_sub -- job_cate_sub 기본키
		PRIMARY KEY (
			job_cate_sub_id -- 업종소분류id
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
			job_cate_id -- 업종대분류id
		)
		REFERENCES job_cate ( -- job_cate
			job_cate_id -- 업종대분류id
		);

-- profile
ALTER TABLE profile
	ADD CONSTRAINT FK_job_cate_sub_TO_profile -- job_cate_sub -> profile
		FOREIGN KEY (
			job_cate_sub_id -- 업종소분류id
		)
		REFERENCES job_cate_sub ( -- job_cate_sub
			job_cate_sub_id -- 업종소분류id
		);

-- job_cate_sub
ALTER TABLE job_cate_sub
	ADD CONSTRAINT FK_job_cate_TO_job_cate_sub -- job_cate -> job_cate_sub
		FOREIGN KEY (
			job_cate_id -- 업종대분류id
		)
		REFERENCES job_cate ( -- job_cate
			job_cate_id -- 업종대분류id
		);
DROP TABLE IF EXISTS `Teachers`;

CREATE TABLE `Teachers` (
	`teacher_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(50)	NULL
);

DROP TABLE IF EXISTS `Grade_Info`;

CREATE TABLE `Grade_Info` (
	`grade_info_id`	VARCHAR(20)	NOT NULL,
	`student_id`	VARCHAR(20)	NOT NULL,
	`teacher_id`	VARCHAR(20)	NOT NULL,
	`grade`	INT(2)	NULL,
	`class`	INT(2)	NULL
);

DROP TABLE IF EXISTS `Student`;

CREATE TABLE `Student` (
	`student_id`	VARCHAR(20)	NOT NULL,
	`teacher_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(50)	NULL,
	`gender`	VARCHAR(30)	NULL,
	`birth_year`	INT(4)	NULL,
	`national`	VARCHAR(100)	NULL
);

DROP TABLE IF EXISTS `Courses_Taken`;

CREATE TABLE `Courses_Taken` (
	`taken_id`	VARCHAR(20)	NOT NULL,
	`student_id`	VARCHAR(20)	NOT NULL,
	`course_id`	VARCHAR(20)	NOT NULL,
	`prime_teacher_id`	VARCHAR(20)	NOT NULL,
	`teacher_id2`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Course`;

CREATE TABLE `Course` (
	`course_id`	VARCHAR(20)	NOT NULL,
	`prime_teacher_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(300)	NULL,
	`taken_grade`	INT(2)	NULL,
	`secon_teacher_id`	VARCHAR(20)	NULL
);

ALTER TABLE `Teachers` ADD CONSTRAINT `PK_TEACHERS` PRIMARY KEY (
	`teacher_id`
);

ALTER TABLE `Grade_Info` ADD CONSTRAINT `PK_GRADE_INFO` PRIMARY KEY (
	`grade_info_id`,
	`student_id`,
	`teacher_id`
);

ALTER TABLE `Student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`student_id`,
	`teacher_id`
);

ALTER TABLE `Courses_Taken` ADD CONSTRAINT `PK_COURSES_TAKEN` PRIMARY KEY (
	`taken_id`,
	`student_id`,
	`course_id`,
	`prime_teacher_id`,
	`teacher_id2`
);

ALTER TABLE `Course` ADD CONSTRAINT `PK_COURSE` PRIMARY KEY (
	`course_id`,
	`prime_teacher_id`
);

ALTER TABLE `Grade_Info` ADD CONSTRAINT `FK_Student_TO_Grade_Info_1` FOREIGN KEY (
	`student_id`
)
REFERENCES `Student` (
	`student_id`
);

ALTER TABLE `Grade_Info` ADD CONSTRAINT `FK_Student_TO_Grade_Info_2` FOREIGN KEY (
	`teacher_id`
)
REFERENCES `Student` (
	`teacher_id`
);

ALTER TABLE `Student` ADD CONSTRAINT `FK_Teachers_TO_Student_1` FOREIGN KEY (
	`teacher_id`
)
REFERENCES `Teachers` (
	`teacher_id`
);

ALTER TABLE `Courses_Taken` ADD CONSTRAINT `FK_Student_TO_Courses_Taken_1` FOREIGN KEY (
	`student_id`
)
REFERENCES `Student` (
	`student_id`
);

ALTER TABLE `Courses_Taken` ADD CONSTRAINT `FK_Student_TO_Courses_Taken_2` FOREIGN KEY (
	`teacher_id2`
)
REFERENCES `Student` (
	`teacher_id`
);

ALTER TABLE `Courses_Taken` ADD CONSTRAINT `FK_Course_TO_Courses_Taken_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `Course` (
	`course_id`
);

ALTER TABLE `Courses_Taken` ADD CONSTRAINT `FK_Course_TO_Courses_Taken_2` FOREIGN KEY (
	`prime_teacher_id`
)
REFERENCES `Course` (
	`prime_teacher_id`
);

ALTER TABLE `Course` ADD CONSTRAINT `FK_Teachers_TO_Course_1` FOREIGN KEY (
	`prime_teacher_id`
)
REFERENCES `Teachers` (
	`teacher_id`
);


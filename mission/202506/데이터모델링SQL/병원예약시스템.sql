DROP TABLE IF EXISTS `Patient`;

CREATE TABLE `Patient` (
	`patient_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(200)	NULL,
	`birthday`	INT(8)	NULL,
	`gender`	INT(3)	NULL,
	`id_number`	VARCHAR(7)	NULL,
	`phone`	VARCHAR(20)	NULL,
	`guardian_id`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Reserved`;

CREATE TABLE `Reserved` (
	`reserve_id`	VARCHAR(20)	NOT NULL,
	`patient_id`	VARCHAR(20)	NOT NULL,
	`treat_id`	VARCHAR(20)	NOT NULL,
	`doctor_id`	VARCHAR(20)	NOT NULL,
	`reserved_dts`	Date	NULL
);

DROP TABLE IF EXISTS `Treatment`;

CREATE TABLE `Treatment` (
	`treat_id`	VARCHAR(20)	NOT NULL,
	`title`	VARCHAR(300)	NULL,
	`Field`	VARCHAR(255)	NULL
);

DROP TABLE IF EXISTS `Charge`;

CREATE TABLE `Charge` (
	`treat_id`	VARCHAR(20)	NOT NULL,
	`doctor_id`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Doctor`;

CREATE TABLE `Doctor` (
	`doctor_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(200)	NULL,
	`phone`	VARCHAR(20)	NULL
);

ALTER TABLE `Patient` ADD CONSTRAINT `PK_PATIENT` PRIMARY KEY (
	`patient_id`
);

ALTER TABLE `Reserved` ADD CONSTRAINT `PK_RESERVED` PRIMARY KEY (
	`reserve_id`,
	`patient_id`,
	`treat_id`,
	`doctor_id`
);

ALTER TABLE `Treatment` ADD CONSTRAINT `PK_TREATMENT` PRIMARY KEY (
	`treat_id`
);

ALTER TABLE `Charge` ADD CONSTRAINT `PK_CHARGE` PRIMARY KEY (
	`treat_id`,
	`doctor_id`
);

ALTER TABLE `Doctor` ADD CONSTRAINT `PK_DOCTOR` PRIMARY KEY (
	`doctor_id`
);

ALTER TABLE `Patient` ADD CONSTRAINT `FK_Patient_TO_Patient_1` FOREIGN KEY (
	`guardian_id`
)
REFERENCES `Patient` (
	`patient_id`
);

ALTER TABLE `Reserved` ADD CONSTRAINT `FK_Patient_TO_Reserved_1` FOREIGN KEY (
	`patient_id`
)
REFERENCES `Patient` (
	`patient_id`
);

ALTER TABLE `Reserved` ADD CONSTRAINT `FK_Charge_TO_Reserved_1` FOREIGN KEY (
	`treat_id`
)
REFERENCES `Charge` (
	`treat_id`
);

ALTER TABLE `Reserved` ADD CONSTRAINT `FK_Charge_TO_Reserved_2` FOREIGN KEY (
	`doctor_id`
)
REFERENCES `Charge` (
	`doctor_id`
);

ALTER TABLE `Charge` ADD CONSTRAINT `FK_Treatment_TO_Charge_1` FOREIGN KEY (
	`treat_id`
)
REFERENCES `Treatment` (
	`treat_id`
);

ALTER TABLE `Charge` ADD CONSTRAINT `FK_Doctor_TO_Charge_1` FOREIGN KEY (
	`doctor_id`
)
REFERENCES `Doctor` (
	`doctor_id`
);


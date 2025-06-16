DROP TABLE IF EXISTS `Members`;

CREATE TABLE `Members` (
	`member_id`	VARCHAR(10)	NOT NULL,
	`name`	VARCHAR(512)	NULL,
	`birth_year`	INT(4)	NULL,
	`gender`	VARCHAR(10)	NULL,
	`mod_dts`	DATE	NULL
);

ALTER TABLE `Members` ADD CONSTRAINT `PK_MEMBERS` PRIMARY KEY (
	`member_id`
);


DROP TABLE IF EXISTS `Parking_List`;

CREATE TABLE `Parking_List` (
	`parking_id`	VARCHAR(30)	NOT NULL,
	`ticket_id`	VARCHAR(30)	NOT NULL,
	`entry_dts`	DATE	NOT NULL,
	`exit_dts`	DATE	NULL,
	`car_plate`	VARCHAR(20)	NULL
);

DROP TABLE IF EXISTS `Tickets`;

CREATE TABLE `Tickets` (
	`ticket_id`	VARCHAR(30)	NOT NULL,
	`car_plate`	VARCHAR(20)	NULL,
	`start_dts`	DATE	NULL,
	`finish_dts`	DATE	NULL,
	`ticket_type`	VARCHAR(20)	NULL
);

ALTER TABLE `Parking_List` ADD CONSTRAINT `PK_PARKING_LIST` PRIMARY KEY (
	`parking_id`,
	`ticket_id`
);

ALTER TABLE `Tickets` ADD CONSTRAINT `PK_TICKETS` PRIMARY KEY (
	`ticket_id`
);

ALTER TABLE `Parking_List` ADD CONSTRAINT `FK_Tickets_TO_Parking_List_1` FOREIGN KEY (
	`ticket_id`
)
REFERENCES `Tickets` (
	`ticket_id`
);


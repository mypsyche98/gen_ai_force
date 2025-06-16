DROP TABLE IF EXISTS `Lyricist`;

CREATE TABLE `Lyricist` (
	`write_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(100)	NULL,
	`gender`	VARCHAR(10)	NULL
);

DROP TABLE IF EXISTS `Singer`;

CREATE TABLE `Singer` (
	`singer_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(100)	NULL,
	`gender`	VARCHAR(10)	NULL,
	`Field`	VARCHAR(255)	NULL
);

DROP TABLE IF EXISTS `Writer_Group`;

CREATE TABLE `Writer_Group` (
	`write_group_id`	VARCHAR(20)	NOT NULL,
	`write_id`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Lyricist_Group`;

CREATE TABLE `Lyricist_Group` (
	`lyricist_group_id`	VARCHAR(20)	NOT NULL,
	`write_id`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Writer`;

CREATE TABLE `Writer` (
	`write_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(100)	NULL,
	`gender`	VARCHAR(10)	NULL
);

DROP TABLE IF EXISTS `Source`;

CREATE TABLE `Source` (
	`source_idI`	VARCHAR(20)	NOT NULL,
	`singer_group_id`	VARCHAR(20)	NOT NULL,
	`singer_id`	VARCHAR(20)	NOT NULL,
	`write_group_id`	VARCHAR(20)	NOT NULL,
	`write_id`	VARCHAR(20)	NOT NULL,
	`lyricist_group_id`	VARCHAR(20)	NOT NULL,
	`write_id2`	VARCHAR(20)	NOT NULL,
	`playlist_id`	VARCHAR(20)	NOT NULL,
	`title`	VARCHAR(300)	NULL
);

DROP TABLE IF EXISTS `Singer_Group`;

CREATE TABLE `Singer_Group` (
	`singer_group_id`	VARCHAR(20)	NOT NULL,
	`singer_id`	VARCHAR(20)	NOT NULL
);

DROP TABLE IF EXISTS `Playlist`;

CREATE TABLE `Playlist` (
	`playlist_id`	VARCHAR(20)	NOT NULL,
	`title`	VARCHAR(300)	NULL
);

DROP TABLE IF EXISTS `Member`;

CREATE TABLE `Member` (
	`member_id`	VARCHAR(20)	NOT NULL,
	`ticket_id`	VARCHAR(20)	NOT NULL,
	`name`	VARCHAR(100)	NULL,
	`gender`	VARCHAR(10)	NULL
);

DROP TABLE IF EXISTS `Buy_List`;

CREATE TABLE `Buy_List` (
	`buy_id`	VARCHAR(20)	NOT NULL,
	`source_idI`	VARCHAR(20)	NOT NULL,
	`member_id`	VARCHAR(20)	NOT NULL,
	`ticket_id`	VARCHAR(20)	NOT NULL,
	`buy_dts`	DATE	NULL,
	`exp_dts`	DATE	NULL,
	`Field`	VARCHAR(255)	NULL
);

DROP TABLE IF EXISTS `Tickets`;

CREATE TABLE `Tickets` (
	`ticket_id`	VARCHAR(20)	NOT NULL,
	`start_dts`	DATE	NULL,
	`finish_dts`	DATE	NULL,
	`ticket_type`	VARCHAR(4)	NULL
);

ALTER TABLE `Lyricist` ADD CONSTRAINT `PK_LYRICIST` PRIMARY KEY (
	`write_id`
);

ALTER TABLE `Singer` ADD CONSTRAINT `PK_SINGER` PRIMARY KEY (
	`singer_id`
);

ALTER TABLE `Writer_Group` ADD CONSTRAINT `PK_WRITER_GROUP` PRIMARY KEY (
	`write_group_id`,
	`write_id`
);

ALTER TABLE `Lyricist_Group` ADD CONSTRAINT `PK_LYRICIST_GROUP` PRIMARY KEY (
	`lyricist_group_id`,
	`write_id`
);

ALTER TABLE `Writer` ADD CONSTRAINT `PK_WRITER` PRIMARY KEY (
	`write_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `PK_SOURCE` PRIMARY KEY (
	`source_idI`,
	`singer_group_id`,
	`singer_id`,
	`write_group_id`,
	`write_id`,
	`lyricist_group_id`,
	`write_id2`,
	`playlist_id`
);

ALTER TABLE `Singer_Group` ADD CONSTRAINT `PK_SINGER_GROUP` PRIMARY KEY (
	`singer_group_id`,
	`singer_id`
);

ALTER TABLE `Playlist` ADD CONSTRAINT `PK_PLAYLIST` PRIMARY KEY (
	`playlist_id`
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`member_id`,
	`ticket_id`
);

ALTER TABLE `Buy_List` ADD CONSTRAINT `PK_BUY_LIST` PRIMARY KEY (
	`buy_id`,
	`source_idI`,
	`member_id`,
	`ticket_id`
);

ALTER TABLE `Tickets` ADD CONSTRAINT `PK_TICKETS` PRIMARY KEY (
	`ticket_id`
);

ALTER TABLE `Writer_Group` ADD CONSTRAINT `FK_Writer_TO_Writer_Group_1` FOREIGN KEY (
	`write_id`
)
REFERENCES `Writer` (
	`write_id`
);

ALTER TABLE `Lyricist_Group` ADD CONSTRAINT `FK_Lyricist_TO_Lyricist_Group_1` FOREIGN KEY (
	`write_id`
)
REFERENCES `Lyricist` (
	`write_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Singer_Group_TO_Source_1` FOREIGN KEY (
	`singer_group_id`
)
REFERENCES `Singer_Group` (
	`singer_group_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Singer_Group_TO_Source_2` FOREIGN KEY (
	`singer_id`
)
REFERENCES `Singer_Group` (
	`singer_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Writer_Group_TO_Source_1` FOREIGN KEY (
	`write_group_id`
)
REFERENCES `Writer_Group` (
	`write_group_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Writer_Group_TO_Source_2` FOREIGN KEY (
	`write_id`
)
REFERENCES `Writer_Group` (
	`write_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Lyricist_Group_TO_Source_1` FOREIGN KEY (
	`lyricist_group_id`
)
REFERENCES `Lyricist_Group` (
	`lyricist_group_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Lyricist_Group_TO_Source_2` FOREIGN KEY (
	`write_id2`
)
REFERENCES `Lyricist_Group` (
	`write_id`
);

ALTER TABLE `Source` ADD CONSTRAINT `FK_Playlist_TO_Source_1` FOREIGN KEY (
	`playlist_id`
)
REFERENCES `Playlist` (
	`playlist_id`
);

ALTER TABLE `Singer_Group` ADD CONSTRAINT `FK_Singer_TO_Singer_Group_1` FOREIGN KEY (
	`singer_id`
)
REFERENCES `Singer` (
	`singer_id`
);

ALTER TABLE `Member` ADD CONSTRAINT `FK_Tickets_TO_Member_1` FOREIGN KEY (
	`ticket_id`
)
REFERENCES `Tickets` (
	`ticket_id`
);

ALTER TABLE `Buy_List` ADD CONSTRAINT `FK_Source_TO_Buy_List_1` FOREIGN KEY (
	`source_idI`
)
REFERENCES `Source` (
	`source_idI`
);

ALTER TABLE `Buy_List` ADD CONSTRAINT `FK_Member_TO_Buy_List_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `Member` (
	`member_id`
);

ALTER TABLE `Buy_List` ADD CONSTRAINT `FK_Member_TO_Buy_List_2` FOREIGN KEY (
	`ticket_id`
)
REFERENCES `Member` (
	`ticket_id`
);


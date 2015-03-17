SET foreign_key_checks=0;

--
-- Table: `member`
--
CREATE TABLE `member` (
  `id` INTEGER NOT NULL auto_increment,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

SET foreign_key_checks=1;


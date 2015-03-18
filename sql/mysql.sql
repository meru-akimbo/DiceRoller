SET foreign_key_checks=0;

--
-- Table: `room`
--
CREATE TABLE `room` (
  `id` INTEGER NOT NULL auto_increment,
  `name` VARCHAR(255) NOT NULL,
  `max_member` INTEGER NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

SET foreign_key_checks=1;


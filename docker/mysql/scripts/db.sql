USE `project`;

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(10) unsigned NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `fathername` varchar(50) DEFAULT NULL,
  `lastname` varchar(75) NOT NULL,
  `gender` enum('M','F') DEFAULT 'M' COMMENT 'gender: M-Male, F-Female',
  `birthdate` date DEFAULT NULL COMMENT 'birthdate: it could be null for some roles',
  `photo` varchar(200) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

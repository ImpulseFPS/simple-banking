
CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `citizenid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;


CREATE TABLE `society` (
  `id` int(11) NOT NULL,
	`name` varchar(255) DEFAULT NULL,
	`money` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
  PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



INSERT INTO `society` (`id`, `name`, `money`) VALUES -- THIS IS JUST AN EXAMPLE HOW TO INSERT NEW JOBS INTO SOCIETY
(1, 'police', 0),
(2, 'lostmc', 0),



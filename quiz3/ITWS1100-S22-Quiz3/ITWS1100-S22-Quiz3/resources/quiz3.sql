
-- Place your SQL Commands to create your table and insert data here
CREATE DATABASE iitquiz3;

CREATE TABLE `myprojects` (
  `id` int(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `myprojects` (`id`, `firstName`, `LastName`, `date`) VALUES
(1, 'harry', 'potter', '2000-04-13'),
(2, 'depp', 'johnny', '1960-05-12');


ALTER TABLE `myprojects`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `myprojects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;


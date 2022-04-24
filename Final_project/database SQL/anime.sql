-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 10:04 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anime`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(100) NOT NULL,
  `blog_img` varchar(1000) NOT NULL DEFAULT 'default.png',
  `blog_by` int(11) NOT NULL,
  `blog_date` date NOT NULL,
  `blog_votes` int(11) NOT NULL DEFAULT 0,
  `blog_content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `blog_title`, `blog_img`, `blog_by`, `blog_date`, `blog_votes`, `blog_content`) VALUES
(25, 'Dragon Ball Z anime blog', '626063db23ca14.64423549.jpg', 40, '2022-04-21', 0, 'all details about dragon ball Z anime.....\r\n..................................\r\n.................................................................................\r\n.......................................................\r\nThank you.');

-- --------------------------------------------------------

--
-- Table structure for table `blogvotes`
--

CREATE TABLE `blogvotes` (
  `voteId` int(11) NOT NULL,
  `voteBlog` int(11) NOT NULL,
  `voteBy` int(11) NOT NULL,
  `voteDate` date NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `blogvotes`
--
DELIMITER $$
CREATE TRIGGER `calc_blog_votes_after_delete` AFTER DELETE ON `blogvotes` FOR EACH ROW BEGIN

		update blogs
        set blogs.blog_votes = blogs.blog_votes - old.vote
        where blogs.blog_id = old.voteBlog;	

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_blog_votes_after_insert` AFTER INSERT ON `blogvotes` FOR EACH ROW BEGIN
	
	update blogs
        set blogs.blog_votes = blogs.blog_votes + new.vote
        where blogs.blog_id = new.voteBlog;	
		
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_blog_votes_after_update` AFTER UPDATE ON `blogvotes` FOR EACH ROW BEGIN
	
		update blogs
        set blogs.blog_votes = blogs.blog_votes + (new.vote * 2)
        where blogs.blog_id = new.voteBlog;	
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(8) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(14, 'Anime', 'cartoons anime etc'),
(15, 'MUSIC', 'artist/songs/ and many more'),
(16, 'FILMS', 'movies etc'),
(17, 'NOVEL/COMICS', 'novels and comics stories write about');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_by` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date_created` date NOT NULL,
  `event_date` varchar(10) NOT NULL,
  `event_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_info`
--

CREATE TABLE `event_info` (
  `event_id` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `headline` varchar(100) NOT NULL,
  `description` varchar(6000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `poll_desc` varchar(5000) NOT NULL,
  `locked` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `poll_option_id` int(11) NOT NULL,
  `vote_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(8) NOT NULL,
  `post_content` text NOT NULL,
  `post_date` datetime NOT NULL,
  `post_topic` int(8) NOT NULL,
  `post_by` int(8) NOT NULL,
  `post_votes` int(11) NOT NULL DEFAULT 0,
  `rank` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_content`, `post_date`, `post_topic`, `post_by`, `post_votes`, `rank`) VALUES
(133, 'lets discuss about anime dragon boll Z', '2022-04-21 00:38:57', 50, 40, 0, '2');

-- --------------------------------------------------------

--
-- Table structure for table `postvotes`
--

CREATE TABLE `postvotes` (
  `voteId` int(11) NOT NULL,
  `votePost` int(11) NOT NULL,
  `voteBy` int(11) NOT NULL,
  `voteDate` date NOT NULL,
  `vote` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `postvotes`
--
DELIMITER $$
CREATE TRIGGER `calc_forum_votes_after_delete` AFTER DELETE ON `postvotes` FOR EACH ROW BEGIN

		update posts
        set posts.post_votes = posts.post_votes - old.vote
        where posts.post_id = old.votePost;	

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_forum_votes_after_insert` AFTER INSERT ON `postvotes` FOR EACH ROW BEGIN
	
	update posts
        set posts.post_votes = posts.post_votes + new.vote
        where posts.post_id = new.votePost;	
		
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_forum_votes_after_update` AFTER UPDATE ON `postvotes` FOR EACH ROW BEGIN
	
		update posts
        set posts.post_votes = posts.post_votes + (new.vote * 2)
        where posts.post_id = new.votePost;	
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `pwdResetId` int(11) NOT NULL,
  `pwdResetEmail` text NOT NULL,
  `pwdResetSelector` text NOT NULL,
  `pwdResetToken` longtext NOT NULL,
  `pwdResetExpires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(8) NOT NULL,
  `topic_subject` varchar(255) NOT NULL,
  `topic_date` datetime NOT NULL,
  `topic_cat` int(8) NOT NULL,
  `topic_by` int(8) NOT NULL,
  `rank` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_subject`, `topic_date`, `topic_cat`, `topic_by`, `rank`) VALUES
(50, 'Dragon ball Z', '2022-04-21 00:38:57', 14, 40, '2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `userLevel` int(11) NOT NULL DEFAULT 0,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL,
  `gender` char(1) NOT NULL,
  `headline` varchar(500) DEFAULT NULL,
  `bio` varchar(4000) DEFAULT NULL,
  `userImg` varchar(500) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUsers`, `userLevel`, `f_name`, `l_name`, `uidUsers`, `emailUsers`, `pwdUsers`, `gender`, `headline`, `bio`, `userImg`) VALUES
(40, 1, 'admin', 'admin', 'admin', 'admin@gmail.com', '$2y$10$yHc2jUbmtte1Dxh5vqBwsO2GQ6g025fnj0XLSWWUpIoDeyRgDVLim', 'm', 'admin detail', 'admin info', '626063a5eef928.41303426.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `blog_by` (`blog_by`);

--
-- Indexes for table `blogvotes`
--
ALTER TABLE `blogvotes`
  ADD PRIMARY KEY (`voteId`),
  ADD KEY `voteBlog` (`voteBlog`),
  ADD KEY `voteBy` (`voteBy`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name_unique` (`cat_name`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `events_ibfk_1` (`event_by`);

--
-- Indexes for table `event_info`
--
ALTER TABLE `event_info`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event` (`event`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_from` (`user_from`),
  ADD KEY `user_to` (`user_to`),
  ADD KEY `conversation_id` (`conversation_id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`),
  ADD KEY `poll_option_id` (`poll_option_id`),
  ADD KEY `vote_by` (`vote_by`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_topic` (`post_topic`),
  ADD KEY `post_by` (`post_by`);

--
-- Indexes for table `postvotes`
--
ALTER TABLE `postvotes`
  ADD PRIMARY KEY (`voteId`),
  ADD KEY `voteBy` (`voteBy`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`pwdResetId`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `topic_cat` (`topic_cat`),
  ADD KEY `topic_by` (`topic_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blogvotes`
--
ALTER TABLE `blogvotes`
  MODIFY `voteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `event_info`
--
ALTER TABLE `event_info`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `postvotes`
--
ALTER TABLE `postvotes`
  MODIFY `voteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `pwdResetId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`blog_by`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blogvotes`
--
ALTER TABLE `blogvotes`
  ADD CONSTRAINT `blogvotes_ibfk_1` FOREIGN KEY (`voteBlog`) REFERENCES `blogs` (`blog_id`),
  ADD CONSTRAINT `blogvotes_ibfk_2` FOREIGN KEY (`voteBy`) REFERENCES `users` (`idUsers`);

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`user_one`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`user_two`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`event_by`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_info`
--
ALTER TABLE `event_info`
  ADD CONSTRAINT `event_info_ibfk_1` FOREIGN KEY (`event`) REFERENCES `events` (`event_id`) ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_from`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_to`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_votes_ibfk_2` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_votes_ibfk_3` FOREIGN KEY (`vote_by`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`idUsers`) ON UPDATE CASCADE;

--
-- Constraints for table `postvotes`
--
ALTER TABLE `postvotes`
  ADD CONSTRAINT `postvotes_ibfk_1` FOREIGN KEY (`voteBy`) REFERENCES `users` (`idUsers`) ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`idUsers`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

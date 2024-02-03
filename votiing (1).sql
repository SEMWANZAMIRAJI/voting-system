-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 09:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votiing`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(11) DEFAULT NULL,
  `firstname` varchar(11) DEFAULT NULL,
  `lastname` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `firstname`, `lastname`) VALUES
('semwanzamiraji@gmail.com', '12345678', 'miraji', 'tumai'),
('semwanzamiraji@gmail.com', '12345678', 'miraji', 'asumani'),
('semwanzamiraji@gmail.com', '1234', 'miraji', 'asumani'),
('semwanzamiraji@gmail.com', '1234', 'miraji', 'asumani'),
('semwanzamiraji@gmail.com', '12345678', 'miraji', 'asumani');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `candidate_id` int(11) NOT NULL,
  `firstname` varchar(11) DEFAULT NULL,
  `lastname` varchar(11) DEFAULT NULL,
  `year` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `image` varchar(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`candidate_id`, `firstname`, `lastname`, `year`, `gender`, `image`, `position_id`) VALUES
(1, 'miraji', 'tumai', '2000', 'male', 'no picture', NULL),
(2, 'juma', 'tumai', '2', 'male', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `positiion`
--

CREATE TABLE `positiion` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `positiion`
--

INSERT INTO `positiion` (`position_id`, `position_name`) VALUES
(1, 'president'),
(2, 'wabunge');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `voters_id` int(11) NOT NULL,
  `password` varchar(11) DEFAULT NULL,
  `firstname` varchar(11) DEFAULT NULL,
  `lastname` varchar(11) DEFAULT NULL,
  `year_level` varchar(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `account` varchar(11) DEFAULT NULL,
  `passwordhash` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`voters_id`, `password`, `firstname`, `lastname`, `year_level`, `status`, `account`, `passwordhash`) VALUES
(1, '123456789', 'juma', 'tumai', '2023', 'active', '12345', '*CC67043C7B');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `votes_id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `votes_count` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`votes_id`, `candidate_id`, `position_id`, `votes_count`) VALUES
(1, 1, 1, '400');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`candidate_id`),
  ADD KEY `fk_candi_posit` (`position_id`);

--
-- Indexes for table `positiion`
--
ALTER TABLE `positiion`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`voters_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`votes_id`),
  ADD KEY `fk_vo_can` (`candidate_id`),
  ADD KEY `fk_votes_posit` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `positiion`
--
ALTER TABLE `positiion`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `voters_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `votes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidate`
--
ALTER TABLE `candidate`
  ADD CONSTRAINT `fk_candi_posit` FOREIGN KEY (`position_id`) REFERENCES `positiion` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_vo_can` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_votes_posit` FOREIGN KEY (`position_id`) REFERENCES `positiion` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

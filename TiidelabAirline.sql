-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 02:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TiidelabAirline`
--

-- --------------------------------------------------------

--
-- Table structure for table `FlightDetails`
--

CREATE TABLE `FlightDetails` (
  `FlightID` int(11) NOT NULL,
  `PassengerID` int(11) DEFAULT NULL,
  `FlightDate` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `TakeOffLocation` varchar(255) DEFAULT NULL,
  `TakeOffTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `FlightDetails`
--

INSERT INTO `FlightDetails` (`FlightID`, `PassengerID`, `FlightDate`, `Destination`, `TakeOffLocation`, `TakeOffTime`) VALUES
(1, NULL, '19/02/2019', 'Lagos', 'Abuja', '08:45 AM'),
(2, NULL, '18/02/2019', 'Kano', 'Lagos', '06:45 AM'),
(3, NULL, '20/02/2019', 'Enugu', 'Port Harcourt', '05:15 AM'),
(4, NULL, '19/02/2019', 'Uyo', 'Abuja', '08:00 AM');

-- --------------------------------------------------------

--
-- Table structure for table `PassengerDetails`
--

CREATE TABLE `PassengerDetails` (
  `PassengerID` int(11) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `HomeAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PassengerDetails`
--

INSERT INTO `PassengerDetails` (`PassengerID`, `LastName`, `FirstName`, `Age`, `EmailAddress`, `MobileNumber`, `Country`, `HomeAddress`) VALUES
(1, 'Eze', 'Kelvin', 25, 'kelvin@gmail.com', '08103930076', 'Nigeria', '39B ZONE 3 Wuse'),
(2, 'John', 'Dulu', 35, 'john@gmail.com', '08102930076', 'Nigeria', '13C ZONE 6 Wuse'),
(3, 'Nana', 'Asemoah', 27, 'nana@gmail.com', '08103930086', 'Ghana', '39B garki area 11'),
(4, 'Adam', 'Schiff', 45, 'schiffty@gmail.com', '081039333076', 'United States', '23 Landon Street Maitama');

-- --------------------------------------------------------

--
-- Table structure for table `Pricing`
--

CREATE TABLE `Pricing` (
  `PricingID` int(11) NOT NULL,
  `FlightClass` varchar(255) DEFAULT NULL,
  `FlightType` varchar(255) DEFAULT NULL,
  `TicketPrice` decimal(10,0) DEFAULT NULL,
  `FlightID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Pricing`
--

INSERT INTO `Pricing` (`PricingID`, `FlightClass`, `FlightType`, `TicketPrice`, `FlightID`) VALUES
(1, 'Economy', 'One way', '17500', NULL),
(2, 'Business', 'Return', '32000', NULL),
(3, 'Business', 'One Way', '20000', NULL),
(4, 'Economy', 'Return', '25000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `FlightDetails`
--
ALTER TABLE `FlightDetails`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `PassengerID` (`PassengerID`);

--
-- Indexes for table `PassengerDetails`
--
ALTER TABLE `PassengerDetails`
  ADD PRIMARY KEY (`PassengerID`);

--
-- Indexes for table `Pricing`
--
ALTER TABLE `Pricing`
  ADD PRIMARY KEY (`PricingID`),
  ADD KEY `FlightID` (`FlightID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `FlightDetails`
--
ALTER TABLE `FlightDetails`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `PassengerDetails`
--
ALTER TABLE `PassengerDetails`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Pricing`
--
ALTER TABLE `Pricing`
  MODIFY `PricingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `FlightDetails`
--
ALTER TABLE `FlightDetails`
  ADD CONSTRAINT `FlightDetails_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `PassengerDetails` (`PassengerID`);

--
-- Constraints for table `Pricing`
--
ALTER TABLE `Pricing`
  ADD CONSTRAINT `Pricing_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `FlightDetails` (`FlightID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

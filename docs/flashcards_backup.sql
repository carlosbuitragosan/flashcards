-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2025 at 09:36 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u255607125_flashcards`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `decks`
--

CREATE TABLE `decks` (
  `id` int(11) NOT NULL,
  `continent` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `decks`
--

INSERT INTO `decks` (`id`, `continent`) VALUES
(1, 'Africa'),
(2, 'Asia'),
(3, 'Europe'),
(4, 'Americas'),
(5, 'Oceania'),
(6, 'Antarctic');

-- --------------------------------------------------------

--
-- Table structure for table `flashcards`
--

CREATE TABLE `flashcards` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `capital` varchar(100) NOT NULL,
  `deck_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashcards`
--

INSERT INTO `flashcards` (`id`, `country`, `capital`, `deck_id`) VALUES
(1, 'Dominican Republic', 'Santo Domingo', 4),
(2, 'Guyana', 'Georgetown', 4),
(3, 'Norway', 'Oslo', 3),
(4, 'United Arab Emirates', 'Abu Dhabi', 2),
(5, 'Azerbaijan', 'Baku', 2),
(6, 'Estonia', 'Tallinn', 3),
(7, 'Guinea-Bissau', 'Bissau', 1),
(8, 'Angola', 'Luanda', 1),
(9, 'Brunei', 'Bandar Seri Begawan', 2),
(10, 'Italy', 'Rome', 3),
(11, 'British Virgin Islands', 'Road Town', 4),
(12, 'Czechia', 'Prague', 3),
(13, 'Mayotte', 'Mamoudzou', 1),
(14, 'Nicaragua', 'Managua', 4),
(15, 'North Korea', 'Pyongyang', 2),
(16, 'Syria', 'Damascus', 2),
(17, 'Bahrain', 'Manama', 2),
(18, 'Martinique', 'Fort-de-France', 4),
(19, 'Albania', 'Tirana', 3),
(20, 'Kiribati', 'South Tarawa', 5),
(21, 'Mozambique', 'Maputo', 1),
(22, 'American Samoa', 'Pago Pago', 5),
(23, 'Philippines', 'Manila', 2),
(24, 'Lithuania', 'Vilnius', 3),
(25, 'Pitcairn Islands', 'Adamstown', 5),
(26, 'Colombia', 'Bogotá', 4),
(27, 'Seychelles', 'Victoria', 1),
(28, 'Bolivia', 'Sucre', 4),
(29, 'Malta', 'Valletta', 3),
(30, 'Greece', 'Athens', 3),
(31, 'Saint Lucia', 'Castries', 4),
(32, 'Kazakhstan', 'Astana', 2),
(33, 'Bosnia and Herzegovina', 'Sarajevo', 3),
(34, 'Fiji', 'Suva', 5),
(35, 'Montenegro', 'Podgorica', 3),
(36, 'Saudi Arabia', 'Riyadh', 2),
(37, 'South Georgia', 'King Edward Point', 6),
(38, 'Eswatini', 'Mbabane', 1),
(39, 'Comoros', 'Moroni', 1),
(40, 'Montserrat', 'Plymouth', 4),
(41, 'Niue', 'Alofi', 5),
(42, 'United States Virgin Islands', 'Charlotte Amalie', 4),
(43, 'Guatemala', 'Guatemala City', 4),
(44, 'Palau', 'Ngerulmud', 5),
(45, 'United Kingdom', 'London', 3),
(46, 'Denmark', 'Copenhagen', 3),
(47, 'Djibouti', 'Djibouti', 1),
(48, 'Israel', 'Jerusalem', 2),
(49, 'Turkmenistan', 'Ashgabat', 2),
(50, 'Micronesia', 'Palikir', 5),
(51, 'Ukraine', 'Kyiv', 3),
(52, 'Solomon Islands', 'Honiara', 5),
(53, 'Honduras', 'Tegucigalpa', 4),
(54, 'Christmas Island', 'Flying Fish Cove', 5),
(55, 'Svalbard and Jan Mayen', 'Longyearbyen', 3),
(56, 'Tajikistan', 'Dushanbe', 2),
(57, 'Cayman Islands', 'George Town', 4),
(58, 'Iraq', 'Baghdad', 2),
(59, 'Uganda', 'Kampala', 1),
(60, 'Russia', 'Moscow', 3),
(61, 'Zimbabwe', 'Harare', 1),
(62, 'Sudan', 'Khartoum', 1),
(63, 'Turks and Caicos Islands', 'Cockburn Town', 4),
(64, 'Haiti', 'Port-au-Prince', 4),
(65, 'Sweden', 'Stockholm', 3),
(66, 'Laos', 'Vientiane', 2),
(67, 'Andorra', 'Andorra la Vella', 3),
(68, 'Turkey', 'Ankara', 2),
(69, 'Lesotho', 'Maseru', 1),
(70, 'Anguilla', 'The Valley', 4),
(71, 'Slovakia', 'Bratislava', 3),
(72, 'Ghana', 'Accra', 1),
(73, 'Finland', 'Helsinki', 3),
(74, 'Morocco', 'Rabat', 1),
(75, 'Niger', 'Niamey', 1),
(76, 'Uruguay', 'Montevideo', 4),
(77, 'Chile', 'Santiago', 4),
(78, 'Barbados', 'Bridgetown', 4),
(79, 'Cambodia', 'Phnom Penh', 2),
(80, 'Burkina Faso', 'Ouagadougou', 1),
(81, 'Rwanda', 'Kigali', 1),
(82, 'Trinidad and Tobago', 'Port of Spain', 4),
(83, 'São Tomé and Príncipe', 'São Tomé', 1),
(84, 'Bangladesh', 'Dhaka', 2),
(85, 'India', 'New Delhi', 2),
(86, 'Republic of the Congo', 'Brazzaville', 1),
(87, 'Oman', 'Muscat', 2),
(88, 'Paraguay', 'Asunción', 4),
(89, 'Togo', 'Lomé', 1),
(90, 'Bulgaria', 'Sofia', 3),
(91, 'El Salvador', 'San Salvador', 4),
(92, 'Faroe Islands', 'Tórshavn', 3),
(93, 'Botswana', 'Gaborone', 1),
(94, 'French Polynesia', 'Papeetē', 5),
(95, 'Portugal', 'Lisbon', 3),
(96, 'Venezuela', 'Caracas', 4),
(97, 'France', 'Paris', 3),
(98, 'Papua New Guinea', 'Port Moresby', 5),
(99, 'Taiwan', 'Taipei', 2),
(100, 'Moldova', 'Chișinău', 3),
(101, 'Ivory Coast', 'Yamoussoukro', 1),
(102, 'Saint Barthélemy', 'Gustavia', 4),
(103, 'Brazil', 'Brasília', 4),
(104, 'Lebanon', 'Beirut', 2),
(105, 'Yemen', 'Sana\'a', 2),
(106, 'Curaçao', 'Willemstad', 4),
(107, 'Gambia', 'Banjul', 1),
(108, 'Wallis and Futuna', 'Mata-Utu', 5),
(109, 'Ethiopia', 'Addis Ababa', 1),
(110, 'Sri Lanka', 'Sri Jayawardenepura Kotte', 2),
(111, 'Cameroon', 'Yaoundé', 1),
(112, 'Guernsey', 'St. Peter Port', 3),
(113, 'Central African Republic', 'Bangui', 1),
(114, 'French Guiana', 'Cayenne', 4),
(115, 'Aruba', 'Oranjestad', 4),
(116, 'French Southern and Antarctic Lands', 'Port-aux-Français', 6),
(117, 'Algeria', 'Algiers', 1),
(118, 'Monaco', 'Monaco', 3),
(119, 'Armenia', 'Yerevan', 2),
(120, 'Switzerland', 'Bern', 3),
(121, 'Peru', 'Lima', 4),
(122, 'Iran', 'Tehran', 2),
(123, 'Saint Helena, Ascension and Tristan da Cunha', 'Jamestown', 1),
(124, 'Senegal', 'Dakar', 1),
(125, 'Saint Pierre and Miquelon', 'Saint-Pierre', 4),
(126, 'Saint Vincent and the Grenadines', 'Kingstown', 4),
(127, 'Zambia', 'Lusaka', 1),
(128, 'Somalia', 'Mogadishu', 1),
(129, 'Austria', 'Vienna', 3),
(130, 'Tonga', 'Nuku\'alofa', 5),
(131, 'Cape Verde', 'Praia', 1),
(132, 'Thailand', 'Bangkok', 2),
(133, 'Western Sahara', 'El Aaiún', 1),
(134, 'Timor-Leste', 'Dili', 2),
(135, 'South Africa', 'Pretoria', 1),
(136, 'Equatorial Guinea', 'Malabo', 1),
(137, 'Gibraltar', 'Gibraltar', 3),
(138, 'Benin', 'Porto-Novo', 1),
(139, 'Malawi', 'Lilongwe', 1),
(140, 'Australia', 'Canberra', 5),
(141, 'Jamaica', 'Kingston', 4),
(142, 'Chad', 'N\'Djamena', 1),
(143, 'Myanmar', 'Naypyidaw', 2),
(144, 'Nigeria', 'Abuja', 1),
(145, 'Mauritania', 'Nouakchott', 1),
(146, 'Bermuda', 'Hamilton', 4),
(147, 'Ecuador', 'Quito', 4),
(148, 'Mauritius', 'Port Louis', 1),
(149, 'Greenland', 'Nuuk', 4),
(150, 'New Caledonia', 'Nouméa', 5),
(151, 'New Zealand', 'Wellington', 5),
(152, 'Argentina', 'Buenos Aires', 4),
(153, 'Costa Rica', 'San José', 4),
(154, 'North Macedonia', 'Skopje', 3),
(155, 'Marshall Islands', 'Majuro', 5),
(156, 'Mali', 'Bamako', 1),
(157, 'Belize', 'Belmopan', 4),
(158, 'Kenya', 'Nairobi', 1),
(159, 'Åland Islands', 'Mariehamn', 3),
(160, 'Jordan', 'Amman', 2),
(161, 'Madagascar', 'Antananarivo', 1),
(162, 'Vatican City', 'Vatican City', 3),
(163, 'Indonesia', 'Jakarta', 2),
(164, 'Iceland', 'Reykjavik', 3),
(165, 'Caribbean Netherlands', 'Kralendijk', 4),
(166, 'Singapore', 'Singapore', 2),
(167, 'Malaysia', 'Kuala Lumpur', 2),
(168, 'Mexico', 'Mexico City', 4),
(169, 'Namibia', 'Windhoek', 1),
(170, 'Puerto Rico', 'San Juan', 4),
(171, 'Afghanistan', 'Kabul', 2),
(172, 'Belarus', 'Minsk', 3),
(173, 'Sint Maarten', 'Philipsburg', 4),
(174, 'Tanzania', 'Dodoma', 1),
(175, 'Isle of Man', 'Douglas', 3),
(176, 'Georgia', 'Tbilisi', 2),
(177, 'Croatia', 'Zagreb', 3),
(178, 'Pakistan', 'Islamabad', 2),
(179, 'Kuwait', 'Kuwait City', 2),
(180, 'Spain', 'Madrid', 3),
(181, 'Liechtenstein', 'Vaduz', 3),
(182, 'Panama', 'Panama City', 4),
(183, 'Antigua and Barbuda', 'Saint John\'s', 4),
(184, 'Japan', 'Tokyo', 2),
(185, 'DR Congo', 'Kinshasa', 1),
(186, 'China', 'Beijing', 2),
(187, 'Guadeloupe', 'Basse-Terre', 4),
(188, 'Libya', 'Tripoli', 1),
(189, 'Romania', 'Bucharest', 3),
(190, 'Ireland', 'Dublin', 3),
(191, 'Egypt', 'Cairo', 1),
(192, 'British Indian Ocean Territory', 'Diego Garcia', 1),
(193, 'Saint Martin', 'Marigot', 4),
(194, 'Norfolk Island', 'Kingston', 5),
(195, 'Vietnam', 'Hanoi', 2),
(196, 'Latvia', 'Riga', 3),
(197, 'Tunisia', 'Tunis', 1),
(198, 'Germany', 'Berlin', 3),
(199, 'Samoa', 'Apia', 5),
(200, 'Hong Kong', 'City of Victoria', 2),
(201, 'Mongolia', 'Ulan Bator', 2),
(202, 'Qatar', 'Doha', 2),
(203, 'Cuba', 'Havana', 4),
(204, 'United States', 'Washington, D.C.', 4),
(205, 'Guinea', 'Conakry', 1),
(206, 'Bahamas', 'Nassau', 4),
(207, 'Cook Islands', 'Avarua', 5),
(208, 'Slovenia', 'Ljubljana', 3),
(209, 'Northern Mariana Islands', 'Saipan', 5),
(210, 'South Korea', 'Seoul', 2),
(211, 'Kosovo', 'Pristina', 3),
(212, 'Canada', 'Ottawa', 4),
(213, 'Tokelau', 'Fakaofo', 5),
(214, 'Guam', 'Hagåtña', 5),
(215, 'South Sudan', 'Juba', 1),
(216, 'Suriname', 'Paramaribo', 4),
(217, 'Hungary', 'Budapest', 3),
(218, 'Dominica', 'Roseau', 4),
(219, 'Nepal', 'Kathmandu', 2),
(220, 'Gabon', 'Libreville', 1),
(221, 'Belgium', 'Brussels', 3),
(222, 'Liberia', 'Monrovia', 1),
(223, 'United States Minor Outlying Islands', 'Washington DC', 4),
(224, 'Bhutan', 'Thimphu', 2),
(225, 'Réunion', 'Saint-Denis', 1),
(226, 'Sierra Leone', 'Freetown', 1),
(227, 'Netherlands', 'Amsterdam', 3),
(228, 'Eritrea', 'Asmara', 1),
(229, 'Maldives', 'Malé', 2),
(230, 'Luxembourg', 'Luxembourg', 3),
(231, 'Nauru', 'Yaren', 5),
(232, 'San Marino', 'City of San Marino', 3),
(233, 'Saint Kitts and Nevis', 'Basseterre', 4),
(234, 'Cocos (Keeling) Islands', 'West Island', 5),
(235, 'Falkland Islands', 'Stanley', 4),
(236, 'Vanuatu', 'Port Vila', 5),
(237, 'Cyprus', 'Nicosia', 3),
(238, 'Palestine', 'Ramallah', 2),
(239, 'Serbia', 'Belgrade', 3),
(240, 'Burundi', 'Gitega', 1),
(241, 'Grenada', 'St. George\'s', 4),
(242, 'Tuvalu', 'Funafuti', 5),
(243, 'Jersey', 'Saint Helier', 3),
(244, 'Uzbekistan', 'Tashkent', 2),
(245, 'Kyrgyzstan', 'Bishkek', 2),
(246, 'Poland', 'Warsaw', 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_07_17_094659_create_cache_table', 1),
(2, '2025_07_17_105114_create_flashcards_table', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `decks`
--
ALTER TABLE `decks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country` (`country`),
  ADD KEY `deck_id` (`deck_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `decks`
--
ALTER TABLE `decks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD CONSTRAINT `flashcards_ibfk_1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

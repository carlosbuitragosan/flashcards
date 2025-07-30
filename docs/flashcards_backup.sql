-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2025 at 06:42 PM
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
-- Database: `flashcards`
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `continent` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `decks`
--

INSERT INTO `decks` (`id`, `continent`, `created_at`, `updated_at`) VALUES
(1, 'Europe', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(2, 'Africa', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(3, 'Asia', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(4, 'Oceania', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(5, 'Americas', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(6, 'Antarctic', '2025-07-30 14:36:54', '2025-07-30 14:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `flashcards`
--

CREATE TABLE `flashcards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `capital` varchar(255) NOT NULL,
  `deck_id` bigint(20) UNSIGNED NOT NULL,
  `flag` varchar(255) NOT NULL,
  `flag_alt` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashcards`
--

INSERT INTO `flashcards` (`id`, `country`, `capital`, `deck_id`, `flag`, `flag_alt`, `created_at`, `updated_at`) VALUES
(1, 'Moldova', 'Chișinău', 1, 'https://flagcdn.com/md.svg', 'The flag of Moldova is composed of three equal vertical bands of blue, yellow and red, with the national coat of arms centered in the yellow band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(2, 'Comoros', 'Moroni', 2, 'https://flagcdn.com/km.svg', 'The flag of Comoros is composed of four equal horizontal bands of yellow, white, red and blue, with a green isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about two-fifth the width of the field and bears a fly-side facing white crescent and four five-pointed white stars arranged in a vertical line along the opening of the crescent.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(3, 'Malaysia', 'Kuala Lumpur', 3, 'https://flagcdn.com/my.svg', 'The flag of Malaysia is composed of fourteen equal horizontal bands of red alternating with white. A blue rectangle, bearing a fly-side facing yellow crescent and a fourteen-pointed yellow star placed just outside the crescent opening, is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(4, 'Algeria', 'Algiers', 2, 'https://flagcdn.com/dz.svg', 'The flag of Algeria features two equal vertical bands of green and white. A five-pointed red star within a fly-side facing red crescent is centered over the two-color boundary.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(5, 'Norfolk Island', 'Kingston', 4, 'https://flagcdn.com/nf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(6, 'Slovenia', 'Ljubljana', 1, 'https://flagcdn.com/si.svg', 'The flag of Slovenia is composed of three equal horizontal bands of white, blue and red. The national coat of arms is situated in the upper hoist side of the field centered on the boundary between the white and blue bands.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(7, 'Guyana', 'Georgetown', 5, 'https://flagcdn.com/gy.svg', 'The flag of Guyana has a green field with two isosceles triangles which share a common base on the hoist end. The smaller black-edged red triangle spanning half the width of the field is superimposed on the larger white-edged yellow triangle which spans the full width of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(8, 'South Georgia', 'King Edward Point', 6, 'https://flagcdn.com/gs.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(9, 'Christmas Island', 'Flying Fish Cove', 4, 'https://flagcdn.com/cx.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(10, 'France', 'Paris', 1, 'https://flagcdn.com/fr.svg', 'The flag of France is composed of three equal vertical bands of blue, white and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(11, 'Denmark', 'Copenhagen', 1, 'https://flagcdn.com/dk.svg', 'The flag of Denmark has a red field with a large white cross that extend to the edges of the field. The vertical part of this cross is offset towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(12, 'Kazakhstan', 'Astana', 3, 'https://flagcdn.com/kz.svg', 'The flag of Kazakhstan has a turquoise field, at the center of which is a gold sun with thirty-two rays above a soaring golden steppe eagle. A thin vertical band displays a national ornamental pattern — koshkar-muiz — in gold near the hoist end.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(13, 'Vanuatu', 'Port Vila', 4, 'https://flagcdn.com/vu.svg', 'The flag of Vanuatu is composed of two equal horizontal bands of red and green, with a black isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about two-fifth the width of the field and is enclosed on its sides by the arms of a thin black-edged yellow horizontally oriented Y-shaped band which extends along the boundary of the red and green bands to the fly end of the field. A yellow boar\'s tusk encircling two yellow crossed namele leaves is centered in the triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(14, 'Ukraine', 'Kyiv', 1, 'https://flagcdn.com/ua.svg', 'The flag of Ukraine is composed of two equal horizontal bands of blue and yellow.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(15, 'Liechtenstein', 'Vaduz', 1, 'https://flagcdn.com/li.svg', 'The flag of Liechtenstein is composed of two equal horizontal bands of blue and red, with a golden-yellow crown on the hoist side of the blue band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(16, 'Austria', 'Vienna', 1, 'https://flagcdn.com/at.svg', 'The flag of Austria is composed of three equal horizontal bands of red, white and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(17, 'Kuwait', 'Kuwait City', 3, 'https://flagcdn.com/kw.svg', 'The flag of Kuwait is composed of three equal horizontal bands of green, white and red, with a black trapezium superimposed on the hoist side of the field. This trapezium has its base on the hoist end and spans about one-fourth the width of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(18, 'Andorra', 'Andorra la Vella', 1, 'https://flagcdn.com/ad.svg', 'The flag of Andorra features three equal vertical bands of blue, yellow and red, with the coat of arms of Andorra centered in the yellow band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(19, 'Botswana', 'Gaborone', 2, 'https://flagcdn.com/bw.svg', 'The flag of Botswana has a light blue field with a white-edged black horizontal band across its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(20, 'Faroe Islands', 'Tórshavn', 1, 'https://flagcdn.com/fo.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(21, 'United Arab Emirates', 'Abu Dhabi', 3, 'https://flagcdn.com/ae.svg', 'The flag of United Arab Emirates features a red vertical band on its hoist side that takes up about one-fourth the width of the field and three equal horizontal bands of green, white and black adjoining the vertical band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(22, 'Cameroon', 'Yaoundé', 2, 'https://flagcdn.com/cm.svg', 'The flag of Cameroon is composed of three equal vertical bands of green, red and yellow, with a yellow five-pointed star in the center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(23, 'Russia', 'Moscow', 1, 'https://flagcdn.com/ru.svg', 'The flag of Russia is composed of three equal horizontal bands of white, blue and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(24, 'Jamaica', 'Kingston', 5, 'https://flagcdn.com/jm.svg', 'The flag of Jamaica is divided by a gold diagonal cross into four alternating triangular areas of green at the top and bottom, and black on the hoist and fly sides', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(25, 'Palestine', 'Ramallah', 3, 'https://flagcdn.com/ps.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(26, 'Djibouti', 'Djibouti', 2, 'https://flagcdn.com/dj.svg', 'The flag of Djibouti is composed of two equal horizontal bands of light blue and light green, with a white isosceles triangle superimposed on the hoist side of the field. The triangle has its base on the hoist end, spans about two-fifth the width of the field and bears a red five-pointed star at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(27, 'Kenya', 'Nairobi', 2, 'https://flagcdn.com/ke.svg', 'The flag of Kenya is composed of three equal horizontal bands of black, red with white top and bottom edges, and green. An emblem comprising a red, black and white Maasai shield covering two crossed white spears is superimposed at the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(28, 'Belize', 'Belmopan', 5, 'https://flagcdn.com/bz.svg', 'The flag of Belize has a royal blue field with a thin red horizontal band at the top and bottom of the field and the national coat of arms in the center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(29, 'French Polynesia', 'Papeetē', 4, 'https://flagcdn.com/pf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(30, 'Myanmar', 'Naypyidaw', 3, 'https://flagcdn.com/mm.svg', 'The flag of Myanmar is composed of three equal horizontal bands of yellow, green and red, with a large five-pointed white star superimposed at the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(31, 'Gibraltar', 'Gibraltar', 1, 'https://flagcdn.com/gi.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(32, 'Singapore', 'Singapore', 3, 'https://flagcdn.com/sg.svg', 'The flag of Singapore is composed of two equal horizontal bands of red and white. On the hoist side of the red band is a fly-side facing white crescent which partially encloses five small five-pointed white stars arranged in the shape of a pentagon.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(33, 'Slovakia', 'Bratislava', 1, 'https://flagcdn.com/sk.svg', 'The flag of Slovakia is composed of three equal horizontal bands of white, blue and red. The coat of arms of Slovakia is superimposed at the center of the field slightly towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(34, 'Iceland', 'Reykjavik', 1, 'https://flagcdn.com/is.svg', 'The flag of Iceland has a blue field with a large white-edged red cross that extends to the edges of the field. The vertical part of this cross is offset towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(35, 'Bhutan', 'Thimphu', 3, 'https://flagcdn.com/bt.svg', 'The flag of Bhutan is divided diagonally, from the lower hoist-side corner to the upper fly-side corner, into an upper yellow and a lower orange triangle. A fly-side facing white dragon holding four jewels in its claws is situated along the boundary of the two triangles.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(36, 'North Macedonia', 'Skopje', 1, 'https://flagcdn.com/mk.svg', 'The flag of North Macedonia has a red field, at the center of which is a golden-yellow sun with eight broadening rays that extend to the edges of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(37, 'United States Virgin Islands', 'Charlotte Amalie', 5, 'https://flagcdn.com/vi.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(38, 'Guinea', 'Conakry', 2, 'https://flagcdn.com/gn.svg', 'The flag of Guinea is composed of three equal vertical bands of red, yellow and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(39, 'Hong Kong', 'City of Victoria', 3, 'https://flagcdn.com/hk.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(40, 'Malta', 'Valletta', 1, 'https://flagcdn.com/mt.svg', 'The flag of Malta is composed of two equal vertical bands of white and red. A representation of the George cross edged in red is situated on the upper hoist-side corner of the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(41, 'Afghanistan', 'Kabul', 3, 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg', 'The flag of the Islamic Emirate of Afghanistan has a white field with Arabic inscriptions — the Shahada — in black across its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(42, 'United States', 'Washington, D.C.', 5, 'https://flagcdn.com/us.svg', 'The flag of the United States of America is composed of thirteen equal horizontal bands of red alternating with white. A blue rectangle, bearing fifty small five-pointed white stars arranged in nine rows where rows of six stars alternate with rows of five stars, is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(43, 'Suriname', 'Paramaribo', 5, 'https://flagcdn.com/sr.svg', 'The flag of Suriname is composed of five horizontal bands of green, white, red, white and green in the ratio of 2:1:4:1:2. A large five-pointed yellow star is centered in the red band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(44, 'Guernsey', 'St. Peter Port', 1, 'https://flagcdn.com/gg.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(45, 'Curaçao', 'Willemstad', 5, 'https://flagcdn.com/cw.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(46, 'Vatican City', 'Vatican City', 1, 'https://flagcdn.com/va.svg', 'The flag of Vatican City is square shaped. It is composed of two equal vertical bands of yellow and white, with national coat of arms centered in the white band. The national coat of arms comprises the Papal Tiara superimposed on two crossed keys.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(47, 'Papua New Guinea', 'Port Moresby', 4, 'https://flagcdn.com/pg.svg', 'The flag of Papua New Guinea is divided diagonally, from the upper hoist-side corner to the lower fly-side corner, into a lower black and an upper red triangle. On the hoist side of the lower black triangle is a representation of the Southern Cross constellation made up of one small and four larger five-pointed white stars. A golden Raggiana bird-of-paradise is situated on the fly side of the upper red triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(48, 'Malawi', 'Lilongwe', 2, 'https://flagcdn.com/mw.svg', 'The flag of Malawi is composed of three equal horizontal bands of black, red and green. The top half of a red sun with thirty-one visible rays is centered in the black band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(49, 'Hungary', 'Budapest', 1, 'https://flagcdn.com/hu.svg', 'The flag of Hungary is composed of three equal horizontal bands of red, white and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(50, 'Cambodia', 'Phnom Penh', 3, 'https://flagcdn.com/kh.svg', 'The flag of Cambodia features three horizontal bands of blue, red and blue, with a white depiction of the temple complex, Angkor Wat centered in the red band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(51, 'Ecuador', 'Quito', 5, 'https://flagcdn.com/ec.svg', 'The flag of Ecuador is composed of the horizontal bands of yellow, blue and red, with the yellow band twice the height of the other two bands. The Ecuadorian coat of arms is superimposed in the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(52, 'Canada', 'Ottawa', 5, 'https://flagcdn.com/ca.svg', 'The flag of Canada is composed of a red vertical band on the hoist and fly sides and a central white square that is twice the width of the vertical bands. A large eleven-pointed red maple leaf is centered in the white square.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(53, 'Norway', 'Oslo', 1, 'https://flagcdn.com/no.svg', 'The flag of Norway has a red field with a large white-edged navy blue cross that extends to the edges of the field. The vertical part of this cross is offset towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(54, 'Cayman Islands', 'George Town', 5, 'https://flagcdn.com/ky.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(55, 'Martinique', 'Fort-de-France', 5, 'https://flagcdn.com/mq.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(56, 'Sint Maarten', 'Philipsburg', 5, 'https://flagcdn.com/sx.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(57, 'Mali', 'Bamako', 2, 'https://flagcdn.com/ml.svg', 'The flag of Mali is composed of three equal vertical bands of green, yellow and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(58, 'Samoa', 'Apia', 4, 'https://flagcdn.com/ws.svg', 'The flag of Samoa has a red field. A blue rectangle, bearing a representation of the Southern Cross made up of five large and one smaller five-pointed white stars, is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(59, 'Fiji', 'Suva', 4, 'https://flagcdn.com/fj.svg', 'The flag of Fiji has a light blue field. It features the flag of the United Kingdom — the Union Jack — in the canton and the shield of the national coat of arms centered in the fly half.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(60, 'Colombia', 'Bogotá', 5, 'https://flagcdn.com/co.svg', 'The flag of Colombia is composed of three horizontal bands of yellow, blue and red, with the yellow band twice the height of the other two bands.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(61, 'Cuba', 'Havana', 5, 'https://flagcdn.com/cu.svg', 'The flag of Cuba is composed of five equal horizontal bands of blue alternating with white and a red equilateral triangle superimposed on the hoist side of the field. The triangle has its base on the hoist end, spans about two-fifth the width of the field and bears a white five-pointed star at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(62, 'Thailand', 'Bangkok', 3, 'https://flagcdn.com/th.svg', 'The flag of Thailand is composed of five horizontal bands of red, white, blue, white and red, with the central blue band twice the height of the other four bands.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(63, 'Mongolia', 'Ulan Bator', 3, 'https://flagcdn.com/mn.svg', 'The flag of Mongolia is composed of three equal vertical bands of red, blue and red, with the national emblem — the Soyombo — in gold centered in the hoist-side red band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(64, 'Réunion', 'Saint-Denis', 2, 'https://flagcdn.com/re.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(65, 'Guinea-Bissau', 'Bissau', 2, 'https://flagcdn.com/gw.svg', 'The flag of Guinea-Bissau features a red vertical band on its hoist side that takes up about two-fifth the width of the field, and two equal horizontal bands of yellow and green adjoining the vertical band. A five-pointed black star is centered in the vertical band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(66, 'Argentina', 'Buenos Aires', 5, 'https://flagcdn.com/ar.svg', 'The flag of Argentina features three equal horizontal bands of light blue, white and light blue. A brown-edged golden sun is centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(67, 'Mexico', 'Mexico City', 5, 'https://flagcdn.com/mx.svg', 'The flag of Mexico is composed of three equal vertical bands of green, white and red, with the national coat of arms centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(68, 'Turkmenistan', 'Ashgabat', 3, 'https://flagcdn.com/tm.svg', 'The flag of Turkmenistan has a green field. It features a red vertical band, bearing five carpet guls stacked above two crossed olive branches, near the hoist end of the field. Just to the fly side of the vertical band near the top edge of the field is a hoist-side facing white crescent and five small five-pointed white stars placed just outside the crescent opening.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(69, 'French Southern and Antarctic Lands', 'Port-aux-Français', 6, 'https://flagcdn.com/tf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(70, 'Ethiopia', 'Addis Ababa', 2, 'https://flagcdn.com/et.svg', 'The flag of Ethiopia is composed of three equal horizontal bands of green, yellow and red, with the national emblem superimposed at the center of the field. The national emblem comprises a light blue circle bearing a golden-yellow pentagram with single yellow rays emanating from the angles between the points of the pentagram.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(71, 'Gabon', 'Libreville', 2, 'https://flagcdn.com/ga.svg', 'The flag of Gabon is composed of three equal horizontal bands of green, yellow and blue.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(72, 'South Korea', 'Seoul', 3, 'https://flagcdn.com/kr.svg', 'The flag of South Korea has a white field, at the center of which is a red and blue Taegeuk circle surrounded by four black trigrams, one in each corner.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(73, 'Togo', 'Lomé', 2, 'https://flagcdn.com/tg.svg', 'The flag of Togo is composed of five equal horizontal bands of green alternating with yellow. A red square bearing a five-pointed white star is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(74, 'Ghana', 'Accra', 2, 'https://flagcdn.com/gh.svg', 'The flag of Ghana is composed of three equal horizontal bands of red, gold and green, with a five-pointed black star centered in the gold band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(75, 'Zambia', 'Lusaka', 2, 'https://flagcdn.com/zm.svg', 'The flag of Zambia has a green field, on the fly side of which is a soaring orange African fish eagle above a rectangular area divided into three equal vertical bands of red, black and orange.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(76, 'New Zealand', 'Wellington', 4, 'https://flagcdn.com/nz.svg', 'The flag of New Zealand has a dark blue field with the flag of the United Kingdom — the Union Jack — in the canton and a representation of the Southern Cross constellation, made up of four five-pointed white-edged red stars, on the fly side of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(77, 'Laos', 'Vientiane', 3, 'https://flagcdn.com/la.svg', 'The flag of Laos is composed of three horizontal bands of red, blue and red. The blue band is twice the height of the red bands and bears a white circle at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(78, 'Burundi', 'Gitega', 2, 'https://flagcdn.com/bi.svg', 'The flag of Burundi is divided by a white diagonal cross into four alternating triangular areas of red at the top and bottom, and green on the hoist and fly sides. A white circle, with three green-edged red six-pointed stars arranged to form a triangle, is superimposed at the center of the cross.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(79, 'Pakistan', 'Islamabad', 3, 'https://flagcdn.com/pk.svg', 'The flag of Pakistan is composed of a white vertical band on its hoist side that takes up about one-fourth the width of the field and a dark green rectangular area that spans the rest of the field. A white fly-side facing crescent and five-pointed star are centered in the dark green area.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(80, 'Armenia', 'Yerevan', 3, 'https://flagcdn.com/am.svg', 'The flag of Armenia is composed of three equal horizontal bands of red, blue and orange.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(81, 'Czechia', 'Prague', 1, 'https://flagcdn.com/cz.svg', 'The flag of Czechia is composed of two equal horizontal bands of white and red, with a blue isosceles triangle superimposed on the hoist side of the field. The triangle has its base on the hoist end and spans about two-fifth the width of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(82, 'San Marino', 'City of San Marino', 1, 'https://flagcdn.com/sm.svg', 'The flag of San Marino is composed of two equal horizontal bands of white and light blue, with the national coat of arms superimposed in the center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(83, 'São Tomé and Príncipe', 'São Tomé', 2, 'https://flagcdn.com/st.svg', 'The flag of South Sudan is composed of three equal horizontal bands of black, red with white top and bottom edges, and green. A blue equilateral triangle which spans about two-fifth the width of the field is superimposed on the hoist side with its base on the hoist end of the field. At the center of this triangle is a five-pointed yellow star.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(84, 'Niue', 'Alofi', 4, 'https://flagcdn.com/nu.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(85, 'Bahamas', 'Nassau', 5, 'https://flagcdn.com/bs.svg', 'The flag of the Bahamas is composed of three equal horizontal bands of aquamarine, yellow and aquamarine, with a black equilateral triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end and spans about one-third the width of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(86, 'Finland', 'Helsinki', 1, 'https://flagcdn.com/fi.svg', 'The flag of Finland has a white field with a large blue cross that extend to the edges of the field. The vertical part of this cross is offset towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(87, 'Guatemala', 'Guatemala City', 5, 'https://flagcdn.com/gt.svg', 'The flag of Guatemala is composed of three equal vertical bands of light blue, white and light blue, with the national coat of arms centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(88, 'Sierra Leone', 'Freetown', 2, 'https://flagcdn.com/sl.svg', 'The flag of Sierra Leone is composed of three equal horizontal bands of green, white and blue.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(89, 'Luxembourg', 'Luxembourg', 1, 'https://flagcdn.com/lu.svg', 'The flag of Luxembourg is composed of three equal horizontal bands of red, white and light blue.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(90, 'Tuvalu', 'Funafuti', 4, 'https://flagcdn.com/tv.svg', 'The flag of Tuvalu has a light blue field with the flag of the United Kingdom — the Union Jack — in the canton. A representation of the country\'s nine Islands using nine five-pointed yellow stars is situated in the fly half of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(91, 'Eritrea', 'Asmara', 2, 'https://flagcdn.com/er.svg', 'The flag of Eritrea comprises three triangles — a large red isosceles triangle with its base spanning the hoist end and its apex at the midpoint on the fly end, and a green and blue right-angled triangle above and beneath the red triangle. On the hoist side of the red triangle is a golden vertical olive branch encircled by a golden olive wreath.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(92, 'Jersey', 'Saint Helier', 1, 'https://flagcdn.com/je.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(93, 'Honduras', 'Tegucigalpa', 5, 'https://flagcdn.com/hn.svg', 'The flag of Honduras is composed of three equal horizontal bands of turquoise, white and turquoise, with five small five-pointed turquoise stars arranged in a quincuncial pattern at the center of the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(94, 'Western Sahara', 'El Aaiún', 2, 'https://flagcdn.com/eh.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(95, 'Senegal', 'Dakar', 2, 'https://flagcdn.com/sn.svg', 'The flag of Senegal is composed of three equal vertical bands of green, golden-yellow and red, with a five-pointed green star centered in the golden-yellow band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(96, 'Svalbard and Jan Mayen', 'Longyearbyen', 1, 'https://flagcdn.com/sj.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(97, 'Nepal', 'Kathmandu', 3, 'https://flagcdn.com/np.svg', 'The flag of Nepal is the world\'s only non-quadrilateral flag of a sovereign country. It takes the shape of two adjoining right-angled triangles and has a crimson red field with deep blue edges. Within the smaller upper triangle is an emblem of the upper half of a white sun resting on an upward facing white crescent. The lower triangle bears a white sun with twelve rays.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(98, 'Antigua and Barbuda', 'Saint John\'s', 5, 'https://flagcdn.com/ag.svg', 'The flag of Antigua and Barbuda has a red field with an inverted isosceles triangle based on the top edge and spanning the height of the field. This triangle has three horizontal bands of black, light blue and white, with the light blue band half the height of the two other bands. The top half of a golden-yellow sun is situated in the lower two-third of the black band to depict a rising sun.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(99, 'Cape Verde', 'Praia', 2, 'https://flagcdn.com/cv.svg', 'The flag of Cape Verde is composed of five horizontal bands of blue, white, red, white and blue in the ratio of 6:1:1:1:3. A ring of ten five-pointed yellow stars is centered at three-eighth of the height from the bottom edge and three-eighth of the width from the hoist end of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(100, 'Bangladesh', 'Dhaka', 3, 'https://flagcdn.com/bd.svg', 'The flag of Bangladesh has a dark green field bearing a large red circle that is offset slightly towards the hoist side of center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(101, 'Kyrgyzstan', 'Bishkek', 3, 'https://flagcdn.com/kg.svg', 'The flag of Kyrgyzstan features a yellow sun with forty rays at the center of a red field. At the center of the sun is a stylized depiction of a tunduk.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(102, 'Anguilla', 'The Valley', 5, 'https://flagcdn.com/ai.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(103, 'Nigeria', 'Abuja', 2, 'https://flagcdn.com/ng.svg', 'The flag of Nigeria is composed of three equal vertical bands of green, white and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(104, 'Spain', 'Madrid', 1, 'https://flagcdn.com/es.svg', 'The flag of Spain is composed of three horizontal bands of red, yellow and red, with the yellow band twice the height of the red bands. In the yellow band is the national coat of arms offset slightly towards the hoist side of center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(105, 'British Virgin Islands', 'Road Town', 5, 'https://flagcdn.com/vg.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(106, 'Marshall Islands', 'Majuro', 4, 'https://flagcdn.com/mh.svg', 'The flag of Marshall Islands has a blue field with two broadening adjacent diagonal bands of orange and white that extend from the lower hoist-side corner to the upper fly-side corner of the field. A large white star with twenty-four rays — four large rays at the cardinal points and twenty smaller rays — is situated in the upper hoist-side corner above the diagonal bands.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(107, 'Mayotte', 'Mamoudzou', 2, 'https://flagcdn.com/yt.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(108, 'Qatar', 'Doha', 3, 'https://flagcdn.com/qa.svg', 'The flag of Qatar has a maroon field, on the hoist side of which is a white vertical band that spans about one-third the width of the field and is separated from the rest of the field by nine adjoining fly-side pointing white isosceles triangles that serve as a serrated line.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(109, 'Venezuela', 'Caracas', 5, 'https://flagcdn.com/ve.svg', 'The flag of Venezuela is composed of three equal horizontal bands of yellow, blue and red. At the center of the blue band are eight five-pointed white stars arranged in a horizontal arc.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(110, 'Tunisia', 'Tunis', 2, 'https://flagcdn.com/tn.svg', 'The flag of Tunisia has a red field. A white circle bearing a five-pointed red star within a fly-side facing red crescent is situated at the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(111, 'Monaco', 'Monaco', 1, 'https://flagcdn.com/mc.svg', 'The flag of Monaco is composed of two equal horizontal bands of red and white.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(112, 'United States Minor Outlying Islands', 'Washington DC', 5, 'https://flagcdn.com/um.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(113, 'Central African Republic', 'Bangui', 2, 'https://flagcdn.com/cf.svg', 'The flag of Central African Republic is composed of four equal horizontal bands of blue, white, green and yellow intersected at the center by a vertical red band of equal size as the horizontal bands. A yellow five-pointed star is situated on the hoist side of the blue band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(114, 'Latvia', 'Riga', 1, 'https://flagcdn.com/lv.svg', 'The flag of Latvia has a carmine-red field with a thin white horizontal band across the middle of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(115, 'Uzbekistan', 'Tashkent', 3, 'https://flagcdn.com/uz.svg', 'The flag of Uzbekistan is composed of three equal horizontal bands of turquoise, white with red top and bottom edges, and green. On the hoist side of the turquoise band is a fly-side facing white crescent and twelve five-pointed white stars arranged just outside the crescent opening in three rows comprising three, four and five stars.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(116, 'Brazil', 'Brasília', 5, 'https://flagcdn.com/br.svg', 'The flag of Brazil has a green field with a large yellow rhombus in the center. Within the rhombus is a dark blue globe with twenty-seven small five-pointed white stars depicting a starry sky and a thin white convex horizontal band inscribed with the national motto \'Ordem e Progresso\' across its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(117, 'Cyprus', 'Nicosia', 1, 'https://flagcdn.com/cy.svg', 'The flag of Cyprus has a white field, at the center of which is a copper-colored silhouette of the Island of Cyprus above two green olive branches crossed at the stem.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(118, 'North Korea', 'Pyongyang', 3, 'https://flagcdn.com/kp.svg', 'The flag of North Korea is composed of three horizontal bands — a large central white-edged red band, and a blue band above and beneath the red band. On the hoist side of the red band is a red five-pointed star within a white circle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(119, 'Dominica', 'Roseau', 5, 'https://flagcdn.com/dm.svg', 'The flag of Dominica has a green field with a large centered tricolor cross. The vertical and horizontal parts of the cross each comprise three bands of yellow, black and white. A red circle, bearing a hoist-side facing purple Sisserou parrot standing on a twig and encircled by ten five-pointed yellow-edged green stars, is superimposed at the center of the cross.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(120, 'Bosnia and Herzegovina', 'Sarajevo', 1, 'https://flagcdn.com/ba.svg', 'The flag of Bosnia and Herzegovina has a blue field, at the center of which is a large yellow hoist-side facing right-angled triangle that is based on the top edge and spans the height of the field. Adjacent to the hypotenuse of this triangle are nine adjoining five-pointed white stars with the top and bottom stars cut in half by the edges of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(121, 'Cocos (Keeling) Islands', 'West Island', 4, 'https://flagcdn.com/cc.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(122, 'Sri Lanka', 'Sri Jayawardenepura Kotte', 3, 'https://flagcdn.com/lk.svg', 'The flag of Sri Lanka features two large adjacent but separate rectangular areas, centered on a golden-yellow field. The smaller hoist-side rectangle is divided into two equal vertical bands of teal and orange, and the larger fly-side rectangle is maroon with a centered golden-yellow lion holding a Kastane sword in its right fore-paw and four golden-yellow Bo leaves, one in each corner.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(123, 'Republic of the Congo', 'Brazzaville', 2, 'https://flagcdn.com/cg.svg', 'The flag of the Republic of the Congo features a yellow diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. Above and beneath this band are a green and red triangle respectively.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(124, 'Israel', 'Jerusalem', 3, 'https://flagcdn.com/il.svg', 'The flag of Israel has a white field with a blue hexagram — the Magen David — centered between two equal horizontal blue bands situated near the top and bottom edges of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(125, 'Namibia', 'Windhoek', 2, 'https://flagcdn.com/na.svg', 'The flag of Namibia features a white-edged red diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. Above and beneath this band are a blue and green triangle respectively. A gold sun with twelve triangular rays is situated on the hoist side of the upper triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(126, 'Micronesia', 'Palikir', 4, 'https://flagcdn.com/fm.svg', 'The flag of Micronesia has a light blue field, at the center of which are four five-pointed white stars arranged in the shape of a diamond.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(127, 'South Sudan', 'Juba', 2, 'https://flagcdn.com/ss.svg', 'The flag of South Sudan is composed of three equal horizontal bands of black, red with white top and bottom edges, and green. A blue equilateral triangle which spans about two-fifth the width of the field is superimposed on the hoist side with its base on the hoist end of the field. At the center of this triangle is a five-pointed yellow star.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(128, 'Rwanda', 'Kigali', 2, 'https://flagcdn.com/rw.svg', 'The flag of Rwanda is composed of three horizontal bands of light blue, yellow and green. The light blue band is twice the height of the other two bands and bears a yellow sun with twenty-four rays on its fly side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(129, 'Uganda', 'Kampala', 2, 'https://flagcdn.com/ug.svg', 'The flag of Uganda is composed of six equal horizontal bands of black, yellow, red, black, yellow and red. A white circle bearing a hoist-side facing grey red-crested crane is superimposed in the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(130, 'Portugal', 'Lisbon', 1, 'https://flagcdn.com/pt.svg', 'The flag of Portugal is composed of two vertical bands of green and red in the ratio of 2:3, with the coat of arms of Portugal centered over the two-color boundary.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(131, 'Bolivia', 'Sucre', 5, 'https://flagcdn.com/bo.svg', 'The flag of Bolivia is composed of three equal horizontal bands of red, yellow and green, with the national coat of arms centered in the yellow band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(132, 'Lesotho', 'Maseru', 2, 'https://flagcdn.com/ls.svg', 'The flag of Lesotho is composed of three horizontal bands of blue, white and green in the ratio of 3:4:3. A black mokorotlo — a Basotho hat — is centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(133, 'Chad', 'N\'Djamena', 2, 'https://flagcdn.com/td.svg', 'The flag of Chad is composed of three equal vertical bands of blue, gold and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(134, 'Saint Helena, Ascension and Tristan da Cunha', 'Jamestown', 2, 'https://flagcdn.com/sh.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(135, 'Cook Islands', 'Avarua', 4, 'https://flagcdn.com/ck.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(136, 'Saint Pierre and Miquelon', 'Saint-Pierre', 5, 'https://flagcdn.com/pm.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(137, 'Lithuania', 'Vilnius', 1, 'https://flagcdn.com/lt.svg', 'The flag of Lithuania is composed of three equal horizontal bands of yellow, green and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(138, 'Montenegro', 'Podgorica', 1, 'https://flagcdn.com/me.svg', 'The flag of Montenegro features a large red central rectangular area surrounded by a golden-yellow border. The coat of arms of Montenegro is centered in the red rectangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(139, 'Oman', 'Muscat', 3, 'https://flagcdn.com/om.svg', 'The flag of Oman features a red vertical band on the hoist side that takes up about one-fourth the width of the field, and three equal horizontal bands of white, red and green adjoining the vertical band. At the top of the vertical band is the white emblem of Oman.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(140, 'Sudan', 'Khartoum', 2, 'https://flagcdn.com/sd.svg', 'The flag of Sudan is composed of three equal horizontal bands of red, white and black, with a green isosceles triangle superimposed on the hoist side. The green triangle spans about two-fifth the width of the field with its base on the hoist end.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(141, 'Brunei', 'Bandar Seri Begawan', 3, 'https://flagcdn.com/bn.svg', 'The flag of Brunei has a yellow field with two adjoining diagonal bands of white and black that extend from the upper hoist side of the field to the lower fly side. The red emblem of Brunei is centered on the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(142, 'DR Congo', 'Kinshasa', 2, 'https://flagcdn.com/cd.svg', 'The flag of the Democratic Republic of the Congo has a sky-blue field with a yellow-edged red diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. A large five-pointed yellow star is situated above the diagonal band on the upper hoist side of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(143, 'Greece', 'Athens', 1, 'https://flagcdn.com/gr.svg', 'The flag of Greece is composed of nine equal horizontal bands of blue alternating with white. A blue square bearing a white cross is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(144, 'Albania', 'Tirana', 1, 'https://flagcdn.com/al.svg', 'The flag of Albania features a silhouetted double-headed black eagle at the center of a red field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(145, 'Tanzania', 'Dodoma', 2, 'https://flagcdn.com/tz.svg', 'The flag of Tanzania features a yellow-edged black diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. Above and beneath this band are a green and light blue triangle respectively.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(146, 'Georgia', 'Tbilisi', 3, 'https://flagcdn.com/ge.svg', 'The flag of Georgia has a white field with a large centered red cross that extends to the edges and divides the field into four quarters. A small red Bolnur-Katskhuri cross is centered in each quarter.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(147, 'Japan', 'Tokyo', 3, 'https://flagcdn.com/jp.svg', 'The flag of Japan features a crimson-red circle at the center of a white field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(148, 'Saudi Arabia', 'Riyadh', 3, 'https://flagcdn.com/sa.svg', 'The flag of Saudi Arabia has a green field, at the center of which is an Arabic inscription — the Shahada — in white above a white horizontal sabre with its tip pointed to the hoist side of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(149, 'Croatia', 'Zagreb', 1, 'https://flagcdn.com/hr.svg', 'The flag of Croatia is composed of three equal horizontal bands of red, white and blue, with coat of arms of Croatia superimposed in the center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(150, 'Solomon Islands', 'Honiara', 4, 'https://flagcdn.com/sb.svg', 'The flag of Solomon Islands features a thin yellow diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. Above and beneath this band are a blue and green triangle respectively. Five white five-pointed stars arranged in an X shape are situated on the hoist side of the upper blue triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(151, 'Yemen', 'Sana\'a', 3, 'https://flagcdn.com/ye.svg', 'The flag of Yemen is composed of three equal horizontal bands of red, white and black.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(152, 'Somalia', 'Mogadishu', 2, 'https://flagcdn.com/so.svg', 'The flag of Somalia features a large five-pointed white star centered on a light blue field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(153, 'Grenada', 'St. George\'s', 5, 'https://flagcdn.com/gd.svg', 'The flag of Grenada features a large central rectangular area surrounded by a red border, with three five-pointed yellow stars centered on the top and bottom borders. The central rectangle is divided diagonally into four alternating triangular areas of yellow at the top and bottom and green on the hoist and fly sides, and a five-pointed yellow star on a red circle is superimposed at its center. A symbolic nutmeg pod is situated on the green hoist-side triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(154, 'Tonga', 'Nuku\'alofa', 4, 'https://flagcdn.com/to.svg', 'The flag of Tonga has a red field. A white rectangle bearing a red Greek cross is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(155, 'Nicaragua', 'Managua', 5, 'https://flagcdn.com/ni.svg', 'The flag of Nicaragua is composed of three equal horizontal bands of blue, white and blue, with the national coat of arms centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(156, 'Paraguay', 'Asunción', 5, 'https://flagcdn.com/py.svg', 'The flag of Paraguay features three equal horizontal bands of red, white and blue, with an emblem centered in the white band. On the obverse side of the flag depicted, this emblem is the national coat of arms.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(157, 'India', 'New Delhi', 3, 'https://flagcdn.com/in.svg', 'The flag of India is composed of three equal horizontal bands of saffron, white and green. A navy blue wheel with twenty-four spokes — the Ashoka Chakra — is centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(158, 'United Kingdom', 'London', 1, 'https://flagcdn.com/gb.svg', 'The flag of the United Kingdom — the Union Jack — has a blue field. It features the white-edged red cross of Saint George superimposed on the diagonal red cross of Saint Patrick which is superimposed on the diagonal white cross of Saint Andrew.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(159, 'Eswatini', 'Mbabane', 2, 'https://flagcdn.com/sz.svg', 'The flag of Eswatini is composed of three horizontal bands — a large central yellow-edged red band, and a light blue band above and beneath the red band. The red band is three times the height of the blue bands and bears a centered emblem made up of a large black and white Nguni shield covering two spears and a staff decorated with feather tassels, all placed horizontally.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(160, 'Madagascar', 'Antananarivo', 2, 'https://flagcdn.com/mg.svg', 'The flag of Madagascar features a white vertical band on the hoist side that takes up about one-third the width of the field, and two equal horizontal bands of red and green adjoining the vertical band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(161, 'Equatorial Guinea', 'Malabo', 2, 'https://flagcdn.com/gq.svg', 'The flag of Equatorial Guinea is composed of three equal horizontal bands of green, white and red with the national coat of arms centered in the white band and an isosceles triangle superimposed on the hoist side of the field. The triangle is light blue, has its base on the hoist end and spans about one-fifth the width of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(162, 'Jordan', 'Amman', 3, 'https://flagcdn.com/jo.svg', 'The flag of Jordan is composed of three equal horizontal bands of black, white and green, with a red isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about half the width of the field and bears a small seven-pointed white star at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(163, 'Guadeloupe', 'Basse-Terre', 5, 'https://flagcdn.com/gp.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(164, 'Belarus', 'Minsk', 1, 'https://flagcdn.com/by.svg', 'The flag of Belarus features a vertical band, with a white and red ornamental pattern, spanning about one-fifth the width of the field on the hoist side. Adjoining the vertical band are two horizontal bands of red and green, with the red band twice the height of the green band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(165, 'Maldives', 'Malé', 3, 'https://flagcdn.com/mv.svg', 'The flag of Maldives has a red field, at the center of which is a large green rectangle bearing a fly-side facing white crescent.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(166, 'Timor-Leste', 'Dili', 3, 'https://flagcdn.com/tl.svg', 'The flag of Timor-Leste has a red field with two isosceles triangles which share a common base on the hoist end. The smaller black triangle, which bears a five-pointed white star at its center and spans one-third the width of the field, is superimposed on the larger yellow triangle that extends to the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(167, 'Serbia', 'Belgrade', 1, 'https://flagcdn.com/rs.svg', 'The flag of Serbia is composed of three equal horizontal bands of red, blue and white. The coat of arms of Serbia is superimposed at the center of the field slightly towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(168, 'Ireland', 'Dublin', 1, 'https://flagcdn.com/ie.svg', 'The flag of Ireland is composed of three equal vertical bands of green, white and orange.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(169, 'Chile', 'Santiago', 5, 'https://flagcdn.com/cl.svg', 'The flag of Chile is composed of two equal horizontal bands of white and red, with a blue square of the same height as the white band superimposed in the canton. A white five-pointed star is centered in the blue square.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(170, 'Iraq', 'Baghdad', 3, 'https://flagcdn.com/iq.svg', 'The flag of Iraq is composed of three equal horizontal bands of red, white and black. In the central white band are Arabic inscriptions in green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(171, 'Philippines', 'Manila', 3, 'https://flagcdn.com/ph.svg', 'The flag of Philippines is composed of two equal horizontal bands of blue and red, with a white equilateral triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about two-fifth the width of the field and bears a central golden-yellow sun with eight rays and a five-pointed golden-yellow star at each vertex.', '2025-07-30 14:36:54', '2025-07-30 14:36:54');
INSERT INTO `flashcards` (`id`, `country`, `capital`, `deck_id`, `flag`, `flag_alt`, `created_at`, `updated_at`) VALUES
(172, 'South Africa', 'Pretoria', 2, 'https://flagcdn.com/za.svg', 'The flag of South Africa is composed of two equal horizontal bands of red and blue, with a yellow-edged black isosceles triangle superimposed on the hoist side of the field. This triangle has its base centered on the hoist end, spans about two-fifth the width and two-third the height of the field, and is enclosed on its sides by the arms of a white-edged green horizontally oriented Y-shaped band which extends along the boundary of the red and blue bands to the fly end of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(173, 'Benin', 'Porto-Novo', 2, 'https://flagcdn.com/bj.svg', 'The flag of Benin features a green vertical band on its hoist side that takes up about two-fifth the width of the field and two equal horizontal bands of yellow and red adjoining the vertical band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(174, 'Bulgaria', 'Sofia', 1, 'https://flagcdn.com/bg.svg', 'The flag of Bulgaria is composed of three equal horizontal bands of white, green and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(175, 'Indonesia', 'Jakarta', 3, 'https://flagcdn.com/id.svg', 'The flag of Indonesia is composed of two equal horizontal bands of red and white.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(176, 'Mauritania', 'Nouakchott', 2, 'https://flagcdn.com/mr.svg', 'The flag of Mauritania has a green field with a thin red horizontal band at the top and bottom of the field. At the center of the field is a five-pointed yellow star above an upward facing yellow crescent.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(177, 'Seychelles', 'Victoria', 2, 'https://flagcdn.com/sc.svg', 'The flag of Seychelles is composed of five broadening oblique bands of blue, yellow, red, white and green, which extend from the hoist side of the bottom edge to the top and fly edges of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(178, 'Romania', 'Bucharest', 1, 'https://flagcdn.com/ro.svg', 'The flag of Romania is composed of three equal vertical bands of navy blue, yellow and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(179, 'Turkey', 'Ankara', 3, 'https://flagcdn.com/tr.svg', 'The flag of Turkey has a red field bearing a large fly-side facing white crescent and a smaller five-pointed white star placed just outside the crescent opening. The white crescent and star are offset slightly towards the hoist side of center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(180, 'Burkina Faso', 'Ouagadougou', 2, 'https://flagcdn.com/bf.svg', 'The flag of Burkina Faso features two equal horizontal bands of red and green, with a yellow five-pointed star in the center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(181, 'Bermuda', 'Hamilton', 5, 'https://flagcdn.com/bm.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(182, 'New Caledonia', 'Nouméa', 4, 'https://flagcdn.com/nc.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(183, 'Egypt', 'Cairo', 2, 'https://flagcdn.com/eg.svg', 'The flag of Egypt is composed of three equal horizontal bands of red, white and black, with Egypt\'s national emblem — a hoist-side facing gold eagle of Saladin — centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(184, 'Vietnam', 'Hanoi', 3, 'https://flagcdn.com/vn.svg', 'The flag of Vietnam features a large five-pointed yellow star on a red field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(185, 'Puerto Rico', 'San Juan', 5, 'https://flagcdn.com/pr.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(186, 'Trinidad and Tobago', 'Port of Spain', 5, 'https://flagcdn.com/tt.svg', 'The flag of Trinidad and Tobago has a red field with a white-edged black diagonal band that extends from the upper hoist-side corner to the lower fly-side corner of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(187, 'Falkland Islands', 'Stanley', 5, 'https://flagcdn.com/fk.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(188, 'Angola', 'Luanda', 2, 'https://flagcdn.com/ao.svg', 'The flag of Angola features two equal horizontal bands of red and black, with a yellow emblem at its centre. This emblem consists of a five-pointed star within the hoist-side facing half of a cogwheel that is crossed on its lower end by a machete.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(189, 'China', 'Beijing', 3, 'https://flagcdn.com/cn.svg', 'The flag of China has a red field. In the canton are five yellow five-pointed stars — a large star and four smaller stars arranged in a vertical arc on the fly side of the large star.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(190, 'Montserrat', 'Plymouth', 5, 'https://flagcdn.com/ms.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(191, 'Turks and Caicos Islands', 'Cockburn Town', 5, 'https://flagcdn.com/tc.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(192, 'Åland Islands', 'Mariehamn', 1, 'https://flagcdn.com/ax.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(193, 'Costa Rica', 'San José', 5, 'https://flagcdn.com/cr.svg', 'The flag of Costa Rica is composed of five horizontal bands of blue, white, red, white and blue. The central red band is twice the height of the other four bands.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(194, 'Uruguay', 'Montevideo', 5, 'https://flagcdn.com/uy.svg', 'The flag of Uruguay is composed of nine equal horizontal bands of white alternating with blue, with a white square superimposed in the canton. In the white square is a yellow sun bearing a human face — the Sun of May — from which sixteen rays extend. The sun\'s rays alternate between triangular and wavy.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(195, 'Morocco', 'Rabat', 2, 'https://flagcdn.com/ma.svg', 'The flag of Morocco features a green pentagram — a five-pointed linear star — centered on a red field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(196, 'Estonia', 'Tallinn', 1, 'https://flagcdn.com/ee.svg', 'The flag of Estonia is composed of three equal horizontal bands of blue, black and white.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(197, 'Saint Lucia', 'Castries', 5, 'https://flagcdn.com/lc.svg', 'The flag of Saint Lucia has a light blue field, at the center of which are two triangles which share a common base — a small golden-yellow isosceles triangle superimposed on a large white-edged black isosceles triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(198, 'Taiwan', 'Taipei', 3, 'https://flagcdn.com/tw.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(199, 'Haiti', 'Port-au-Prince', 5, 'https://flagcdn.com/ht.svg', 'The flag of Haiti is composed of two equal horizontal bands of blue and red. A white square bearing the national coat of arms is superimposed at the center of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(200, 'Tajikistan', 'Dushanbe', 3, 'https://flagcdn.com/tj.svg', 'The flag of Tajikistan is composed of three horizontal bands of red, white and green in the ratio of 2:3:2. A golden-yellow crown surmounted by an arc of seven five-pointed golden-yellow stars is centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(201, 'Niger', 'Niamey', 2, 'https://flagcdn.com/ne.svg', 'The flag of Niger features three equal horizontal bands of orange, white and green, with an orange circle centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(202, 'Lebanon', 'Beirut', 3, 'https://flagcdn.com/lb.svg', 'The flag of Lebanon is composed of three horizontal bands of red, white and red. The white band is twice the height of the red bands and bears a green Lebanese Cedar tree at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(203, 'Australia', 'Canberra', 4, 'https://flagcdn.com/au.svg', 'The flag of Australia has a dark blue field. It features the flag of the United Kingdom — the Union Jack — in the canton, beneath which is a large white seven-pointed star. A representation of the Southern Cross constellation, made up of one small five-pointed and four larger seven-pointed white stars, is situated on the fly side of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(204, 'Liberia', 'Monrovia', 2, 'https://flagcdn.com/lr.svg', 'The flag of Liberia is composed of eleven equal horizontal bands of red alternating with white. A blue square bearing a five-pointed white star is superimposed in the canton.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(205, 'Italy', 'Rome', 1, 'https://flagcdn.com/it.svg', 'The flag of Italy is composed of three equal vertical bands of green, white and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(206, 'Northern Mariana Islands', 'Saipan', 4, 'https://flagcdn.com/mp.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(207, 'Saint Martin', 'Marigot', 5, 'https://flagcdn.com/mf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(208, 'Nauru', 'Yaren', 4, 'https://flagcdn.com/nr.svg', 'The flag of Nauru has a dark blue field with a thin yellow horizontal band across the center and a large white twelve-pointed star beneath the horizontal band on the hoist side of the field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(209, 'Switzerland', 'Bern', 1, 'https://flagcdn.com/ch.svg', 'The flag of Switzerland is square shaped. It features a white Swiss cross centered on a red field.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(210, 'Peru', 'Lima', 5, 'https://flagcdn.com/pe.svg', 'The flag of Peru is composed of three equal vertical bands of red, white and red, with the national emblem centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(211, 'Libya', 'Tripoli', 2, 'https://flagcdn.com/ly.svg', 'The flag of Libya is composed of three horizontal bands of red, black and green, with the black band twice the height of the other two bands. At the center of the black band is a fly-side facing white crescent and a five-pointed white star placed just outside the crescent opening.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(212, 'Germany', 'Berlin', 1, 'https://flagcdn.com/de.svg', 'The flag of Germany is composed of three equal horizontal bands of black, red and gold.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(213, 'Kosovo', 'Pristina', 1, 'https://flagcdn.com/xk.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(214, 'Guam', 'Hagåtña', 4, 'https://flagcdn.com/gu.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(215, 'Bahrain', 'Manama', 3, 'https://flagcdn.com/bh.svg', 'The flag of Bahrain has a red field. On the hoist side, it features a white vertical band that spans about one-third the width of the field and is separated from the rest of the field by five adjoining fly-side pointing white isosceles triangles that serve as a serrated line.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(216, 'Wallis and Futuna', 'Mata-Utu', 4, 'https://flagcdn.com/wf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(217, 'Iran', 'Tehran', 3, 'https://flagcdn.com/ir.svg', 'The flag of Iran is composed of three equal horizontal bands of green, white and red. A red emblem of Iran is centered in the white band and Arabic inscriptions in white span the bottom edge of the green band and the top edge of the red band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(218, 'Panama', 'Panama City', 5, 'https://flagcdn.com/pa.svg', 'The flag of Panama is composed of four equal rectangular areas — a white rectangular area with a blue five-pointed star at its center, a red rectangular area, a white rectangular area with a red five-pointed star at its center, and a blue rectangular area — in the upper hoist side, upper fly side, lower fly side and lower hoist side respectively.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(219, 'Tokelau', 'Fakaofo', 4, 'https://flagcdn.com/tk.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(220, 'Syria', 'Damascus', 3, 'https://flagcdn.com/sy.svg', 'The flag of Syria is composed of three equal horizontal bands of red, white and black. At the center of the white band are two small five-pointed green stars arranged in a horizontal line.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(221, 'Saint Kitts and Nevis', 'Basseterre', 5, 'https://flagcdn.com/kn.svg', 'The flag of Saint Kitts and Nevis features two large five-pointed white stars within a yellow-edged black diagonal band that extends from the lower hoist-side corner to the upper fly-side corner of the field. Above and beneath this band are a green and red triangle respectively.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(222, 'Gambia', 'Banjul', 2, 'https://flagcdn.com/gm.svg', 'The flag of Gambia is composed of three equal horizontal bands of red, blue with white top and bottom edges, and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(223, 'Caribbean Netherlands', 'Kralendijk', 5, 'https://flagcdn.com/bq.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(224, 'British Indian Ocean Territory', 'Diego Garcia', 2, 'https://flagcdn.com/io.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(225, 'Netherlands', 'Amsterdam', 1, 'https://flagcdn.com/nl.svg', 'The flag of the Netherlands is composed of three equal horizontal bands of red, white and blue.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(226, 'El Salvador', 'San Salvador', 5, 'https://flagcdn.com/sv.svg', 'The flag of El Salvador is composed of three equal horizontal bands of cobalt blue, white and cobalt blue, with the national coat of arms centered in the white band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(227, 'Ivory Coast', 'Yamoussoukro', 2, 'https://flagcdn.com/ci.svg', 'The flag of Ivory Coast is composed of three equal vertical bands of orange, white and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(228, 'Kiribati', 'South Tarawa', 4, 'https://flagcdn.com/ki.svg', 'The flag of Kiribati is divided into two halves. While the upper half has a red field, at the center of which is a yellow frigate bird flying over the top half of a rising yellow sun with seventeen visible rays, the lower half is composed of six horizontal wavy bands of white alternating with blue to depict the ocean.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(229, 'Saint Barthélemy', 'Gustavia', 5, 'https://flagcdn.com/bl.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(230, 'American Samoa', 'Pago Pago', 4, 'https://flagcdn.com/as.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(231, 'Aruba', 'Oranjestad', 5, 'https://flagcdn.com/aw.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(232, 'French Guiana', 'Cayenne', 5, 'https://flagcdn.com/gf.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(233, 'Palau', 'Ngerulmud', 4, 'https://flagcdn.com/pw.svg', 'The flag of Palau has a light blue field with a large golden-yellow circle that is offset slightly towards the hoist side of center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(234, 'Saint Vincent and the Grenadines', 'Kingstown', 5, 'https://flagcdn.com/vc.svg', 'The flag of Saint Vincent and the Grenadines is composed of three vertical bands of blue, gold and green. The gold band is twice as wide as the other two bands and bears three green diamonds arranged to form the letter V at its center.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(235, 'Poland', 'Warsaw', 1, 'https://flagcdn.com/pl.svg', 'The flag of Poland is composed of two equal horizontal bands of white and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(236, 'Barbados', 'Bridgetown', 5, 'https://flagcdn.com/bb.svg', 'The flag of Barbados is composed of three equal vertical bands of ultramarine, gold and ultramarine. The head of a black trident is centered in the gold band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(237, 'Isle of Man', 'Douglas', 1, 'https://flagcdn.com/im.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(238, 'Greenland', 'Nuuk', 5, 'https://flagcdn.com/gl.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(239, 'Zimbabwe', 'Harare', 2, 'https://flagcdn.com/zw.svg', 'The flag of Zimbabwe is composed of seven equal horizontal bands of green, yellow, red, black, red, yellow and green, with a white isosceles triangle superimposed on the hoist side of the field. This triangle is edged in black, spans about one-fourth the width of the field and has its base on the hoist end. A yellow Zimbabwe bird superimposed on a five-pointed red star is centered in the triangle.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(240, 'Pitcairn Islands', 'Adamstown', 4, 'https://flagcdn.com/pn.svg', '', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(241, 'Sweden', 'Stockholm', 1, 'https://flagcdn.com/se.svg', 'The flag of Sweden has a blue field with a large golden-yellow cross that extend to the edges of the field. The vertical part of this cross is offset towards the hoist side.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(242, 'Dominican Republic', 'Santo Domingo', 5, 'https://flagcdn.com/do.svg', 'The flag of the Dominican Republic is divided into four rectangles by a centered white cross that extends to the edges of the field and bears the national coat of arms in its center. The upper hoist-side and lower fly-side rectangles are blue and the lower hoist-side and upper fly-side rectangles are red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(243, 'Belgium', 'Brussels', 1, 'https://flagcdn.com/be.svg', 'The flag of Belgium is composed of three equal vertical bands of black, yellow and red.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(244, 'Mozambique', 'Maputo', 2, 'https://flagcdn.com/mz.svg', 'The flag of Mozambique is composed of three equal horizontal bands of teal, black with white top and bottom edges, and yellow. A red isosceles triangle spanning about two-fifth the width of the field is superimposed on the hoist side with its base on the hoist end. This triangle bears a crossed rifle and hoe in black superimposed on an open white book which is superimposed on a five-pointed yellow star.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(245, 'Mauritius', 'Port Louis', 2, 'https://flagcdn.com/mu.svg', 'The flag of Mauritius is composed of four equal horizontal bands of red, blue, yellow and green.', '2025-07-30 14:36:54', '2025-07-30 14:36:54'),
(246, 'Azerbaijan', 'Baku', 3, 'https://flagcdn.com/az.svg', 'The flag of Azerbaijan features three equal horizontal bands of blue, red and green, with a white fly-side facing crescent and eight-pointed star centered in the red band.', '2025-07-30 14:36:54', '2025-07-30 14:36:54');

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
(2, '2025_07_24_084343_create_decks_table', 1),
(3, '2025_07_25_105114_create_flashcards_table', 1);

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
  ADD KEY `flashcards_deck_id_foreign` (`deck_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD CONSTRAINT `flashcards_deck_id_foreign` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

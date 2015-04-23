-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 23. apr 2015 ob 11.47
-- Različica strežnika: 5.6.20
-- Različica PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Zbirka podatkov: `jquery`
--

-- --------------------------------------------------------

--
-- Struktura tabele `dijak`
--

CREATE TABLE IF NOT EXISTS `dijak` (
`id_d` int(11) NOT NULL,
  `ime` varchar(20) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `priimek` varchar(20) COLLATE utf8_slovenian_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=4 ;

--
-- Odloži podatke za tabelo `dijak`
--

INSERT INTO `dijak` (`id_d`, `ime`, `priimek`) VALUES
(1, 'Klemen', 'Brodej'),
(2, 'Marsel', 'Bogar'),
(3, 'Denis', 'Zdovc');

-- --------------------------------------------------------

--
-- Struktura tabele `ocene`
--

CREATE TABLE IF NOT EXISTS `ocene` (
`id_ocene` int(11) NOT NULL,
  `ocena` varchar(20) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `komentrat` varchar(20) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `id_p` int(11) DEFAULT NULL,
  `id_d` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=3 ;

--
-- Odloži podatke za tabelo `ocene`
--

INSERT INTO `ocene` (`id_ocene`, `ocena`, `komentrat`, `id_p`, `id_d`) VALUES
(1, '5', 'Odlicno', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabele `predmer`
--

CREATE TABLE IF NOT EXISTS `predmer` (
`id_p` int(11) NOT NULL,
  `ime_predmeta` varchar(20) COLLATE utf8_slovenian_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=3 ;

--
-- Odloži podatke za tabelo `predmer`
--

INSERT INTO `predmer` (`id_p`, `ime_predmeta`) VALUES
(1, 'Ang'),
(2, 'Slo');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `dijak`
--
ALTER TABLE `dijak`
 ADD PRIMARY KEY (`id_d`);

--
-- Indeksi tabele `ocene`
--
ALTER TABLE `ocene`
 ADD PRIMARY KEY (`id_ocene`), ADD KEY `IX_Relationship1` (`id_p`), ADD KEY `IX_Relationship2` (`id_d`);

--
-- Indeksi tabele `predmer`
--
ALTER TABLE `predmer`
 ADD PRIMARY KEY (`id_p`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `dijak`
--
ALTER TABLE `dijak`
MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT tabele `ocene`
--
ALTER TABLE `ocene`
MODIFY `id_ocene` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabele `predmer`
--
ALTER TABLE `predmer`
MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `ocene`
--
ALTER TABLE `ocene`
ADD CONSTRAINT `Relationship1` FOREIGN KEY (`id_p`) REFERENCES `predmer` (`id_p`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Relationship2` FOREIGN KEY (`id_d`) REFERENCES `dijak` (`id_d`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

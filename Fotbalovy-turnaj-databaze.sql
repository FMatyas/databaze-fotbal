-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 05. pro 2025, 11:20
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `neco`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `hrac`
--

CREATE TABLE `hrac` (
  `id_hrace` int(11) NOT NULL,
  `id_aktualniho_tymu` int(11) NOT NULL,
  `jmeno` varchar(255) NOT NULL,
  `prijmeni` varchar(255) NOT NULL,
  `pohlavi` enum('muž','žena') NOT NULL,
  `datum_narozeni` date DEFAULT NULL,
  `pocet_golu` int(11) NOT NULL DEFAULT 0,
  `pozice` enum('Brankář','Obránce','Záložník','Útočník') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `hrac`
--

INSERT INTO `hrac` (`id_hrace`, `id_aktualniho_tymu`, `jmeno`, `prijmeni`, `pohlavi`, `datum_narozeni`, `pocet_golu`, `pozice`) VALUES
(1, 1, 'Jindřich', 'Staněk', 'muž', '1996-04-27', 0, 'Brankář'),
(2, 1, 'Tomáš', 'Holeš', 'muž', '1993-03-31', 0, 'Obránce'),
(3, 3, 'Gabriel', 'Martinelli', 'muž', '2001-06-18', 4, 'Záložník'),
(4, 3, 'Bukayo', 'Saka', 'muž', '2001-09-05', 2, 'Útočník'),
(5, 2, 'Nico', 'Williams', 'muž', '2002-07-12', 0, 'Útočník'),
(6, 2, 'Unai', 'Simon', 'muž', '1997-06-11', 0, 'Brankář'),
(7, 4, 'Ademola', 'Lookman', 'muž', '1997-10-20', 1, 'Útočník'),
(8, 4, 'Charles', 'De Ketelaere', 'muž', '2001-03-10', 1, 'Záložník'),
(9, 5, 'Lautaro', 'Martinez', 'muž', '1997-08-22', 4, 'Útočník'),
(10, 5, 'Alessandro', 'Bastoni', 'muž', '1999-04-13', 0, 'Obránce'),
(11, 6, 'Kasper', 'Hogh', 'muž', '2000-12-06', 1, 'Útočník'),
(12, 6, 'Ole', 'Blomberg', 'muž', '2000-06-12', 1, 'Útočník');

-- --------------------------------------------------------

--
-- Struktura tabulky `hraci_v_zapase`
--

CREATE TABLE `hraci_v_zapase` (
  `id_hrace` int(11) NOT NULL,
  `id_zapasu` int(11) NOT NULL,
  `odehrane_minuty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `hraci_v_zapase`
--

INSERT INTO `hraci_v_zapase` (`id_hrace`, `id_zapasu`, `odehrane_minuty`) VALUES
(1, 1, 90),
(1, 2, 0),
(2, 1, 18),
(2, 2, 0),
(3, 3, 25),
(3, 5, 40),
(4, 3, 90),
(4, 5, 78),
(5, 3, 65),
(5, 4, 65),
(6, 3, 90),
(6, 4, 90),
(7, 2, 70),
(7, 4, 70),
(8, 2, 90),
(8, 4, 76),
(9, 5, 90),
(9, 6, 84),
(10, 5, 90),
(10, 6, 90),
(11, 1, 74),
(11, 6, 66),
(12, 1, 0),
(12, 6, 67);

-- --------------------------------------------------------

--
-- Struktura tabulky `prestup`
--

CREATE TABLE `prestup` (
  `id_prestupu` int(11) NOT NULL,
  `id_hrace` int(11) NOT NULL,
  `id_noveho_tymu` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `prestup`
--

INSERT INTO `prestup` (`id_prestupu`, `id_hrace`, `id_noveho_tymu`, `datum`) VALUES
(1, 5, 5, '2026-08-12');

-- --------------------------------------------------------

--
-- Struktura tabulky `tym`
--

CREATE TABLE `tym` (
  `id_tymu` int(11) NOT NULL,
  `jmeno_tymu` varchar(255) NOT NULL,
  `pocet_hracu` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `tym`
--

INSERT INTO `tym` (`id_tymu`, `jmeno_tymu`, `pocet_hracu`) VALUES
(1, 'Slavia Praha', 26),
(2, 'Ath. Bilbao', 26),
(3, 'Arsenal', 25),
(4, 'Atalanta', 26),
(5, 'Inter Milan', 26),
(6, 'Bodo/Glimt', 25);

-- --------------------------------------------------------

--
-- Struktura tabulky `udalosti`
--

CREATE TABLE `udalosti` (
  `id_udalosti` int(11) NOT NULL,
  `id_zapasu` int(11) NOT NULL,
  `id_hrace` int(11) NOT NULL,
  `minuta` int(11) NOT NULL,
  `typ` enum('gól','žlutá karta','červená karta','střídání') NOT NULL,
  `popisek` varchar(255) DEFAULT NULL,
  `stridajici_hrac` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `udalosti`
--

INSERT INTO `udalosti` (`id_udalosti`, `id_zapasu`, `id_hrace`, `minuta`, `typ`, `popisek`, `stridajici_hrac`) VALUES
(1, 3, 3, 72, 'gól', NULL, NULL),
(2, 1, 2, 18, 'střídání', NULL, 2),
(3, 2, 7, 50, 'žlutá karta', NULL, NULL),
(4, 5, 9, 88, 'gól', NULL, NULL),
(5, 4, 8, 50, 'červená karta', NULL, NULL),
(6, 6, 10, 92, 'gól', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `zapas`
--

CREATE TABLE `zapas` (
  `id_zapasu` int(11) NOT NULL,
  `domaci_tym` int(11) NOT NULL,
  `hostujici_tym` int(11) NOT NULL,
  `cas_zapasu` timestamp NOT NULL DEFAULT current_timestamp(),
  `domaci_goly` int(11) NOT NULL DEFAULT 0,
  `hoste_goly` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `zapas`
--

INSERT INTO `zapas` (`id_zapasu`, `domaci_tym`, `hostujici_tym`, `cas_zapasu`, `domaci_goly`, `hoste_goly`) VALUES
(1, 1, 6, '2025-09-17 16:45:00', 2, 2),
(2, 4, 1, '2025-10-22 19:00:00', 0, 0),
(3, 2, 3, '2025-09-16 16:45:00', 0, 2),
(4, 4, 2, '2025-11-25 20:00:00', 1, 1),
(5, 3, 5, '2025-11-25 17:45:00', 2, 1),
(6, 5, 6, '2025-11-04 20:00:00', 3, 1);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `hrac`
--
ALTER TABLE `hrac`
  ADD PRIMARY KEY (`id_hrace`),
  ADD KEY `idx_hrac_tym` (`id_aktualniho_tymu`);

--
-- Indexy pro tabulku `hraci_v_zapase`
--
ALTER TABLE `hraci_v_zapase`
  ADD PRIMARY KEY (`id_hrace`,`id_zapasu`),
  ADD KEY `idx_hvz_hrac` (`id_hrace`),
  ADD KEY `idx_hvz_zapas` (`id_zapasu`);

--
-- Indexy pro tabulku `prestup`
--
ALTER TABLE `prestup`
  ADD PRIMARY KEY (`id_prestupu`),
  ADD KEY `idx_prestup_hrac` (`id_hrace`),
  ADD KEY `idx_prestup_tym` (`id_noveho_tymu`);

--
-- Indexy pro tabulku `tym`
--
ALTER TABLE `tym`
  ADD PRIMARY KEY (`id_tymu`);

--
-- Indexy pro tabulku `udalosti`
--
ALTER TABLE `udalosti`
  ADD PRIMARY KEY (`id_udalosti`),
  ADD KEY `idx_udalosti_zapas` (`id_zapasu`),
  ADD KEY `idx_udalosti_hrac` (`id_hrace`),
  ADD KEY `idx_udalosti_stridani` (`stridajici_hrac`);

--
-- Indexy pro tabulku `zapas`
--
ALTER TABLE `zapas`
  ADD PRIMARY KEY (`id_zapasu`),
  ADD KEY `idx_zapas_domaci` (`domaci_tym`),
  ADD KEY `idx_zapas_hoste` (`hostujici_tym`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `hrac`
--
ALTER TABLE `hrac`
  MODIFY `id_hrace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `prestup`
--
ALTER TABLE `prestup`
  MODIFY `id_prestupu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `tym`
--
ALTER TABLE `tym`
  MODIFY `id_tymu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `udalosti`
--
ALTER TABLE `udalosti`
  MODIFY `id_udalosti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `zapas`
--
ALTER TABLE `zapas`
  MODIFY `id_zapasu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `hrac`
--
ALTER TABLE `hrac`
  ADD CONSTRAINT `fk_hrac_tym` FOREIGN KEY (`id_aktualniho_tymu`) REFERENCES `tym` (`id_tymu`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `hraci_v_zapase`
--
ALTER TABLE `hraci_v_zapase`
  ADD CONSTRAINT `fk_hvz_hrac` FOREIGN KEY (`id_hrace`) REFERENCES `hrac` (`id_hrace`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hvz_zapas` FOREIGN KEY (`id_zapasu`) REFERENCES `zapas` (`id_zapasu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `prestup`
--
ALTER TABLE `prestup`
  ADD CONSTRAINT `fk_prestup_hrac` FOREIGN KEY (`id_hrace`) REFERENCES `hrac` (`id_hrace`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestup_tym` FOREIGN KEY (`id_noveho_tymu`) REFERENCES `tym` (`id_tymu`) ON UPDATE CASCADE;

--
-- Omezení pro tabulku `udalosti`
--
ALTER TABLE `udalosti`
  ADD CONSTRAINT `fk_udalosti_hrac` FOREIGN KEY (`id_hrace`) REFERENCES `hrac` (`id_hrace`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_udalosti_stridani_hrac` FOREIGN KEY (`stridajici_hrac`) REFERENCES `hrac` (`id_hrace`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_udalosti_zapas` FOREIGN KEY (`id_zapasu`) REFERENCES `zapas` (`id_zapasu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `zapas`
--
ALTER TABLE `zapas`
  ADD CONSTRAINT `fk_zapas_domaci_tym` FOREIGN KEY (`domaci_tym`) REFERENCES `tym` (`id_tymu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zapas_hoste_tym` FOREIGN KEY (`hostujici_tym`) REFERENCES `tym` (`id_tymu`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Cze 2023, 17:39
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `silownia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cwiczenie`
--

CREATE TABLE `cwiczenie` (
  `Id_cwiczenia` int(11) NOT NULL COMMENT 'id danego ćwiczenia',
  `Nazwa_cwiczenia` varchar(200) NOT NULL COMMENT 'Nazwa ćwiczenia',
  `Partia` varchar(20) NOT NULL COMMENT 'rodzaj mięśni używanych podczas ćwiczenia',
  `Opis_cwiczenia` text NOT NULL COMMENT 'opis wykonania ćwiczenia',
  `Przerwa` int(10) UNSIGNED NOT NULL COMMENT 'przerwa pomiedzy seriami w sekundach',
  `Powtorzenia` int(10) UNSIGNED NOT NULL COMMENT 'ilość powtórzeń w serii',
  `Serie` int(10) UNSIGNED NOT NULL COMMENT 'ilość serii',
  `Id_treningu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `cwiczenie`
--

INSERT INTO `cwiczenie` (`Id_cwiczenia`, `Nazwa_cwiczenia`, `Partia`, `Opis_cwiczenia`, `Przerwa`, `Powtorzenia`, `Serie`, `Id_treningu`) VALUES
(1, 'wyciskanie_sztangi_leżąc', 'klatka', '...........................................................................', 60, 5, 5, 2),
(2, 'przysiad', 'nogi', '.............................', 60, 8, 4, 3),
(3, 'wyciskanie_sztangi_leżąc', 'klatka', '...........................................................................', 60, 5, 5, 2),
(4, 'przysiad', 'nogi', '.............................', 60, 8, 4, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane`
--

CREATE TABLE `dane` (
  `Id_dane` int(11) NOT NULL COMMENT 'id danych',
  `Wiek` int(10) UNSIGNED NOT NULL COMMENT 'wiek osoby',
  `Waga` int(10) UNSIGNED NOT NULL COMMENT 'waga osoby',
  `Wzrost` int(10) UNSIGNED NOT NULL COMMENT 'wzrost w cm osoby',
  `Plec` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL COMMENT 'pleć osoby',
  `Rezulatat` varchar(45) NOT NULL DEFAULT 'Schudnąć' COMMENT 'rezultat po treningowy',
  `Id_hosta` int(11) NOT NULL,
  `Id_treningu` int(11) NOT NULL,
  `Id_diety` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `dane`
--

INSERT INTO `dane` (`Id_dane`, `Wiek`, `Waga`, `Wzrost`, `Plec`, `Rezulatat`, `Id_hosta`, `Id_treningu`, `Id_diety`) VALUES
(5, 21, 80, 180, 'mężczyzna', 'nabrać mięśni', 2, 2, 1),
(6, 17, 50, 160, 'kobieta', 'Schudnąć', 4, 1, 2),
(7, 21, 80, 180, 'mężczyzna', 'nabrać mięśni', 2, 2, 1),
(8, 17, 50, 160, 'kobieta', 'Schudnąć', 4, 1, 2),
(9, 21, 65, 170, 'mężczyzna', 'przytyć', 6, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dieta`
--

CREATE TABLE `dieta` (
  `Id_diety` int(11) NOT NULL COMMENT 'id diety',
  `Rodzaj_diety` varchar(45) NOT NULL COMMENT 'rodzaj diety',
  `Kalorie_diety` int(10) NOT NULL COMMENT 'ilość kalorii dziennie ',
  `Ilosc_posilkow` int(1) NOT NULL COMMENT 'ilość posiłków na dzień',
  `Trudnosc_posilkow` int(11) NOT NULL COMMENT 'trudność przygotowania diety',
  `Id_dietetyka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `dieta`
--

INSERT INTO `dieta` (`Id_diety`, `Rodzaj_diety`, `Kalorie_diety`, `Ilosc_posilkow`, `Trudnosc_posilkow`, `Id_dietetyka`) VALUES
(1, 'keto', 2500, 3, 10, 1),
(2, 'podstawowa', 3000, 4, 5, 2),
(3, 'keto', 2500, 3, 10, 1),
(4, 'podstawowa', 3000, 4, 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dietetyk`
--

CREATE TABLE `dietetyk` (
  `Id_dietetyka` int(11) NOT NULL COMMENT 'id dietetyka',
  `Specjalizacja_dietetyka` varchar(45) NOT NULL COMMENT 'Specjalizacja dietetyka',
  `Wiek_dietetyka` int(10) NOT NULL COMMENT 'wiek dietetyka',
  `Doswiadczenie_dietetyka` int(10) NOT NULL COMMENT 'lata doświadczenia w branży',
  `Strona-dietetyka` varchar(45) DEFAULT NULL COMMENT 'strona internetowa',
  `Certyfikaty` varchar(45) DEFAULT NULL COMMENT 'posiadane certyfikaty',
  `Id_hosta_dietetyka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `dietetyk`
--

INSERT INTO `dietetyk` (`Id_dietetyka`, `Specjalizacja_dietetyka`, `Wiek_dietetyka`, `Doswiadczenie_dietetyka`, `Strona-dietetyka`, `Certyfikaty`, `Id_hosta_dietetyka`) VALUES
(1, 'ogolna', 26, 6, 'dieta.pl', NULL, 2),
(2, 'sportowa', 45, 15, 'dietetyk.com', 'dietetyki polskiej', 1),
(3, 'ogolna', 26, 6, 'dieta.pl', NULL, 2),
(4, 'sportowa', 45, 15, 'dietetyk.com', 'dietetyki polskiej', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `host`
--

CREATE TABLE `host` (
  `Id_hosta` int(11) NOT NULL COMMENT 'id hosta',
  `Login` varchar(45) NOT NULL COMMENT 'nazwa użytkownika',
  `Imie` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL COMMENT 'imię użytkownika',
  `Nazwisko` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL COMMENT 'nazwisko użytkownika',
  `Adres` varchar(45) NOT NULL COMMENT 'adres email',
  `Haslo` varchar(45) NOT NULL COMMENT 'hasło nie szyfrowane',
  `Telefon` int(10) UNSIGNED DEFAULT NULL COMMENT 'numer telefonu',
  `creasted_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `host`
--

INSERT INTO `host` (`Id_hosta`, `Login`, `Imie`, `Nazwisko`, `Adres`, `Haslo`, `Telefon`, `creasted_time`) VALUES
(2, 'szym', 'szymon', 'bialk', 'zako27@gmail.com', '12345', 997990098, '2023-06-07 13:16:12'),
(4, 'talon', 'magda', 'nowak', 'polna2@gmail.com', '0987', NULL, '2023-06-07 13:16:22'),
(6, 'smerf', 'mateusz', 'lentowicz', 'lentowicz@gmail.com', '321241', 979932198, '2023-06-07 13:14:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `host_dietetykow`
--

CREATE TABLE `host_dietetykow` (
  `Id_hosta_dietetyka` int(11) NOT NULL COMMENT 'id hosta',
  `Login_dietetyka` varchar(45) NOT NULL COMMENT 'login hosta',
  `Imie_dietetyka` varchar(45) NOT NULL COMMENT 'imię hosta',
  `Nazwisko_dietetyka` varchar(45) NOT NULL COMMENT 'nazwisko hosta',
  `Adres_dietetyka` varchar(45) NOT NULL COMMENT 'adres hosta',
  `Haslo_dietetyka` varchar(45) NOT NULL COMMENT 'haslo hosta',
  `Telefon_dietetyka` int(10) NOT NULL COMMENT 'telefon hosta',
  `Krs_dietetyka` int(11) NOT NULL COMMENT 'krs firmy',
  `Creasted_time_dietetyka` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `host_dietetykow`
--

INSERT INTO `host_dietetykow` (`Id_hosta_dietetyka`, `Login_dietetyka`, `Imie_dietetyka`, `Nazwisko_dietetyka`, `Adres_dietetyka`, `Haslo_dietetyka`, `Telefon_dietetyka`, `Krs_dietetyka`, `Creasted_time_dietetyka`) VALUES
(1, 'm_diet', 'mateusz', 'kowal', 'kowal@gmail.com', 'qazxsw12', 999021231, 133156, '2023-06-07 13:21:33'),
(2, 'k_diet', 'krystyna', 'maj', 'maj@gmail.com', 'mnbvcxz', 12343565, 133123, '2023-06-07 13:21:33'),
(3, 'm_diet', 'mateusz', 'kowal', 'kowal@gmail.com', 'qazxsw12', 999021231, 133156, '2023-06-07 13:21:41'),
(4, 'k_diet', 'krystyna', 'maj', 'maj@gmail.com', 'mnbvcxz', 12343565, 133123, '2023-06-07 13:21:41');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `host_trenerow`
--

CREATE TABLE `host_trenerow` (
  `Id_trener_host` int(11) NOT NULL COMMENT 'id hosta trenera',
  `Login_trenera` varchar(45) NOT NULL COMMENT 'login hosta',
  `Imie_trenera` varchar(45) NOT NULL COMMENT 'imie hosta',
  `Nazwisko_trenera` varchar(45) NOT NULL COMMENT 'nazwisko hosta',
  `Adres_trenera` varchar(45) NOT NULL COMMENT 'adres hosta',
  `Haslo_trenera` varchar(45) NOT NULL COMMENT 'haslo hosta',
  `Telefon_trenera` int(10) UNSIGNED NOT NULL COMMENT 'numer telefonu',
  `Krs_trenera` varchar(45) NOT NULL COMMENT 'krs dzialalnosci',
  `Creasted_time_trenera` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `host_trenerow`
--

INSERT INTO `host_trenerow` (`Id_trener_host`, `Login_trenera`, `Imie_trenera`, `Nazwisko_trenera`, `Adres_trenera`, `Haslo_trenera`, `Telefon_trenera`, `Krs_trenera`, `Creasted_time_trenera`) VALUES
(1, 'trener_hub', 'hubert', 'mac', 'mac@gmail.com', '32154', 321456321, '0000133123', '2023-06-07 13:23:27'),
(2, 'trenerinka', 'zofia', 'kowalska', 'kowalska@gmail.com', '3215434', 213757342, '0000131234', '2023-06-07 13:23:27'),
(3, 'trener_hub', 'hubert', 'mac', 'mac@gmail.com', '32154', 321456321, '0000133123', '2023-06-07 13:23:31'),
(4, 'trenerinka', 'zofia', 'kowalska', 'kowalska@gmail.com', '3215434', 213757342, '0000131234', '2023-06-07 13:23:31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posilek`
--

CREATE TABLE `posilek` (
  `Id_posilku` int(11) NOT NULL COMMENT 'id posilku',
  `Nazwa_posilku` varchar(45) NOT NULL COMMENT 'nazwa posilku',
  `Kalorie` int(10) NOT NULL COMMENT 'ilosc kalori posilku',
  `Ilosc_skladnikow` int(10) NOT NULL COMMENT 'Ilość składników',
  `Trudnosc_przygotowania` varchar(45) NOT NULL COMMENT 'trudność wykonania potrawy',
  `ilosc_bialka` int(10) NOT NULL COMMENT 'ilość białka',
  `ilosc_cukrow` int(10) NOT NULL COMMENT 'ilość cukrów',
  `ilosc_weglowodanow` int(10) NOT NULL COMMENT 'ilość węglowodanów',
  `Opis_posilku` varchar(10000) NOT NULL COMMENT 'Opis dania',
  `Id_diety` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `posilek`
--

INSERT INTO `posilek` (`Id_posilku`, `Nazwa_posilku`, `Kalorie`, `Ilosc_skladnikow`, `Trudnosc_przygotowania`, `ilosc_bialka`, `ilosc_cukrow`, `ilosc_weglowodanow`, `Opis_posilku`, `Id_diety`) VALUES
(1, 'Jajecznica', 500, 2, '1', 23, 23, 34, '................................................................................................................................................................', 2),
(2, 'spaghetti_bolognese ', 400, 6, '8', 23, 15, 67, '..........................................................................................................................................................................', 1),
(3, 'Jajecznica', 500, 2, '1', 23, 23, 34, '................................................................................................................................................................', 2),
(4, 'spaghetti_bolognese ', 400, 6, '8', 23, 15, 67, '..........................................................................................................................................................................', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trener`
--

CREATE TABLE `trener` (
  `Id_trener` int(11) NOT NULL COMMENT 'id trenera',
  `Wiek_trenera` int(10) UNSIGNED NOT NULL COMMENT 'wiek trenera',
  `Plec_trenera` varchar(30) NOT NULL COMMENT 'płeć trenera',
  `Specjalizacja_trenera` varchar(45) NOT NULL COMMENT 'Specjalizacja trenera',
  `Doswiadczenie_trenera` int(10) UNSIGNED NOT NULL COMMENT 'lata doświadczenia',
  `Id_trener_host` int(11) NOT NULL,
  `Strona_trenera` varchar(45) DEFAULT NULL COMMENT 'link do strony'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `trener`
--

INSERT INTO `trener` (`Id_trener`, `Wiek_trenera`, `Plec_trenera`, `Specjalizacja_trenera`, `Doswiadczenie_trenera`, `Id_trener_host`, `Strona_trenera`) VALUES
(1, 32, 'mężczyzna', 'trojboj', 10, 1, 'trener.com'),
(2, 25, 'kobieta', 'kalistenika', 3, 4, 'trenernik.com'),
(3, 32, 'mężczyzna', 'trojboj', 10, 1, 'trener.com'),
(4, 25, 'kobieta', 'kalistenika', 3, 4, 'trenernik.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trening`
--

CREATE TABLE `trening` (
  `Id_treningu` int(11) NOT NULL COMMENT 'id treningu',
  `Rodzaj_treningu` varchar(45) NOT NULL COMMENT 'rodzaj treningu',
  `Trudnosc` int(2) NOT NULL COMMENT 'w skali od 1 do 10',
  `Id_trener` int(11) NOT NULL,
  `Czas_trwania` int(10) UNSIGNED NOT NULL COMMENT 'ile trwa wykonanie calego trenigu',
  `Miejsce` varchar(30) NOT NULL DEFAULT 'Siłownia' COMMENT 'miejsce wykonywania treningu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `trening`
--

INSERT INTO `trening` (`Id_treningu`, `Rodzaj_treningu`, `Trudnosc`, `Id_trener`, `Czas_trwania`, `Miejsce`) VALUES
(1, 'fullbodyworkout', 5, 4, 0, 'dom'),
(2, 'push-pull', 10, 1, 100, 'Siłownia'),
(3, 'fullbodyworkout', 5, 4, 100, 'dom'),
(4, 'push-pull', 10, 1, 100, 'Siłownia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cwiczenie`
--
ALTER TABLE `cwiczenie`
  ADD PRIMARY KEY (`Id_cwiczenia`),
  ADD KEY `Id_treningu` (`Id_treningu`);

--
-- Indeksy dla tabeli `dane`
--
ALTER TABLE `dane`
  ADD PRIMARY KEY (`Id_dane`),
  ADD KEY `Id_hosta` (`Id_hosta`),
  ADD KEY `Id_treningu` (`Id_treningu`),
  ADD KEY `Id_diety` (`Id_diety`);

--
-- Indeksy dla tabeli `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`Id_diety`),
  ADD KEY `Id_dietetyka` (`Id_dietetyka`);

--
-- Indeksy dla tabeli `dietetyk`
--
ALTER TABLE `dietetyk`
  ADD PRIMARY KEY (`Id_dietetyka`),
  ADD KEY `Id_hosta_dietetyka` (`Id_hosta_dietetyka`);

--
-- Indeksy dla tabeli `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`Id_hosta`);

--
-- Indeksy dla tabeli `host_dietetykow`
--
ALTER TABLE `host_dietetykow`
  ADD PRIMARY KEY (`Id_hosta_dietetyka`);

--
-- Indeksy dla tabeli `host_trenerow`
--
ALTER TABLE `host_trenerow`
  ADD PRIMARY KEY (`Id_trener_host`);

--
-- Indeksy dla tabeli `posilek`
--
ALTER TABLE `posilek`
  ADD PRIMARY KEY (`Id_posilku`),
  ADD KEY `Id_diety` (`Id_diety`);

--
-- Indeksy dla tabeli `trener`
--
ALTER TABLE `trener`
  ADD PRIMARY KEY (`Id_trener`),
  ADD KEY `Id_trener_host` (`Id_trener_host`);

--
-- Indeksy dla tabeli `trening`
--
ALTER TABLE `trening`
  ADD PRIMARY KEY (`Id_treningu`),
  ADD KEY `Id_trener` (`Id_trener`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `cwiczenie`
--
ALTER TABLE `cwiczenie`
  MODIFY `Id_cwiczenia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id danego ćwiczenia', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `dane`
--
ALTER TABLE `dane`
  MODIFY `Id_dane` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id danych', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `dieta`
--
ALTER TABLE `dieta`
  MODIFY `Id_diety` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id diety', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `dietetyk`
--
ALTER TABLE `dietetyk`
  MODIFY `Id_dietetyka` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id dietetyka', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `host`
--
ALTER TABLE `host`
  MODIFY `Id_hosta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id hosta', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `host_dietetykow`
--
ALTER TABLE `host_dietetykow`
  MODIFY `Id_hosta_dietetyka` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id hosta', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `host_trenerow`
--
ALTER TABLE `host_trenerow`
  MODIFY `Id_trener_host` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id hosta trenera', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `posilek`
--
ALTER TABLE `posilek`
  MODIFY `Id_posilku` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id posilku', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `trener`
--
ALTER TABLE `trener`
  MODIFY `Id_trener` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id trenera', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `trening`
--
ALTER TABLE `trening`
  MODIFY `Id_treningu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id treningu', AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `cwiczenie`
--
ALTER TABLE `cwiczenie`
  ADD CONSTRAINT `cwiczenie_ibfk_1` FOREIGN KEY (`Id_treningu`) REFERENCES `trening` (`Id_treningu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `dane`
--
ALTER TABLE `dane`
  ADD CONSTRAINT `dane_ibfk_1` FOREIGN KEY (`Id_hosta`) REFERENCES `host` (`Id_hosta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dane_ibfk_2` FOREIGN KEY (`Id_treningu`) REFERENCES `trening` (`Id_treningu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dane_ibfk_3` FOREIGN KEY (`Id_diety`) REFERENCES `dieta` (`Id_diety`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `dieta`
--
ALTER TABLE `dieta`
  ADD CONSTRAINT `dieta_ibfk_2` FOREIGN KEY (`Id_dietetyka`) REFERENCES `dietetyk` (`Id_dietetyka`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `dietetyk`
--
ALTER TABLE `dietetyk`
  ADD CONSTRAINT `dietetyk_ibfk_1` FOREIGN KEY (`Id_hosta_dietetyka`) REFERENCES `host_dietetykow` (`Id_hosta_dietetyka`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `posilek`
--
ALTER TABLE `posilek`
  ADD CONSTRAINT `posilek_ibfk_1` FOREIGN KEY (`Id_diety`) REFERENCES `dieta` (`Id_diety`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `trener`
--
ALTER TABLE `trener`
  ADD CONSTRAINT `trener_ibfk_2` FOREIGN KEY (`Id_trener_host`) REFERENCES `host_trenerow` (`Id_trener_host`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `trening`
--
ALTER TABLE `trening`
  ADD CONSTRAINT `trening_ibfk_2` FOREIGN KEY (`Id_trener`) REFERENCES `trener` (`Id_trener`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

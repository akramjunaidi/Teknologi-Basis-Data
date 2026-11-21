-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2026 at 12:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademikkampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_induk_dosen` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `kode_prodi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_induk_dosen`, `email`, `nama_dosen`, `jenis_kelamin`, `no_telepon`, `kode_prodi`) VALUES
('DSN001', 'ahmad.fauzi@uinmataram.ac.id', 'Dr. Ahmad Fauzi, M.Kom.', 'L', '081234567801', 'PR001'),
('DSN002', 'siti.rahma@uinmataram.ac.id', 'Siti Rahma, M.T.', 'P', '081234567802', 'PR001'),
('DSN003', 'budi.santoso@uinmataram.ac.id', 'Budi Santoso, M.Sc.', 'L', '081234567803', 'PR001'),
('DSN004', 'nurul.hidayah@uinmataram.ac.id', 'Nurul Hidayah, M.T.', 'P', '081234567804', 'PR001'),
('DSN005', 'eko.prasetyo@uinmataram.ac.id', 'Eko Prasetyo, M.Kom.', 'L', '081234567805', 'PR001'),
('DSN006', 'hendra.wijaya@uinmataram.ac.id', 'Hendra Wijaya, Ph.D.', 'L', '081234567806', 'PR002'),
('DSN007', 'dewi.lestari@uinmataram.ac.id', 'Dewi Lestari, M.Si.', 'P', '081234567807', 'PR002'),
('DSN008', 'agus.kurniawan@uinmataram.ac.id', 'Agus Kurniawan, M.T.', 'L', '081234567808', 'PR002'),
('DSN009', 'ririn.astuti@uinmataram.ac.id', 'Ririn Astuti, M.Kom.', 'P', '081234567809', 'PR002'),
('DSN010', 'fajar.hidayat@uinmataram.ac.id', 'Fajar Hidayat, M.Sc.', 'L', '081234567810', 'PR002'),
('DSN011', 'bambang.s@uinmataram.ac.id', 'Dr. Bambang Sudarmono, M.Sc.', 'L', '081234567811', 'PR003'),
('DSN012', 'ratna.sari@uinmataram.ac.id', 'Ratna Sari, M.T.', 'P', '081234567812', 'PR003'),
('DSN013', 'dian.pratama@uinmataram.ac.id', 'Dian Pratama, M.Kom.', 'L', '081234567813', 'PR003'),
('DSN014', 'maya.puspita@uinmataram.ac.id', 'Maya Puspita, M.Sc.', 'P', '081234567814', 'PR003'),
('DSN015', 'rizki.ramadhan@uinmataram.ac.id', 'Rizki Ramadhan, M.T.', 'L', '081234567815', 'PR003');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_kuliah`
--

CREATE TABLE `kelas_kuliah` (
  `kode_kelas` varchar(15) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `tahun_ajaran` varchar(9) NOT NULL,
  `kode_induk_dosen` varchar(20) NOT NULL,
  `kode_mk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas_kuliah`
--

INSERT INTO `kelas_kuliah` (`kode_kelas`, `nama_kelas`, `tahun_ajaran`, `kode_induk_dosen`, `kode_mk`) VALUES
('KLS001', 'TI-3A', '2025/2026', 'DSN001', 'MK001'),
('KLS002', 'TI-3B', '2025/2026', 'DSN002', 'MK002'),
('KLS003', 'TI-3C', '2025/2026', 'DSN003', 'MK003'),
('KLS004', 'TI-3D', '2025/2026', 'DSN004', 'MK004'),
('KLS005', 'TI-3E', '2025/2026', 'DSN005', 'MK005'),
('KLS006', 'SI-3A', '2025/2026', 'DSN006', 'MK007'),
('KLS007', 'SI-3B', '2025/2026', 'DSN007', 'MK008'),
('KLS008', 'SI-3C', '2025/2026', 'DSN008', 'MK009'),
('KLS009', 'SI-3D', '2025/2026', 'DSN009', 'MK010'),
('KLS010', 'SI-3E', '2025/2026', 'DSN010', 'MK011'),
('KLS011', 'IK-3A', '2025/2026', 'DSN011', 'MK013'),
('KLS012', 'IK-3B', '2025/2026', 'DSN012', 'MK014'),
('KLS013', 'IK-3C', '2025/2026', 'DSN013', 'MK015'),
('KLS014', 'IK-3D', '2025/2026', 'DSN014', 'MK016'),
('KLS015', 'IK-3E', '2025/2026', 'DSN015', 'MK017');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id_krs` int(11) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `tahun_akademik` varchar(9) NOT NULL,
  `tanggal_pengambilan` date NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_mk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id_krs`, `semester`, `tahun_akademik`, `tanggal_pengambilan`, `nim`, `kode_mk`) VALUES
(1, '3', '2025/2026', '2026-09-01', '250306001', 'MK001'),
(2, '3', '2025/2026', '2026-09-01', '250306002', 'MK001'),
(3, '3', '2025/2026', '2026-09-01', '250306003', 'MK002'),
(4, '3', '2025/2026', '2026-09-01', '250306004', 'MK002'),
(5, '3', '2025/2026', '2026-09-01', '250306005', 'MK003'),
(6, '3', '2025/2026', '2026-09-01', '250306006', 'MK004'),
(7, '3', '2025/2026', '2026-09-01', '250306007', 'MK005'),
(8, '3', '2025/2026', '2026-09-01', '250306008', 'MK006'),
(9, '3', '2025/2026', '2026-09-01', '250306009', 'MK007'),
(10, '3', '2025/2026', '2026-09-01', '250306010', 'MK007'),
(11, '3', '2025/2026', '2026-09-01', '250306011', 'MK008'),
(12, '3', '2025/2026', '2026-09-01', '250306012', 'MK009'),
(13, '3', '2025/2026', '2026-09-01', '250306013', 'MK010'),
(14, '3', '2025/2026', '2026-09-01', '250306014', 'MK011'),
(15, '3', '2025/2026', '2026-09-01', '250306015', 'MK012'),
(16, '3', '2025/2026', '2026-09-01', '250306016', 'MK007'),
(17, '3', '2025/2026', '2026-09-01', '250306017', 'MK013'),
(18, '3', '2025/2026', '2026-09-01', '250306018', 'MK013'),
(19, '3', '2025/2026', '2026-09-01', '250306019', 'MK014'),
(20, '3', '2025/2026', '2026-09-01', '250306020', 'MK015'),
(21, '3', '2025/2026', '2026-09-01', '250306021', 'MK016'),
(22, '3', '2025/2026', '2026-09-01', '250306022', 'MK017'),
(23, '3', '2025/2026', '2026-09-01', '250306023', 'MK018'),
(24, '3', '2025/2026', '2026-09-01', '250306024', 'MK013');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tahun_angkatan` varchar(4) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `kode_induk_dosen` varchar(20) NOT NULL,
  `status_mhs` varchar(20) DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_lengkap`, `jenis_kelamin`, `alamat`, `tanggal_lahir`, `tahun_angkatan`, `kode_prodi`, `kode_induk_dosen`, `status_mhs`) VALUES
('250306001', 'Akram Junaidi', 'L', 'Cakranegara, Mataram', '2005-04-04', '2025', 'PR001', 'DSN001', 'Aktif'),
('250306002', 'M. Nabil Ibnu Serra', 'L', 'Mataram', '2005-08-15', '2025', 'PR001', 'DSN001', 'Aktif'),
('250306003', 'Fathir Rahman', 'L', 'Ampenan, Mataram', '2005-03-10', '2025', 'PR001', 'DSN002', 'Aktif'),
('250306004', 'Siti Aisyah', 'P', 'Cakranegara, Mataram', '2005-07-22', '2025', 'PR001', 'DSN002', 'Aktif'),
('250306005', 'Rian Hidayat', 'L', 'Gerung, Lombok Barat', '2005-01-18', '2025', 'PR001', 'DSN003', 'Aktif'),
('250306006', 'Dina Lestari', 'P', 'Kediri, Lombok Barat', '2005-11-05', '2025', 'PR001', 'DSN003', 'Aktif'),
('250306007', 'Andi Pratama', 'L', 'Praya, Lombok Tengah', '2005-09-30', '2025', 'PR001', 'DSN004', 'Aktif'),
('250306008', 'Rina Maya', 'P', 'Selong, Lombok Timur', '2005-12-12', '2025', 'PR001', 'DSN005', 'Aktif'),
('250306009', 'Anisa Putri', 'P', 'Ampenan, Mataram', '2005-11-20', '2025', 'PR002', 'DSN006', 'Aktif'),
('250306010', 'Bagus Santoso', 'L', 'Mataram', '2005-02-14', '2025', 'PR002', 'DSN006', 'Aktif'),
('250306011', 'Citra Dewi', 'P', 'Cakranegara, Mataram', '2005-06-18', '2025', 'PR002', 'DSN007', 'Aktif'),
('250306012', 'Doni Damara', 'L', 'Lingsar, Lombok Barat', '2005-10-08', '2025', 'PR002', 'DSN007', 'Aktif'),
('250306013', 'Eka Rahmawati', 'P', 'Narmada, Lombok Barat', '2005-04-25', '2025', 'PR002', 'DSN008', 'Aktif'),
('250306014', 'Faris Ihsan', 'L', 'Praya, Lombok Tengah', '2005-08-03', '2025', 'PR002', 'DSN009', 'Aktif'),
('250306015', 'Gita Gutawa', 'P', 'Kopang, Lombok Tengah', '2005-05-17', '2025', 'PR002', 'DSN009', 'Aktif'),
('250306016', 'Hafiz Azhari', 'L', 'Masbagik, Lombok Timur', '2005-01-29', '2025', 'PR002', 'DSN010', 'Aktif'),
('250306017', 'Irfan Maulana', 'L', 'Mataram', '2005-03-03', '2025', 'PR003', 'DSN011', 'Aktif'),
('250306018', 'Jihan Fahira', 'P', 'Ampenan, Mataram', '2005-07-11', '2025', 'PR003', 'DSN011', 'Aktif'),
('250306019', 'Kevin Sanjaya', 'L', 'Cakranegara, Mataram', '2005-09-09', '2025', 'PR003', 'DSN012', 'Aktif'),
('250306020', 'Laila Sari', 'P', 'Senggigi, Lombok Barat', '2005-12-01', '2025', 'PR003', 'DSN013', 'Aktif'),
('250306021', 'M. Rizky Pratama', 'L', 'Pelementang, Mataram', '2005-02-28', '2025', 'PR003', 'DSN013', 'Aktif'),
('250306022', 'Nadia Utami', 'P', 'Labuapi, Lombok Barat', '2005-06-06', '2025', 'PR003', 'DSN014', 'Aktif'),
('250306023', 'Oki Setiana', 'P', 'Jorong, Lombok Tengah', '2005-10-15', '2025', 'PR003', 'DSN014', 'Aktif'),
('250306024', 'Panji Petualang', 'L', 'Pringgabaya, Lombok Timur', '2005-04-19', '2025', 'PR003', 'DSN015', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mk` varchar(10) NOT NULL,
  `nama_mk` varchar(100) NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mk`, `nama_mk`, `jumlah_sks`, `kode_prodi`) VALUES
('MK001', 'Teknologi Basis Data', 3, 'PR001'),
('MK002', 'Pemrograman Web', 3, 'PR001'),
('MK003', 'Algoritma & Pemrograman', 3, 'PR001'),
('MK004', 'Jaringan Komputer', 3, 'PR001'),
('MK005', 'Sistem Operasi', 3, 'PR001'),
('MK006', 'Rekayasa Perangkat Lunak', 3, 'PR001'),
('MK007', 'Analisis & Perancangan SI', 3, 'PR002'),
('MK008', 'Manajemen Proyek TI', 3, 'PR002'),
('MK009', 'Basis Data Lanjut', 3, 'PR002'),
('MK010', 'Enterprise Architecture', 3, 'PR002'),
('MK011', 'Tata Kelola TI', 3, 'PR002'),
('MK012', 'Sistem Informasi Manajemen', 3, 'PR002'),
('MK013', 'Kecerdasan Buatan', 3, 'PR003'),
('MK014', 'Struktur Data', 3, 'PR003'),
('MK015', 'Machine Learning', 3, 'PR003'),
('MK016', 'Pengolahan Citra Digital', 3, 'PR003'),
('MK017', 'Keamanan Siber', 3, 'PR003'),
('MK018', 'Teori Komputasi', 3, 'PR003');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nilai_tugas` decimal(5,2) DEFAULT NULL,
  `nilai_uts` decimal(5,2) DEFAULT NULL,
  `nilai_uas` decimal(5,2) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_induk_dosen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nilai_tugas`, `nilai_uts`, `nilai_uas`, `nilai_akhir`, `nim`, `kode_induk_dosen`) VALUES
(1, 88.50, 85.00, 90.00, 88.00, '250306001', 'DSN001'),
(2, 82.00, 80.00, 85.00, 82.50, '250306002', 'DSN001'),
(3, 90.00, 88.00, 92.00, 90.20, '250306003', 'DSN002'),
(4, 85.00, 82.00, 88.00, 85.20, '250306004', 'DSN002'),
(5, 78.00, 75.00, 80.00, 77.80, '250306005', 'DSN003'),
(6, 92.00, 90.00, 95.00, 92.50, '250306006', 'DSN003'),
(7, 85.00, 80.00, 88.00, 84.60, '250306009', 'DSN006'),
(8, 88.00, 85.00, 90.00, 87.80, '250306010', 'DSN006'),
(9, 80.00, 78.00, 82.00, 80.20, '250306011', 'DSN007'),
(10, 91.00, 89.00, 94.00, 91.50, '250306012', 'DSN007'),
(11, 84.00, 82.00, 86.00, 84.20, '250306013', 'DSN008'),
(12, 87.00, 85.00, 89.00, 87.10, '250306014', 'DSN009'),
(13, 95.00, 92.00, 96.00, 94.50, '250306017', 'DSN011'),
(14, 89.00, 86.00, 91.00, 88.80, '250306018', 'DSN011'),
(15, 83.00, 80.00, 85.00, 82.80, '250306019', 'DSN012'),
(16, 90.00, 88.00, 92.00, 90.20, '250306020', 'DSN013'),
(17, 86.00, 84.00, 88.00, 86.20, '250306021', 'DSN013'),
(18, 92.00, 90.00, 94.00, 92.20, '250306022', 'DSN014');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `fakultas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`kode_prodi`, `nama_prodi`, `fakultas`) VALUES
('PR001', 'Teknologi Informasi', 'Fakultas Dakwah dan Ilmu Komunikasi'),
('PR002', 'Sistem Informasi', 'Fakultas Sains dan Teknologi'),
('PR003', 'Ilmu Komputer', 'Fakultas Sains dan Teknologi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_induk_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_dosen_prodi` (`kode_prodi`);

--
-- Indexes for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  ADD PRIMARY KEY (`kode_kelas`),
  ADD KEY `fk_kelaskuliah_dosen` (`kode_induk_dosen`),
  ADD KEY `fk_kelaskuliah_mk` (`kode_mk`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id_krs`),
  ADD KEY `fk_krs_mahasiswa` (`nim`),
  ADD KEY `fk_krs_mk` (`kode_mk`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `fk_mahasiswa_prodi` (`kode_prodi`),
  ADD KEY `fk_mahasiswa_dosen` (`kode_induk_dosen`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `fk_mk_prodi` (`kode_prodi`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `fk_nilai_mahasiswa` (`nim`),
  ADD KEY `fk_nilai_dosen` (`kode_induk_dosen`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`kode_prodi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `fk_dosen_prodi` FOREIGN KEY (`kode_prodi`) REFERENCES `program_studi` (`kode_prodi`);

--
-- Constraints for table `kelas_kuliah`
--
ALTER TABLE `kelas_kuliah`
  ADD CONSTRAINT `fk_kelaskuliah_dosen` FOREIGN KEY (`kode_induk_dosen`) REFERENCES `dosen` (`kode_induk_dosen`),
  ADD CONSTRAINT `fk_kelaskuliah_mk` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`);

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `fk_krs_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `fk_krs_mk` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_mahasiswa_dosen` FOREIGN KEY (`kode_induk_dosen`) REFERENCES `dosen` (`kode_induk_dosen`),
  ADD CONSTRAINT `fk_mahasiswa_prodi` FOREIGN KEY (`kode_prodi`) REFERENCES `program_studi` (`kode_prodi`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `fk_mk_prodi` FOREIGN KEY (`kode_prodi`) REFERENCES `program_studi` (`kode_prodi`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_nilai_dosen` FOREIGN KEY (`kode_induk_dosen`) REFERENCES `dosen` (`kode_induk_dosen`),
  ADD CONSTRAINT `fk_nilai_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

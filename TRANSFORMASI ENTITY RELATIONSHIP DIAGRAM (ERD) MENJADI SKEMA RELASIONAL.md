# Teknologi Basis Data - Transformasi ERD ke Skema Relasional & DDL SQL

Repository ini berisi materi, modul praktikum, dan implementasi kode SQL untuk mata kuliah **Teknologi Basis Data**, Program Studi Teknologi Informasi, Universitas Islam Negeri Mataram.

Fokus utama repositori ini mencakup proses transformasi dari *Entity Relationship Diagram* (ERD) konseptual menjadi Skema Relasional[cite: 1], serta persiapan implementasi *Data Definition Language* (DDL) SQL[cite: 22, 24].

---

## 📌 Konsep Dasar Transformasi (Modul 3)

Pada tahap perancangan, elemen-elemen ERD diterjemahkan ke dalam struktur relasional dengan aturan pemetaan sebagai berikut[cite: 3, 4]:

| Elemen ERD[cite: 3] | Skema Relasional[cite: 3] | Keterangan[cite: 4, 6] |
| :--- | :--- | :--- |
| **Entitas** | **Tabel** | Mewakili objek utama dalam sistem[cite: 4]. |
| **Atribut** | **Field / Kolom** | Karakteristik atau properti data[cite: 4]. |
| **Identifier** | **Primary Key (PK)** | Atribut unik pembeda antar-record[cite: 4]. |
| **Relationship** | **Foreign Key (FK)** | Atribut penghubung antar-tabel[cite: 5]. |
| **Kardinalitas** | **Lokasi FK** | Menentukan penempatan kunci tamu[cite: 4]. |

### Aturan Relasi Kunci (PK & FK)
* **One-to-Many ($1 : N$):** Primary Key dari entitas pada sisi 1 ditempatkan sebagai Foreign Key pada tabel di sisi $N$[cite: 6].
* **Many-to-Many ($N : N$):** Membutuhkan tabel penghubung (*junction table*) yang menyimpan Foreign Key dari kedua tabel yang berhubungan[cite: 8].

---

## 🗂️ Skema Relasional SIAKAD SMA

Berdasarkan studi kasus Sistem Informasi Akademik SMA Harapan Bangsa[cite: 9], struktur tabel dan penguncian disusun sebagai berikut[cite: 21]:

1. **`KELAS`**
   * **PK:** `kode_kelas`[cite: 10]
   * **Atribut:** `nama_kelas`[cite: 10]

2. **`SISWA`**
   * **PK:** `nisn`[cite: 11]
   * **FK:** `kode_kelas` $\rightarrow$ `KELAS(kode_kelas)`[cite: 12]
   * **Atribut:** `nama_siswa`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `nomor_telephone`[cite: 11]

3. **`GURU`**
   * **PK:** `kode_guru`[cite: 13]
   * **Atribut:** `nip_nuptk`, `nama_guru`, `jenis_kelamin`, `alamat`, `nomor_telephone`[cite: 12, 13]

4. **`MATA_PELAJARAN`**
   * **PK:** `kode_mapel`[cite: 13]
   * **Atribut:** `nama_mapel`[cite: 13]

5. **`JADWAL_PELAJARAN`**
   * **PK:** `kode_jadwal`[cite: 14]
   * **FK:** 
     * `kode_kelas` $\rightarrow$ `KELAS(kode_kelas)`[cite: 14, 15]
     * `kode_guru` $\rightarrow$ `GURU(kode_guru)`[cite: 16]
     * `kode_mapel` $\rightarrow$ `MATA_PELAJARAN(kode_mapel)`[cite: 17]
   * **Atribut:** `hari`, `jam_mulai`, `jam_selesai`, `ruang`[cite: 13, 14]

6. **`NILAI`**
   * **FK:** 
     * `nisn` $\rightarrow$ `SISWA(nisn)`[cite: 19]
     * `kode_mapel` $\rightarrow$ `MATA_PELAJARAN(kode_mapel)`[cite: 20]
   * **Atribut:** `nilai_tugas`, `nilai_uts`, `nilai_uas`, `nilai_akhir`[cite: 18]

---

## 💻 Referensi Perintah DDL SQL (Modul 4)

Implementasi nyata pada Database Management System (DBMS) seperti MySQL/MariaDB menggunakan perintah DDL berikut[cite: 22, 24]:

```sql
-- 1. Tabel KELAS
CREATE TABLE KELAS (
    kode_kelas VARCHAR(10) PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL
);

-- 2. Tabel SISWA
CREATE TABLE SISWA (
    nisn VARCHAR(20) PRIMARY KEY,
    nama_siswa VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L', 'P'),
    tanggal_lahir DATE,
    alamat TEXT,
    nomor_telephone VARCHAR(15),
    kode_kelas VARCHAR(10),
    FOREIGN KEY (kode_kelas) REFERENCES KELAS(kode_kelas)
);

-- 3. Tabel GURU
CREATE TABLE GURU (
    kode_guru VARCHAR(10) PRIMARY KEY,
    nip_nuptk VARCHAR(30),
    nama_guru VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L', 'P'),
    alamat TEXT,
    nomor_telephone VARCHAR(15)
);

-- 4. Tabel MATA PELAJARAN
CREATE TABLE MATA_PELAJARAN (
    kode_mapel VARCHAR(10) PRIMARY KEY,
    nama_mapel VARCHAR(100) NOT NULL
);

-- 5. Tabel JADWAL PELAJARAN
CREATE TABLE JADWAL_PELAJARAN (
    kode_jadwal VARCHAR(10) PRIMARY KEY,
    hari VARCHAR(10) NOT NULL,
    jam_mulai TIME NOT NULL,
    jam_selesai TIME NOT NULL,
    ruang VARCHAR(20),
    kode_kelas VARCHAR(10),
    kode_guru VARCHAR(10),
    kode_mapel VARCHAR(10),
    FOREIGN KEY (kode_kelas) REFERENCES KELAS(kode_kelas),
    FOREIGN KEY (kode_guru) REFERENCES GURU(kode_guru),
    FOREIGN KEY (kode_mapel) REFERENCES MATA_PELAJARAN(kode_mapel)
);

-- 6. Tabel NILAI
CREATE TABLE NILAI (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    nisn VARCHAR(20),
    kode_mapel VARCHAR(10),
    nilai_tugas DECIMAL(5,2),
    nilai_uts DECIMAL(5,2),
    nilai_uas DECIMAL(5,2),
    nilai_akhir DECIMAL(5,2),
    FOREIGN KEY (nisn) REFERENCES SISWA(nisn),
    FOREIGN KEY (kode_mapel) REFERENCES MATA_PELAJARAN(kode_mapel)
);
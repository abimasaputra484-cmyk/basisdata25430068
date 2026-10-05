-- Praktikum Basis Data
-- Modul 1
-- NIM: 25430068
-- Password sengaja tidak ditulis di dalam skrip.

CREATE DATABASE IF NOT EXISTS kopma_068
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'mhs_068'@'localhost'
IDENTIFIED BY '<password_kerja>';

GRANT ALL PRIVILEGES ON kopma_068.*
TO 'mhs_068'@'localhost';
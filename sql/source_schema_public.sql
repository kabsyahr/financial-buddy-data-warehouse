-- Financial Buddy (FINBU) - Public Source Schema
-- Portfolio-safe schema derived from the fields referenced by the Pentaho ETL transformations.
-- Contains structure only; no personal records, credentials, or production data.

CREATE DATABASE IF NOT EXISTS uasfinbufix;
USE uasfinbufix;

CREATE TABLE fakultas (
    id INT PRIMARY KEY,
    fakultas VARCHAR(100),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE jurusan (
    id INT PRIMARY KEY,
    jurusan VARCHAR(100),
    fakultas_id INT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    level VARCHAR(50),
    foto VARCHAR(255),
    fakultas_id INT,
    prodi_id INT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE kategori (
    id BIGINT PRIMARY KEY,
    kategori VARCHAR(255),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE transaksi (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    tanggal DATE,
    jenis VARCHAR(50),
    kategori_id BIGINT,
    nominal DECIMAL(15,2),
    keterangan VARCHAR(255),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE saldo (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    tanggal DATE,
    saldo DECIMAL(15,2),
    transaksi_id BIGINT,
    topup_id BIGINT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE topup (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    admin_id BIGINT,
    nominal DECIMAL(15,2),
    status VARCHAR(50),
    tanggal DATE,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- Source analytical tables referenced by the original fact-building transformations.
CREATE TABLE fact_riwayat (
    user_id BIGINT,
    topup_id BIGINT,
    periode_waktu DATE,
    nominal DECIMAL(15,2),
    status VARCHAR(50)
);

CREATE TABLE fact_status (
    user_id BIGINT,
    periode_waktu DATE,
    pendapatan_total DECIMAL(15,2),
    pengeluaran_total DECIMAL(15,2),
    saldo_akhir DECIMAL(15,2)
);

CREATE TABLE fact_pencatatan (
    user_id BIGINT,
    kategori_id BIGINT,
    periode_waktu DATE,
    jenis VARCHAR(50),
    nominal DECIMAL(15,2),
    keterangan VARCHAR(255)
);

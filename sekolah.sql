-- Membuat database sekolah dan tabel siswa-nilai
CREATE DATABASE sekolah;

CREATE TABLE siswa (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    umur INT,
    jurusan VARCHAR(255)
);

CREATE TABLE nilai (
    id SERIAL PRIMARY KEY,
    siswa_id INT REFERENCES siswa(id) ON DELETE CASCADE,
    mata_pelajaran VARCHAR(255),
    nilai INT
);

--menambahkan values ke tabel siswa (nama, umur, jurusan siswa) dan tabel nilai (siswa_id, mata_pelajaran,nilai)
INSERT INTO siswa (nama, umur, jurusan) VALUES
('Rapli', 16, 'IPA'),
('Hadid', 17, 'IPS'),
('Safa', 16, 'IPA'),
('Ali', 17, 'IPS'),
('Ardha', 18, 'IPA');

INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES
(1, 'Matematika', 85),
(1, 'Bahasa Inggris', 90),
(2, 'Matematika', 79),
(3, 'Sejarah', 83),
(3, 'Fisika', 88),
(4, 'Kimia', 84),
(4, 'Bahasa Indonesia', 92),
(5, 'Ekonomi', 80),
(5, 'Agama', 82);

-- menambahkan query data (SELECT)
SELECT * FROM siswa;

SELECT * FROM siswa WHERE jurusan = 'IPA';

SELECT s.nama, AVG(n.nilai) AS rata_nilai
FROM siswa s
JOIN nilai n ON s.id = n.siswa_id
GROUP BY s.nama;

-- menambahkan update siswa dan nilai
UPDATE siswa
SET jurusan = 'IPS'
WHERE nama = 'Ardha';

UPDATE nilai
SET nilai = 87
WHERE siswa_id = 1 AND mata_pelajaran = 'Matematika';

delete from nilai where siswa_id = 2 and mata_pelajaran ='Matematika'

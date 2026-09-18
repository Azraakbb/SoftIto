CREATE TABLE Bolum (
    bolum_id INT PRIMARY KEY,
    bolum_adi VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Ogrenci (
    ogrenci_id INT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    bolum_id INT NOT NULL,

    FOREIGN KEY (bolum_id) REFERENCES Bolum(bolum_id) ON DELETE RESTRICT
);

CREATE TABLE Ders (
    ders_id INT PRIMARY KEY,
    ders_adi VARCHAR(150) NOT NULL,
    bolum_id INT NOT NULL,

    FOREIGN KEY (bolum_id) REFERENCES Bolum(bolum_id) ON DELETE RESTRICT
);

CREATE TABLE Ogrenci_Ders (
    ogrenci_id INT,
    ders_id INT,

    PRIMARY KEY (ogrenci_id, ders_id),

    FOREIGN KEY (ogrenci_id) REFERENCES Ogrenci(ogrenci_id) ON DELETE CASCADE,

    FOREIGN KEY (ders_id) REFERENCES Ders(ders_id) ON DELETE CASCADE
);
CREATE TABLE ref_application (
    code VARCHAR(10) PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE ref_departement (
    code VARCHAR(3) PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE ref_type_requete (
    id INT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- Populate Dropdown Master Records
INSERT INTO ref_application (code, libelle) VALUES
('SURF', 'SURF'),
('MAJIC', 'MAJIC'),
('EVALOC', 'EVALOC'),
('GEST_TU', 'Gestion TU');

INSERT INTO ref_departement (code, libelle) VALUES
('974', '974 - La Réunion'),
('75', '75 - Paris'),
('92', '92 - Hauts-de-Seine');

INSERT INTO ref_type_requete (id, libelle) VALUES
(1, 'Fiches en anomalie'),
(2, 'Dossiers TU'),
(3, 'Déclarations à traiter'),
(4, 'Fiches en évaluation d''office');

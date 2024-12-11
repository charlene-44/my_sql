-- Créer la table users qui permet de référencer les apprenants et apprenantes utilisant Edusign et qui contiendra donc le Prénom, Nom et l’adresse Email. 
-- Créer un identifiant au sein de la table users
CREATE TABLE edusign (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

ALTER TABLE edusign RENAME TO users;

CREATE TABLE edusign (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
);

UPDATE users
SET lastname = 'Judic'
WHERE lastname = 'Judoc'

-- Modifier la table edusign pour remplacer les colonnes Prénom, Nom et Email par l’identifiant de la table users
PRAGMA foreign_keys = ON;

CREATE TABLE edusign (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT ,
    lastname TEXT,
    email TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 1);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 2);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 3);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 4);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 5);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 6);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 7);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 8);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 9);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 10);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 11);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 12);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 13);
INSERT INTO edusign (firstname, lastname, email, user_id) VALUES ('', '', '', 14);

UPDATE edusign
SET firstname = (SELECT users.firstname FROM users WHERE users.id = edusign.user_id),
    lastname = (SELECT users.lastname FROM users WHERE users.id = edusign.user_id),
    email = (SELECT users.email FROM users WHERE users.id = edusign.user_id)
WHERE firstname = '' OR lastname = '' OR email = '';

-- Vous pouvez dorénavant insérer de la données fictives dans vos tables pour vérifier que tout est bon. 
-- Un exemple de requête ci-dessous :
INSERT INTO users (firstname, lastname, email) VALUES
  ('Ange', 'Kouakou', 'ange.kouakou@adatechschool.fr'),
  ('Grace', 'Judic', 'grace.judic@adatechschool.fr'),
  ('Dorothée', 'Braud', 'dorothee.braud@adatechschool.fr'),
  ('Sebastien', 'Herbiet', 'sebastien.herbiet@adatechschool.fr'),
  ('Charlotte', 'Beck', 'charlotte.beck@adatechschool.fr'),
  ('Florence', 'Sahal', 'florence.sahal@adatechschool.fr'),
  ('Eloi', 'Maynadier', 'eloi.maynadier@adatechschool.fr'),
  ('Molid', 'Nour Awaleh', 'molid.nour.awaleh@adatechschool.fr'),
  ('Toilibou', 'Abadallah Massangari', 'toilibou.abdallah.massangari@adatechschool.fr'),
  ('Floriane', 'Boireau', 'floriane.boireau@adatechschool.fr'),
  ('Delphine', 'Orain', 'delphine.orain@adatechschool.fr'),
  ('Pierre-Emanuel', 'Juvenelle', 'pierre-emmanuel.juvenelle@adatechschool.fr'),
  ('Charlene', 'Duret', 'charlene.duret@adatechschool.fr'),
  ('Sarra', 'Baehl', 'sarra.baehl@adatechschool.fr')

INSERT INTO edusign (firstname, lastname, email) VALUES
   ('Sophie', 'de Saint Exupéry', 'sophie.de-saint-exupery@adatechschool.fr')


-- Sélectionner toutes les lignes de la table users
SELECT * FROM users

-- Sélectionner uniquement la ligne où le prénom est Ada dans la table users
SELECT firstname  FROM users
WHERE firstname = 'Charlotte'

-- autre méthode
SELECT 'Charlotte' FROM users

-- Sélectionner les lignes dont la première lettre du prénom est un C dans la table users
SELECT firstname FROM users
WHERE SUBSTR(firstname, 1, 1) = 'C';

-- Compter le nombre de ligne qu’il y a dans la table users
SELECT COUNT(*) FROM users;

-- Compter le nombre de ligne dont la première lettre du prénom est un D dans la table users
SELECT COUNT(*) FROM users
WHERE SUBSTR(firstname, 1, 1) = 'D';

-- Afficher uniquement la colonne contenant le prénom de la table users
SELECT firstname FROM users

-- Niveau moyen
-- Insérer une ligne dans la table edusign qui correspond à la user Ada avec comme date de signature le 2024-05-30 09:30:00
ALTER TABLE edusign ADD COLUMN sign_at DATETIME;

UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE firstname = 'Charlotte';

UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE firstname = 'Ange';

UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE firstname = 'Grace';

UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE firstname = 'Dorothée';

UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE firstname = 'Sebastien';

UPDATE edusign
SET sign_at = '2024-09-01 09:30:00'
WHERE SUBSTR(firstname, 1, 1) = 'D';

UPDATE edusign
SET sign_at = '2024-09-01 09:30:00'
WHERE SUBSTR(firstname, 1, 1) = 'C';

-- Insérer toutes les lignes de la table users dans la table edusign avec pour date de signature le 2024-09-01 09:30:00
UPDATE edusign
SET sign_at = '2024-05-30 09:30:00'
WHERE sign_at IS NULL;

-- Sélectionner toutes les lignes de la table edusign ordonnées par date de signature de la plus récente à la plus ancienne et par user_id ascendant.
SELECT id, user_id, sign_at
FROM edusign
ORDER BY sign_at DESC;

-- Sélectionner toutes les lignes de la table edusign dont la date est 2024-05-30 09:30:00
SELECT * FROM edusign
WHERE sign_at = '2024-05-30 09:30:00'

-- Dans la table edusign, afficher le nombre d’apprenantes par date.
SELECT COUNT(*) FROM edusign
WHERE sign_at = '2024-05-30 09:30:00'

SELECT COUNT(*) FROM edusign
WHERE sign_at = '2024-09-01 09:30:00'

-- Compter le nombre de ligne au sein de la table edusign dont le prénom est Bella
SELECT COUNT(*) FROM edusign
WHERE firstname = 'Sarra'

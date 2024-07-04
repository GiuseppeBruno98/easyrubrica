CREATE DATABASE rubrica;
CREATE USER 'rubrica'@'localhost' IDENTIFIED BY 'rubrica';
GRANT ALL PRIVILEGES ON rubrica.* TO 'rubrica'@'localhost';
FLUSH PRIVILEGES;
USE rubrica;
CREATE TABLE lista_contatti (
    id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    eta INT NOT NULL
);
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
INSERT INTO users (username, password) VALUES ('utente', 'passutente123');
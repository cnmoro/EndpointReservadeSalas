CREATE DATABASE gerenciador_salas;
USE gerenciador_salas;

CREATE TABLE `organizacao` (
 `id` int NOT NULL AUTO_INCREMENT,
 `nome` VARCHAR(45) DEFAULT NULL,
 `id_organizacao_pai` int DEFAULT NULL,
 `tipo_organizacao` char(1) DEFAULT 'M',
 `dominio` VARCHAR(64) DEFAULT NULL,
 `ativo` tinyint(1) DEFAULT '1',
 `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
 `dataAlteracao` timestamp NULL DEFAULT NULL,
 `CEP` CHAR(9),
 PRIMARY KEY (`id`),
 FOREIGN KEY (`id_organizacao_pai`) REFERENCES `organizacao` (`id`) 
);

CREATE TABLE `sala` (
 `id` int NOT NULL AUTO_INCREMENT,
 `id_organizacao` int DEFAULT NULL,
 `nome` VARCHAR(45) DEFAULT NULL,
 `quantidadePessoasSentadas` int DEFAULT NULL,
 `possuiMultimidia` tinyint(1) DEFAULT '1',
 `possuiAC` tinyint(1) DEFAULT '1',
 `areaDaSala` decimal(9,2) DEFAULT NULL,
 `localizacao` VARCHAR(64) DEFAULT NULL,
 `latitude` double DEFAULT NULL,
 `longitude` double DEFAULT NULL,
 `ativo` tinyint(1) DEFAULT '1',
 `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
 `dataAlteracao` timestamp NULL DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
 `urlImagem` VARCHAR (300) DEFAULT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`id_organizacao`) REFERENCES `organizacao` (`id`)
);

CREATE TABLE `usuario` (
 `id` int NOT NULL AUTO_INCREMENT,
 `id_organizacao` int DEFAULT NULL,
 `nome` VARCHAR(45) DEFAULT NULL,
 `email` VARCHAR(50) DEFAULT NULL UNIQUE,
 `senha` VARCHAR(256) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`id_organizacao`) REFERENCES `organizacao` (`id`)
);

CREATE TABLE `alocacao_sala` (
 `id` int NOT NULL AUTO_INCREMENT,
 `id_sala` int DEFAULT NULL,
 `id_usuario` int DEFAULT NULL,
 `dataHoraInicio` DATETIME DEFAULT NULL,
 `dataHoraFim` DATETIME DEFAULT NULL,
`descricao` VARCHAR(45) DEFAULT NULL,
 `ativo` tinyint(1) DEFAULT '1',
 `dataCriacao` timestamp DEFAULT CURRENT_TIMESTAMP,
 `dataAlteracao` timestamp DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`),
 FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
 FOREIGN KEY (`id_organizacao`) REFERENCES `organizacao` (`id`)
);
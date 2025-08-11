CREATE TABLE IF NOT EXISTS `cliente` (
	`cliente_id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(255) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`telefone` varchar(20) NOT NULL,
	PRIMARY KEY (`cliente_id`)
);

CREATE TABLE IF NOT EXISTS `veiculo` (
	`veiculo_id` int AUTO_INCREMENT NOT NULL,
	`cliente_id` int NOT NULL,
	`placa` varchar(10) NOT NULL UNIQUE,
	`modelo` varchar(100) NOT NULL,
	`ano` int NOT NULL,
	`cor` varchar(50) NOT NULL,
	PRIMARY KEY (`veiculo_id`)
);

CREATE TABLE IF NOT EXISTS `equipe` (
	`equipe_id` int AUTO_INCREMENT NOT NULL,
	`nome_equipe` varchar(100) NOT NULL,
	PRIMARY KEY (`equipe_id`)
);

CREATE TABLE IF NOT EXISTS `mecanico` (
	`mecanico_id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(255) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`especialidade` varchar(100) NOT NULL,
	`equipe_id` int NOT NULL,
	PRIMARY KEY (`mecanico_id`)
);

CREATE TABLE IF NOT EXISTS `ordem_servico` (
	`os_id` int AUTO_INCREMENT NOT NULL,
	`veiculo_id` int NOT NULL,
	`equipe_id` int NOT NULL,
	`data_emissao` date NOT NULL,
	`data_conclusao` date NOT NULL,
	`valor_total` decimal(10,2) NOT NULL,
	PRIMARY KEY (`os_id`)
);

CREATE TABLE IF NOT EXISTS `servico` (
	`servico_id` int AUTO_INCREMENT NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`valor_mao_obra` decimal(10,2) NOT NULL,
	PRIMARY KEY (`servico_id`)
);

CREATE TABLE IF NOT EXISTS `peca` (
	`peca_id` int AUTO_INCREMENT NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`valor` decimal(10,2) NOT NULL,
	PRIMARY KEY (`peca_id`)
);

CREATE TABLE IF NOT EXISTS `detalhe_ordem_servico` (
	`os_id` int NOT NULL,
	`servico_id` int NOT NULL,
	`quantidade` int NOT NULL DEFAULT '1',
	`subtotal_mao_obra` decimal(10,2) NOT NULL,
	`mecanico_id` int NOT NULL,
	PRIMARY KEY (`os_id`, `servico_id`)
);

CREATE TABLE IF NOT EXISTS `os_peca` (
	`os_id` int NOT NULL,
	`peca_id` int NOT NULL,
	`quantidade` int NOT NULL DEFAULT '1',
	`subtotal_peca` decimal(10,2) NOT NULL,
	PRIMARY KEY (`os_id`, `peca_id`)
);


ALTER TABLE `veiculo` ADD CONSTRAINT `veiculo_fk1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente`(`cliente_id`);

ALTER TABLE `mecanico` ADD CONSTRAINT `mecanico_fk4` FOREIGN KEY (`equipe_id`) REFERENCES `equipe`(`equipe_id`);
ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk1` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo`(`veiculo_id`);


ALTER TABLE `detalhe_ordem_servico` ADD CONSTRAINT `detalhe_ordem_servico_fk0` FOREIGN KEY (`os_id`) REFERENCES `ordem_servico`(`os_id`);

ALTER TABLE `detalhe_ordem_servico` ADD CONSTRAINT `detalhe_ordem_servico_fk1` FOREIGN KEY (`servico_id`) REFERENCES `servico`(`servico_id`);

ALTER TABLE `detalhe_ordem_servico` ADD CONSTRAINT `detalhe_ordem_servico_fk4` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico`(`mecanico_id`);
ALTER TABLE `os_peca` ADD CONSTRAINT `os_peca_fk0` FOREIGN KEY (`os_id`) REFERENCES `ordem_servico`(`os_id`);

ALTER TABLE `os_peca` ADD CONSTRAINT `os_peca_fk1` FOREIGN KEY (`peca_id`) REFERENCES `peca`(`peca_id`);
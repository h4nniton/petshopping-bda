-- -----------------------------------------------------
-- Schema petshopping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petshopping` DEFAULT CHARACTER SET utf8 ;

USE `petshopping` ;

-- -----------------------------------------------------
-- Table `petshopping`.`veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`veterinario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_veterinario` VARCHAR(45) NULL,
  `telefone` FLOAT NULL,
  `email` VARCHAR(45) NULL,
  `senha` FLOAT NULL,
  `foto_veterinario` VARCHAR(250) NULL,
  PRIMARY KEY (`id`));
  
  insert into veterinario (nome_veterinario, telefone, email, senha, foto_veterinario) values (
  "Vitor de Jesus", "1144443333", "vitordejesus@gmail.com", "12345", "https://www.petz.com.br/blog/wp-content/uploads/2019/05/especialidades-veterinarias-1.jpg");
  
  select * from veterinario;


-- -----------------------------------------------------
-- Table `petshopping`.`consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`consultas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pet` VARCHAR(45) NULL,
  `data_consulta` DATE NULL,
  `horario_consulta` TIME NULL,
  `medicamentos` VARCHAR(45) NULL,
  `observacoes` VARCHAR(45) NULL,
  `veterinario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_consultas_veterinario1`
    FOREIGN KEY (`veterinario_id`)
    REFERENCES `petshopping`.`veterinario` (`id`));
    
    
    insert into consultas (id, pet, data_consulta, horario_consulta, medicamentos, observacoes, veterinario_id) values (
    "0", "Polly", "2024-02-03", "14:30:00", "Apoquel e Dipirona", "1 dose do remédio a cada 8 horas.", "");


-- -----------------------------------------------------
-- Table `petshopping`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`funcionarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `telefone` FLOAT NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `foto_funcionario` VARCHAR(250) NULL,
  PRIMARY KEY (`id`));
  
  insert into funcionarios (nome, telefone, email, senha, foto_funcionario) values (
  "Fernando Leonid", "1133334444", "fernandoleonid@gmail.com", "12345", "https://itpetblog.com.br/wp-content/uploads/2023/06/banho_no_inverno.jpg");

select * from funcionarios;

-- -----------------------------------------------------
-- Table `petshopping`.`banho_tosa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`banho_tosa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pet` VARCHAR(45) NULL,
  `data_servico` DATE NULL,
  `horario_servico` TIME NULL,
  `funcionario` VARCHAR(45) NULL,
  `servico` VARCHAR(45) NULL,
  `funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_banho_tosa_funcionarios1`
    FOREIGN KEY (`funcionarios_id`)
    REFERENCES `petshopping`.`funcionarios` (`id`));
    
    insert into banho_tosa (pet, data_servico, horario_servico, funcionario, servico, funcionarios_id) values (
    "Polly", "2024-05-18", "15:45:00", "", "Banho e tosa", "1");


-- -----------------------------------------------------
-- Table `petshopping`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`servicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_servico` VARCHAR(45) NULL,
  `funcionario` VARCHAR(45) NULL,
  `pet` VARCHAR(45) NULL,
  `consultas_id` INT NOT NULL,
  `banho_tosa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_servicos_consultas1`
    FOREIGN KEY (`consultas_id`)
    REFERENCES `petshopping`.`consultas` (`id`),
  CONSTRAINT `fk_servicos_banho_tosa1`
    FOREIGN KEY (`banho_tosa_id`)
    REFERENCES `petshopping`.`banho_tosa` (`id`));
    
	insert into servicos (tipo_servico, funcionario, pet, consultas_id, banho_tosa_id) values (
    "Banho e tosa", "", "Polly", "0", "0");


-- -----------------------------------------------------
-- Table `petshopping`.`carrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`carrinho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(45) NULL,
  `valor_total` FLOAT NULL,
  PRIMARY KEY (`id`));
  
  insert into carrinho (produto, valor_total) values (
  "Ração GoldeN, para filhotes", "89.90"),
  ("Roupa para GoldeN, tamanho adulto", "49.99"),
   ("Bolinhas de brinquedo para gato", "9.90"),
    ("Areia Sanitária Gatíssimo", "31.49");

select * from carrinho;

-- -----------------------------------------------------
-- Table `petshopping`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NULL,
  `valor_unitario` FLOAT NULL,
  `tipo_produto` VARCHAR(100) NULL,
  `descricao` VARCHAR(200) NULL,
  `foto_produto` VARCHAR(1250) NULL,
  `carrinho_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_produtos_carrinho1`
    FOREIGN KEY (`carrinho_id`)
    REFERENCES `petshopping`.`carrinho` (`id`));
    
    insert into produtos (nome, valor_unitario, tipo_produto, descricao, foto_produto, carrinho_id) values (
    "Areia Sanitária Gatíssimo", "31.49", "Animais", "Areia para gatos", "", "4");


-- -----------------------------------------------------
-- Table `petshopping`.`tipo_pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`tipo_pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
  insert into tipo_pet (nome_tipo) values (
  "Cachorro"), ("Gato"), ("Aves"), ("Roedores");

select * from tipo_pet;

-- -----------------------------------------------------
-- Table `petshopping`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`sexo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

  insert into sexo (nome_sexo) values (
  "Macho"), ("Fêmea");

select * from sexo;

-- -----------------------------------------------------
-- Table `petshopping`.`perfil_pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`perfil_pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_pet` VARCHAR(45) NULL,
  `idade` FLOAT NULL,
  `tipo_pet_id` INT NOT NULL,
  `sexo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_perfil_pet_tipo_pet`
    FOREIGN KEY (`tipo_pet_id`)
    REFERENCES `petshopping`.`tipo_pet` (`id`),
  CONSTRAINT `fk_perfil_pet_sexo1`
    FOREIGN KEY (`sexo_id`)
    REFERENCES `petshopping`.`sexo` (`id`));
    
    insert into perfil_pet (nome_pet, idade, tipo_pet_id, sexo_id) values (
    "Polly", "0.8", "1", "2"), ("Faísca", "2", "4", "1");
    
    select * from perfil_pet;


-- -----------------------------------------------------
-- Table `petshopping`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshopping`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NULL,
  `telefone` FLOAT NULL,
  `email` VARCHAR(200) NULL,
  `senha` FLOAT NULL,
  `foto_perfil` VARCHAR(250) NULL,
  `servicos_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  `perfil_pet_id` INT NOT NULL,
  PRIMARY KEY (`id`, `servicos_id`, `produtos_id`, `perfil_pet_id`),
  CONSTRAINT `fk_usuario_servicos1`
    FOREIGN KEY (`servicos_id`)
    REFERENCES `petshopping`.`servicos` (`id`),
  CONSTRAINT `fk_usuario_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `petshopping`.`produtos` (`id`),
  CONSTRAINT `fk_usuario_perfil_pet1`
    FOREIGN KEY (`perfil_pet_id`)
    REFERENCES `petshopping`.`perfil_pet` (`id`));

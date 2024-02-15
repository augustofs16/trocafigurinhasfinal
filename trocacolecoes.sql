-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/01/2024 às 02:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trocacolecoes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `album`
--

CREATE TABLE `album` (
  `ID` smallint(3) UNSIGNED NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `album_usuario`
--

CREATE TABLE `album_usuario` (
  `ID_album` smallint(3) UNSIGNED NOT NULL,
  `Usuario` char(11) NOT NULL,
  `NumeroFigurinha` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andamento_trocas`
--

CREATE TABLE `andamento_trocas` (
  `ID` int(10) UNSIGNED NOT NULL,
  `ID_troca` int(10) UNSIGNED NOT NULL,
  `Status` enum('Ativa','Em Andamento','Cancelada','Finalizada') NOT NULL,
  `DataAlteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastroalbum`
--

CREATE TABLE `cadastroalbum` (
  `ID` smallint(3) UNSIGNED NOT NULL,
  `NomeAlbum` varchar(100) NOT NULL,
  `Editora` varchar(30) NOT NULL,
  `Datadecadastro` date NOT NULL,
  `Ano` year(4) NOT NULL,
  `Categoria` char(3) NOT NULL,
  `Pais` varchar(20) NOT NULL,
  `QuantidadeFigurinhas` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `especial`
--

CREATE TABLE `especial` (
  `ID` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `figurinhas`
--

CREATE TABLE `figurinhas` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `caminho` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `figurinhas_disponiveis`
--

CREATE TABLE `figurinhas_disponiveis` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Usuario` char(11) NOT NULL,
  `ID_album` smallint(3) UNSIGNED NOT NULL,
  `Figurinha` smallint(4) UNSIGNED NOT NULL,
  `DataCadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `troca_figurinhas`
--

CREATE TABLE `troca_figurinhas` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Usuario` char(11) NOT NULL,
  `Usuario2` char(11) NOT NULL,
  `ID_album` smallint(3) UNSIGNED NOT NULL,
  `Figurinhausuarios_id1` smallint(4) UNSIGNED NOT NULL,
  `Figurinhausuarios_id2` smallint(4) UNSIGNED NOT NULL,
  `DataTroca` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `CPF` char(11) NOT NULL,
  `CNPJ` char(18) DEFAULT NULL,
  `Senha` char(8) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `NumeroCasa` int(10) UNSIGNED NOT NULL,
  `Bairro` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Estado` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `Telefone` char(15) NOT NULL,
  `CEP` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuariosfigurinhas`
--

CREATE TABLE `usuariosfigurinhas` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `figurinha_id` int(11) NOT NULL,
  `disponivel` tinyint(2) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `andamento_trocas`
--
ALTER TABLE `andamento_trocas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_troca` (`ID_troca`);

--
-- Índices de tabela `cadastroalbum`
--
ALTER TABLE `cadastroalbum`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `figurinhas_disponiveis`
--
ALTER TABLE `figurinhas_disponiveis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_album` (`ID_album`);

--
-- Índices de tabela `troca_figurinhas`
--
ALTER TABLE `troca_figurinhas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_album` (`ID_album`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andamento_trocas`
--
ALTER TABLE `andamento_trocas`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `figurinhas_disponiveis`
--
ALTER TABLE `figurinhas_disponiveis`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `troca_figurinhas`
--
ALTER TABLE `troca_figurinhas`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `andamento_trocas`
--
ALTER TABLE `andamento_trocas`
  ADD CONSTRAINT `andamento_trocas_ibfk_1` FOREIGN KEY (`ID_troca`) REFERENCES `troca_figurinhas` (`ID`);

--
-- Restrições para tabelas `cadastroalbum`
--
ALTER TABLE `cadastroalbum`
  ADD CONSTRAINT `cadastroalbum_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `album` (`ID`);

--
-- Restrições para tabelas `figurinhas_disponiveis`
--
ALTER TABLE `figurinhas_disponiveis`
  ADD CONSTRAINT `figurinhas_disponiveis_ibfk_1` FOREIGN KEY (`ID_album`) REFERENCES `album` (`ID`);

--
-- Restrições para tabelas `troca_figurinhas`
--
ALTER TABLE `troca_figurinhas`
  ADD CONSTRAINT `troca_figurinhas_ibfk_1` FOREIGN KEY (`ID_album`) REFERENCES `album` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

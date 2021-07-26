-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Jul-2021 às 17:47
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agencia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `notaFiscal` int(2) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nomeDestino` varchar(90) DEFAULT NULL,
  `nomeLinha` varchar(20) DEFAULT NULL,
  `preco` float(10,2) DEFAULT NULL,
  `classe` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`notaFiscal`, `idUsuario`, `nomeDestino`, `nomeLinha`, `preco`, `classe`) VALUES
(15, 19, 'Israel, Jerusálem', 'GOL', 220.00, 2),
(16, 19, 'Brasil, Copacabana', 'LATAM', 450.00, 1),
(17, 19, 'Israel, Jerusálem', 'GOL', 220.00, 2),
(18, 19, 'Israel, Jerusálem', 'GOL', 220.00, 2),
(19, 20, 'Israel, Jerusálem', 'GOL', 220.00, 2),
(20, 20, 'Brasil, Copacabana', 'LATAM', 450.00, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha_aerea`
--

CREATE TABLE `linha_aerea` (
  `idLinhaAerea` int(11) NOT NULL,
  `idPassagem` int(11) NOT NULL,
  `nomeEmpresa` varchar(30) DEFAULT NULL,
  `preco` float(10,2) DEFAULT NULL,
  `classe` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `linha_aerea`
--

INSERT INTO `linha_aerea` (`idLinhaAerea`, `idPassagem`, `nomeEmpresa`, `preco`, `classe`) VALUES
(1, 1, 'GOL', 220.00, 2),
(5, 7, 'LATAM', 450.00, 1),
(6, 8, 'AZUL', 3660.00, 2),
(24, 5, 'LATAM', 2566.00, 2),
(26, 5, 'TWITCH', 2100.00, 1),
(30, 18, 'LATAM', 310.00, 1),
(37, 21, 'AMARELO', 1500.00, 1),
(40, 23, 'AMARELO', 2000.00, 2),
(41, 23, 'AZUL', 1900.00, 1),
(44, 28, 'LATAM', 3000.00, 1),
(47, 7, 'GOL', 500.00, 2),
(50, 29, 'GOL', 500.00, 1),
(51, 7, 'AZUL', 400.00, 1),
(52, 18, 'AMARELO', 500.00, 2),
(53, 21, 'GOL', 2000.00, 2),
(54, 8, 'AZUBU', 3000.00, 2),
(55, 28, 'GOL', 3100.00, 2),
(56, 29, 'LATAM', 600.00, 2),
(58, 5, 'GOL', 2500.00, 1),
(60, 35, 'GOL', 1.00, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `idLocalizacao` int(11) NOT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `URL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `localizacao`
--

INSERT INTO `localizacao` (`idLocalizacao`, `nome`, `URL`) VALUES
(1, 'Israel, Jerusálem', 'https://www.guiadasemana.com.br/contentFiles/image/2018/10/FEA/galeria/58102_w840h525_1539712212shutterstock-779797672-jerusalem.jpg'),
(3, 'Paris, França', 'https://viagemeturismo.abril.com.br/wp-content/uploads/2016/11/thinkstockphotos-4549879531.jpeg'),
(4, 'Brasil, Lençóis Maranhenses', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2017/10/lencois-maranhenses-melhor-epoca-820x547.jpg'),
(5, 'Brasil, Copacabana', 'https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/45659/show/praia-de-copacabana.jpg'),
(6, 'Itália, Roma', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-roma-capa2019-01.jpg'),
(7, 'Argentina, Buenos Aires', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-buenos-aires-capa2019-02.jpg'),
(8, 'Estados Unidos, Times Square', 'https://www.siaranews.com.br/wp-content/uploads/2020/06/pics-012.jpg'),
(12, 'China, Muralha da China', 'https://aventurasnahistoria.uol.com.br/media/_versions/capa_great_wall_of_china_history_widelg.jpeg'),
(13, 'Japão, Toyko', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2016/07/tokyo-japao4.jpg'),
(15, 'México, Cancún', 'https://r4t2s9v3.stackpathcdn.com/wp-content/uploads/2018/01/cancun-o-que-fazer-3.jpg'),
(27, 'Israel, Muro das Lamentações', 'https://mundovastomundo.com.br/wp-content/uploads/2019/08/Muro-das-lamenta%C3%A7%C3%B5es-e1565389307282.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `passagem`
--

CREATE TABLE `passagem` (
  `idPassagem` int(11) NOT NULL,
  `idLocalizacao` int(11) NOT NULL,
  `promocao` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `passagem`
--

INSERT INTO `passagem` (`idPassagem`, `idLocalizacao`, `promocao`) VALUES
(1, 1, 1),
(5, 3, 1),
(7, 5, 0),
(8, 6, 0),
(18, 4, 0),
(21, 8, 0),
(23, 12, 0),
(25, 7, 0),
(28, 13, 0),
(29, 15, 0),
(35, 27, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `senha` varchar(30) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `estado` char(2) NOT NULL,
  `nivelusuario` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `login`, `senha`, `telefone`, `estado`, `nivelusuario`) VALUES
(12, 'Kaique Nakao', 'Kaique', '123', '11933260403', 'SP', 2),
(15, 'Jubileu', 'Jubileu', '123', '11933260403', 'SC', 1),
(18, 'Roberto', 'Roberto', '123', '11234124', 'AL', 2),
(19, 'Vitoria', 'Vitoria', '123', '11933260403', 'SP', 1),
(20, 'Cleber Oliveira', 'Cleber', '123', '1123124124', 'MG', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`notaFiscal`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `linha_aerea`
--
ALTER TABLE `linha_aerea`
  ADD PRIMARY KEY (`idLinhaAerea`),
  ADD KEY `idPassagem` (`idPassagem`);

--
-- Índices para tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`idLocalizacao`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `passagem`
--
ALTER TABLE `passagem`
  ADD PRIMARY KEY (`idPassagem`),
  ADD KEY `idLocalizacao` (`idLocalizacao`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `notaFiscal` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `linha_aerea`
--
ALTER TABLE `linha_aerea`
  MODIFY `idLinhaAerea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `idLocalizacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `passagem`
--
ALTER TABLE `passagem`
  MODIFY `idPassagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `linha_aerea`
--
ALTER TABLE `linha_aerea`
  ADD CONSTRAINT `linha_aerea_ibfk_1` FOREIGN KEY (`idPassagem`) REFERENCES `passagem` (`idPassagem`);

--
-- Limitadores para a tabela `passagem`
--
ALTER TABLE `passagem`
  ADD CONSTRAINT `passagem_ibfk_1` FOREIGN KEY (`idLocalizacao`) REFERENCES `localizacao` (`idLocalizacao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

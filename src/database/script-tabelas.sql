-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE tlou;

USE tlou;

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45) UNIQUE,
    senha VARCHAR(45)
);

CREATE TABLE quiz (
    idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    descricao VARCHAR(450)
);

CREATE TABLE questao (
    idQuestao INT PRIMARY KEY AUTO_INCREMENT,
    fkQuiz INT DEFAULT 1,
    enunciado VARCHAR(100),
    alternativaA VARCHAR(45),
    alternativaB VARCHAR(45),
    alternativaC VARCHAR(45),
    alternativaD VARCHAR(45),
	alternativaCorreta VARCHAR(12),
    FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE tentativa (
    idTentativa INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkQuiz INT,
    acertos INT,
    erros INT,
    pontuacao INT,
    dtHrTent DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

SELECT * FROM usuario;
SELECT * FROM quiz;
SELECT * FROM questao;
SELECT * FROM tentativa;
SELECT * FROM resposta;

SHOW TABLES;

-- CRIAR QUIZ
INSERT INTO quiz (titulo, descricao)
VALUES (
    'Quiz The Last of Us',
    'Prove que você está pronto para enfrentar o mundo devastado de The Last of Us. Teste seus conhecimentos sobre a Parte I, Parte II e a DLC Left Behind — história, personagens, infectados e momentos marcantes. Só os verdadeiros sobreviventes chegam ao final!'
);

-- INSERIR QUESTÕES
INSERT INTO questao (
    fkQuiz, enunciado,
    alternativaA, alternativaB, alternativaC, alternativaD,
    alternativaCorreta
) VALUES
-- Parte 1
(1, 'Qual é o nome da filha de Joel?', 'Tess', 'Ellie', 'Sarah', 'Riley', 'alternativaC'),
(1, 'Qual é o nome do fungo que causa a infecção?', 'Cordyceps', 'Mycelium', 'Clickeritis', 'Necrospora', 'alternativaA'),
(1, 'Quem é o irmão de Joel?', 'Bill', 'Tommy', 'David', 'Henry', 'alternativaB'),
(1, 'Qual grupo tenta criar uma cura usando a imunidade de Ellie?', 'FEDRA', 'Os Vaga-lumes (Fireflies)', 'Os Caçadores', 'Os Serafitas', 'alternativaB'),
(1, 'Onde ocorre o clímax final do primeiro jogo?', 'No hospital de Salt Lake City', 'No laboratório da Universidade de Colorado', 'Em Boston', 'No esconderijo dos Caçadores', 'alternativaA'),
(1, 'Como morre Tess?', 'Infectada por um Estalador', 'Baleada por soldados da FEDRA', 'Queimada viva', 'Mordida por Ellie', 'alternativaB'),
(1, 'Qual é o nome do homem que ajuda Joel em Lincoln?', 'Henry', 'Bill', 'David', 'Sam', 'alternativaB'),
(1, 'Como Joel e Ellie se conhecem?', 'Tess pede para Joel escoltar Ellie', 'Joel a encontra perdida em Boston', 'Ellie invade a casa de Joel', 'No hospital dos Vaga-lumes', 'alternativaA'),
(1, 'Qual cidade visitam para encontrar Tommy?', 'Pittsburgh', 'Jackson', 'Denver', 'Salt Lake City', 'alternativaB'),
(1, 'Nome da universidade onde encontram indícios dos Vaga-lumes?', 'Universidade do Leste do Colorado', 'Universidade de Salt Lake', 'Universidade Federal de Boston', 'Universidade de Denver', 'alternativaA'),
(1, 'Nome do hospital do clímax do jogo?', 'Hospital St. Mary''s', 'Hospital Salt Lake City Central', 'Hospital Marlene Firefly', 'Hospital da FEDRA', 'alternativaA'),
(1, 'Nome da líder dos Vaga-lumes?', 'Tess', 'Marlene', 'Abby', 'Riley', 'alternativaB'),
(1, 'Ano em que começa a infecção?', '2013', '2010', '2020', '2003', 'alternativaA'),
(1, 'Quatro estágios principais do Cordyceps?', 'Corredor, Estalador, Baiacu, Rei Rato', 'Corredor, Espreitador, Estalador, Baiacu', 'Mordido, Infectado, Estalador, Morto', 'Corredor, Atacante, Caçador, Baiacu', 'alternativaB'),

-- Left Behind
(1, 'Nome da melhor amiga de Ellie?', 'Dina', 'Riley', 'Sarah', 'Abby', 'alternativaB'),
(1, 'Onde se passa Left Behind?', 'Hospital abandonado', 'Shopping center', 'Escola', 'Acampamento militar', 'alternativaB'),
(1, 'Atividade que Ellie e Riley NÃO fazem?', 'Tirar fotos', 'Brincar de guerra de água', 'Jogar fliperama', 'Nadar em um lago', 'alternativaD'),
(1, 'Destino de Riley?', 'Ela escapa', 'Mordida por infectado', 'Morta por soldados', 'Junta-se à FEDRA', 'alternativaB'),

-- Parte 2
(1, 'Quem procura Joel em busca de vingança?', 'Abby Anderson', 'Owen', 'Manny', 'Isaac', 'alternativaA'),
(1, 'Nome da namorada de Ellie?', 'Riley', 'Dina', 'Abby', 'Mel', 'alternativaB'),
(1, 'Cidade onde se passa a maior parte do jogo?', 'Jackson', 'Seattle', 'Salt Lake City', 'Denver', 'alternativaB'),
(1, 'Grupo militar que domina Seattle?', 'Serafitas', 'Vaga-lumes', 'WLF', 'Hunters', 'alternativaC'),
(1, 'Nome do cachorro que Abby treina?', 'Bear', 'Alice', 'Buck', 'Max', 'alternativaB'),
(1, 'Instrumento que Joel ensina Ellie?', 'Guitarra', 'Violino', 'Ukulele', 'Piano', 'alternativaA'),
(1, 'Música que Joel toca para Ellie?', 'Take On Me', 'Future Days', 'Wayfaring Stranger', 'True Faith', 'alternativaB'),
(1, 'Líder dos Serafitas que ordena execução?', 'Emily', 'Yara', 'Maya', 'Lilian', 'alternativaA'),
(1, 'Grupo religioso inimigo do WLF?', 'Serafitas', 'Vaga-lumes', 'Caçadores', 'Fireflies do Oeste', 'alternativaA'),
(1, 'Nome completo de Ellie?', 'Ellie Johnson', 'Ellie Williams', 'Ellie Miller', 'Ellie Greene', 'alternativaB'),
(1, 'Quem ajuda Abby a fugir dos Serafitas?', 'Lev e Yara', 'Dina e Jesse', 'Ellie e Tommy', 'Owen e Mel', 'alternativaA'),
(1, 'Última localização jogável de Ellie?', 'Jackson', 'Rancho da Ellie', 'Santa Barbara', 'Seattle', 'alternativaC');

-- SELECIONAR QUESTÕES
SELECT * FROM questao
WHERE fkQuiz = 1;

-- SELECT COM DADOS DO USUÁRIO E DADOS DAS TENTATIVAS
SELECT acertos, erros, pontuacao, dtHrTent
FROM tentativa
JOIN usuario ON usuario.idUsuario = tentativa.fkUsuario
WHERE fkUsuario = 1;

-- SELECT DAS MÉDIAS POR USUÁRIO
SELECT 
    AVG(acertos) AS media_acertos,
    AVG(erros) AS media_erros,
    AVG(pontuacao) AS media_pontuacao
FROM tentativa
WHERE fkUsuario = 1;

-- SELECT DAS MÉDIAS GERAIS
SELECT 
    AVG(acertos) AS media_acertos,
    AVG(erros) AS media_erros,
    AVG(pontuacao) AS media_pontuacao
FROM tentativa;

/* 
//COMANDOS usuarioMODEL.js

	// AUTENTICAR
		SELECT idUsuario, nome, email FROM usuario WHERE email = '${email}' AND senha = '${senha}';

	// CADASTRAR
		INSERT INTO usuario (nome, email, senha) VALUES ('${nome}', '${email}', '${senha}');
        
//COMANDOS quizMODEL.js

	// PUBLICAR
		INSERT INTO tentativa (fkUsuario, acertos, erros, pontuacao, dtHrTent)
			VALUES (${idUsuario}, ${acertos}, ${erros}, ${pontuacao}, NOW());
            
//COMANDOS medidaMODEL.js
	
    // BUSCAR ÚLTIMAS MEDIDAS
		SELECT 
			acertos,
			erros,pontuacao,
			DATE_FORMAT(dtHrTent, '%d/%m/%y %H:%i:%s') AS dtHrTent
		FROM tentativa
			JOIN usuario ON usuario.idUsuario = tentativa.fkUsuario
		WHERE fkUsuario = ${idUsuario}
			ORDER BY dtHrTent DESC LIMIT ${limite_linhas};`;
            
	    // BUSCAR MEDIDAS EM TEMPO REAL
			SELECT
				acertos,
				erros,
				pontuacao,
				DATE_FORMAT(dtHrTent, '%d/%m/%y %H:%i:%s') AS dtHrTent
			FROM tentativa
				JOIN usuario ON usuario.idUsuario = tentativa.fkUsuario
			WHERE fkUsuario = ${idUsuario}
				ORDER BY dtHrTent DESC LIMIT 1`
                
		// BUSCAR MÉDIAS USUÁRIO
			SELECT
				AVG(acertos) AS mediaAcertos,
				AVG(erros) AS mediaErros,
				AVG(pontuacao) AS mediaPontuacao
			FROM tentativa
				WHERE fkUsuario = ${idUsuario};`
                
		// BUSCAR MÉDIAS GERAIS
			SELECT
				AVG(acertos) AS mediaAcertos,
				AVG(erros) AS mediaErros,
				AVG(pontuacao) AS mediaPontuacao
			FROM tentativa;
*/
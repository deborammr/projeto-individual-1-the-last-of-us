**Portal The Last of Us**

Este projeto consiste no desenvolvimento de um website temático sobre The Last of Us, criado para a disciplina de Pesquisa e Inovação. O portal reúne páginas informativas sobre o universo dos jogos, além de funcionalidades interativas como cadastro, login, quiz, dashboard e simulador de jogo.

**Objetivo**

Criar um portal completo aplicando conhecimentos de:

  - HTML, CSS e JavaScript
  
  - Node.js
  
  - Banco de Dados MySQL
  
  - API Web Data Viz
  
  - Chart.js
  
  - O site apresenta conteúdo narrativo, interações e visualização de dados.

**Funcionalidades**

- Páginas informativas (história, personagens, grupos/facções, infectados etc.)

- Cadastro e login integrados à API Web Data Viz

- Quiz temático sobre TLOU

- Dashboard com gráficos (Chart.js) para exibição de desempenho

- Mini simulador inspirado no jogo

- O projeto armazena informações em um banco de dados MySQL, utilizado para persistir dados de usuários e resultados do quiz.


**_Web Data Visualization = Visualização de Dados na Web_**

**_Implementação de Referência para o seu Projeto de Primeiro Semestre_**

<hr>

# Como usar

1. Clone este repositório em sua máquina.


1. Crie, no Banco de Dados, as tabelas necessárias para o funcionamento deste projeto.
- Siga as instruções no arquivo **/src/database/script-tabelas.sql**


3. Acesse o arquivo **app.js** e parametrize o ambiente.
- Se você estiver utilizando o Ambiente de Produção (remoto), comente a linha 2 e deixe habilitada a linha 1 onde está o valor **var ambiente_processo = 'producao';**
- Se você estiver utilizando o Ambiente de Desenvolvimento (local), comente a linha 1 e deixe habilitada a linha 2 onde está o valor **var ambiente_processo = 'desenvolvimento';**

4. Adicione as credenciais de Banco de Dados no arquivo **.env** ou em **.env.dev**, seguindo as instruções neste.

5. Acesse este repositório no seu terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento do projeto. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar seu projeto e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

6. Para "ver" seu projeto funcionando, acesse em seu navegador o caminho **informado no terminal**.

7. Caso queira parar a execução, tecle **CTRL+C** no terminal em que o projeto está rodando.
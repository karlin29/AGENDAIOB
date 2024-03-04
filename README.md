# Agenda de Contatos e Tarefas em Visual FoxPro

Este é um aplicativo em Visual FoxPro que permite o cadastro de contatos, funciona como uma agenda pessoal, permite a marcação de tarefas por dia, realiza consultas via CEP para identificar o endereço do contato e oferece funcionalidades de backup e importação via XML.

## Recursos Principais

- Cadastro de contatos com informações como nome, telefone, celular, e-mail e data de nascimento.
- Agenda pessoal para marcação de tarefas por dia.
- Consulta de endereço através do CEP.
- Funcionalidades de backup e importação de dados via XML.
  
## Instalação

Considerando o banco de dados PostgreSQL versão 10.10 ou superior instalado na máquina:

1. Faça o download ou clone este repositório na raiz do C:\\ com o nome `AGENDAIOB`.
2. Vá na pasta instalacao/scripts.
3. Por ordem dos arquivos, copie e cole seu conteúdo no pgAdmin e execute (o primeiro relacionado ao create do banco de dados, pode ser modificado de acordo com um nome de banco de preferência.
5. Ainda na pasta instalacao, execute o arquivo `Instalar.bat` como administrador para registrar recursos de calendário necessários.

## Configuração

1. Na pasta raiz `AGENDAIOB`, encontre o arquivo chamado  `config.txt`.
2. Atribua as configurações de conexão com o banco de dados via ODBC.

## Execução

- Após as configurações, abra o aplicativo `agenda.exe` que está na raiz da pasta `AGENDAIOB`.

## Projeto

- O arquivo principal do projeto se encontra na pasta: `projeto\agenda_contatos.PJT`.

## Considerações

- Este projeto tem como finalidade, provar meus conhecimentos em programação, utilizando as tecnologias VisualFoxPro9 e banco de dados PostgreSql.
- Qualquer dúvida relacionada ao projeto, estou a disposição.



# Projeto-IC - Desafio de Infra
## Topologia
#### Linux/Docker/Nginx/Python
Objetivo
O objetivo é testar os seus conhecimentos sobre redes tcp/ip, sistemas operacionais windows e linux, containers, balanceadores, automação de tarefas, criação de scripts e programação.
O teste está dividido em duas partes, instalação e configuração da topologia, e automação e operação.

#### Restrições:

* Você deverá concluir o teste até a data especificada no email de aprovação da etapa de currículo
* Você deverá usar apenas Pyhton e Bash Script para qualquer programação.

## Conhecimentos envolvidos

Redes, Linux, Docker, docker-compose, Nginx, FastAPI, Python, Bash

## Implementação

Você deverá criar uma topologia cliente e servidor, entre duas máquinas, uma windows, que será o lado cliente e outra linux que será o servidor, hospedando uma “Stack“ de containers, com duas aplicações web, um proxy Nginx, acessados diretamente do ambiente windows. Tudo instanciado através de docker-compose. Uma tarefa agendada no windows deve executar o script de monitoração, conforme as considerações do Anexo I. As aplicações web, padrão FastAPI, devem ser criadas usando as boas práticas do guia no link abaixo, executando nas portas 9000 e 9001 , respectivamente para cada aplicação servidor. https://fastapi.tiangolo.com/deployment/docker/. Uma mesma imagem de docker deve ser usada como base para subir as duas aplicações.

Uma rota “/status” deve ser incluída em cada aplicação web, retornando “http status code 200”, indicando que a aplicação está online e retornando um JSON com o nome e IP da aplicação. Para isso você deverá alterar o código do arquivo main.py. O servidor NGINX deve ser executado na porta 80, redirecionando as requisições do cliente para as portas das aplicações nas rotas da “/app1/status” e “/app2/status”, tudo conforme a topologia do serviço. Um script em bash deve ser criado para gerenciar o ambiente no linux conforme Anexo II.


## Topologia:

![Teste Analista Infraestrutura](https://user-images.githubusercontent.com/59631821/156685455-8dbf4e01-6e12-4ed8-bcef-9b8c3f140f40.png)

## Observações Importantes:

* Usar o docker-compose para gerar os containers e a configuração da Stack, incluindo a rede.
* A raíz da porta 80 deve retornar a página de boas vindas do nginx.
* Os containers das aplicações FastAPI não podem ser diretamente acessados fora da rede do Stack, e da VM Linux.
* Uma automação do windows deverá executar script de monitoração a cada 30 segundos.
* Deve ser possível alterar o arquivo “nginx.conf”, de configuração do Nginx, para inserir um novo server e upstream, fazer o re-deploy da stack e acessar o novo container.
* Os endereços do windows e linux podem ser adaptados ao seu ambiente. A rede da Stack deve ser 172.10.0.0/24

## Configuração da Topologia
1. Criar no seu ambiente windows uma máquina virtual linux, ubuntu 20.04, que será o server que hospeda os containers. Poderá ser usado o VirtualBox ou VMware.
      * a. Obs: As configurações de execução e memória são livres.
      * b. Você precisará instalar também o Python 3.8.
2. Instalar o docker / docker-compose, criar o stack das aplicações conforme o padrão de configuração com arquivo “yaml”.
3. Criar as imagens de cada container.
4. Configurar o firewall do linux para aceitar conexões nas portas:
      * 80, 22 : todos as redes
      * 9000-9010 : apenas rede local
5. Criar um usuário do linux para acesso remoto através de SSH .

## Automação e Operação

1. Criar no windows um script em python que faz a monitoração das aplicações, conforme abaixo:
      * a. Testa acesso no container 1 : http://server-linux/app1/status
      * b. Testa acesso no container 2: http://server-linux/app2/status
      * c. O script de monitoração, “main.py” já está pronto e é compatível com a versão 3.8 do python. Caso precise editar ou fazer alguma adaptação, você pode usar o VSCode ou qualquer editor de texto.
      * d. O script gera um arquivo de log da execução.

## Anexo I - Script de Monitoração

Você deve criar um código em python versão 3.8, com os seguintes requisitos:
1. Fazer a monitoração dos endpoints das aplicações coletando o http status code, o tempo de resposta da requisição em milissegundos (latência), data do início da coleta
(timestamp)
      * a. Testar acesso no container 1 : http://server-linux/app1/status
      * b. Testar acesso no container 2: http://server-linux/app2/status
      * c. Testar acesso ao Nginx: http://server-linux/
2. Apendar cada coleta em um arquivo CSV, com as seguintes informações:
      * a. DATA_REGISTRO, APPLICACAO, STATUS, LATENCIA, DATA_COLETA.
3. Configurar um agendamento no windows para executar o script a cada 30 segundos.
OBS-1: Como a topologia é local, simular de forma randômica, um valor de latência entre 30 - 50 ms.
   - OBS-2: Simular a queda dos servidores, gerando status DOWN quando não acessível.
   - OBS-3: Crie um projeto no VSCode para editar os scripts.

## Anexo II - Script de Gestão das Aplicações
Você deve criar um script no linux, em bash, “cluster.sh”, para a gestão do ambiente, recebendo os seguintes argumentos: “start”, “stop” e "status''.
* Start: iniciar a stack do docker-composer.
* Stop: encerrar a stack.
* Status: verificar o status da stack.

## Extras

* Caso consiga, implementar um certificado SSL no Nginx para acesso HTTPS do client

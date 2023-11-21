# Projeto Docker com NGINX, Balanceador de Carga e Proxy Reverso

Este projeto demonstra a configuração de um ambiente Docker usando o servidor web NGINX, um balanceador de carga simples e um proxy reverso para encaminhar solicitações para os serviços apropriados.

## Estrutura do Projeto

- `docker-compose.yml`: Arquivo de composição do Docker para orquestrar os serviços.
- `entrypoint.sh`: Script de entrada personalizado para o contêiner NGINX.
- `nginx.conf`: Configuração principal do NGINX.
- `cert/`: Diretório para armazenar certificados SSL.
- `global_ssl.conf`: Configurações globais para SSL no NGINX.

O arquivo `nginx.conf` contém principais configurações do NGINX, incluindo definições de proxy reverso, balanceador de carga e manipulação de erros.

O arquivo `docker-compose.yml` define os serviços Docker a serem utilizados. São eles: o NGINX, servidor1 (red), servidor2 (blue), servidor3 (green), servidor4 (aqua), servidor6 (silver).

![cenario proposto](https://i.imgur.com/XXAJjyt.png)

## Pré-requisitos

- [Docker](https://www.docker.com/get-started) instalado e funcional.

## Executando o projeto localmente

1. Clone o repositório para sua máquina local:

   ```bash
   git clone https://github.com/nicolas0liveira/apresentacao-docker-nginx-loadbalance.git
   ```

2. Navegue até o diretório do projeto:

   ```bash
    cd apresentacao-docker-nginx-loadbalance
   ```

3. Execute o Docker Compose para iniciar os contêineres NGINX e backend:

   ```bash
    docker-compose up -d
   ```

4. Abra um navegador e acesse:
  - `red.127.0.0.1.nip.io`: o nginx direciona a requisição para o servidor red (proxy reverso)
  - `blue.127.0.0.1.nip.io`: o nginx direciona  a requisição para o servidor blue (proxy reverso)
  - `api.127.0.0.1.nip.io`: o nginx direciona a requisição para o servidores  green, aqua. Caso os dois parem de responder, a requisição é direcionada ao servidor black (balanceador de carga)

## Configuração personalizada

- Para adicionar ou remover servidores, não esqueça de ajustar as seções no arquivo `nginx.conf`.
- Para configurar SSL adequadamente, você pode substituir os certificados autoassinados em `cert/` pelos seus próprios certificados.
- Caso esteja usando alguma distro linux debian, e queira gerar um certificado autoassinado

## Referência

- [Docker](https://www.docker.com/get-started)
- [NGINX](https://github.com/matiassingers/awesome-readme)

## Observações

A título de curiosidade, foi utilizado o serviço `nip.io` para uso do DNS, dispensando as costumeiras alterações no arquivo `/etc/hosts`.
Exemplos:

- `127.0.0.1.nip.io` direciona para **127.0.0.1**
  - a requisição é tratada diretamente pelo nginx
- `red.127.0.0.1.nip.io` direciona para **127.0.0.1**
  - a requisição o nginx direciona para o servidor red
- `api.127.0.0.1.nip.io` direciona para **127.0.0.1**
  - a requisição o nginx direciona para o servidores  green, aqua. Caso os dois parem de responder, a requisição é direcionada ao servidor black

Como se trata de uma introdução ao NGINX e Docker, que foi executada de forma pontual e rápida, certamente existem muitas configurações que precisam melhorar. Não houve preocupação com segurança e alguns parâmetros de performance.

<!-- 
## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here) 
-->

## Roadmap

- Integrar com Certbot
- organizar os parâmetros
- distribuir os servidores em arquivos conf.d, do nginx
- Adicionar mais integrações

## Alguns projetos relacionados

- [webcoloapp](coloar aqui repo do app java)

## Feedback

Se você tiver algum feedback, por favor nos deixe saber por meio de <dev.nicolas@gmail.com>

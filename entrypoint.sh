#!/bin/bash

# Caminho do arquivo no host
SSL_CONF_PATH="/etc/nginx/ssl/global_ssl.conf"

# Verifica se o arquivo existe e cria caso não exista. Para que seja corretamente mapeado pelo docker
if [ ! -f "$SSL_CONF_PATH" ]; then
    # Se não existir, cria o arquivo
    echo "ssl_protocols TLSv1.2 TLSv1.3;" > "$SSL_CONF_PATH"
    echo "ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';" >> "$SSL_CONF_PATH"
    # Adicione outras configurações conforme necessário
fi

# Inicia o servidor Nginx
exec nginx -g "daemon off;"

# Inicia com a imagem oficial mais recente do n8n
FROM n8nio/n8n:latest

# Troca para o usuário root para poder instalar pacotes do sistema
USER root

# Atualiza a lista de pacotes e instala o Chromium e dependências necessárias
# O '--no-install-recommends' evita instalar pacotes desnecessários
RUN apt-get update && \
    apt-get install -y \
    chromium \
    libgbm-dev \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    --no-install-recommends

# Informa ao Puppeteer para não baixar o Chromium, pois já o instalamos manualmente
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# Informa ao Puppeteer onde encontrar o executável do Chromium que acabamos de instalar
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Retorna para o usuário 'node', que é o padrão do n8n, por segurança
USER node

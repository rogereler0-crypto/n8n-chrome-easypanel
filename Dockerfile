# Inicia com a imagem oficial mais recente do n8n (baseada em Alpine)
FROM n8nio/n8n:latest

# Troca para o usuário root para poder instalar pacotes
USER root

# Usa o gerenciador 'apk' do Alpine para atualizar e instalar o Chromium
# Adicionamos as dependências mais comuns para o Chromium funcionar no Alpine
RUN apk update && \
    apk add --no-cache \
    chromium \
    harfbuzz \
    nss \
    freetype \
    ttf-freefont

# As variáveis de ambiente para o Puppeteer continuam as mesmas
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Retorna para o usuário 'node' por segurança
USER node

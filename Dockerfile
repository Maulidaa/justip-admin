FROM node:14

WORKDIR /src

COPY package*.json ./

COPY . .

RUN npm install
RUN apt-get update && apt-get install -y \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-curl \
    php-zip \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 8000

CMD CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
# Usamos la imagen oficial de Nginx
FROM docker.io/library/nginx:latest

# Instalamos herramientas para generar el certificado y el htpasswd
RUN apt-get update && apt-get install -y openssl apache2-utils

# 1. Creamos el directorio para el certificado y lo generamos (Autofirmado)
# Según la fuente: openssl req -x509 ... [6]
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/C=ES/O=UNIR/CN=cp2.unir.local"

# 2. Generamos el archivo de autenticación básica
# Según la fuente: usuario 'alumno' y pass 'unir2026' [6, 7]
RUN htpasswd -cb /etc/nginx/.htpasswd alumno unir2026

# 3. Copiamos nuestra configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 4. Copiamos un index.html básico (debes tenerlo en la carpeta /app-web)
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 443 para HTTPS [8]
EXPOSE 443
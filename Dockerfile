# Usar una imagen base de Nginx
FROM nginx:alpine

# Copiar los archivos de tu proyecto al contenedor
COPY . /usr/share/nginx/html

# Exponer el puerto 80 para que Nginx escuche
EXPOSE 80

# Nginx ya se ejecuta por defecto, por lo que no es necesario especificar el CMD
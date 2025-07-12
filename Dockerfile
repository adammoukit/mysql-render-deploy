FROM mysql:8.0

# Définir les variables OBLIGATOIRES pour l'initialisation
ENV MYSQL_ROOT_PASSWORD=user-moukit
ENV MYSQL_DATABASE=ecommerce
ENV MYSQL_USER=app_user
ENV MYSQL_PASSWORD=Strong!AppPassword123

# Installer les timezones
RUN apt-get update && apt-get install -y tzdata && \
    rm -rf /var/lib/apt/lists/*

# Copier le script SQL
COPY ./init.sql /docker-entrypoint-initdb.d/

# Exposer le port
EXPOSE 3306

# Solution d'authentification
CMD ["mysqld", "--default-authentication-plugin=mysql_native_password"]
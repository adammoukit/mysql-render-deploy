FROM mysql:8.0

# Définir le mot de passe root
ENV MYSQL_ROOT_PASSWORD=user-moukit

# Créer la base de données
ENV MYSQL_DATABASE=ecommerce

# Copier le script SQL d'initialisation
COPY ./init.sql /docker-entrypoint-initdb.d/

# Exposer le port MySQL
EXPOSE 3306

# Optimisations pour Render
CMD ["mysqld", "--default-authentication-plugin=mysql_native_password"]
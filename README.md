# Rails API Simple

API desarrollada en **Ruby on Rails** que contiene un CRUD de usuarios con persistencia de datos en **PostgreSQL**.

## Iniciar Proyecto

1. Asegúrate de crear el archivo `.env` en la raíz del proyecto para la configuración de la base de datos. Usa el siguiente formato:

    ```plaintext
    DATABASE_URL=postgres://usuario:contraseña@localhost:5432/nombre_base_datos
    ```

2. Inicia el servicio de **PostgreSQL** usando Docker (asegúrate de tener Docker en ejecución):

    ```bash
    docker compose up -d
    ```

3. Instala las dependencias del proyecto usando Bundler:

    ```bash
    bundle install
    ```

4. Crea y migra la base de datos:

    ```bash
    rails db:create
    rails db:migrate
    ```

5. Ahora, en la raíz del proyecto, ejecuta el servidor de Rails:

    ```bash
    rails server
    ```

La API estará disponible en `http://localhost:3000`.

## cURLs del Proyecto

### Obtener Usuarios
```bash
curl --location 'http://localhost:3000/api/v1/usuarios'
```

### Crear Usuario
```bash
curl --location 'http://localhost:3000/api/v1/usuarios' \
--header 'Content-Type: application/json' \
--data-raw '{
    "usuario": {
        "nombre": "nombre_prueba",
        "email": "test@test.cl"
    }
}'
```

### Obtener Usuario por ID
```bash
curl --location 'http://localhost:3000/api/v1/usuarios/1'
```

### Modificar Usuario por ID
```bash
curl --location --request PUT 'http://localhost:3000/api/v1/usuarios/1' \
--header 'Content-Type: application/json' \
--data-raw '{
    "usuario": {
        "nombre": "nombre_actualizado",
        "email": "actualizado@test.cl"
    }
}'
```

### Eliminar Usuario por ID
```bash
curl --location --request DELETE 'http://localhost:3000/api/v1/usuarios/1'
```

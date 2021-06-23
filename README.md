# Ruleta nnodes

Para instalar dependencias
```
bundle install
```

Para iniciar la base de datos.
```
docker-compose up
```

Para crear y migrar la base de datos.
```
bundle exec rails db:create
bundle exec rails db:migrate
```

Para correr los test.
```
bundle exec rspec
```

Para iniciar las tareas de cron.
```
bundle exec whenever --update-crontab 
```

Para iniciar el server.
```
bundle exec rails server

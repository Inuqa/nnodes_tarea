# Ruleta nnodes

 Para iniciar la base de datos.
```
docker-compose
```
Para crear y migrar la base de datos.
```
bundle exec rails db:create
bundle exec rails db:migrate
```
Para iniciar las tareas de cron.
```
bundle exec whenever --update-crontab 
```
Para iniciar el server.
```
bundle exec rails server

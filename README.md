# README

 ## Run on docker

  ###setup
  ```
  docker-compose build
  docker-compose up
  docker-compose run web rake db:create db:migrate db:seed
  ```
  ###run tests in docker
  `docker-compose run web rspec`

## Run specs

  `rspec`

## Test manually

1) Get available videos

`curl http://localhost:3000/api/v1/videos.json`

2) Do post request including selected purchase option

`curl -X POST -H 'Content-Type: application/json' -d '{ "user_id": 1, "purchase": {"purchase_option_id": 1}}' http://localhost:3000/api/v1/purchases.json`


3) check your library

  `curl http://localhost:3000/api/v1/purchases.json?user_id=1`
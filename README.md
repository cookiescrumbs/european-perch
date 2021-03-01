# European Perch

An API that Converts latitude,longitude to an OS map reference and an OS map reference to latitude,longitude

![Perch](./perch.jpg "European Perch")


European Perch is the HTTP wrapper for [Northern Pike](https://github.com/cookiescrumbs/northern-pike/)


[OS Map Ref:HU2600048999 to latitude,longitude](https://still-waters-39747.herokuapp.com/api/v1/os-ref/HU2600048999)


[latitude,longitude to OS Map Ref](https://still-waters-39747.herokuapp.com/api/v1/lat/60.22449375779038/lng/-1.5325017342359533)


## Development

```bash
docker-compose up --build

http://localhost:4567/api/v1/os-ref/HU2600048999

{:lat=>60.22449375779038, :lng=>-1.5325017342359533}


http://localhost:4567/api/v1/lat/60.22449375779038/lng/-1.5325017342359533

{:os_map_ref=>"HU 26000 49000"}

```

## Usage

```bash
https://still-waters-39747.herokuapp.com/api/v1/os-ref/HU2600048999

{:lat=>60.22449375779038, :lng=>-1.5325017342359533}

```
```bash

https://still-waters-39747.herokuapp.com/api/v1/lat/60.22449375779038/lng/-1.5325017342359533


{:os_map_ref=>"HU 26000 49000"}

```

## Deployment

```bash
docker build -t european-perch:latest .

docker tag european-perch registry.heroku.com/vast-bastion-09981/web

docker push registry.heroku.com/vast-bastion-09981/web

heroku login

heroku container:release web
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/cookiescrumbs/perch.

## License
This code is free to use under the terms of the MIT license.
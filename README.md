# DataDome Apache demo

This repository provides an example of the DataDome Apache module using Docker.

For additional information, please check our [public documentation](https://docs.datadome.co/docs/apache).

## 1 - Configuration

Open the file `mod_datadome.conf` and set your `datadome-server-side-key` (found inside your [DataDome Dashboard](https://app.datadome.co/dashboard/management/integrations)).

## 2 - Build

```
docker image build . -t datadome-apache-demo-image
```

## 3 - Run

```
docker run -d --rm --name datadome-apache-demo-container -p 8282:80 datadome-nginx-demo-image
```

## 4 - Test

```
curl -v  http://localhost:8282/
```

Your request was protected (the header `X-DataDome: protected` is present) and is shown in your Dashboard.

## 5 - Logs

```
docker logs -f datadome-apache-demo-container
```

## 6 - Stop

```
docker stop  datadome-apache-demo-container
```

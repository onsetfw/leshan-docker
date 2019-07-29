Cross-platform containers for the Eclipse [Leshan](https://hudson.eclipse.org/leshan/job/leshan/) server and bootstrap server

## To build these images

```
$ docker build -t onsetfw/leshan .
$ docker build -t onsetfw/leshan-bs -f Dockerfile-bs .
```

## To run these images

```
$ docker run -d -p5683:5683/udp -p5684:5684/udp -p8080:8080/tcp onsetfw/leshan
$ docker run -d -p5783:5783/udp -p5784:5784/udp -p8081:8081/tcp onsetfw/leshan-bs
```

The server may be run without the bootstrap server.

## Web UI
Leshan server: `http://<host>:8080`

Leshan bootstrap server: `http://<host>:8081`



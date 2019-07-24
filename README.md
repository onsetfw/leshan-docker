A cross-platform container for the Eclipse [Leshan](https://hudson.eclipse.org/leshan/job/leshan/) server

## How to use this image

```
docker run -d -p5683:5683/udp -p5684:5684/udp -p8080:8080/tcp onsetfw/leshan
```

To open the Leshan Web UI goto: `http://<host>:8080`


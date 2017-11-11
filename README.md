# Docker setup for doorstop

With the provided files the open source requirements management system [doorstop](https://github.com/jacebrowning/doorstop) runs in Docker


## how to run doorstop container
make sure that you have a `data` directory under the directory from where you are calling this command (or you adapt the run command). The directory is then available at `/data`

```
docker run --name doorstop --rm \
    -v "$(pwd)/data:/data" \
    -i -t tlwt/doorstop
```

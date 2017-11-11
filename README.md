# Docker setup for doorstop

With the provided files the open source requirements management system [doorstop](https://github.com/jacebrowning/doorstop) runs in Docker


## how to run doorstop container
You can either use the prebuilt image or build it yourself

### Option 1 - use prebuilt image

```
docker run tlwt/doorstop
```

### Option 2 - build it yourself

Step 1 - clone this repository to your machine

```
git clone https://github.com/tlwt/doorstop-docker.git
```

Step 2 - make scripts executable

```
chmod 755 dockerBuild.sh dockerRun.sh
```

Step 3 - build the docker image by running

```
./dockerBuild
```

Step 4 - execute the container
./dockerRun

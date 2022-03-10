# Purpose

Test / reproduce issue [#333](https://github.com/ycphs/openxlsx/issues/333) on [openxlsx R package](https://github.com/ycphs/openxlsx/).

# Docker image 

Docker image is publicly available on [dockerhub.com](https://hub.docker.com/repository/docker/finalspy/openxlsx333)

# Build and Run yourself

## Build image

Simply checkout this project and run :

```
    ./build.sh
```

## Run image

After you built the image sinply run :

```
    ./run.sh
```

# Description of the problem

The files should conform to the ACLs of the directory they are written to.

As this example demonstrates the openxlsx package doesn't conform to the default ACLs.

```
    -rw-r--r--+ 1 my_user my_user 6864 Mar 10 12:58 openxlsx.xlsx
    -rw-rw----+ 1 my_user my_user 5439 Mar 10 12:58 writexl.xlsx
```

instead of : 

```
    -rw-rw----+ 1 my_user my_user 6864 Mar 10 12:58 openxlsx.xlsx
    -rw-rw----+ 1 my_user my_user 5439 Mar 10 12:58 writexl.xlsx
```

